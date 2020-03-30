LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_BIT.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE WORK.MyPackage.ALL;

ENTITY BinaryToDecimal IS

 	GENERIC (
		BinaryNumberSize : INTEGER := 6;
		DisplaySize		  : INTEGER := 7;
		ModulusOperatorOutputSize : INTEGER := 6;
		UnitsInBinarySize : INTEGER := 4;
		TensInBinarySize  : INTEGER := 4
	);
	
	PORT (
		BinaryNumber   : IN  STD_LOGIC_VECTOR(BinaryNumberSize -1 DOWNTO 0);
		UnitsDisplay   : OUT STD_LOGIC_VECTOR(DisplaySize		 -1 DOWNTO 0);
		TensDisplay   	: OUT STD_LOGIC_VECTOR(DisplaySize		 -1 DOWNTO 0);
		UnitsInBinary 	: OUT STD_LOGIC_VECTOR(UnitsInBinarySize-1 DOWNTO 0);
		TensInBinary	: OUT STD_LOGIC_VECTOR(TensInBinarySize -1 DOWNTO 0)
	);
 
END BinaryToDecimal;

ARCHITECTURE BinaryToDecimalArchitecture OF BinaryToDecimal IS

SIGNAL Codes  : STD_LOGIC_VECTOR(BinaryNumberSize-1 DOWNTO 0):=(OTHERS => '0');
SIGNAL MuxOutputs : STD_LOGIC_VECTOR(BinaryNumberSize-1 DOWNTO 0);
SIGNAL ModulusOperatorOutput: STD_LOGIC_VECTOR(ModulusOperatorOutputSize-1 DOWNTO 0);
SIGNAL ComparatorOutput : STD_LOGIC;
BEGIN


	C1 : CheckRange
		PORT MAP(
			BinaryNumber => BinaryNumber,
			Codes			 => Codes
	  );
	  
	 C2 : Comparator
		PORT MAP(
			BinaryNumberA => Codes,
			BinaryNumberB => (OTHERS => '0'),
			S				  => ComparatorOutput
		);
		
	MuxCycle : FOR I IN 0 TO BinaryNumberSize-1 GENERATE		
		FirstMuultiplexers: IF(I<3) GENERATE
		C3: Mux
			PORT MAP(
				A=> BinaryNumber(I),
				B=> ModulusOperatorOutput(I),
				S=> ComparatorOutput, 
				C=> MuxOutputs(I)
			);
		END GENERATE FirstMuultiplexers;
		
		LastMuultiplexers: IF(I>=3) GENERATE
		C3: Mux
			PORT MAP(
				A=> BinaryNumber(I),
				B=> '0',
				S=> ComparatorOutput, 
				C=> MuxOutputs(I)
			);
		END GENERATE LastMuultiplexers;
	END GENERATE;
	
	C4 : ModulusOperator
		PORT MAP(
			operatorA => BinaryNumber,
			operatorB => "001010",
			Output	 => ModulusOperatorOutput
	);	
	

	C5 : UnitsDecoder
		PORT MAP(
			DecoderInput  => MuxOutputs,
			DecoderOutput => UnitsDisplay
	);	
	
	
	C6 : TensDecoder
		PORT MAP(
			DecoderInput  => Codes,
			DecoderOutput => TensDisplay
	);	


	C7 : BinaryDecoder
		PORT MAP(
			DecoderInput => Codes,
			DecoderOutput=> TensInBinary
	);	
	
	UnitsInBinary<= MuxOutputs(3 DOWNTO 0);
		
END BinaryToDecimalArchitecture;