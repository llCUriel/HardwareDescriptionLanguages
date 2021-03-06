LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.all;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Hw3 IS

	PORT(
		 T   : IN  STD_LOGIC;
		 CLK : IN  STD_LOGIC;
		 RESET: IN STD_LOGIC;
		 Q   : OUT STD_LOGIC
		);

END Hw3;

ARCHITECTURE Hw3Architecture OF Hw3 IS

signal TMP: std_logic;
BEGIN

PROCESS(CLK,RESET) BEGIN
	IF(RESET='0') THEN
		TMP<='0';
	ELSIF(RISING_EDGE(CLK)) THEN
		IF (T='0') THEN
			TMP<=TMP;
		ELSIF T='1' THEN
			TMP<= NOT(TMP);
		END IF;
	END IF;
END PROCESS;
Q<=TMP;

END Hw3Architecture;
