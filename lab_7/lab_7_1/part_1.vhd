--Task 1
--Creating modulo-k counter
--modified 8bit counter

library ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_signed.all;

entity part_1 is
	port
	(
		KEY	: in std_logic_vector(1 downto 0);
		LEDR 	: out std_logic_vector(9 downto 0) --8bit output and rollover
	);
	
end part_1;

architecture behav of part_1 is
	component counter
	generic
	(
		n : integer := 4;
		k : integer := 8
		
	);
	
	port
	(
	
		clk	: in std_logic;
		R		: in std_logic;
		q		: out std_logic_vector(n-1 downto 0);
		rollover : out std_logic
	);
	
	end component;
	
	begin
	
	 
		count_8 : counter
			generic map( n => 8, k => 20)
			port map (KEY(1), KEY(0), LEDR(7 downto 0), LEDR(9));
			
	end behav;