LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_BIT.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Comparator IS

 	GENERIC (
		BinaryNumbersSize	 : INTEGER := 6
		);
	
	PORT (
		BinaryNumberA   : IN  STD_LOGIC_VECTOR(BinaryNumbersSize-1 DOWNTO 0);
		BinaryNumberB	 : IN  STD_LOGIC_VECTOR(BinaryNumbersSize-1 DOWNTO 0);
		S					 : OUT STD_LOGIC
	);
 
END Comparator;

ARCHITECTURE ComparatorArchitecture OF Comparator IS


BEGIN
	 
	S <= '1' when BinaryNumberA = BinaryNumberB else '0';

END ComparatorArchitecture;