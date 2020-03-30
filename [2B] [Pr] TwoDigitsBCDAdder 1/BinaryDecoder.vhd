LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_BIT.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY BinaryDecoder IS

	GENERIC (
		InputSize 		: INTEGER := 6;
		OutputSize		: INTEGER := 4;
		NumberOfSymbols: INTEGER := 7
		
	);
	
	PORT (
		DecoderInput   		 : IN  STD_LOGIC_VECTOR(InputSize -1 DOWNTO 0);
		DecoderOutput   	 	 : OUT STD_LOGIC_VECTOR(OutputSize-1 DOWNTO 0)
	);
 
END BinaryDecoder;

ARCHITECTURE BinaryDecoderArchitecture OF BinaryDecoder IS

CONSTANT NumberZero :STD_LOGIC_VECTOR(3 DOWNTO 0):= "0000"; 
CONSTANT NumberOne  :STD_LOGIC_VECTOR(3 DOWNTO 0):= "0001";
CONSTANT NumberTwo  :STD_LOGIC_VECTOR(3 DOWNTO 0):= "0010"; 
CONSTANT NumberThree:STD_LOGIC_VECTOR(3 DOWNTO 0):= "0011"; 
CONSTANT NumberFour :STD_LOGIC_VECTOR(3 DOWNTO 0):= "0100";
CONSTANT NumberFive :STD_LOGIC_VECTOR(3 DOWNTO 0):= "0101"; 
CONSTANT NumberSix  :STD_LOGIC_VECTOR(3 DOWNTO 0):= "0110"; 

BEGIN

	DECODER: PROCESS(DecoderInput,DecoderOutput) BEGIN
		CASE DecoderInput IS
			WHEN "000000" => DecoderOutput <= NumberZero;
			WHEN "100000" => DecoderOutput <= NumberOne;
			WHEN "010000" => DecoderOutput <= NumberTwo;
			WHEN "001000" => DecoderOutput <= NumberThree;
			WHEN "000100" => DecoderOutput <= NumberFour;
			WHEN "000010" => DecoderOutput <= NumberFive;
			WHEN "000001" => DecoderOutput <= NumberSix;
			WHEN OTHERS   => DecoderOutput <= NumberZero;
		END CASE;
	
	END PROCESS DECODER;

END BinaryDecoderArchitecture;