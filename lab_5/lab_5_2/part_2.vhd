--Top level

library ieee;
use ieee.std_logic_1164.all;

entity part_2 is
	port(		
		KEY, SW        	: in std_logic_vector(1 downto 0);
		LEDR		      	: out std_logic_vector(1 downto 0);
		HEX0, HEX1, HEX2, HEX3	: out std_logic_vector(0 to 6)
	);
		
end part_2;

architecture behav of part_2 is
	component nt_ff port
	(
		clk	   : in std_logic;
		t		   : in std_logic;
		o_put		: out std_logic_vector(15 downto 0);
		clr	   : in std_logic
	);
	end component;
	
	-- Hexadecimal display
		component Hex7 port
		(
		
			c    : in std_logic_vector(3 downto 0);
			disp : out std_logic_vector(0 to 6)
			
		);
		end component;
	
	signal clk, clr 	: std_logic;
	signal t			: std_logic;
	signal o_put   : std_logic_vector(15 downto 0);

	begin
	
		clk <= not KEY(0);
		clr <= not SW(0);
		LEDR <= SW;
		
		--16 states
		t(0) <= SW(1); --when Enable is high
		t(1) <= SW(1) and o_put(0);
		t(2) <= t(1) and o_put(1);
		t(3) <= t(2) and o_put(2);
		t(4) <= t(3) and o_put(3);
		t(5) <= t(4) and o_put(4);
		t(6) <= t(5) and o_put(5);
		t(7) <= t(6) and o_put(6);
		t(8) <= t(7) and o_put(7);
		t(9) <= t(8) and o_put(8);
		t(10) <= t(9) and o_put(9);
		t(11) <= t(10) and o_put(10);
		t(12) <= t(11) and o_put(11);
		t(13) <= t(12) and o_put(12);
		t(14) <= t(13) and o_put(13);
		t(15) <= t(14) and o_put(14);
		
		-------Instansing flip flops
		s0 : nt_ff port map (clk, t(0), o_put(0), clr);
		s1 : nt_ff port map (clk, t(1), o_put(1), clr);
		s2 : nt_ff port map (clk, t(2), o_put(2), clr);
		s3 : nt_ff port map (clk, t(3), o_put(3), clr);
		s4 : nt_ff port map (clk, t(4), o_put(4), clr);
		s5 : nt_ff port map (clk, t(5), o_put(5), clr);
		s6 : nt_ff port map (clk, t(6), o_put(6), clr);
		s7 : nt_ff port map (clk, t(7), o_put(7), clr);
		s8 : nt_ff port map (clk, t(8), o_put(8), clr);
		s9 : nt_ff port map (clk, t(9), o_put(9), clr);
		s10 : nt_ff port map (clk, t(10), o_put(10), clr);
		s11 : nt_ff port map (clk, t(11), o_put(11), clr);
		s12 : nt_ff port map (clk, t(12), o_put(12), clr);
		s13 : nt_ff port map (clk, t(13), o_put(13), clr);
		s14 : nt_ff port map (clk, t(14), o_put(14), clr);
		s15 : nt_ff port map (clk, t(15), o_put(15), clr);
		
		--Print to display:
		disp_3 : Hex7 port map ( o_put(15 downto 12), HEX3 );
		disp_2 : Hex7 port map ( o_put(11 downto 8), HEX2 );
		disp_1 : Hex7 port map ( o_put(7 downto 4), HEX1 );
		disp_0 : Hex7 port map ( o_put(3 downto 0), HEX0 );
		
end behav;