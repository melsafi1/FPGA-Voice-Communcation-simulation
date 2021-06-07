LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE rsx_roots IS

type numarray IS ARRAY (0 TO 255) OF integer;

constant negenum : numarray := (1,142,71,173,216,108,54,27,131,207,233,250,125,176,88,44,22,
                                11,139,203,235,251,243,247,245,244,122,61,144,72,36,18,9,
                                138,69,172,86,43,155,195,239,249,242,121,178,89,162,81,166,
                                83,167,221,224,112,56,28,14,7,141,200,100,50,25,130,65,
                                174,87,165,220,110,55,149,196,98,49,150,75,171,219,227,255,
                                241,246,123,179,215,229,252,126,63,145,198,99,191,209,230,115,
                                183,213,228,114,57,146,73,170,85,164,82,41,154,77,168,84,
                                42,21,132,66,33,158,79,169,218,109,184,92,46,23,133,204,
                                102,51,151,197,236,118,59,147,199,237,248,124,62,31,129,206,
                                103,189,208,104,52,26,13,136,68,34,17,134,67,175,217,226,
                                113,182,91,163,223,225,254,127,177,214,107,187,211,231,253,240,
                                120,60,30,15,137,202,101,188,94,47,153,194,97,190,95,161,
                                222,111,185,210,105,186,93,160,80,40,20,10,5,140,70,35,
                                159,193,238,119,181,212,106,53,148,74,37,156,78,39,157,192,
                                96,48,24,12,6,3,143,201,234,117,180,90,45,152,76,38,
                                19,135,205,232,116,58,29,128,64,32,16,8,4,2,1);

constant powernum : numarray := (1,2,4,8,16,32,64,128,29,58,116,232,205,135,19,38,76,
                                152,45,90,180,117,234,201,143,3,6,12,24,48,96,192,157,
                                39,78,156,37,74,148,53,106,212,181,119,238,193,159,35,70,
                                140,5,10,20,40,80,160,93,186,105,210,185,111,222,161,95,
                                190,97,194,153,47,94,188,101,202,137,15,30,60,120,240,253,
                                231,211,187,107,214,177,127,254,225,223,163,91,182,113,226,217,
                                175,67,134,17,34,68,136,13,26,52,104,208,189,103,206,129,
                                31,62,124,248,237,199,147,59,118,236,197,151,51,102,204,133,
                                23,46,92,184,109,218,169,79,158,33,66,132,21,42,84,168,
                                77,154,41,82,164,85,170,73,146,57,114,228,213,183,115,230,
                                209,191,99,198,145,63,126,252,229,215,179,123,246,241,255,227,
                                219,171,75,150,49,98,196,149,55,110,220,165,87,174,65,130,
                                25,50,100,200,141,7,14,28,56,112,224,221,167,83,166,81,
                                162,89,178,121,242,249,239,195,155,43,86,172,69,138,9,18,
                                36,72,144,61,122,244,245,247,243,251,235,203,139,11,22,44,
                                88,176,125,250,233,207,131,27,54,108,216,173,71,142,1);

constant inverses : numarray := (0,1,142,244,71,167,122,186,173,157,221,152,61,170,93,150,216,
                                114,192,88,224,62,76,102,144,222,85,128,160,131,75,42,108,
                                237,57,81,96,86,44,138,112,208,31,74,38,139,51,110,72,
                                137,111,46,164,195,64,94,80,34,207,169,171,12,21,225,54,
                                95,248,213,146,78,166,4,48,136,43,30,22,103,69,147,56,
                                35,104,140,129,26,37,97,19,193,203,99,151,14,55,65,36,
                                87,202,91,185,196,23,77,82,141,239,179,32,236,47,50,40,
                                209,17,217,233,251,218,121,219,119,6,187,132,205,254,252,27,
                                84,161,29,124,204,228,176,73,49,39,45,83,105,2,245,24,
                                223,68,79,155,188,15,92,11,220,189,148,172,9,199,162,28,
                                130,159,198,52,194,70,5,206,59,13,60,156,8,190,183,135,
                                229,238,107,235,242,191,175,197,100,7,123,149,154,174,182,18,
                                89,165,53,101,184,163,158,210,247,98,90,133,125,168,58,41,
                                113,200,246,249,67,215,214,16,115,118,120,153,10,25,145,20,
                                63,230,240,134,177,226,241,250,116,243,180,109,33,178,106,227,
                                231,181,234,3,143,211,201,66,212,232,117,127,255,126,253);

END rsx_roots;

