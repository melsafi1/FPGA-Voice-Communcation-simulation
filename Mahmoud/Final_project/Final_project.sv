`default_nettype none
module Final_project(

    //////////// CLOCK //////////
    CLOCK_50,
	 CLOCK2_50,

    //////////// LED //////////
    LEDR,

    //////////// KEY //////////
    KEY,

    //////////// SW //////////
    SW,

    //////////// SEG7 //////////
    HEX0,
    HEX1,
    HEX2,
    HEX3,
    HEX4,
    HEX5,

    //////////// Audio //////////
    AUD_ADCDAT,
    AUD_ADCLRCK,
    AUD_BCLK,
    AUD_DACDAT,
    AUD_DACLRCK,
    AUD_XCK,

    //////////// I2C for Audio  //////////
    FPGA_I2C_SCLK,
    FPGA_I2C_SDAT,
    
    
   
   
    //////// SDRAM //////////
    DRAM_ADDR,
    DRAM_BA,
    DRAM_CAS_N,
    DRAM_CKE,
    DRAM_CLK,
    DRAM_CS_N,
    DRAM_DQ,
    DRAM_LDQM,
    DRAM_UDQM,
    DRAM_RAS_N,
    DRAM_WE_N
    
 
 
    
);
`define zero_pad(width,signal)  {{((width)-$size(signal)){1'b0}},(signal)}
//=======================================================
//  PORT declarations
//=======================================================

//////////// CLOCK //////////
input                       CLOCK_50;
input								CLOCK2_50;

//////////// LED //////////
output           [9:0]      LEDR;

//////////// KEY //////////
input            [3:0]      KEY;

//////////// SW //////////
input            [9:0]      SW;

//////////// SEG7 //////////
output           [6:0]      HEX0;
output           [6:0]      HEX1;
output           [6:0]      HEX2;
output           [6:0]      HEX3;
output           [6:0]      HEX4;
output           [6:0]      HEX5;



//////////// Audio //////////
input                       AUD_ADCDAT;
inout                       AUD_ADCLRCK;
inout                       AUD_BCLK;
output                      AUD_DACDAT;
inout                       AUD_DACLRCK;
output                      AUD_XCK;

//////////// I2C for Audio  //////////
output                      FPGA_I2C_SCLK;
inout                       FPGA_I2C_SDAT;



                
//////////// SDRAM //////////
output          [12:0]      DRAM_ADDR;
output        [1:0]         DRAM_BA;
output                      DRAM_CAS_N;
output                      DRAM_CKE;
output                      DRAM_CLK;
output                      DRAM_CS_N;
inout           [15:0]      DRAM_DQ;
output                      DRAM_LDQM;
output                      DRAM_UDQM;
output                      DRAM_RAS_N;
output                      DRAM_WE_N;




//=======================================================
//  REG/WIRE declarations
//=======================================================
// Input and output declarations
logic CLK_50M;
logic  [9:0] LED;
assign CLK_50M =  CLOCK_50;
assign LEDR[9:0] = LED[9:0];
wire reset;
assign reset =~KEY[3];
assign pause = SW[0];
assign start = SW[1];
logic read,write,CLOCK2_50,write_ready,read_ready;
//Character definitions




//wire decleration
    
	 
	 /////////////////clock divider for sampling clock code here//////////////////////////
	   logic sampling_clk;
Clock_divider U1(
.clock_in(CLK_50M),
.reset(1'b0),               // Clock divider for 22KHz 
.DIVISOR(32'd1042),   //32'd4545
.clock_out(sampling_clk)
);
logic sampling_clk_edge;
	  /////////////////clock divider for sampling clock code here//////////////////////////
	  
	 
/////////////////clock and 50MHz syncronization and edge detection //////////////////////////
	   
/*
asyncsig U9(
    .clk(CLK_50M),
    .async_sig(CLK_7200),  //synchronizer for clock 50 and clock 7200 from my HW 1
    .out_sync_sig(clk_7200_sync)
);*/

edge_detect_gate U7(
.clk50(CLK_50M),        //direct CHU edge detector implementation
.reset(1'b0),
.clkother(sampling_clk),
.edge_clk(sampling_clk_edge)
);
/////////////////clock 7200Hz and 50MHz syncronization and edge detection //////////////////////////


/////////////////Flash Control modules //////////////////////////
	 wire            flash_mem_read;
wire            flash_mem_waitrequest;
wire    [22:0]  flash_mem_address;
wire    [31:0]  flash_mem_readdata;
wire            flash_mem_readdatavalid;
wire    [3:0]   flash_mem_byteenable;

	logic signed [23:0] writedata_left, writedata_right;
	logic [15:0] audio_data;
	logic [15:0] data_out;
	logic signed [23:0]readdata_left, readdata_right;
  assign writedata_left = {audio_data,8'b11111111};
assign writedata_right = {audio_data,8'b11111111};
	assign read = 1'b0;
	 
  assign audio_data = {data_out_compdec,2'b11};
  assign write = finish_compdec;
	/////////////////Flash Control modules //////////////////////////
logic pause,start;
	
	flashfsm U8 (.CLK50MHZ(CLK_50M), 
		.CLK_sampling(sampling_clk_edge),
		.flash_mem_readdatavalid(flash_mem_readdatavalid), 
		.flash_mem_waitrequest(flash_mem_waitrequest), 
		.flash_mem_readdata(flash_mem_readdata),           // Flash controller is fed syncrhonized edge detected sampling clock
		.reset(reset),
		.pause(pause),
		.start(start),
		.flash_mem_read(flash_mem_read), 
		.flash_mem_byteenable(flash_mem_byteenable), 
		.data_out(data_out), 
		.flash_mem_address(flash_mem_address),
    //.write_codec(write)
    .write_codec(start_compenc_init)
		);

    

	flash flash_inst (
		.clk_clk                 (CLK_50M),
		.reset_reset_n           (1'b1),
		.flash_mem_write         (1'b0),
		.flash_mem_burstcount    (1'b1),
		.flash_mem_waitrequest   (flash_mem_waitrequest),
		.flash_mem_read          (flash_mem_read),
		.flash_mem_address       (flash_mem_address),
		.flash_mem_writedata     (),
		.flash_mem_readdata      (flash_mem_readdata),
		.flash_mem_readdatavalid (flash_mem_readdatavalid),
		.flash_mem_byteenable    (flash_mem_byteenable)
	);
	wire flash_mem_write;
	wire [31:0] flash_mem_writedata;
	wire [5:0] flash_mem_burstcount;
				
	assign flash_mem_write = 1'b0;
	assign flash_mem_writedata = 32'b0;  //as stated in lab manual, set writes to 0
	assign flash_mem_burstcount = 6'b000001;

/////////////////compression encoding/decoding //////////////////////////
  logic start_compenc,start_compenc_init;
  edge_detect_gate flash_ready(
    .clk50(CLK_50M),        //direct CHU edge detector implementation
    .reset(1'b0),
    .clkother(start_compenc_init),
    .edge_clk(start_compenc)
    );

	logic finish_compenc,finish_compdec,ready_compdec;
	logic [7:0] data_out_compenc;
	logic [13:0] data_out_compdec;
  //encoding
  ulaw_comp compression(
    .clk(CLK_50M),
    .start(start_compenc), 
    .in(data_out[15:2]), 
    .enc_out(data_out_compenc),
    .finish(finish_compenc)
    );
    //decoding
    ulaw_decomp decompression(
      .clk(CLK_50M),
      .start(valid_out_BCH_dec), 
      .enc_in(data_out_BCH_dec), 
      .dec_out(data_out_compdec),
      .finish(finish_compdec),
      .ready(ready_compdec)
      );
      /////////////////compression encoding/decoding //////////////////////////
logic ready_BCH_enc,sop_in_BCH_enc,eop_in_BCH_enc,valid_out_BCH_enc,finish_BCH_enc,load_BCH_enc;
logic [7:0] data_out_BCH_enc;
logic sop_out_BCH_enc,eop_out_BCH_enc,ready_BCH_dec;
      /////////////////error encoding/decoding //////////////////////////
      BCH_enc_controller  BCH_cont (
        .clk        (CLK_50M),
        .reset      (reset),
        .sop_in     (sop_in_BCH_enc),
        .eop_in     (eop_in_BCH_enc),
        .ready      (ready_BCH_enc),
        .load       (load_BCH_enc),
        .valid_out  (valid_out_BCH_enc), 
        .start      (finish_compenc),
        .finish     (finish_BCH_enc)
        );
//encoding 
      BCH_204_128_10_enc ERROR_ENC (
        .clk        (CLK_50M),        // clk.clk
        .reset      (~reset),      // rst.reset
        .load       (load_BCH_enc),       //  in.valid
        .ready      (ready_BCH_enc),      //    .ready
        .sop_in     (sop_in_BCH_enc),     //    .startofpacket //should probably come from flash reader
        .eop_in     (eop_in_BCH_enc),     //    .endofpacket //should probably come from flash reader
        .data_in    (data_out_compenc),    //    .data_in // from comp
        .valid_out  (valid_out_BCH_enc),  // out.valid

        .sink_ready (ready_BCH_dec), //    .ready

        .sop_out    (sop_out_BCH_enc),    //    .startofpacket
        .eop_out    (eop_out_BCH_enc),    //    .endofpacket
        .data_out   (data_out_BCH_enc)    //    .data_out
    );

    //decoding
logic [7:0] data_out_BCH_dec;
logic valid_out_BCH_dec,sop_out_BCH_dec,eop_out_BCH_dec;
logic [7:0]number_errors_BCH_dec;
    BCH_204_128_10_dec ERROR_DEC (
      .clk        (CLK_50M),        // clk.clk
      .reset      (~reset),      // rst.reset
      .load          (valid_out_BCH_enc),          //  in.valid
      .ready         (ready_BCH_dec),         //    .ready
      .sop_in        (sop_out_BCH_enc),        //    .startofpacket
      .eop_in        (eop_out_BCH_enc),        //    .endofpacket
      .data_in       (data_out_BCH_enc),       //    .data_in
      .valid_out     (valid_out_BCH_dec),     // out.valid
      .sink_ready    (ready_compdec),    //    .ready
      .sop_out       (sop_out_BCH_dec),       //    .startofpacket
      .eop_out       (eop_out_BCH_dec),       //    .endofpacket
      .data_out      (data_out_BCH_dec),      //    .data_out
      .number_errors (number_errors_BCH_dec)  //    .number_errors
    );
  
  
      /////////////////error encoding/decoding //////////////////////////
 carrier_freq 900MHZ_carrier(
     .refclk(CLOCK3_50),   //  refclk.clk
      .rst(reset),      //   reset.reset
     .outclk_0(CLOCK_900), // outclk0.clk
     .locked()    //  locked.export
    );


/////////////////final project code here//////////////////////////
/*
  message_RAM message_RAM (
    .data(),
    .rdaddress(),
    .rdclock(),
    .rden(),
    .wraddress(),
    .wrclock(),
    .wren(),
    .q()
    );
*/







//=====================================================================================
//
//  Seven-Segment and speed control
//
//=====================================================================================

SevenSegmentDisplayDecoder U12(HEX0, inHEX0);
SevenSegmentDisplayDecoder U13(HEX1, inHEX1);
SevenSegmentDisplayDecoder U14(HEX2, inHEX2);
SevenSegmentDisplayDecoder U15(HEX3, inHEX3);
SevenSegmentDisplayDecoder U16(HEX4, inHEX4);
SevenSegmentDisplayDecoder U17(HEX5, inHEX5);
  logic [3:0]inHEX0;
  logic [3:0]inHEX1;
  logic [3:0]inHEX2;
  logic [3:0]inHEX3;
  logic [3:0]inHEX4;
  logic [3:0]inHEX5;
  assign inHEX0 = audio_data[3:0];
  assign inHEX1 = audio_data[7:4];
  assign inHEX2 = audio_data[11:8];
  assign inHEX3 = audio_data[15:12];
  assign inHEX4 = number_errors_BCH_dec[3:0];
  assign inHEX5 = number_errors_BCH_dec[7:4];
  





/////////////////////////////////////////////////////////////////////////////////
// Audio CODEC interface. 
//
// The interface consists of the following wires:
// read_ready, write_ready - CODEC ready for read/write operation 
// readdata_left, readdata_right - left and right channel data from the CODEC
// read - send data from the CODEC (both channels)
// writedata_left, writedata_right - left and right channel data to the CODEC
// write - send data to the CODEC (both channels)
// AUD_* - should connect to top-level entity I/O of the same name.
//         These signals go directly to the Audio CODEC
// I2C_* - should connect to top-level entity I/O of the same name.
//         These signals go directly to the Audio/Video Config module
/////////////////////////////////////////////////////////////////////////////////
	clock_generator my_clock_gen(
		// inputs
		CLOCK2_50,
		reset,

		// outputs
		AUD_XCK
	);

	audio_and_video_config cfg(
		// Inputs
		CLOCK_50,
		reset,

		// Bidirectionals
		FPGA_I2C_SDAT,
		FPGA_I2C_SCLK
	);

	audio_codec codec(
		// Inputs
		CLOCK_50,
		reset,

		read,	write,
		writedata_left, writedata_right,

		AUD_ADCDAT,

		// Bidirectionals
		AUD_BCLK,
		AUD_ADCLRCK,
		AUD_DACLRCK,

		// Outputs
		read_ready, write_ready,
		readdata_left, readdata_right,
		AUD_DACDAT
	);

endmodule
