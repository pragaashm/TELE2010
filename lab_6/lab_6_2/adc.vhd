--fulladder w/carry

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity adc is

	generic (n: integer := 8);
	port(
			
			A		:  in std_logic_vector(n-1 downto 0);
			B		:  in std_logic_vector(n-1 downto 0);
			add_sub 	: 	in std_logic;
			sum 	:  out std_logic_vector(n-1 downto 0);
			carry1 : out std_logic
			
		);
		
	end adc;
	
	
	architecture behav of adc is
	
	
	signal temp_1 : std_logic_vector(n downto 0);
	
	begin
		
		process (A, B, add_sub) begin
			if (add_sub = ('1') and B >= A) then
			   temp_1 <= ("0" & B) - ("0" & A);
		else 
				temp_1 <= ("0" & A) + ("0" & B);
		end if;
		end process;
		
		sum <= temp_1(n-1 downto 0);
		carry1 <= temp_1(n);
			
	end behav;
	

		