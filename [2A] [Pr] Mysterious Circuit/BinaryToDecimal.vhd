LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_BIT.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE WORK.MyPackage.ALL;

ENTITY BinaryToDecimal IS
	PORT (
		BinaryNumber   : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		UnitsDisplay   : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		TensDisplay    : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
 
END BinaryToDecimal;

ARCHITECTURE BinaryToDecimalArchitecture OF BinaryToDecimal IS

SIGNAL MuxOutputs 			 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL SymbolZero 			 : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000001";
SIGNAL SymbolOne 			 : STD_LOGIC_VECTOR(6 DOWNTO 0) := "1111001";
SIGNAL TriStateBufferOutput  : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL ComparatorOutput 	 : STD_LOGIC;

BEGIN
	
	C : Comparator
		PORT MAP(
			A => BinaryNumber,
			S => ComparatorOutput
	);
	
	MuxCycle : FOR I IN 0 TO 4 GENERATE
	
		FirstMuultiplexers: IF(I < 4 and I /= 3) GENERATE
		M1 : Mux
			PORT MAP(
				A => BinaryNumber(I), 
				B => TriStateBufferOutput(I), 
				C => MuxOutputs(I), 
				S => ComparatorOutput
		);
		END GENERATE FirstMuultiplexers;
		
		PenultimateMultiplexer: IF(I = 3) GENERATE
		M1 : Mux
			PORT MAP(
				A => BinaryNumber(I), 
				B => '1', 
				C => MuxOutputs(I), 
				S => ComparatorOutput
		);
		END GENERATE PenultimateMultiplexer;
		
		LastMultiplexer: IF (I >= 4) GENERATE
		M2 : Multiplexer_2_To_1T
			PORT MAP(
				A => SymbolOne, 
				B => SymbolZero, 
				C => TensDisplay, 
				S => ComparatorOutput
		);
		END GENERATE LastMultiplexer;
		
	END GENERATE;
	
	D : Decoder
		PORT MAP(
			DecoderInput => MuxOutputs, 
			DecoderOutput => UnitsDisplay
		);
	
	TB : TriStateBuffer
		PORT MAP(
			BufferInput   => BinaryNumber(2 DOWNTO 0),
			EN 			  => ComparatorOutput,
			BufferOutput => TriStateBufferOutput
		);


END BinaryToDecimalArchitecture;
