LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_BIT.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY SynchronousDFlipFlop IS
	PORT (
		CLK,RESET,D: IN STD_LOGIC;
		Q: OUT STD_LOGIC
	);
 
END SynchronousDFlipFlop;

ARCHITECTURE SynchronousDFlipFlopArchitecture OF SynchronousDFlipFlop IS
BEGIN

	AsynDFFProcess: PROCESS (CLK)
	BEGIN
		
		IF RESET THEN 
			Q <= '0';
		ELSIF(RISING_EDGE(CLK)) THEN
			Q<=D;
		END IF;
		
	END PROCESS;
	
END SynchronousDFlipFlopArchitecture;
