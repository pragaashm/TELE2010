library ieee;
use ieee.std_logic_1164.all;

entity n_ff is
	port
	(
		clk, d	: in std_logic;
		q		   : out std_logic
	);
end n_ff;

architecture Behavioral of n_ff is

begin
	process (clk, d)
	begin
		if clk'event and clk = '0' then
			q <= d;
		end if;
	end process;
	
end Behavioral;
