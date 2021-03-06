module noise_generator (clk, enable, Q);
    input clk,enable;
    output [23:0]Q;
    reg [2:0] counter;
    always @(posedge clk)
    if (enable)
        counter = counter +1'b1;
        assign Q = {{10{counter[2]}}, counter,11'd0};

endmodule 