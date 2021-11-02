
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity part_3 is
	port
	(
		CLOCK_50	: in std_logic;
		LEDR		: out std_logic_vector(1 downto 0);
		HEX0		: out std_logic_vector(0 to 6)
	);
end part_3;

architecture behav of part_3 is

	component c_26b port
	(		
		clk		: in std_logic;
		en			: in std_logic;
		clr		: in std_logic;
		o_put		: out std_logic_vector(25 downto 0)
	);
	end component;
	
	component c_4b port
	(		
		clk		: in std_logic;
		en			: in std_logic;
		clr		: in std_logic;
		o_put		: out std_logic_vector(3 downto 0)
	);
	end component;
	
	component Hex7 port
	(
		c		: in std_logic_vector(3 downto 0);
		disp	: out std_logic_vector(0 to 6)
	);
	end component;
	
	signal q_clk : std_logic_vector(25 downto 0);
	signal clr_clk : std_logic;
	signal q_dig : std_logic_vector(3 downto 0);
	signal clr_dig : std_logic;
	
begin

	clk_counter : process (CLOCK_50, q_clk)
	begin
		if CLOCK_50'event and CLOCK_50 = '0' then
			if q_clk >= 50000000 then
				clr_clk <= '0';
			else
				clr_clk <= '1';
			end if;
		end if;
	end process;
	
	dig_counter : process (clr_clk, q_dig)
	begin
		if clr_clk'event and clr_clk = '0' then
			if q_dig >= 9 then
				clr_dig <= '0';
			else
				clr_dig <= '1';
			end if;
		end if;
	end process;

	c26bit : c_26b port map ( CLOCK_50, '1', clr_clk, q_clk );
	c4bit : c_4b port map ( clr_clk, '1', clr_dig, q_dig );
	
	disp_0 : Hex7 port map ( q_dig, HEX0 );
	
end behav;
