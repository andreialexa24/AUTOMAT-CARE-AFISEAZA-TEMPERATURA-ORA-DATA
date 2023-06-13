Library IEEE;
use IEEE.std_logic_1164.all;
entity OR2 is
	port(A,B: in std_logic;
	Y: out std_logic);
end entity	; 

architecture flux of OR2 is
begin 
	 Y <= A or B;
	
END ARCHitecture;