library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity addierer is
    Port ( a : in STD_LOGIC_VECTOR(7 downto 0);
           b : in STD_LOGIC_VECTOR(7 downto 0);
           cin : in STD_LOGIC;
           s : out STD_LOGIC_VECTOR(7 downto 0);
           cout : out STD_LOGIC);
end addierer;

architecture Behavioral of addierer is


COMPONENT volladdierer is
    Port ( a    : in STD_LOGIC;
           b    : in STD_LOGIC;
           cin  : in STD_LOGIC;
           s    : out STD_LOGIC;
           cout : out STD_LOGIC
           );
end COMPONENT;

signal c : STD_LOGIC_VECTOR(7 downto 0);

begin

    PROCESS (a,b,cin)
    BEGIN

    s(0) <= a(0) xor b(0) xor cin; 
    c(0) <= (cin and b(0)) or (cin and a(0)) or (a(0) and b(0)); 

    for i in 1 to 7 loop 

        s(i)    <= a(i) xor b(i) xor c(i-1);
        c(i)      <= (c(i-1) and b(i)) or (c(i-1) and a(i)) or (a(i) and b(i));    

    end loop;

    cout <= c(6);

    END PROCESS;

end Behavioral;