library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity comparator_bit is
    Port ( A,B : in std_logic_vector(0 to 7);
           X,Y,Z: out std_logic);
end comparator_bit;

architecture comp_arch of comparator_bit is
  begin
   process(A,B)
     begin
if A=B then
           X <= '0';
           Z <= '0';
           Y <= '1';
       elsif A>B then
           X <= '1';
           Z <= '0';
           Y <= '0';
      elsif A<B then
           X <= '0';
           Z <= '1';
           Y <= '0';
      end if;
    end process;
end comp_arch;