library IEEE;
use IEEE.std_logic_1164.all;
entity AND2 is

    port(A: in std_logic;      
         B: in std_logic;      
         Y : out std_logic);   

end AND2; 

architecture andLogic of AND2 is
 begin 
    Y <= A AND B;
end andLogic; 