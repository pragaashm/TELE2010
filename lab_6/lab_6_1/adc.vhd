--fulladder w/carry

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity adc is

	generic (n: integer := 8);
	port(
			
			A		:  in std_logic_vector(n-1 downto 0);
			B		:  in std_logic_vector(n-1 downto 0);
			carry0	: 	in std_logic;
			sum 	:  out std_logic_vector(n-1 downto 0);
			carry1 : out std_logic
			
		);
		
	end adc;
	
	
	architecture behav of adc is
	
	
	signal temp_1 : std_logic_vector(n downto 0);
	
	constant temp_2: std_logic_vector(n downto 1) := (others => '0');
	
	begin
	
			temp_1 <= ('0' & A)+('0' & B) + (temp_2 & carry0);
			sum <= temp_1(n-1 downto 0);
			carry1 <= temp_1(n);
			
	end behav;
	

		