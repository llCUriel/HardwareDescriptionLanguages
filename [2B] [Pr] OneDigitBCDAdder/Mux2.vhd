LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_BIT.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Mux_2To1 IS
	PORT (
		A: IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		B: IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		S: IN  STD_LOGIC;
		C: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
 
END Mux_2To1;

ARCHITECTURE Mux2Architecture OF Mux_2To1 IS

BEGIN

	C <= A when S else B;
	
END Mux2Architecture;