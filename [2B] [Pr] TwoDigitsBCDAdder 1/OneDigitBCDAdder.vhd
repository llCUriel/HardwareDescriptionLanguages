LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_BIT.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE WORK.MyPackage1.ALL;

ENTITY OneDigitBCDAdder IS

 	GENERIC (
		OperatorsSize 		: INTEGER := 4;
		DisplaySize	  		: INTEGER := 7;
		UnitsInBinarySize : INTEGER := 4;
		TensInBinarySize  : INTEGER := 4
	);
	
	PORT (
		OperatorA    : IN  STD_LOGIC_VECTOR(OperatorsSize-1 DOWNTO 0);
		OperatorB    : IN  STD_LOGIC_VECTOR(OperatorsSize-1 DOWNTO 0);
		Cin 			 : IN  STD_LOGIC;
		E				 : OUT STD_LOGIC;
		UnitsDisplay : OUT STD_LOGIC_VECTOR(DisplaySize-1 DOWNTO 0);
		TensDisplay	 : OUT STD_LOGIC_VECTOR(DisplaySize-1 DOWNTO 0);
		UnitsInBinary: OUT STD_LOGIC_VECTOR(UnitsInBinarySize-1 DOWNTO 0);
		TensInBinary : OUT STD_LOGIC_VECTOR(TensInBinarySize -1 DOWNTO 0)
	);
 
END OneDigitBCDAdder;

ARCHITECTURE OneDigitBCDAdderArchitecture OF OneDigitBCDAdder IS

CONSTANT SymbolE  		  : STD_LOGIC_VECTOR(DisplaySize-1 DOWNTO 0) := "0110000"; 
CONSTANT SymbolOne   	  : STD_LOGIC_VECTOR(DisplaySize-1 DOWNTO 0) := "1001111";
CONSTANT SymbolTwo   	  : STD_LOGIC_VECTOR(DisplaySize-1 DOWNTO 0) := "0010010"; 
CONSTANT SymbolThree 	  : STD_LOGIC_VECTOR(DisplaySize-1 DOWNTO 0) := "0000110"; 
SIGNAL UnitsInBinarySignal: STD_LOGIC_VECTOR(UnitsInBinarySize-1 DOWNTO 0);
SIGNAL TensInBinarySignal : STD_LOGIC_VECTOR(TensInBinarySize-1 DOWNTO 0);
SIGNAL UnitsDisplaySignal : STD_LOGIC_VECTOR(DisplaySize-1 DOWNTO 0);
SIGNAL TensDisplaySignal  : STD_LOGIC_VECTOR(DisplaySize-1 DOWNTO 0);
SIGNAL FinalOutput 		  : STD_LOGIC_VECTOR(DisplaySize*2-1 DOWNTO 0);
SIGNAL ComparatorsOutputs : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL Sum : STD_LOGIC_VECTOR(OperatorsSize-1 DOWNTO 0);
SIGNAL Cout: STD_LOGIC;
SIGNAL ErrorSignal : STD_LOGIC;


BEGIN

C1 : AdderRipleCarry
	PORT MAP(
		A   => OperatorA,
		B   => OperatorB,
		Cin => Cin,
		Cout=> Cout,
		Sum => Sum
	);	
	
C2 : BinaryToDecimal
	PORT MAP(
		BinaryNumber=> '0' & Cout & Sum,
		UnitsDisplay=> UnitsDisplaySignal,
		TensDisplay => TensDisplaySignal,
		UnitsInBinary=>UnitsInBinarySignal,
		TensInBinary => TensInBinarySignal
	);	
	
C3 : BCDComparator
	PORT MAP(
		A=> OperatorA,
		B=> "1010",
		S=> ComparatorsOutputs(0)
	);
	
C4 : BCDComparator
	PORT MAP(
		A=> OperatorB,
		B=> "1010",
		S=> ComparatorsOutputs(1)
	);	
	
C5 : Mux_4To1
	PORT MAP(
		A=> UnitsDisplaySignal & TensDisplaySignal,
		B=> SymbolE & SymbolTwo,
		C=> SymbolE & SymbolOne,
		D=> SymbolE & SymbolThree,
		S=> ComparatorsOutputs,
		Z=> FinalOutput
	);	


C6 : Mux_2To1
	PORT MAP(
		A => (OTHERS => '1'),
		B => UnitsInBinarySignal,
		S => ErrorSignal,
		C => UnitsInBinary
	);

C7 : Mux_2To1
	PORT MAP(
		A => (OTHERS => '1'),
		B => TensInBinarySignal,
		S => ErrorSignal,
		C => TensInBinary
	);
	ErrorSignal <= '1' when ComparatorsOutputs > 0 else '0';
	E<= ErrorSignal;
	TensDisplay<=FinalOutput(6 DOWNTO 0);
	UnitsDisplay<= FinalOutput(13 DOWNTO 7);
	
END OneDigitBCDAdderArchitecture;