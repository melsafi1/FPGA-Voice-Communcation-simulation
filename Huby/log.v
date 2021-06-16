// -------------------------------------------------------------
// 
// File Name: C:\Users\huber\Downloads\hdlsrc\HDLAWGNGenerator\HDLAWGNGenerator\log.v
// Created: 2021-06-06 18:19:43
// 
// Generated by MATLAB 9.10 and HDL Coder 3.18
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: log
// Source Path: HDLAWGNGenerator/AWGNGenerator/GaussianNoiseWithUnitVar/logImplementation/log
// Hierarchy Level: 3
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module log
          (clk,
           reset,
           enb,
           u0_48_48,
           e);


  input   clk;
  input   reset;
  input   enb;
  input   [47:0] u0_48_48;  // ufix48_En48
  output  [30:0] e;  // ufix31_En24


  wire [48:0] RangeReduction_out1;  // ufix49_En48
  wire [7:0] RangeReduction_out2;  // uint8
  wire signed [30:0] FunctionEvaluation_out1;  // sfix31_En27
  wire [7:0] FunctionEvaluation_out2;  // uint8
  wire [30:0] y;  // ufix31_En24


  RangeReduction_block u_RangeReduction (.clk(clk),
                                         .reset(reset),
                                         .enb(enb),
                                         .x(u0_48_48),  // ufix48_En48
                                         .x_e(RangeReduction_out1),  // ufix49_En48
                                         .exp_e(RangeReduction_out2)  // uint8
                                         );

  FunctionEvaluation_block u_FunctionEvaluation (.x_e(RangeReduction_out1),  // ufix49_En48
                                                 .exp_eIn(RangeReduction_out2),  // uint8
                                                 .y_e(FunctionEvaluation_out1),  // sfix31_En27
                                                 .exp_eOut(FunctionEvaluation_out2)  // uint8
                                                 );

  RangeReconstruction_block u_RangeReconstruction (.y_e(FunctionEvaluation_out1),  // sfix31_En27
                                                   .exp_e(FunctionEvaluation_out2),  // uint8
                                                   .e(y)  // ufix31_En24
                                                   );

  assign e = y;

endmodule  // log
