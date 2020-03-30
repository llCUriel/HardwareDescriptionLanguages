
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_BIT.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY FullAdder IS
 
	PORT (
		A,B : IN  STD_LOGIC;
		Cin : IN  STD_LOGIC;
		Cout: OUT STD_LOGIC;
		Sum : OUT STD_LOGIC
	);
 
END FullAdder;

ARCHITECTURE FullAdderArchitecture OF FullAdder IS BEGIN

Cout<= (B and Cin) xor (A and Cin) xor (A and B);
Sum <= A xor(B xor Cin);

END FullAdderArchitecture;
