--Top level

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity part_4 is
	port
	(
		CLOCK_50						: in std_logic;
		HEX0, HEX1, HEX2, HEX3	: out std_logic_vector(0 to 6)
	
	);
end part_4;

architecture behav of part_4 is

	component mux2b4_1 port
	(
		s				: in std_logic_vector(1 downto 0);
		u,v,w,x		: in std_logic_vector(0 to 6);

		m				: out std_logic_vector(0 to 6)
	);
	end component;
	
	component t_ff
	
	generic ( n : integer := 8 );
	port
	(		
		clk	 	: in std_logic;
		t		 	: in std_logic;
		clr	 	: in std_logic;
		o_put		: inout std_logic_vector(n-1 downto 0)
	);
	
	end component;
	
	signal q_clk : std_logic_vector(25 downto 0);
	signal clr_clk : std_logic;
	signal q_disp : std_logic_vector(1 downto 0);
	signal clr_disp : std_logic;
	
	
	begin

	clk_counter : process (CLOCK_50, q_clk)
	
	begin
	--Checking if event has occured on signal	
		if CLOCK_50'event and CLOCK_50 = '0' then 
			if q_clk >= 50000000 then
				clr_clk <= '0';
			else
				clr_clk <= '1';
			end if;
		end if;
	end process;
	
	dig_counter : process (clr_clk, q_disp)
	
	begin
	--Checking if event has occured on signal	

		if clr_clk'event and clr_clk = '0' then
			if q_disp >= 3 then
				clr_disp <= '0';
			else
				clr_disp <= '1';
			end if;
		end if;
	end process;

	c26bit : t_ff 
		generic map ( 26 )
		port map ( CLOCK_50, '1', clr_clk, q_clk );
	c2bit : t_ff
		generic map ( 2 )
		port map ( clr_clk, '1', clr_disp, q_disp );
	
	MUX0 : mux2b4_1 port map
	(
		q_disp,
		"0000001", -- 0
		"1000010", -- d
		"0110000", -- E
		"1001111", -- 1
		HEX0
	);
	
	MUX1 : mux2b4_1 port map
	(
		q_disp,
		"1001111", -- 1
		"0000001", -- 0 
		"1000010", -- d
		"0110000", -- E
		HEX1
	);
	
	MUX2 : mux2b4_1 port map
	(
		q_disp,
		"0110000", -- E
		"1001111", -- 1
		"0000001", -- 0
		"1000010", -- d
		HEX2
	);
	
	MUX3 : mux2b4_1 port map
	(
		q_disp,
		"1000010", -- d
		"0110000", -- E
		"1001111", -- 1
		"0000001", -- 0
		HEX3
	);

end behav;