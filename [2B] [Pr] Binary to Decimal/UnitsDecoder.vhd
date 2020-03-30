LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_BIT.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;


ENTITY UnitsDecoder IS
 	
	GENERIC (
		InputSize 		: INTEGER := 6;
		OutputSize		: INTEGER := 7;
		NumberOfSymbols: INTEGER := 10
		
	);
	
	PORT (
		DecoderInput : IN  STD_LOGIC_VECTOR(InputSize -1 DOWNTO 0);
		DecoderOutput: OUT STD_LOGIC_VECTOR(OutputSize-1 DOWNTO 0)
	);
 
END UnitsDecoder;

ARCHITECTURE UnitsDecoderArchitecture OF UnitsDecoder IS


TYPE myArray IS ARRAY(0 to NumberOfSymbols-1) OF STD_LOGIC_VECTOR (OutputSize-1 downto 0);
CONSTANT Symbols : myArray := ("0000001",
										 "1111001",
										 "0010010",
										 "0000110",
										 "1001100",
										 "0100100",
										 "0100000",
										 "0001110",
										 "0000000",
										 "0001100"
										 );

BEGIN

	DecoderOutput <= Symbols(CONV_INTEGER(DecoderInput)) WHEN DecoderInput < 10 ELSE "1111110";	
END UnitsDecoderArchitecture;