LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_BIT.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Decoder_3_To_7 IS
    
	 GENERIC(
        InputSize  : INTEGER := 3;
		  OutputSize : INTEGER := 7
    );
	 
	PORT(
		 DecoderInput		: IN 	STD_LOGIC_VECTOR(InputSize -1 DOWNTO 0);
		 DecorderOutput	: OUT STD_LOGIC_VECTOR(OutputSize-1 DOWNTO 0)
	);
	
END Decoder_3_To_7;

ARCHITECTURE DecoderArchitecture OF Decoder_3_To_7 IS

CONSTANT SymbolF : STD_LOGIC_VECTOR(OutputSize-1 DOWNTO 0) := "0111000"; 
CONSTANT SymbolP : STD_LOGIC_VECTOR(OutputSize-1 DOWNTO 0) := "0011000"; 
CONSTANT SymbolG : STD_LOGIC_VECTOR(OutputSize-1 DOWNTO 0) := "0100000"; 
CONSTANT SymbolA : STD_LOGIC_VECTOR(OutputSize-1 DOWNTO 0) := "0001000"; 

BEGIN

	DECODER: PROCESS(DecoderInput,DecorderOutput) BEGIN

		CASE DecoderInput IS
	
			WHEN "000"  => DecorderOutput <= SymbolF;
			WHEN "001"  => DecorderOutput <= SymbolP;
			WHEN "010"  => DecorderOutput <= SymbolG;
			WHEN "011"  => DecorderOutput <= SymbolA;
			WHEN OTHERS => DecorderOutput <= (OTHERS => '1');
		
		END CASE;
	
	END PROCESS DECODER;

END DecoderArchitecture;

