library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_signed.all;


entity counter is
	generic
	(	
		n : integer := 4;
		k : integer := 16
	);
	
	port 
	(
		clk	: in std_logic; 
		R		: in std_logic;
		q		: out std_logic_vector(n-1 downto 0);
		rollover : out std_logic
	);
	
end counter;

architecture behav of counter is	
	signal q0 : std_logic_vector(n-1 downto 0);
	
	begin
		process(clk, R)
		begin	
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
			
		end process;
		q <= q0;
		
	end behav;
	
					
					
		
		