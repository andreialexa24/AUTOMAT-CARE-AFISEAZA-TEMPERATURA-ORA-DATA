 library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity automat is
	
port(in_grade,clk,in_minut,luna,zi,ora: in std_logic;
ex_dcd1, ex_dcd2, ex_dcd3, ex_dcd4, ex_dcd5, ex_dcd6, ex_dcd7, ex_dcd8: out std_logic);
end entity ;

architecture struct of automat is

signal ex_grade,ex_minut,ex_sum,ex_ora, ex_luna,ex_zi :std_logic_vector(7 downto 0);
signal exc6,comp7,exc7,exA2_2,exc8,exA2_1,in_luna,exc4,exc1,in_ora,exc5,exc2,in_zi,exc3 :std_logic;
begin  
	
	counter1:entity work.NUMARATOR port map(clk=>clk, enable=>in_luna,reset=>'0', cout=>ex_luna );
	counter2:entity work.NUMARATOR port map(clk=>clk, enable=>in_zi,reset=>'0', cout=>ex_zi );
	counter3:entity work.NUMARATOR port map(clk=>clk, enable=>in_ora,reset=>'0', cout=>ex_ora );
	counter4:entity work.NUMARATOR port map(clk=>clk, enable=>in_minut,reset=>'0', cout=>ex_minut );
	counter5:entity work.NUMARATOR port map(clk=>clk, enable=>in_grade,reset=>'0',cout=>ex_grade );
	comp6:entity work.comparator_bit port map(A=>ex_minut, B=>"00111011", Y=>exc6);
    comp2:entity work.comparator_bit port map(A=>ex_zi, B=> "00000000", Y=>exc2 );
	comp3:entity work.comparator_bit port map(A=>ex_zi, B=> "00011110" , Y=>exc3 );
	comp5:entity work.comparator_bit port map(A=>ex_ora, B=>"00100011", Y=>exc5 );
	comp_7:entity work.comparator_1bit port map(A=> '1', B=>exA2_2, Y=>exc7 );
	comp1:entity work.comparator_bit port map(A=>"00000000", B=>ex_luna, Y=>exc1 );
	comp8:entity work.comparator_bit port map(A=>ex_sum, B=>"01010010", Y=>exc8 );
	comp4:entity work.comparator_1bit port map(A=>exA2_1, B=>'1', Y=>exc4 );
	sumator:entity work.addierer port map(a=>ex_ora, b=>ex_minut, s=>ex_sum, cin=>'0' );
	AND2_2:entity work.AND2 port map(A=>exc5, B=>exc6,Y=>exA2_2);
	AND2_1:entity work.AND2 port map(A=>exc8, B=>exc3,Y=>exA2_1);
	OR3_1:entity work.OR3 port map(A=>exc4, B=>luna,C=>exc1, Y=>in_luna );
	OR3_2:entity work.OR3 port map(A=>exc2, B=>zi,C=>exc7, Y=>in_zi );
	OR2:entity work.OR2 port map(A=>ora, B=>exc6, Y=>in_ora );
			
		
		  
end architecture struct;
