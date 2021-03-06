--modified counter for switching

library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;


entity counter0 is
	generic
	(	
		n : integer := 4;
		k : integer := 8
	);
	
	port 
	(
		clk	: in std_logic; 
		R		: in std_logic;
		load  : in std_logic;
		datain : in std_logic_vector(n-1 downto 0);
		q		: out std_logic_vector(n-1 downto 0);
		rollover : out std_logic
	);
	
end counter0;

architecture behav of counter0 is	
	signal q0 : std_logic_vector(n-1 downto 0);
	
	begin
		process(clk, R, load, datain)
		begin	
		
			if load = '1' then		
				if R = '0' then
					q0 <= (others => '0');
					rollover <= '0';
				
				elsif rising_edge(clk) then			
					if q0 >= k-1 then
						q0 <= (others => '0');
						rollover <= '1';
					else
						q0 <= q0 + 1;					
					end if;
				end if;
						
			else
			q0 <= datain;
			end if;
		
		end process;
		q <= q0;
			
		
	end behav;
	
					
					
		
		