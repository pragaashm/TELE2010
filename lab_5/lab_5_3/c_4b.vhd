library ieee;
use ieee.std_logic_1164.all;

entity c_4b is
	port
	(		
		clk		: in std_logic;
		en			: in std_logic;
		clr		: in std_logic;
		o_put		: inout std_logic_vector(3 downto 0)
	);
end c_4b;

architecture behav of c_4b is

	component t_ff port
	(		
		clk		: in std_logic;
		t			: in std_logic;
		clr		: in std_logic;
		o_put		: out std_logic
	);
	end component;
	
	signal t_int : std_logic_vector(3 downto 0);
	signal q_int : std_logic_vector(3 downto 0);
	
begin
	t_int(0) <= en;
	t_int(1) <= en and q_int(0);
	t_int(2) <= t_int(1) and q_int(1);
	t_int(3) <= t_int(2) and q_int(2);
	
	c0 : t_ff port map (clk, t_int(0), clr, q_int(0));
	c1 : t_ff port map (clk, t_int(1), clr, q_int(1));
	c2 : t_ff port map (clk, t_int(2), clr, q_int(2));
	c3 : t_ff port map (clk, t_int(3), clr, q_int(3));
	
	o_put <= q_int;
	
end behav;