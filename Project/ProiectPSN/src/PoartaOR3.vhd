Library IEEE;
use IEEE.std_logic_1164.all;
entity OR3 is
	port(A,B,C: in std_logic;
	Y: out std_logic);
end entity	; 

architecture flux of OR3 is
begin 
	 Y <= A or B or C;
	
END ARCHitecture;