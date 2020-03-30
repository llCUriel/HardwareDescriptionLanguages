LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_BIT.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY TriStateBuffer IS
	PORT (
		BufferInput   : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		EN 			  : IN  STD_LOGIC;
		BufferOutput  : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
 
END TriStateBuffer;

ARCHITECTURE TriStateBufferArchitecture OF TriStateBuffer IS

BEGIN

	BufferOutput <= BufferInput when (NOT EN) ELSE (OTHERS => 'Z');

END TriStateBufferArchitecture;