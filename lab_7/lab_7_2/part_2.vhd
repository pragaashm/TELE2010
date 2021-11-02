--Task 2
--Creating modulo-k counter
--modified 8bit counter


library ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

entity part_2 is
	port
	(
		KEY	: in std_logic_vector(1 downto 0);
		CLOCK_50 : in std_logic;
		o_put		: out std_logic_vector(11 downto 0);
		HEX0, HEX1, HEX2	: out std_logic_vector(0 to 6)
		
	);
	
end part_2;

architecture behav of part_2 is
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
		q		: out std_logic_vector(n-1 downto 0)
		--rollover : out std_logic
	);
	
	end component;
	
	component Hex7 
	port
	(
		c	: in std_logic_vector(3 downto 0);
		disp	: out std_logic_vector(0 to 6)
	);
	
	end component;

signal CYCLES : std_logic_vector(25 downto 0);

--Hex output
signal s0 : std_logic_vector(3 downto 0);
signal s1 : std_logic_vector(3 downto 0);
signal s2 : std_logic_vector(3 downto 0);

--1s, 10s, 100s input
signal ons,tns,hunds : std_logic;

--base and new
signal x1,y1,z1 : std_logic;
signal x2,y2,z2 : std_logic;


	
	begin
	
	--output for hex 0-2
	o_put(3 downto 0) <= s0;	
	o_put(7 downto 4) <= s1;
	o_put(11 downto 8) <= s2;
	
	--Base and new. Change when KEY(0) is registered
	x2 <= x1 and KEY(0); 
	y2 <= y1 and KEY(0);
	z2 <= z1 and KEY(0);
	
	CT		: counter
		generic map ( n => 26, k => 50000000 )
		port map ( CLOCK_50,KEY(0),CYCLES );
		
	C1		: counter 
		generic map ( n => 4, k => 11 )
		port map ( ons, x2, s0 );
		
	C10 	: counter 
		generic map ( n => 4, k => 11 )
		port map ( tns, y2, s1 );
	
	C100  : counter 
		generic map ( n => 4, k => 11 )		
		port map ( hunds, z2, s2 );
		
		
	process (CLOCK_50) begin
	
	if rising_edge(CLOCK_50) then

		if (CYCLES = 49999999)then
			ons <= '1';
		else
			ons <= '0';
		end if;
		
		if (s0 = 10) then
			tns <= '1';
			x1	<= '0';
		else
			tns <= '0';
			x1 <= '1';
		end if; 
		
		if (s1 = 10) then
			hunds <= '1';
			y1 <= '0';
		else
			hunds <= '0';
			y1 <= '1';
		end if;
		
		z1 <= '1';
		
	end if;

end process;


d_ones	  : Hex7 PORT MAP (s0, HEX0);
d_tens	  : Hex7 PORT MAP (s1, HEX1);
d_hundreds : Hex7 PORT MAP (s2, HEX2);

		
end behav;