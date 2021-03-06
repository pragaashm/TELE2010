library ieee;
use ieee.std_logic_1164.all;

entity part2_1 is
	port
	(
		clk,d	: in std_logic;
		q		: out std_logic
	);
end part2_1;

architecture Structural of part2_1 is
	signal r, s, r_g, s_g, q_a, q_b : std_logic;
	
	attribute keep : boolean;
	attribute keep of r, r_g, s_g, q_a, q_b : signal is true;

begin
	s <= d;
	r <= not d;
	s_g <= not(s and clk);
	r_g <= not(r and clk);
	q_a <= not(s_g and q_b);
	q_b <= not(r_g and q_a);
	
	q <= q_a;
	
end Structural;