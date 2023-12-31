 library ieee;
 use ieee.std_logic_1164.all;
     use ieee.std_logic_unsigned.all;

 entity NUMARATOR is
      port (
         cout  :out std_logic_vector (7 downto 0); 
          enable :in  std_logic;                     
          clk :in  std_logic;                     
          reset  :in  std_logic                      
     );
 end entity;
  
 architecture rtl of NUMARATOR is
     signal count :std_logic_vector (7 downto 0);
 begin
     process (clk, reset) begin
          if (reset = '1') then
              count <= (others=>'0');
         elsif (rising_edge(clk)) then
            if (enable = '1') then
                count <= count + 1;
            end if;
         end if;
     end process;
     cout <= count;
	 end architecture;