-- (C) 2001-2016 Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions and other 
-- software and tools, and its AMPP partner logic functions, and any output 
-- files any of the foregoing (including device programming or simulation 
-- files), and any associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License Subscription 
-- Agreement, Intel MegaCore Function License Agreement, or other applicable 
-- license agreement, including, without limitation, that your use is for the 
-- sole purpose of programming logic devices manufactured by Intel and sold by 
-- Intel or its authorized distributors.  Please refer to the applicable 
-- agreement for further details.



LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA BCH LIBRARY                        ***
--***                                             ***
--***   BCHP_DEL                                  ***
--***                                             ***
--***   Function: Generic Bus Delay               ***
--***                                             ***
--***   27/07/12 ML                               ***
--***                                             ***
--***   (c) 2012 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY bchp_del IS 
GENERIC (
           width : positive := 64;
           pipes : positive := 1
          );
PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (width DOWNTO 1); 
      
        cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
       );
END bchp_del;
  
ARCHITECTURE rtl OF bchp_del IS
  
  type delfftype IS ARRAY (pipes DOWNTO 1) OF STD_LOGIC_VECTOR (width DOWNTO 1);
  
  signal delff : delfftype := (others => (others => '0'));
  
BEGIN
  
  prc_del: PROCESS (sysclk)
  BEGIN
  
    IF (rising_edge(sysclk)) THEN
      IF (enable = '1') THEN
        delff(1)(width DOWNTO 1) <= aa;
        FOR k IN 2 TO pipes LOOP
          delff(k)(width DOWNTO 1) <= delff(k-1)(width DOWNTO 1);
        END LOOP;
      END IF;
    END IF;
  
  END PROCESS;
  
  cc <= delff(pipes)(width DOWNTO 1);
  
END rtl;

  