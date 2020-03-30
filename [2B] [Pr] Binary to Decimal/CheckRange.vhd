LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_BIT.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY CheckRange IS

 	GENERIC (
		NumberOfConditions : INTEGER := 6;
		InputSize			 : INTEGER := 6;
		OutputSize			 : INTEGER := 6
		);
	
	PORT (
		BinaryNumber   : IN  STD_LOGIC_VECTOR(InputSize -1 DOWNTO 0);
		Codes			   : OUT STD_LOGIC_VECTOR(OutputSize-1 DOWNTO 0)
	);
 
END CheckRange;

ARCHITECTURE CheckRangeArchitecture OF CheckRange IS
SIGNAL A   : STD_LOGIC_VECTOR(InputSize-1 DOWNTO 0);
SIGNAL Num : INTEGER;


BEGIN

	A<=BinaryNumber;
	Num<=CONV_INTEGER(A);
	CheckRangeProcess: PROCESS (BinaryNumber,Num)
	BEGIN
		IF(Num>=10 and Num<20) THEN
			Codes<="100000";
		ELSIF(Num>=20 and Num<30) THEN
			Codes<="010000";
		ELSIF(Num>=30 and Num<40) THEN
			Codes<="001000";
		ELSIF(Num>=40 and Num<50) THEN
			Codes<="000100";
		ELSIF(Num>=50 and Num<60) THEN
			Codes<="000010";
		ELSIF(Num>=60 and Num<70) THEN
			Codes<="000001";
		ELSE
			Codes<=(OTHERS => '0');
		END IF;


	END PROCESS CheckRangeProcess;

END CheckRangeArchitecture;