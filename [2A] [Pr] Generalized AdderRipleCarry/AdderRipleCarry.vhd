
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_BIT.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY AdderRipleCarry IS
 
	GENERIC (
		AdderSize : INTEGER := 4
	);
 
	PORT (
		A,B : IN  STD_LOGIC_VECTOR(AdderSize - 1 DOWNTO 0);
		Cin : IN  STD_LOGIC;
		Cout: OUT STD_LOGIC;
		Sum : OUT STD_LOGIC_VECTOR(AdderSize - 1 DOWNTO 0)
	);
 
END AdderRipleCarry;

ARCHITECTURE AdderRipleCarryArchitecture OF AdderRipleCarry IS

SIGNAL Carrys : STD_LOGIC_VECTOR(AdderSize DOWNTO 0);
	
COMPONENT FullAdder IS
	PORT (
		A,B : IN  STD_LOGIC;
		Cin : IN  STD_LOGIC;
		Cout: OUT STD_LOGIC;
		Sum : OUT STD_LOGIC
	);
END COMPONENT;

BEGIN
	Carrys(0)<=Cin;
	AdderRipleCarryCycle : FOR I IN 0 TO AdderSize-1 GENERATE
	FullAdder1 : FullAdder
		PORT MAP(
			A => A(I), 
			B => B(I), 
			Cin => Carrys(I), 
			Cout => Carrys(I+1), 
			Sum => Sum(I)
		);
	END GENERATE;
	Cout<=Carrys(AdderSize);


END AdderRipleCarryArchitecture;
