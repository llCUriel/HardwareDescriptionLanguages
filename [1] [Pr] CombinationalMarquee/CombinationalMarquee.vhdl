LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_BIT.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY CombinationalMarquee IS
    
	 GENERIC(
        InputCodeSize  		  : INTEGER := 3;
		  InputPositionBusSize : INTEGER := 3;
		  OutputSize           : INTEGER := 7;
		  NumberOfLetters      : INTEGER := 5;
		  NumberOfDisplays	  : INTEGER := 8
    );
	 
	PORT(
		 C0,C1,C2,C3,C4				: IN 	 STD_LOGIC_VECTOR(InputCodeSize 		  -1 DOWNTO 0);
		 MarqueePosition				: IN   STD_LOGIC_VECTOR(InputPositionBusSize-1 DOWNTO 0);
		 D0,D1,D2,D3,D4,D5,D6,D7	: OUT  STD_LOGIC_VECTOR(OutputSize			  -1 DOWNTO 0);
		 MarqueePositionOutput     : OUT  STD_LOGIC_VECTOR(NumberOfDisplays    -1 DOWNTO 0)
	);
	
END CombinationalMarquee;

ARCHITECTURE CombinationalMarqueeArchitecture OF CombinationalMarquee IS

SIGNAL EmptySymbol	   : STD_LOGIC_VECTOR(OutputSize							-1 DOWNTO 0):= (OTHERS => '1');
SIGNAL BusOfCodes 	   : STD_LOGIC_VECTOR(InputCodeSize*NumberOfLetters-1 DOWNTO 0);
SIGNAL BusOfCharacteres : STD_LOGIC_VECTOR(OutputSize*NumberOfLetters	-1 DOWNTO 0);

COMPONENT Decoder_3_To_7 IS
		PORT ( 
				DecoderInput	: IN 	STD_LOGIC_VECTOR(InputCodeSize -1 DOWNTO 0);
				DecorderOutput	: OUT STD_LOGIC_VECTOR(OutputSize	 -1 DOWNTO 0)
				);
END COMPONENT;

COMPONENT Decoder_3_To_8 IS
		PORT ( 
				DecoderInput	: IN 	STD_LOGIC_VECTOR(InputCodeSize   -1 	 DOWNTO 0);
				DecorderOutput	: OUT STD_LOGIC_VECTOR(NumberOfDisplays-1	    DOWNTO 0)
				);
END COMPONENT;


COMPONENT Multiplexer_8_To_1 IS
		PORT (
				MI0,MI1,MI2,MI3,MI4,MI5,MI6,MI7	: IN 	STD_LOGIC_VECTOR(OutputSize -1 			 DOWNTO 0);
				MultiplexerOutput						: OUT STD_LOGIC_VECTOR(OutputSize-1 			 DOWNTO 0);
				SelectSignal        					: IN  STD_LOGIC_VECTOR(InputPositionBusSize-1 DOWNTO 0)
				);
END COMPONENT;

BEGIN

	BUSOFCODES<= C4 & C3 & C2 & C1 & C0;

	DecoderCycle: FOR I IN 1 TO NumberOfLetters GENERATE
		Decoder : Decoder_3_To_7 PORT MAP(
		DecoderInput   	=> BusOfCodes(3*I-1 DOWNTO 3*(I-1)),
		DecorderOutput 	=> BusOfCharacteres(7*I-1 DOWNTO 7*(I-1))
		);
	END GENERATE;
	MultiplexerD0 : Multiplexer_8_To_1 PORT MAP(
		MI0 => BusOfCharacteres(6  DOWNTO 0),
		MI1 => EmptySymbol,
		MI2 => EmptySymbol,
		MI3 => EmptySymbol,
		MI4 => BusOfCharacteres(34 DOWNTO 28),
		MI5 => BusOfCharacteres(27 DOWNTO 21),
		MI6 => BusOfCharacteres(20 DOWNTO 14),
		MI7 => BusOfCharacteres(13 DOWNTO 7),
		MultiplexerOutput => D0,
		SelectSignal => MarqueePosition
	);
	MultiplexerD1 : Multiplexer_8_To_1 PORT MAP(
		MI0 => BusOfCharacteres(13 DOWNTO 7),
		MI1 => BusOfCharacteres(6  DOWNTO 0),
		MI2 => EmptySymbol,
		MI3 => EmptySymbol,
		MI4 => EmptySymbol,
		MI5 => BusOfCharacteres(34 DOWNTO 28),
		MI6 => BusOfCharacteres(27 DOWNTO 21),
		MI7 => BusOfCharacteres(20 DOWNTO 14),
		MultiplexerOutput => D1,
		SelectSignal => MarqueePosition
	);
	
	MultiplexerD2 : Multiplexer_8_To_1 PORT MAP(
		MI0 => BusOfCharacteres(20 DOWNTO 14),
		MI1 => BusOfCharacteres(13 DOWNTO 7),
		MI2 => BusOfCharacteres(6  DOWNTO 0),
		MI3 => EmptySymbol,
		MI4 => EmptySymbol,
		MI5 => EmptySymbol,
		MI6 => BusOfCharacteres(34 DOWNTO 28),
		MI7 => BusOfCharacteres(27 DOWNTO 21),
		MultiplexerOutput => D2,
		SelectSignal => MarqueePosition
	);
	
	MultiplexerD3 : Multiplexer_8_To_1 PORT MAP(
		MI0 => BusOfCharacteres(27 DOWNTO 21),
		MI1 => BusOfCharacteres(20 DOWNTO 14),
		MI2 => BusOfCharacteres(13 DOWNTO 7),
		MI3 => BusOfCharacteres(6  DOWNTO 0),
		MI4 => EmptySymbol,
		MI5 => EmptySymbol,
		MI6 => EmptySymbol,
		MI7 => BusOfCharacteres(34 DOWNTO 28),
		MultiplexerOutput => D3,
		SelectSignal => MarqueePosition
	);
	
	MultiplexerD4 : Multiplexer_8_To_1 PORT MAP(
		MI0 => BusOfCharacteres(34 DOWNTO 28),
		MI1 => BusOfCharacteres(27 DOWNTO 21),
		MI2 => BusOfCharacteres(20 DOWNTO 14),
		MI3 => BusOfCharacteres(13 DOWNTO 7),
		MI4 => BusOfCharacteres(6  DOWNTO 0),
		MI5 => EmptySymbol,
		MI6 => EmptySymbol,
		MI7 => EmptySymbol,
		MultiplexerOutput => D4,
		SelectSignal => MarqueePosition
	);
	MultiplexerD5 : Multiplexer_8_To_1 PORT MAP(
		MI0 => EmptySymbol,
		MI1 => BusOfCharacteres(34 DOWNTO 28),
		MI2 => BusOfCharacteres(27 DOWNTO 21),
		MI3 => BusOfCharacteres(20 DOWNTO 14),
		MI4 => BusOfCharacteres(13 DOWNTO 7),
		MI5 => BusOfCharacteres(6  DOWNTO 0),
		MI6 => EmptySymbol,
		MI7 => EmptySymbol,
		MultiplexerOutput => D5,
		SelectSignal => MarqueePosition
	);
	MultiplexerD6 : Multiplexer_8_To_1 PORT MAP(
		MI0 => EmptySymbol,
		MI1 => EmptySymbol,
		MI2 => BusOfCharacteres(34 DOWNTO 28),
		MI3 => BusOfCharacteres(27 DOWNTO 21),
		MI4 => BusOfCharacteres(20 DOWNTO 14),
		MI5 => BusOfCharacteres(13 DOWNTO 7),
		MI6 => BusOfCharacteres(6  DOWNTO 0),
		MI7 => EmptySymbol,
		MultiplexerOutput => D6,
		SelectSignal => MarqueePosition
	);
	MultiplexerD7 : Multiplexer_8_To_1 PORT MAP(
		MI0 => EmptySymbol,
		MI1 => EmptySymbol,
		MI2 => EmptySymbol,
		MI3 => BusOfCharacteres(34 DOWNTO 28),
		MI4 => BusOfCharacteres(27 DOWNTO 21),
		MI5 => BusOfCharacteres(20 DOWNTO 14),
		MI6 => BusOfCharacteres(13 DOWNTO 7),
		MI7 => BusOfCharacteres(6  DOWNTO 0),
		MultiplexerOutput => D7,
		SelectSignal => MarqueePosition
	);
	
	Decoder6 : Decoder_3_To_8 PORT MAP(
		DecoderInput   	=> MarqueePosition,
		DecorderOutput 	=> MarqueePositionOutput
	);
	  --D0<=BusOfCharacteres(6  DOWNTO 0);		--Ch0
	  --D1<=BusOfCharacteres(13 DOWNTO 7);		--Ch1
	  --D2<=BusOfCharacteres(20 DOWNTO 14);	--Ch2
	  --D3<=BusOfCharacteres(27 DOWNTO 21);	--Ch3
	  --D4<=BusOfCharacteres(34 DOWNTO 28);	--Ch4
	  --D5<=BusOfCharacteres(41 DOWNTO 35);	--Ch5
	  --D6<=BusOfCharacteres(48 DOWNTO 42);	--Ch6
	  --D7<=BusOfCharacteres(55 DOWNTO 49);	--Ch7


END CombinationalMarqueeArchitecture;


