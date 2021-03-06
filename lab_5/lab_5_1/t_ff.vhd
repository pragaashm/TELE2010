--Creating T-flip flop

library ieee;
use ieee.std_logic_1164.all;

entity t_ff is
	port (
			clk, clr, t      : in std_logic;
			o_put 			  : out std_logic
			);
			
	end t_ff;

architecture behav of t_ff is
		signal temp : std_logic;
		
begin 
		process (clk, clr, t, temp)
		begin
				
			if rising_edge(clk) then
				if t = '1' then
					temp <= not temp;
				end if;
				
			end if;
			

			--if clear is low, then value set to '0'
			if (clr <= '0') then
				temp <= '0';
	
			end if;
			o_put <= temp;

		end process;
			
			
			
end behav;