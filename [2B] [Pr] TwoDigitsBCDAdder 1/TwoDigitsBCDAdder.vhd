LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_BIT.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE WORK.MyPackage2.ALL;

ENTITY TwoDigitsBCDAdder IS

 	GENERIC (
		OperatorsSize 		: INTEGER := 4;
		DisplaySize			: INTEGER := 7;
		AdderSize 			: INTEGER := 2
	);
	
	PORT (
		Ao,Bo,A1,B1 : IN STD_LOGIC_VECTOR(OperatorsSize-1 DOWNTO 0);
		Cin 			: IN STD_LOGIC;
		E0,E1,E2,E3 : OUT STD_LOGIC_VECTOR(DisplaySize-1 DOWNTO 0);
		S0,S1,S2 	: OUT STD_LOGIC_VECTOR(DisplaySize-1 DOWNTO 0)
	);
 
END TwoDigitsBCDAdder;

ARCHITECTURE TwoDigitSBCDAdderArchitecture OF TwoDigitsBCDAdder IS

CONSTANT NullSymbol      : STD_LOGIC_VECTOR(DisplaySize-1 DOWNTO 0) := "1111110"; 
SIGNAL ErrorSignals 		 : STD_LOGIC_VECTOR(AdderSize-1 DOWNTO 0);
SIGNAL Carrys       		 : STD_LOGIC_VECTOR(AdderSize-1 DOWNTO 0);
SIGNAL SumDisplays  		 : STD_LOGIC_VECTOR(DisplaySize*(AdderSize+1)-1 DOWNTO 0);
SIGNAL SumDisplaysOutput : STD_LOGIC_VECTOR(DisplaySize*(AdderSize+1)-1 DOWNTO 0);
SIGNAL TensInBinary 		 : STD_LOGIC_VECTOR(OperatorsSize-1 DOWNTO 0);
SIGNAL MuxSelect 			 : STD_LOGIC;
SIGNAL ErrorDisplays		 : STD_LOGIC_VECTOR(AdderSize*AdderSize*DisplaySize-1 DOWNTO 0);
SIGNAL ErrorDisplaysOutput : STD_LOGIC_VECTOR(AdderSize*AdderSize*DisplaySize-1 DOWNTO 0);


BEGIN

Carrys(0)<=Cin;

C1 : OneDigitBCDAdder
	PORT MAP(
			OperatorA     => Ao,
			OperatorB     => Bo,
			Cin 		     => Carrys(0),
			E			     => ErrorSignals(0),
			UnitsDisplay  => SumDisplays(6 DOWNTO 0),
			TensDisplay   => ErrorDisplays(13 DOWNTO 7),
			TensInBinary  => TensInBinary
	);

C2 : OneDigitBCDAdder
	PORT MAP(
			OperatorA     => A1,
			OperatorB     => B1,
			Cin 		     => Carrys(1),
			E			     => ErrorSignals(1),
			UnitsDisplay  => SumDisplays(13 DOWNTO 7),
			TensDisplay   => SumDisplays(20 DOWNTO 14)
	);

C3 : Mux2_2To1
	PORT MAP(
		A => SumDisplays,
		B => NullSymbol & NullSymbol & NullSymbol,
		S => MuxSelect,
		C =>SumDisplaysOutput
	);
	
C4 : Mux3_2To1
	PORT MAP(
		A => NullSymbol & NullSymbol & NullSymbol & NullSymbol,
		B => ErrorDisplays,
		S => MuxSelect,
		C => ErrorDisplaysOutput
	);
	
Carrys(1) <= '1' when TensInBinary = "0001" else '0';
ErrorDisplays(6 DOWNTO 0) <= SumDisplays(6 DOWNTO 0);
ErrorDisplays(20 DOWNTO 14)<= SumDisplays(13 DOWNTO 7);
ErrorDisplays(27 DOWNTO 21)<= SumDisplays(20 DOWNTO 14);
MuxSelect<= '0' when (ErrorSignals = "00") else '1';

E0<= ErrorDisplaysOutput(6 DOWNTO 0);
E1<= ErrorDisplaysOutput(13 DOWNTO 7);
E2<= ErrorDisplaysOutput(20 DOWNTO 14);
E3<= ErrorDisplaysOutput(27 DOWNTO 21);
S0<=SumDisplaysOutput(6 DOWNTO 0);
S1<=SumDisplaysOutput(13 DOWNTO 7);
S2<=SumDisplaysOutput(20 DOWNTO 14);
	
	
END TwoDigitSBCDAdderArchitecture;