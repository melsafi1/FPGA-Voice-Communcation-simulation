// -------------------------------------------------------------
// 
// File Name: C:\UBC Summer 2021\gitproject\ELEC391_Final_Project\mike\V_Normal_RC\Filter_for_16PSK\hdlcoder\receiver2\gm_gm_Modulation_test\Raised_Cosine_Receive_Filter_tc.v
// Created: 2021-06-16 00:04:21
// 
// Generated by MATLAB 9.10 and HDL Coder 3.18
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Raised_Cosine_Receive_Filter_tc
// Source Path: Raised Cosine Receive Filter_tc
// Hierarchy Level: 1
// 
// Master clock enable input: clk_enable
// 
// enb_1_1_1   : identical to clk_enable
// enb_1_8_1   : 8x slower than clk with phase 1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Raised_Cosine_Receive_Filter_tc
          (clk,
           reset,
           clk_enable,
           enb_1_1_1,
           enb_1_8_1);


  input   clk;
  input   reset;
  input   clk_enable;
  output  enb_1_1_1;
  output  enb_1_8_1;


  reg [2:0] count8;  // ufix3
  wire phase_all;
  reg  phase_1;
  wire phase_1_tmp;


  always @ (posedge clk or posedge reset)
    begin: Counter8
      if (reset == 1'b1) begin
        count8 <= 3'b001;
      end
      else begin
        if (clk_enable == 1'b1) begin
          if (count8 >= 3'b111) begin
            count8 <= 3'b000;
          end
          else begin
            count8 <= count8 + 3'b001;
          end
        end
      end
    end // Counter8

  assign phase_all = clk_enable ? 1'b1 : 1'b0;

  always @ (posedge clk or posedge reset)
    begin: temp_process1
      if (reset == 1'b1) begin
        phase_1 <= 1'b1;
      end
      else begin
        if (clk_enable == 1'b1) begin
          phase_1 <= phase_1_tmp;
        end
      end
    end // temp_process1

  assign  phase_1_tmp = (count8 == 3'b000 && clk_enable == 1'b1) ? 1'b1 : 1'b0;

  assign enb_1_1_1 =  phase_all & clk_enable;

  assign enb_1_8_1 =  phase_1 & clk_enable;


endmodule  // Raised_Cosine_Receive_Filter_tc

