LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_BIT.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE WORK.MyPackage1.ALL;

ENTITY Mux_4To1 IS

 	GENERIC (
		InputsSize  : INTEGER := 14;
		OutputSize  : INTEGER := 14;
		SelectorSize: INTEGER := 2
	);
	
	PORT (
		A,B,C,D : IN STD_LOGIC_VECTOR(InputsSize-1 DOWNTO 0);
		S		  : IN STD_LOGIC_VECTOR(SelectorSize-1 DOWNTO 0);
		Z  : OUT STD_LOGIC_VECTOR(OutputSize-1 DOWNTO 0)
 	);
 
END Mux_4To1;

ARCHITECTURE Mux_4To1Architecture OF Mux_4To1 IS

BEGIN
PROCESS (A,B,C,D,S) is
begin
  if (S = "00") then
      Z <= A;
  elsif(S = "10") then
      Z <= B;
  elsif(S = "01") then
      Z <= C;
  else
      Z <= D;
  end if;
end process;

END Mux_4To1Architecture;