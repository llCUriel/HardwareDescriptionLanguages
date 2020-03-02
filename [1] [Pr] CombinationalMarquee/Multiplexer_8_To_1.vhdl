LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_BIT.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Multiplexer_8_To_1 IS
    
	 GENERIC(
        InputSize  		 : INTEGER := 7;
		  OutputSize 		 : INTEGER := 7;
		  SelectSignalSize : INTEGER := 3
		  );
	 
	PORT(
		 MI0,MI1,MI2,MI3,MI4,MI5,MI6,MI7	: IN 	STD_LOGIC_VECTOR(InputSize -1 		DOWNTO 0);
		 MultiplexerOutput					: OUT STD_LOGIC_VECTOR(OutputSize-1 		DOWNTO 0);
		 SelectSignal        				: IN  STD_LOGIC_VECTOR(SelectSignalSize-1 DOWNTO 0)
	);
	
END Multiplexer_8_To_1;

ARCHITECTURE MultiplexerArchitecture OF Multiplexer_8_To_1 IS

CONSTANT NullSymbol : STD_LOGIC_VECTOR(OutputSize-1 DOWNTO 0) := "0111000"; 

BEGIN

   MultiplexerOutput <=  MI0 			WHEN (SelectSignal  = "000") ELSE
								 MI1 			WHEN (SelectSignal  = "001") ELSE
								 MI2		   WHEN (SelectSignal  = "010") ELSE
								 MI3 			WHEN (SelectSignal  = "011") ELSE
								 MI4 			WHEN (SelectSignal  = "100") ELSE
								 MI5 			WHEN (SelectSignal  = "101") ELSE
								 MI6 			WHEN (SelectSignal  = "110") ELSE
								 MI7 			WHEN (SelectSignal  = "111") ELSE                
								 NullSymbol;
								 
END MultiplexerArchitecture;
