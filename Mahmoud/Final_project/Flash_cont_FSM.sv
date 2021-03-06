`default_nettype none
module flashfsm (
CLK50MHZ, 
CLK_sampling, 
 flash_mem_readdatavalid, 
  flash_mem_waitrequest, 
 flash_mem_readdata, 
 pause,
 reset, 
 start,
 flash_mem_read, //set to 1 when you want to read
  flash_mem_byteenable, //During reads, byteenables indicate which bytes the master is reading. Slaves that simply return readdata with no side effects are free to ignore byteenables
 data_out,  //data at specific address
 flash_mem_address,
 write_codec
  
); 

//inputs and outputs
input logic CLK50MHZ; 
input logic CLK_sampling; 

input logic flash_mem_readdatavalid; 
input logic flash_mem_waitrequest; 
input logic [31:0]flash_mem_readdata; 
output logic pause;
input logic reset;
input logic start; 

output logic flash_mem_read; //set to 1 when you want to read
output logic [3:0] flash_mem_byteenable; //During reads, byteenables indicate which bytes the master is reading. Slaves that simply return readdata with no side effects are free to ignore byteenables
output logic [15:0] data_out;  //data at specific address
output logic [22:0] flash_mem_address;
output logic write_codec;



logic fetchaddressenable;
logic addressready;

//instantiation of address fsm to provide address to flash fsm
addressfsm U6 (
.clock(CLK50MHZ), 
.reset(reset), 
.start(start), 
.pause(pause),
.fetchaddressenable(fetchaddressenable),
.address_out(flash_mem_address), 
.addressready(addressready)
);


//1 diff state 2 averaging tick 3-4 counter 5 data enable 6 byte enable 7 read 8 fetchaddressenable
//state parameters depending on outputs, explained in flowchart
			    //        0       1    2  3 4    5 6
parameter idle 			= 14'b0000____0____11_0_0000_0_0;

parameter determine_address 	= 14'b0000____0____11_0_0000_0_1;

parameter wait_request 		= 14'b0001____0____11_0_0000_0_0;

parameter address_fetched 	= 14'b0010____0____00_0_0000_0_0;

parameter read_state 		= 14'b0000____0____00_1_1111_1_0;

parameter outputsample0 	= 14'b0000____1____00_0_0000_0_0;//change data enable
parameter outputsample00 	= 14'b0011____0____00_0_0000_0_0;

parameter outputsample1 	= 14'b0100____1____01_0_0000_0_0;
parameter outputsample11 	= 14'b0101____0____01_0_0000_0_0;





logic [13:0] state;


			always_ff @ (posedge CLK50MHZ , posedge reset) begin
				if (reset) state <= idle;
				else begin
					case (state)

						idle: 	 state <= determine_address;	
					
						determine_address: if (addressready) state <= address_fetched;
												else state <= determine_address;
										
						wait_request: if (~flash_mem_waitrequest) //if no wait request from flash memory and address is ready, lower fetch address flag
											state <= read_state;
									else state <= wait_request;
						
						address_fetched: if (flash_mem_waitrequest) state <= wait_request;
						
						else state <= read_state;
						
						read_state: 
										
										 if (flash_mem_readdatavalid) //if read data valid flag is high move to next state
										state <= outputsample0;
										else state <= read_state;
						
						outputsample0: if(CLK_sampling) state <= outputsample00; //edge detect clk22
									else state <= outputsample0;

						outputsample00: //if(~CLK7200HZ) 
						state <= outputsample1;
												//else state <= outputsample00;
						outputsample1: if(CLK_sampling) state <= outputsample11; //edge detect clk22
						else state <= outputsample1;

						outputsample11: //if(~CLK7200HZ) 
						state <= idle;
												//else state <= outputsample11;


						

						default: state <= idle;
					endcase
				end
			end
			
//assign interrupt = state[12];
logic [31:0] splitdata;
logic dataenable;
logic [1:0]samplenumb;

always_ff @(posedge dataenable)
splitdata <= flash_mem_readdata;//save 32 bit data into a flip flop so it doesnt get lost for 2 clockcycles
		
always_comb begin
		flash_mem_byteenable = state[5:2]; //FSM controller outputs from states
		flash_mem_read = state[1];
		fetchaddressenable = state[0];
		dataenable = state[6];
		samplenumb = state[7];  //counter
		write_codec = state[9];
		
end
assign data_out = samplenumb? sample_1: sample_0; 

logic [15:0] sample_0,sample_1;	
assign sample_0 = splitdata[15:0];  //split the data into 2 16 bit signals
assign sample_1 = splitdata[31:16];


endmodule

