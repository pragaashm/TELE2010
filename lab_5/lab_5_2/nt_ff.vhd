--16bit counter

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity nt_ff is
	port(
		clk, clr, t		: in std_logic;
		o_put				: inout std_logic_vector(15 downto 0)
		
		);
	end nt_ff;
	
	
architecture behav of nt_ff is 
	
	begin
		
		process (clk, clr, t)
		
		begin
			if rising_edge(clk) then
				if t= '1' then
					o_put <= o_put +1;
				end if;
			end if;
				if (clr <= '0') then
					o_put <= (others => '0');
					
				end if;
				
		end process;
	
end behav;
				