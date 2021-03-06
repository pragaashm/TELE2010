--Importing library
--Creating Top-level entity

library ieee;
use ieee.std_logic_1164.all;



entity task_1 is
port(		
		KEY, SW   	: in std_logic_vector(1 downto 0);
		LEDR			: out std_logic_vector(1 downto 0);
		HEX0, HEX1	: out std_logic_vector(0 to 6)
	);
		
end task_1;

-------------------------------------------------------------


architecture behav of task_1 is

		
--Importing components
		
		--T flip-flop
		component t_ff port 
		(
			
			clk           : in std_logic;
			t				  : in std_logic;
			o_put         : out std_logic;
			clr			  : in std_logic
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
	   signal t, o_put   : std_logic_vector(7 downto 0);

		
		begin
		
			clk <= not KEY(0);
			clr <= not SW(0);
			LEDR <= SW;
			
			--states
			
			t(0) <= SW(1); --when Enable is high
			t(1) <= SW(1) and o_put(0);
			t(2) <= t(1) and o_put(1);
			t(3) <= t(2) and o_put(2);
			t(4) <= t(3) and o_put(3); 
			t(5) <= t(4) and o_put(4);
			t(6) <= t(5) and o_put(5);
			t(7) <= t(6) and o_put(6);
----------------------------------------------------

			--Instansiating flip-flop eight times:
			
			s0 : t_ff port map (clk, t(0), o_put(0), clr);
			s1 : t_ff port map (clk, t(1), o_put(1), clr);
			s2 : t_ff port map (clk, t(2), o_put(2), clr);
			s3 : t_ff port map (clk, t(3), o_put(3), clr);
			s4 : t_ff port map (clk, t(4), o_put(4), clr);
			s5 : t_ff port map (clk, t(5), o_put(5), clr);
			s6 : t_ff port map (clk, t(6), o_put(6), clr);
			s7 : t_ff port map (clk, t(7), o_put(7), clr);
			
			--Printing to display
			disp_1 : Hex7 port map ( o_put(7 downto 4), HEX1 );
			disp_0 : Hex7 port map ( o_put(3 downto 0), HEX0 );
			
end behav;