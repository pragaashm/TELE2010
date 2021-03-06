library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity part_5 is
	port
	(
		SW		:	in std_logic_vector(8 downto 0);
		LEDR	:	out std_logic_vector(8 downto 0);
		HEX0, HEX1, HEX3, HEX5	:	out std_logic_vector(0 to 6)
	);
end part_5;

architecture Behavioral of part_5 is

	component Bdc7Seg port
	(
		c		: in std_logic_vector(3 downto 0);
		disp	: out std_logic_vector(0 to 6)
	);
	end component;
	
	component Cir_B port
	(
		c		: in std_logic;
		disp	: out std_logic_vector(0 to 6)
	);
	end component;
	
	signal a 		: std_logic_vector(3 downto 0);
	signal b 		: std_logic_vector(3 downto 0);
	signal t0 		: std_logic_vector(4 downto 0);
	signal c0	 	: std_logic;
	signal z0		: std_logic_vector(3 downto 0);
	signal s0 		: std_logic_vector(3 downto 0);
	signal st	 	: std_logic_vector(4 downto 0);
	signal s1 		: std_logic;
	
	begin
	a <= SW(7 downto 4); --input
	b <= SW(3 downto 0); --input
	c0 <= SW(8); --carry

	LEDR(7 downto 4) <= a;
	LEDR(3 downto 0) <= b;	
	LEDR(8) <= c0;

	
	process (a, b, c0)
	
	begin
		t0 <= ('0' & a) + ('0' & b) + c0; --adders
		if t0 > 9 then --mux
			z0 <= "1010";
			s1 <= '1';
		else
			z0 <= "0000";
			s1 <= '0';
		end if;
		st <= t0 - z0;
		s0 <= st(3 downto 0);
	end process;
	
	--Display instances:
	DISP3 : Bdc7Seg port map --Value of A
	( a, HEX5 );
	
	DISP2 : Bdc7Seg port map --Value of B
	( b, HEX3 );
	
	DISP1 : Cir_B port map --Value of S1
	( s1, HEX1 );
	
	DISP0 : Bdc7seg port map --Value of S0
	( s0, HEX0 );
	
end Behavioral;