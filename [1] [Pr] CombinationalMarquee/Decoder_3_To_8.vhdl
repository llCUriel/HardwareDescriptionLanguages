LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_BIT.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Decoder_3_To_8 IS
    
	 GENERIC(
        InputSize  : INTEGER := 3;
		  OutputSize : INTEGER := 8
    );
	 
	PORT(
		 DecoderInput		: IN 	STD_LOGIC_VECTOR(InputSize -1 DOWNTO 0);
		 DecorderOutput	: OUT STD_LOGIC_VECTOR(OutputSize-1 DOWNTO 0)
	);
	
END Decoder_3_To_8;

ARCHITECTURE DecoderArchitecture OF Decoder_3_To_8 IS

CONSTANT OutputA : STD_LOGIC_VECTOR(OutputSize-1 DOWNTO 0) := "00000111"; 
CONSTANT OutputB : STD_LOGIC_VECTOR(OutputSize-1 DOWNTO 0) := "10000011"; 
CONSTANT OutputC : STD_LOGIC_VECTOR(OutputSize-1 DOWNTO 0) := "11000001"; 
CONSTANT OutputD : STD_LOGIC_VECTOR(OutputSize-1 DOWNTO 0) := "11100000"; 
CONSTANT OutputE : STD_LOGIC_VECTOR(OutputSize-1 DOWNTO 0) := "01110000"; 
CONSTANT OutputF : STD_LOGIC_VECTOR(OutputSize-1 DOWNTO 0) := "00111000"; 
CONSTANT OutputG : STD_LOGIC_VECTOR(OutputSize-1 DOWNTO 0) := "00011100"; 
CONSTANT OutputH : STD_LOGIC_VECTOR(OutputSize-1 DOWNTO 0) := "00001110"; 

BEGIN

	DECODER: PROCESS(DecoderInput,DecorderOutput) BEGIN

		CASE DecoderInput IS
			WHEN "000"  => DecorderOutput <= OutputA;
			WHEN "001"  => DecorderOutput <= OutputB;
			WHEN "010"  => DecorderOutput <= OutputC;
			WHEN "011"  => DecorderOutput <= OutputD;
			WHEN "100"  => DecorderOutput <= OutputE;
			WHEN "101"  => DecorderOutput <= OutputF;
			WHEN "110"  => DecorderOutput <= OutputG;
			WHEN "111"  => DecorderOutput <= OutputH;
			WHEN OTHERS => DecorderOutput <= (OTHERS => '1');
		
		END CASE;
	
	END PROCESS DECODER;

END DecoderArchitecture;

