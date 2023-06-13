library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity comparator_1bit is
    Port ( A,B : in std_logic;
           X,Y,Z: out std_logic);
end comparator_1bit;

architecture comp_arch of comparator_1bit is
  begin
   X <= A and (not B);
   Z <= (not A) and B;
   Y <= A xnor B;
end comp_arch;