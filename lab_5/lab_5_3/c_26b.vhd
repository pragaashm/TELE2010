library ieee;
use ieee.std_logic_1164.all;

entity c_26b is
	port
	(		
		clk	: in std_logic;
		en		: in std_logic;
		clr	: in std_logic;
		o_put	: inout std_logic_vector(25 downto 0)
	);
end c_26b;

architecture behav of c_26b is

	component t_ff port
	(		
		clk		: in std_logic;
		t			: in std_logic;
		clr		: in std_logic;
		o_put		: out std_logic
	);
	end component;
	
	signal t_int : std_logic_vector(25 downto 0);
	signal q_int : std_logic_vector(25 downto 0);
	
begin
	t_int(0) <= en;
	t_int(1) <= en and q_int(0);
	t_int(2) <= t_int(1) and q_int(1);
	t_int(3) <= t_int(2) and q_int(2);
	t_int(4) <= t_int(3) and q_int(3);
	t_int(5) <= t_int(4) and q_int(4);
	t_int(6) <= t_int(5) and q_int(5);
	t_int(7) <= t_int(6) and q_int(6);
	t_int(8) <= t_int(7) and q_int(7);
	t_int(9) <= t_int(8) and q_int(8);
	t_int(10) <= t_int(9) and q_int(9);
	t_int(11) <= t_int(10) and q_int(10);
	t_int(12) <= t_int(11) and q_int(11);
	t_int(13) <= t_int(12) and q_int(12);
	t_int(14) <= t_int(13) and q_int(13);
	t_int(15) <= t_int(14) and q_int(14);
	t_int(16) <= t_int(15) and q_int(15);
	t_int(17) <= t_int(16) and q_int(16);
	t_int(18) <= t_int(17) and q_int(17);
	t_int(19) <= t_int(18) and q_int(18);
	t_int(20) <= t_int(19) and q_int(19);
	t_int(21) <= t_int(20) and q_int(20);
	t_int(22) <= t_int(21) and q_int(21);
	t_int(23) <= t_int(22) and q_int(22);
	t_int(24) <= t_int(23) and q_int(23);
	t_int(25) <= t_int(24) and q_int(24);
	
	c0 : t_ff port map (clk, t_int(0), clr, q_int(0));
	c1 : t_ff port map (clk, t_int(1), clr, q_int(1));
	c2 : t_ff port map (clk, t_int(2), clr, q_int(2));
	c3 : t_ff port map (clk, t_int(3), clr, q_int(3));
	c4 : t_ff port map (clk, t_int(4), clr, q_int(4));
	c5 : t_ff port map (clk, t_int(5), clr, q_int(5));
	c6 : t_ff port map (clk, t_int(6), clr, q_int(6));
	c7 : t_ff port map (clk, t_int(7), clr, q_int(7));
	c8 : t_ff port map (clk, t_int(8), clr, q_int(8));
	c9 : t_ff port map (clk, t_int(9), clr, q_int(9));
	c10 : t_ff port map (clk, t_int(10), clr, q_int(10));
	c11 : t_ff port map (clk, t_int(11), clr, q_int(11));
	c12 : t_ff port map (clk, t_int(12), clr, q_int(12));
	c13 : t_ff port map (clk, t_int(13), clr, q_int(13));
	c14 : t_ff port map (clk, t_int(14), clr, q_int(14));
	c15 : t_ff port map (clk, t_int(15), clr, q_int(15));
	c16 : t_ff port map (clk, t_int(16), clr, q_int(16));
	c17 : t_ff port map (clk, t_int(17), clr, q_int(17));
	c18 : t_ff port map (clk, t_int(18), clr, q_int(18));
	c19 : t_ff port map (clk, t_int(19), clr, q_int(19));
	c20 : t_ff port map (clk, t_int(20), clr, q_int(20));
	c21 : t_ff port map (clk, t_int(21), clr, q_int(21));
	c22 : t_ff port map (clk, t_int(22), clr, q_int(22));
	c23 : t_ff port map (clk, t_int(23), clr, q_int(23));
	c24 : t_ff port map (clk, t_int(24), clr, q_int(24));
	c25 : t_ff port map (clk, t_int(25), clr, q_int(25));
	
	o_put <= q_int;
end behav;