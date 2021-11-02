library ieee;
use ieee.std_logic_1164.all;

entity p_ff is
	port
	(
		clk, d : in std_logic;
		q		 : out std_logic
	);
end p_ff;

architecture Behavioral of p_ff is

begin
	process (clk, d)
	begin
		if clk'event and clk = '1' then
			q <= d;
		end if;
	end process;
	
end Behavioral;