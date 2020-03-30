LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY ModulusOperator IS
 	GENERIC (
		OperatorsSize : INTEGER := 6;
		OutputSize    : INTEGER := 6
	);
	PORT (
		operatorA: IN  STD_LOGIC_VECTOR(OperatorsSize-1 DOWNTO 0);
		operatorB: IN  STD_LOGIC_VECTOR(OperatorsSize-1 DOWNTO 0);
		Output	: OUT STD_LOGIC_VECTOR(OutputSize	-1 DOWNTO 0)
	);
 
END ModulusOperator;

ARCHITECTURE ModulusOperatorArchitecture OF ModulusOperator IS

BEGIN

   Output <= STD_LOGIC_VECTOR(UNSIGNED(operatorA) MOD UNSIGNED(operatorB));
	
END ModulusOperatorArchitecture;