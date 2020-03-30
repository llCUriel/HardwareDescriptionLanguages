library IEEE;
use IEEE.STD_LOGIC_1164.all;

package MyPackage is
 	

	COMPONENT CheckRange IS
		PORT (
			BinaryNumber   : IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
			Codes			   : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
		);
	END COMPONENT;

	COMPONENT Comparator IS
		PORT (
			BinaryNumberA   : IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
			BinaryNumberB	 : IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
			S					 : OUT STD_LOGIC
		);
	END COMPONENT;
	
	COMPONENT Mux IS
		PORT (
			A: IN  STD_LOGIC;
			B: IN  STD_LOGIC;
			S: IN  STD_LOGIC;
			C: OUT STD_LOGIC
		);
	END COMPONENT;

	COMPONENT ModulusOperator IS
		PORT (
			operatorA: IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
			operatorB: IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
			Output	: OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
		);
	END COMPONENT;
	
	
	COMPONENT UnitsDecoder IS
		PORT (
			DecoderInput : IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
			DecoderOutput: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
		);
	END COMPONENT;
	
	
	COMPONENT TensDecoder IS
		PORT (
			DecoderInput  : IN  STD_LOGIC_VECTOR(5 DOWNTO 0);
			DecoderOutput : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
		);
	END COMPONENT;
	
end MyPackage;

	
package body MyPackage is


 
end MyPackage;