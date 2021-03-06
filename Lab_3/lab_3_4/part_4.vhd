library ieee;
use ieee.std_logic_1164.all;

entity part_4 is
	port
	(
		clk, d      : in std_logic;
		qa, qb, qc	: out std_logic
	);
end part_4;

architecture Behavioral of part_4 is
	component dLatch port
	(
		clk, d	: in std_logic;
		q		   : out std_logic
	);
	end component;
	
	component p_ff port
	(
		clk, d	: in std_logic;
		q		   : out std_logic
	);
	end component;
	
	component n_ff port
	(
		clk, d 	: in std_logic;
		q		   : out std_logic
	);   
	end component;
	
begin

	part4_1 : dLatch port map
	( clk, d, qa );
	
	part4_2 : p_ff port map
	( clk, d, qb );
	
	part4_3 : n_ff port map
	( clk, d, qc );
	
end Behavioral;