-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "02/15/2020 20:27:29"
                                                            
-- Vhdl Test Bench template for design  :  VHDLAdder
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY VHDLAdder_vhd_tst IS
END VHDLAdder_vhd_tst;
ARCHITECTURE VHDLAdder_arch OF VHDLAdder_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC_VECTOR(0 DOWNTO 0);
SIGNAL B : STD_LOGIC_VECTOR(0 DOWNTO 0);
SIGNAL Cin : STD_LOGIC;
SIGNAL Cout : STD_LOGIC;
SIGNAL PartialSum : STD_LOGIC_VECTOR(0 DOWNTO 0);
SIGNAL TotalSum : STD_LOGIC_VECTOR(1 DOWNTO 0);
COMPONENT VHDLAdder
	PORT (
	A : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	B : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	Cin : IN STD_LOGIC;
	Cout : OUT STD_LOGIC;
	PartialSum : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
	TotalSum : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : VHDLAdder
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	B => B,
	Cin => Cin,
	Cout => Cout,
	PartialSum => PartialSum,
	TotalSum => TotalSum
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
A<="0";
B<="0";
Cin<='0';
wait for 20 ns;
A<="0";
B<="0";
Cin<='1';
wait for 20 ns;
A<="0";
B<="0";
Cin<='1';
wait for 20 ns;
A<="0";
B<="1";
Cin<='0';
wait for 20 ns;
A<="0";
B<="1";
Cin<='1';
wait for 20 ns;
A<="1";
B<="0";
Cin<='0';
wait for 20 ns;
A<="1";
B<="0";
Cin<='1';
wait for 20 ns;
A<="1";
B<="1";
Cin<='0';
wait for 20 ns;
A<="1";
B<="1";
Cin<='1';
wait for 20 ns; 
 -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END VHDLAdder_arch;
