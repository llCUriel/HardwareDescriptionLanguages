
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_BIT.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Practice02A IS
 
	PORT (
		A,B 				: IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Cin 				: IN  STD_LOGIC;
		Cout				: OUT STD_LOGIC;
		Sum 				: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		BinaryNumber   : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		UnitsDisplay   : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		TensDisplay    : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		DecoderInput  	: IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		DecoderOutput  : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
 
END Practice02A;

ARCHITECTURE Practice02AArchitecture OF Practice02A IS

	
COMPONENT AdderRipleCarry IS
	PORT (
		A,B : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		Cin : IN  STD_LOGIC;
		Cout: OUT STD_LOGIC;
		Sum : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END COMPONENT;

COMPONENT BinaryToDecimal IS
	PORT (
		BinaryNumber   : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		UnitsDisplay   : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		TensDisplay    : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;

	
COMPONENT HexDecoder IS
 	PORT (
		DecoderInput   	 : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		DecoderOutput   	 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;

 

BEGIN
		C1 : AdderRipleCarry
			PORT MAP(
				A =>A,
				B =>B,
				Cin =>Cin,
				Cout =>Cout,
				Sum =>Sum
		);
		C2 : BinaryToDecimal
			PORT MAP(
				BinaryNumber =>BinaryNumber,
				UnitsDisplay =>UnitsDisplay,
				TensDisplay  =>TensDisplay
		);
		C3 : HexDecoder
			PORT MAP(
				DecoderInput =>DecoderInput,
				DecoderOutput=>DecoderOutput
		);
END Practice02AArchitecture;