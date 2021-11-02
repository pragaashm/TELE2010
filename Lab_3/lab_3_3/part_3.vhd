library ieee;
use ieee.std_logic_1164.all;

entity part_3 is
	port
	(
		SW			: in std_logic_vector(1 downto 0);
		LEDR		: out std_logic_vector(1 downto 0)
	);
end part_3;

architecture Behavioral of part_3 is
	component part2_1 port
	(
		clk, d : in std_logic;
		q		 : out std_logic
	);
	end component;
	
	signal clk, d, qm, q : std_logic;

begin

	clk <= SW(1);
	d <= SW(0);
	LEDR(0) <= q;
	LEDR(1) <= clk;

	master : part2_1 port map
	( not clk, d, qm );
	
	slave : part2_1 port map
	( clk, qm, q );
end Behavioral;