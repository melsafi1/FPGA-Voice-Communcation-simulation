// -------------------------------------------------------------
// 
// File Name: C:\Users\huber\Downloads\hdlsrc\HDLAWGNGenerator\HDLAWGNGenerator\SinCos.v
// Created: 2021-06-06 18:19:42
// 
// Generated by MATLAB 9.10 and HDL Coder 3.18
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: SinCos
// Source Path: HDLAWGNGenerator/AWGNGenerator/GaussianNoiseWithUnitVar/SinCos
// Hierarchy Level: 2
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module SinCos
          (clk,
           reset,
           enb,
           u1,
           g0,
           g1_16_15);


  input   clk;
  input   reset;
  input   enb;
  input   [15:0] u1;  // ufix16_En16
  output  signed [15:0] g0;  // sfix16_En15
  output  signed [15:0] g1_16_15;  // sfix16_En15


  reg [15:0] u1_1;  // ufix16_En16
  wire signed [15:0] g0_1;  // sfix16_En15
  reg signed [15:0] Delay_out1;  // sfix16_En15
  wire signed [15:0] g1_16_15_1;  // sfix16_En15
  reg signed [15:0] Delay1_out1;  // sfix16_En15


  always @(posedge clk or posedge reset)
    begin : reduced_process
      if (reset == 1'b1) begin
        u1_1 <= 16'b0000000000000000;
      end
      else begin
        if (enb) begin
          u1_1 <= u1;
        end
      end
    end



  Sine_HDL_Optimized2 u_Sine_HDL_Optimized2 (.u(u1_1),  // ufix16_En16
                                             .x(g0_1)  // sfix16_En15
                                             );

  always @(posedge clk or posedge reset)
    begin : Delay_process
      if (reset == 1'b1) begin
        Delay_out1 <= 16'sb0000000000000000;
      end
      else begin
        if (enb) begin
          Delay_out1 <= g0_1;
        end
      end
    end



  assign g0 = Delay_out1;

  Sine_HDL_Optimized1 u_Sine_HDL_Optimized1 (.u(u1_1),  // ufix16_En16
                                             .x(g1_16_15_1)  // sfix16_En15
                                             );

  always @(posedge clk or posedge reset)
    begin : Delay1_process
      if (reset == 1'b1) begin
        Delay1_out1 <= 16'sb0000000000000000;
      end
      else begin
        if (enb) begin
          Delay1_out1 <= g1_16_15_1;
        end
      end
    end



  assign g1_16_15 = Delay1_out1;

endmodule  // SinCos

