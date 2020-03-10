library IEEE;
use IEEE.STD_LOGIC_1164.all;

package MyPackage is

	COMPONENT Mux IS
		PORT (
			A	  : IN  STD_LOGIC;
			B    : IN  STD_LOGIC;
			C	  : OUT STD_LOGIC;
			S    : IN STD_LOGIC
	);
	END COMPONENT;

	COMPONENT Comparator IS
		PORT (
			A   : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
			S   : OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT Multiplexer_2_To_1T IS
		PORT (
			A	  : IN  STD_LOGIC_VECTOR(6 DOWNTO 0);
			B    : IN  STD_LOGIC_VECTOR(6 DOWNTO 0);
			C	  : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
			S    : IN STD_LOGIC
	);
	END COMPONENT;

	COMPONENT Decoder IS
		PORT (
			DecoderInput   	 : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
			DecoderOutput   	 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
	END COMPONENT;
	
	
	COMPONENT TriStateBuffer IS
		PORT (
			BufferInput   : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
			EN 			  : IN  STD_LOGIC;
			BufferOutput  : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
	END COMPONENT;
	
	
end MyPackage;

	
package body MyPackage is


 
end MyPackage;