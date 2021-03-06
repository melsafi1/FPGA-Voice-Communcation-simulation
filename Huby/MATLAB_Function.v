// -------------------------------------------------------------
// 
// File Name: C:\Users\huber\Downloads\hdlsrc\HDLAWGNGenerator\HDLAWGNGenerator\MATLAB_Function.v
// Created: 2021-06-06 18:19:42
// 
// Generated by MATLAB 9.10 and HDL Coder 3.18
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: MATLAB_Function
// Source Path: HDLAWGNGenerator/AWGNGenerator/GaussianNoiseWithUnitVar/SqrtImplementation/SqrtEval/RangeReduction/MATLAB 
// Functio
// Hierarchy Level: 5
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module MATLAB_Function
          (x,
           exp_f);


  input   [30:0] x;  // ufix31_En24
  output  [7:0] exp_f;  // uint8


  wire [37:0] x_1;  // ufix38_En31
  wire [37:0] x_2;  // ufix38_En31
  wire [69:0] p127x_div_temp;  // ufix70_En32
  wire [69:0] p127x_cast;  // ufix70_En63
  wire tmp;
  wire [75:0] p125tmp_cast;  // ufix76_En38
  wire signed [31:0] temp;  // int32
  wire tmp_1;
  wire [75:0] p122tmp_cast;  // ufix76_En39
  wire signed [31:0] temp_1;  // int32
  wire signed [31:0] tmp_2;  // int32
  wire tmp_3;
  wire [75:0] p118tmp_cast;  // ufix76_En40
  wire signed [31:0] temp_2;  // int32
  wire signed [31:0] tmp_4;  // int32
  wire tmp_5;
  wire [75:0] p114tmp_cast;  // ufix76_En41
  wire signed [31:0] temp_3;  // int32
  wire signed [31:0] tmp_6;  // int32
  wire tmp_7;
  wire [75:0] p110tmp_cast;  // ufix76_En42
  wire signed [31:0] temp_4;  // int32
  wire signed [31:0] tmp_8;  // int32
  wire tmp_9;
  wire [75:0] p106tmp_cast;  // ufix76_En43
  wire signed [31:0] temp_5;  // int32
  wire signed [31:0] tmp_10;  // int32
  wire tmp_11;
  wire [75:0] p102tmp_cast;  // ufix76_En44
  wire signed [31:0] temp_6;  // int32
  wire signed [31:0] tmp_12;  // int32
  wire tmp_13;
  wire [75:0] p98tmp_cast;  // ufix76_En45
  wire signed [31:0] temp_7;  // int32
  wire signed [31:0] tmp_14;  // int32
  wire tmp_15;
  wire [75:0] p94tmp_cast;  // ufix76_En46
  wire signed [31:0] temp_8;  // int32
  wire signed [31:0] tmp_16;  // int32
  wire tmp_17;
  wire [75:0] p90tmp_cast;  // ufix76_En47
  wire signed [31:0] temp_9;  // int32
  wire signed [31:0] tmp_18;  // int32
  wire tmp_19;
  wire [75:0] p86tmp_cast;  // ufix76_En48
  wire signed [31:0] temp_10;  // int32
  wire signed [31:0] tmp_20;  // int32
  wire tmp_21;
  wire [75:0] p82tmp_cast;  // ufix76_En49
  wire signed [31:0] temp_11;  // int32
  wire signed [31:0] tmp_22;  // int32
  wire tmp_23;
  wire [75:0] p78tmp_cast;  // ufix76_En50
  wire signed [31:0] temp_12;  // int32
  wire signed [31:0] tmp_24;  // int32
  wire tmp_25;
  wire [75:0] p74tmp_cast;  // ufix76_En51
  wire signed [31:0] temp_13;  // int32
  wire signed [31:0] tmp_26;  // int32
  wire tmp_27;
  wire [75:0] p70tmp_cast;  // ufix76_En52
  wire signed [31:0] temp_14;  // int32
  wire signed [31:0] tmp_28;  // int32
  wire tmp_29;
  wire [75:0] p66tmp_cast;  // ufix76_En53
  wire signed [31:0] temp_15;  // int32
  wire signed [31:0] tmp_30;  // int32
  wire tmp_31;
  wire [75:0] p62tmp_cast;  // ufix76_En54
  wire signed [31:0] temp_16;  // int32
  wire signed [31:0] tmp_32;  // int32
  wire tmp_33;
  wire [75:0] p58tmp_cast;  // ufix76_En55
  wire signed [31:0] temp_17;  // int32
  wire signed [31:0] tmp_34;  // int32
  wire tmp_35;
  wire [75:0] p54tmp_cast;  // ufix76_En56
  wire signed [31:0] temp_18;  // int32
  wire signed [31:0] tmp_36;  // int32
  wire tmp_37;
  wire [75:0] p50tmp_cast;  // ufix76_En57
  wire signed [31:0] temp_19;  // int32
  wire signed [31:0] tmp_38;  // int32
  wire tmp_39;
  wire [75:0] p46tmp_cast;  // ufix76_En58
  wire signed [31:0] temp_20;  // int32
  wire signed [31:0] tmp_40;  // int32
  wire tmp_41;
  wire [75:0] p42tmp_cast;  // ufix76_En59
  wire signed [31:0] temp_21;  // int32
  wire signed [31:0] tmp_42;  // int32
  wire tmp_43;
  wire [75:0] p38tmp_cast;  // ufix76_En60
  wire signed [31:0] temp_22;  // int32
  wire signed [31:0] tmp_44;  // int32
  wire tmp_45;
  wire [75:0] p34tmp_cast;  // ufix76_En61
  wire signed [31:0] temp_23;  // int32
  wire signed [31:0] tmp_46;  // int32
  wire tmp_47;
  wire [75:0] p30tmp_cast;  // ufix76_En62
  wire signed [31:0] temp_24;  // int32
  wire signed [31:0] tmp_48;  // int32
  wire tmp_49;
  wire [75:0] p26tmp_cast;  // ufix76_En63
  wire signed [31:0] temp_25;  // int32
  wire signed [31:0] tmp_50;  // int32
  wire tmp_51;
  wire [75:0] p22tmp_cast;  // ufix76_En64
  wire signed [31:0] temp_26;  // int32
  wire signed [31:0] tmp_52;  // int32
  wire tmp_53;
  wire [75:0] p18tmp_cast;  // ufix76_En65
  wire signed [31:0] temp_27;  // int32
  wire signed [31:0] tmp_54;  // int32
  wire tmp_55;
  wire [75:0] p14tmp_cast;  // ufix76_En66
  wire signed [31:0] temp_28;  // int32
  wire signed [31:0] tmp_56;  // int32
  wire tmp_57;
  wire [75:0] p10tmp_cast;  // ufix76_En67
  wire signed [31:0] temp_29;  // int32
  wire signed [31:0] tmp_58;  // int32
  wire tmp_59;
  wire signed [31:0] temp_30;  // int32
  wire signed [31:0] tmp_60;  // int32
  wire signed [31:0] temp_31;  // int32
  wire signed [31:0] tmp_61;  // int32


  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function
  // 
  // exp_e=31-length(dec2bin(x));
  assign x_1 = {x, 7'b0000000};



  assign p127x_cast = {x_1, 32'b00000000000000000000000000000000};
  assign p127x_div_temp = p127x_cast / 38'h2000000000;
  assign x_2 = ((p127x_div_temp[69:39] != 31'b0000000000000000000000000000000) || (p127x_div_temp[38:1] == 38'h3FFFFFFFFF) ? 38'h3FFFFFFFFF :
              p127x_div_temp[38:1] + p127x_div_temp[0]);



  assign p125tmp_cast = {1'b0, {x_2, 37'b0000000000000000000000000000000000000}};
  assign tmp = p125tmp_cast > 76'h0000000004000000000;



  assign temp = 32'sd0;



  assign p122tmp_cast = {1'b0, {x_2, 37'b0000000000000000000000000000000000000}};
  assign tmp_1 = p122tmp_cast > 76'h0000000008000000000;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_trueregionp123
  assign temp_1 = 32'sd30;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_falseregionp119
  assign tmp_2 = (tmp == 1'b0 ? temp :
              temp_1);



  assign p118tmp_cast = {1'b0, {x_2, 37'b0000000000000000000000000000000000000}};
  assign tmp_3 = p118tmp_cast > 76'h0000000010000000000;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_trueregionp119
  assign temp_2 = 32'sd29;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_falseregionp115
  assign tmp_4 = (tmp_1 == 1'b0 ? tmp_2 :
              temp_2);



  assign p114tmp_cast = {1'b0, {x_2, 37'b0000000000000000000000000000000000000}};
  assign tmp_5 = p114tmp_cast > 76'h0000000020000000000;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_trueregionp115
  assign temp_3 = 32'sd28;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_falseregionp111
  assign tmp_6 = (tmp_3 == 1'b0 ? tmp_4 :
              temp_3);



  assign p110tmp_cast = {1'b0, {x_2, 37'b0000000000000000000000000000000000000}};
  assign tmp_7 = p110tmp_cast > 76'h0000000040000000000;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_trueregionp111
  assign temp_4 = 32'sd27;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_falseregionp107
  assign tmp_8 = (tmp_5 == 1'b0 ? tmp_6 :
              temp_4);



  assign p106tmp_cast = {1'b0, {x_2, 37'b0000000000000000000000000000000000000}};
  assign tmp_9 = p106tmp_cast > 76'h0000000080000000000;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_trueregionp107
  assign temp_5 = 32'sd26;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_falseregionp103
  assign tmp_10 = (tmp_7 == 1'b0 ? tmp_8 :
              temp_5);



  assign p102tmp_cast = {1'b0, {x_2, 37'b0000000000000000000000000000000000000}};
  assign tmp_11 = p102tmp_cast > 76'h0000000100000000000;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_trueregionp103
  assign temp_6 = 32'sd25;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_falseregionp99
  assign tmp_12 = (tmp_9 == 1'b0 ? tmp_10 :
              temp_6);



  assign p98tmp_cast = {1'b0, {x_2, 37'b0000000000000000000000000000000000000}};
  assign tmp_13 = p98tmp_cast > 76'h0000000200000000000;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_trueregionp99
  assign temp_7 = 32'sd24;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_falseregionp95
  assign tmp_14 = (tmp_11 == 1'b0 ? tmp_12 :
              temp_7);



  assign p94tmp_cast = {1'b0, {x_2, 37'b0000000000000000000000000000000000000}};
  assign tmp_15 = p94tmp_cast > 76'h0000000400000000000;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_trueregionp95
  assign temp_8 = 32'sd23;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_falseregionp91
  assign tmp_16 = (tmp_13 == 1'b0 ? tmp_14 :
              temp_8);



  assign p90tmp_cast = {1'b0, {x_2, 37'b0000000000000000000000000000000000000}};
  assign tmp_17 = p90tmp_cast > 76'h0000000800000000000;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_trueregionp91
  assign temp_9 = 32'sd22;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_falseregionp87
  assign tmp_18 = (tmp_15 == 1'b0 ? tmp_16 :
              temp_9);



  assign p86tmp_cast = {1'b0, {x_2, 37'b0000000000000000000000000000000000000}};
  assign tmp_19 = p86tmp_cast > 76'h0000001000000000000;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_trueregionp87
  assign temp_10 = 32'sd21;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_falseregionp83
  assign tmp_20 = (tmp_17 == 1'b0 ? tmp_18 :
              temp_10);



  assign p82tmp_cast = {1'b0, {x_2, 37'b0000000000000000000000000000000000000}};
  assign tmp_21 = p82tmp_cast > 76'h0000002000000000000;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_trueregionp83
  assign temp_11 = 32'sd20;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_falseregionp79
  assign tmp_22 = (tmp_19 == 1'b0 ? tmp_20 :
              temp_11);



  assign p78tmp_cast = {1'b0, {x_2, 37'b0000000000000000000000000000000000000}};
  assign tmp_23 = p78tmp_cast > 76'h0000004000000000000;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_trueregionp79
  assign temp_12 = 32'sd19;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_falseregionp75
  assign tmp_24 = (tmp_21 == 1'b0 ? tmp_22 :
              temp_12);



  assign p74tmp_cast = {1'b0, {x_2, 37'b0000000000000000000000000000000000000}};
  assign tmp_25 = p74tmp_cast > 76'h0000008000000000000;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_trueregionp75
  assign temp_13 = 32'sd18;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_falseregionp71
  assign tmp_26 = (tmp_23 == 1'b0 ? tmp_24 :
              temp_13);



  assign p70tmp_cast = {1'b0, {x_2, 37'b0000000000000000000000000000000000000}};
  assign tmp_27 = p70tmp_cast > 76'h0000010000000000000;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_trueregionp71
  assign temp_14 = 32'sd17;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_falseregionp67
  assign tmp_28 = (tmp_25 == 1'b0 ? tmp_26 :
              temp_14);



  assign p66tmp_cast = {1'b0, {x_2, 37'b0000000000000000000000000000000000000}};
  assign tmp_29 = p66tmp_cast > 76'h0000020000000000000;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_trueregionp67
  assign temp_15 = 32'sd16;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_falseregionp63
  assign tmp_30 = (tmp_27 == 1'b0 ? tmp_28 :
              temp_15);



  assign p62tmp_cast = {1'b0, {x_2, 37'b0000000000000000000000000000000000000}};
  assign tmp_31 = p62tmp_cast > 76'h0000040000000000000;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_trueregionp63
  assign temp_16 = 32'sd15;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_falseregionp59
  assign tmp_32 = (tmp_29 == 1'b0 ? tmp_30 :
              temp_16);



  assign p58tmp_cast = {1'b0, {x_2, 37'b0000000000000000000000000000000000000}};
  assign tmp_33 = p58tmp_cast > 76'h0000080000000000000;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_trueregionp59
  assign temp_17 = 32'sd14;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_falseregionp55
  assign tmp_34 = (tmp_31 == 1'b0 ? tmp_32 :
              temp_17);



  assign p54tmp_cast = {1'b0, {x_2, 37'b0000000000000000000000000000000000000}};
  assign tmp_35 = p54tmp_cast > 76'h0000100000000000000;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_trueregionp55
  assign temp_18 = 32'sd13;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_falseregionp51
  assign tmp_36 = (tmp_33 == 1'b0 ? tmp_34 :
              temp_18);



  assign p50tmp_cast = {1'b0, {x_2, 37'b0000000000000000000000000000000000000}};
  assign tmp_37 = p50tmp_cast > 76'h0000200000000000000;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_trueregionp51
  assign temp_19 = 32'sd12;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_falseregionp47
  assign tmp_38 = (tmp_35 == 1'b0 ? tmp_36 :
              temp_19);



  assign p46tmp_cast = {1'b0, {x_2, 37'b0000000000000000000000000000000000000}};
  assign tmp_39 = p46tmp_cast > 76'h0000400000000000000;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_trueregionp47
  assign temp_20 = 32'sd11;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_falseregionp43
  assign tmp_40 = (tmp_37 == 1'b0 ? tmp_38 :
              temp_20);



  assign p42tmp_cast = {1'b0, {x_2, 37'b0000000000000000000000000000000000000}};
  assign tmp_41 = p42tmp_cast > 76'h0000800000000000000;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_trueregionp43
  assign temp_21 = 32'sd10;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_falseregionp39
  assign tmp_42 = (tmp_39 == 1'b0 ? tmp_40 :
              temp_21);



  assign p38tmp_cast = {1'b0, {x_2, 37'b0000000000000000000000000000000000000}};
  assign tmp_43 = p38tmp_cast > 76'h0001000000000000000;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_trueregionp39
  assign temp_22 = 32'sd9;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_falseregionp35
  assign tmp_44 = (tmp_41 == 1'b0 ? tmp_42 :
              temp_22);



  assign p34tmp_cast = {1'b0, {x_2, 37'b0000000000000000000000000000000000000}};
  assign tmp_45 = p34tmp_cast > 76'h0002000000000000000;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_trueregionp35
  assign temp_23 = 32'sd8;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_falseregionp31
  assign tmp_46 = (tmp_43 == 1'b0 ? tmp_44 :
              temp_23);



  assign p30tmp_cast = {1'b0, {x_2, 37'b0000000000000000000000000000000000000}};
  assign tmp_47 = p30tmp_cast > 76'h0004000000000000000;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_trueregionp31
  assign temp_24 = 32'sd7;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_falseregionp27
  assign tmp_48 = (tmp_45 == 1'b0 ? tmp_46 :
              temp_24);



  assign p26tmp_cast = {1'b0, {x_2, 37'b0000000000000000000000000000000000000}};
  assign tmp_49 = p26tmp_cast > 76'h0008000000000000000;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_trueregionp27
  assign temp_25 = 32'sd6;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_falseregionp23
  assign tmp_50 = (tmp_47 == 1'b0 ? tmp_48 :
              temp_25);



  assign p22tmp_cast = {1'b0, {x_2, 37'b0000000000000000000000000000000000000}};
  assign tmp_51 = p22tmp_cast > 76'h0010000000000000000;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_trueregionp23
  assign temp_26 = 32'sd5;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_falseregionp19
  assign tmp_52 = (tmp_49 == 1'b0 ? tmp_50 :
              temp_26);



  assign p18tmp_cast = {1'b0, {x_2, 37'b0000000000000000000000000000000000000}};
  assign tmp_53 = p18tmp_cast > 76'h0020000000000000000;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_trueregionp19
  assign temp_27 = 32'sd4;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_falseregionp15
  assign tmp_54 = (tmp_51 == 1'b0 ? tmp_52 :
              temp_27);



  assign p14tmp_cast = {1'b0, {x_2, 37'b0000000000000000000000000000000000000}};
  assign tmp_55 = p14tmp_cast > 76'h0040000000000000000;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_trueregionp15
  assign temp_28 = 32'sd3;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_falseregionp11
  assign tmp_56 = (tmp_53 == 1'b0 ? tmp_54 :
              temp_28);



  assign p10tmp_cast = {1'b0, {x_2, 37'b0000000000000000000000000000000000000}};
  assign tmp_57 = p10tmp_cast > 76'h0080000000000000000;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_trueregionp11
  assign temp_29 = 32'sd2;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_falseregionp7
  assign tmp_58 = (tmp_55 == 1'b0 ? tmp_56 :
              temp_29);



  // else
  // 
  //     while( )
  // 
  //         temp = temp+1;
  // 
  //         flag()=flag()*2;
  // 
  //     end
  // 
  // end
  // 
  // 
  // 
  // end
  assign tmp_59 = x_2 == 38'h0000000000;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_trueregionp7
  assign temp_30 = 32'sd1;



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_falseregionp3
  assign tmp_60 = (tmp_57 == 1'b0 ? tmp_58 :
              temp_30);



  // HDL code generation from MATLAB function: sf_gateway_MATLAB Function_trueregionp3
  assign temp_31 = 32'sd31;



  assign tmp_61 = (tmp_59 == 1'b0 ? tmp_60 :
              temp_31);



  assign exp_f = tmp_61[7:0];



endmodule  // MATLAB_Function

