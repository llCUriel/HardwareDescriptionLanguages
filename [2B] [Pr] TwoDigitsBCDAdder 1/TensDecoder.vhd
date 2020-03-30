LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_BIT.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY TensDecoder IS

	GENERIC (
		InputSize 		: INTEGER := 6;
		OutputSize		: INTEGER := 7;
		NumberOfSymbols: INTEGER := 7
		
	);
	
	PORT (
		DecoderInput   		 : IN  STD_LOGIC_VECTOR(InputSize -1 DOWNTO 0);
		DecoderOutput   	 	 : OUT STD_LOGIC_VECTOR(OutputSize-1 DOWNTO 0)
	);
 
END TensDecoder;

ARCHITECTURE TensDecoderArchitecture OF TensDecoder IS

CONSTANT SymbolZero :STD_LOGIC_VECTOR(6 DOWNTO 0):= "0000001"; 
CONSTANT SymbolOne  :STD_LOGIC_VECTOR(6 DOWNTO 0):= "1001111";
CONSTANT SymbolTwo  :STD_LOGIC_VECTOR(6 DOWNTO 0):= "0010010"; 
CONSTANT SymbolThree:STD_LOGIC_VECTOR(6 DOWNTO 0):= "0000110"; 
CONSTANT SymbolFour :STD_LOGIC_VECTOR(6 DOWNTO 0):= "1001100";
CONSTANT SymbolFive :STD_LOGIC_VECTOR(6 DOWNTO 0):= "0100100"; 
CONSTANT SymbolSix  :STD_LOGIC_VECTOR(6 DOWNTO 0):= "0100000"; 
CONSTANT SymbolNull :STD_LOGIC_VECTOR(6 DOWNTO 0):= "1111110"; 

BEGIN

	DECODER: PROCESS(DecoderInput,DecoderOutput) BEGIN
		CASE DecoderInput IS
			WHEN "000000" => DecoderOutput <= SymbolZero;
			WHEN "100000" => DecoderOutput <= SymbolOne;
			WHEN "010000" => DecoderOutput <= SymbolTwo;
			WHEN "001000" => DecoderOutput <= SymbolThree;
			WHEN "000100" => DecoderOutput <= SymbolFour;
			WHEN "000010" => DecoderOutput <= SymbolFive;
			WHEN "000001" => DecoderOutput <= SymbolSix;
			WHEN OTHERS   => DecoderOutput <= SymbolNull;
		END CASE;
	
	END PROCESS DECODER;

END TensDecoderArchitecture;