LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_BIT.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Decoder IS
	PORT (
		DecoderInput   		 : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		DecoderOutput   	 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
 
END Decoder;

ARCHITECTURE DecoderArchitecture OF Decoder IS

CONSTANT SymbolZero  : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000001"; 
CONSTANT SymbolOne   : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1111001";
CONSTANT SymbolTwo   : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0010010"; 
CONSTANT SymbolThree : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000110"; 
CONSTANT SymbolFour  : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1001100";
CONSTANT SymbolFive  : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0100100"; 
CONSTANT SymbolSix   : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0100000"; 
CONSTANT SymbolSeven : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0001110";
CONSTANT SymbolEight : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000000";
CONSTANT SymbolNine  : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0001100"; 


BEGIN

	DECODER: PROCESS(DecoderInput,DecoderOutput) BEGIN

		CASE DecoderInput IS
			WHEN "0000"  => DecoderOutput <= SymbolZero;
			WHEN "0001"  => DecoderOutput <= SymbolOne;
			WHEN "0010"  => DecoderOutput <= SymbolTwo;
			WHEN "0011"  => DecoderOutput <= SymbolThree;
			WHEN "0100"  => DecoderOutput <= SymbolFour;
			WHEN "0101"  => DecoderOutput <= SymbolFive;
			WHEN "0110"  => DecoderOutput <= SymbolSix;
			WHEN "0111"  => DecoderOutput <= SymbolSeven;
			WHEN "1000"  => DecoderOutput <= SymbolEight;
			WHEN "1001"  => DecoderOutput <= SymbolNine;
			WHEN "1010"  => DecoderOutput <= SymbolZero;
			WHEN "1011"  => DecoderOutput <= SymbolOne;
			WHEN "1100"  => DecoderOutput <= SymbolTwo;
			WHEN "1101"  => DecoderOutput <= SymbolThree;
			WHEN "1110"  => DecoderOutput <= SymbolFour;
			WHEN "1111"  => DecoderOutput <= SymbolFive;
			WHEN OTHERS => DecoderOutput <= (OTHERS => '1');
		END CASE;
	
	END PROCESS DECODER;

END DecoderArchitecture;
