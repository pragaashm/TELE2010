--Task 3
--Creating a real-time clock


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity part_3 is
	port
	(
		KEY											: in std_logic_vector(1 downto 0);
		CLOCK_50 									: in std_logic;
		SW 											: in std_logic_vector(7 downto 0);
		LEDR											: out std_logic_vector(9 downto 0);
		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5	: out std_logic_vector(0 to 6)
		
	);
	
end part_3;

architecture behav of part_3 is
	
	--importing counter
	component counter
	generic
	(
		n	: integer := 4;
		k	: integer := 8
	);
	
	port
	(
		clk	: in std_logic;
		R		: in std_logic;
		q		: out std_logic_vector(n-1 downto 0)
		--rollover	: out std_logic --not in use
	);
	
	end component;
	
	--importing modified counter
	component counter0
	generic
	(
		n	: integer	:=4;
		k	: integer	:=8
	);
	
	port
	(
		clk		: in std_logic;
		R			: in std_logic;
		load		: in std_logic;
		datain 	: in std_logic_vector(n-1 downto 0);
		q		: out std_logic_vector(n-1 downto 0)
		--rollover	: out std_logic --not in use
	);
	
	end component;


	
	--importing hexadecimal display
	component Hex7
	port
	(
		c		: in std_logic_vector(3 downto 0);
		disp 	: out std_logic_vector(0 to 6)
	);
	
	end component;
	
signal CYCLES : std_logic_vector(25 downto 0);

--pause, switch statments
signal pause_now : std_logic;
signal switch_now : std_logic;
--hex output
signal s0,s1  : std_logic_vector(3 downto 0); --1/100, 1/10
signal s2,s3  : std_logic_vector(3 downto 0); --1, 10
signal s4,s5  : std_logic_vector(3 downto 0); --100, 1000


--1/100, 1/10, 1, 10, 100, 1000 input
signal hunds0, ons0, ons, tns, hunds, tous : std_logic;

--base and new
signal a1, b1, c1, d1, e1, f1	: std_logic;
signal a0, b0, c0, d0, e0, f0 : std_logic;


	
begin

   --Reset state and base
	a1 <= a0;
	b1 <= b0;
	c1 <= c0;
	d1 <= d0;
	e1 <= e0;
	f1 <= f0;
	
	

	cT		: counter
			generic map (n=> 26, k => 500000) --equates to about 0.01 second
			port map (CLOCK_50, '1', CYCLES);
			
	c1s	: counter
			generic map (n => 4, k => 11)
			port map (hunds0, a1, s0);	
			
	c2		: counter
			generic map (n => 4, k => 11)
			port map (ons0, b1, s1);
			
	c3		: counter
			generic map (n => 4, k => 11)
			port map (ons, c1, s2);
			
	c4		: counter
			generic map (n => 4, k => 7)
			port map(tns, d1, s3);
	

			--New counter with modifiable values. Values above 9 is ignored.
	c5		: counter0
			generic map (n => 4, k => 11)
			port map(hunds, e1, KEY(1), SW(3 downto 0), s4);
			
	c6		: counter0
			generic map (n => 4, k => 7)
			port map(tous, f1, KEY(1), SW(7 downto 4), s5);
			
			
	
	
	process (CLOCK_50, pause_now)
	



	
	begin
	
	
	
	--process runs only when KEY(0) is not pressed
	if (pause_now = '1') then
		
		if rising_edge(CLOCK_50) then
			
			if (CYCLES = 499999) then
				hunds0 <= '1';
			else
				hunds0 <= '0';
			end if;
			
			if (s0 = 10) then
				ons0 <= '1';
				a0 <= '0';
			else
				ons0 <= '0';
				a0 <= '1';
			end if;
			
			if (s1 = 10) then
				ons <= '1';
				b0 <= '0';
			else
				ons <= '0';
				b0 <= '1';
			end if;
			
			if (s2 = 10) then
				tns <= '1';
				c0 <= '0';
			else
				tns <= '0';
				c0 <= '1';
			end if;
			
			
			if (s3 = 6) then
				hunds <= '1';
				d0 <= '0';
			else
				hunds <= '0';
				d0 <= '1';
			end if;
			
			
			if (s4 = 10) then
				tous <= '1';
				e0 <= '0';
			else
				tous <= '0';
				e0 <= '1';
			end if;		
			
			if (s5 = 6) then
				tous <= '0';
				f0 <= '0';
			else
				f0 <= '1';
			end if;
			
	
		
		end if;
				
			
	

	else
	--pause
	
	
	end if;
	
	
	end process;


d_hundredths   : Hex7 PORT MAP (s0, HEX0);
d_tenths	  		: Hex7 PORT MAP (s1, HEX1);
d_ones	 	   : Hex7 PORT MAP (s2, HEX2);
d_tens	      : Hex7 PORT MAP (s3, HEX3);
d_hundreds     : Hex7 PORT MAP (s4, HEX4);
d_thousends    : Hex7 PORT MAP (s5, HEX5);

pause_now <= KEY(0);

--ligths up binary values to overwrite
LEDR(3 downto 0) <= SW(3 downto 0);
LEDR(7 downto 4) <= SW(7 downto 4);

end behav;
				
				
				
		
	
	
	
	
	
	
	
	
	
	
	


