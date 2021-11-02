library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Counter is
	generic
	(
		n : integer := 4;
		k : integer := 10
	);
	port
	(
		clk		: in std_logic;
		rst		: in std_logic;
		q			: out std_logic_vector(n-1 downto 0)
	);
end Counter;

architecture rtl of Counter is
	signal q_int : std_logic_vector(n-1 downto 0);
begin
	process (clk, rst)
	begin
		if rst = '0' then
			q_int <= (others => '0');
		elsif rising_edge(clk)then
			if q_int >= k-1 then
				q_int <= (others => '0');
			else
				q_int <= q_int + 1;
			end if;
		end if;
	end process;
	q <= q_int;
end rtl;