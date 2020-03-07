LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_BIT.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY AsynchronousDFlipFlop IS
	PORT (
		CLK,RESET,D: IN STD_LOGIC;
		Q: OUT STD_LOGIC
	);
 
END AsynchronousDFlipFlop;

ARCHITECTURE AsynchronousDFlipFlopArchitecture OF AsynchronousDFlipFlop IS
BEGIN

	AsynDFFProcess: PROCESS (CLK, RESET)
	BEGIN
		
		IF RESET THEN 
			Q <= '0';
		ELSIF(RISING_EDGE(CLK)) THEN
			Q<=D;
		END IF;
		
	END PROCESS;
	
END AsynchronousDFlipFlopArchitecture;