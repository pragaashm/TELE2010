library ieee;
use ieee.std_logic_1164.all;

entity dLatch is
	port
	(
		clk, d	: in std_logic;
		q		   : out std_logic
	);
end dLatch;

architecture Behavioral of dLatch is

begin

	process (clk, d)
	begin
		if clk = '1' then
			q <= d;
		end if;
	end process;
	
end Behavioral;
