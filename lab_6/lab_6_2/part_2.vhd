--Part 2 
--8bit Accumulator w/add and sub

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity part_2 is
	port(
		KEY : in std_logic_vector(1 downto 0);
		SW  : in std_logic_vector(8 downto 0);
		LEDR : out std_logic_vector(9 downto 0);
		HEX0, HEX1, HEX2, HEX3 : out std_logic_vector(0 to 6)
		);
	end part_2;
	
-----------------------------------------------------------
	
architecture behav of part_2 is
		
		--fulladder component
		component adc
		generic (n: integer := 8);
		port
		(
		
			A		:  in std_logic_vector(n-1 downto 0);
			B		:  in std_logic_vector(n-1 downto 0);
			add_sub 	:  in std_logic;
			sum 	:  out std_logic_vector(n-1 downto 0);
			carry1 	:  out std_logic
		);
		
		end component;
		
		--hex display
		component Hex7 port
		(
			c		: in std_logic_vector(3 downto 0);
			disp	: out std_logic_vector(0 to 6)
	   );
		end component;
		
		signal w  		: std_logic_vector(7 downto 0);
		signal A, B, S, bchange : std_logic_vector(7 downto 0);
		
		signal C, carry, overflow : std_logic;
		
		
		begin
			
			
			f8bit : adc
			generic map (n => 8)
			port map (A,B,SW(8), w, C);
			
			
			
			process(KEY) begin --clock input
			
			if rising_edge(KEY(1)) then
			
				A <= SW(7 downto 0);
				
				S <=  w(7 downto 0);
				carry <= C;
				B <= S;
				overflow <= C XOR (B(7) XOR A(7));
			
			end if;
				

			
			if ((KEY(0) = '0')) then --RESET
				
				A <= "00000000";
				B <= "00000000";
				S <= "00000000";
				carry <= '0';
				overflow <= '0';
			end if;
		end process;
	
	
		
		
	LEDR(7 downto 0) <= S;
	LEDR(8) <= carry;
	LEDR(9) <= overflow;
		
		
				
			
	--display what to add
	disp_3 : Hex7 port map (A(7 downto 4), HEX3 );
	disp_2 : Hex7 port map (A(3 downto 0), HEX2 );

	--display sum
	disp_1 : Hex7 port map (S(7 downto 4), HEX1 );
	disp_0 : Hex7 port map (S(3 downto 0), HEX0 );
							
		
end behav;
						

				
		
	
		
		
		
			