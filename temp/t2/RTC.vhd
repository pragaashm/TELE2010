-- Author/ Editor - Kavinda Rathnayake
-- M.Eng (Hons) in Electrical and Electronic Engineering,Sheffield Hallam University,United Kingdom.
-- Faculty of Graduate studies and Research in Electrical and Electronics Engineering
-- Sri Lanka Institute of Information Technology,Sri Lanka.
-- under supervisation of Dr. Rohana Thilakumara.(SLIIT).


library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

entity RTC is
	port
	(
		CLOCK_50 : in std_logic;
		KEY		: in std_logic_vector(1 downto 0);
		LEDR     : out std_logic_vector(7 downto 0);
		HEX3,HEX2  : out std_logic_vector(7 downto 0);
		HEX1,HEX0: out std_logic_vector(7 downto 0)
	);
end RTC;

architecture Behavioral of RTC is

signal PERSEC : std_logic_vector(25 downto 0);
--signal PERMIN : std_logic_vector(31 downto 0);
--signal PERHOR : std_logic_vector(37 downto 0);

signal seconds,minutes : std_logic_vector ( 5 downto 0);
signal hours			  : std_logic_vector ( 5 downto 0);


signal sec,min,hor: std_logic;

component Counter
	generic
	(
		n : integer := 4; 
		k : integer := 10
	);
	port
	(
		clk		: in std_logic;
		rst		: in std_logic;
		q			: out std_logic_vector(n-1 downto 0)
	);
end component;

component Dseg

port (
		  SW: in std_logic_vector(5 downto 0);  --BCD input
        Display2,Display1 : out std_logic_vector(0 to 7)  -- 7 bit decoded output.
     );
end component;

component Dseg2

port (
		  SW: in std_logic_vector(5 downto 0);  --BCD input
        Display2,Display1 : out std_logic_vector(0 to 7)  -- 7 bit decoded output.
     );
end component;

	
begin


C0		: Counter
		generic map ( n => 26, k => 50000000 )
		port map ( CLOCK_50,KEY(0),PERSEC );
C3  : Counter 
		generic map ( n => 6, k => 61 )		
		port map ( sec, KEY(0), seconds );
C4  : Counter 
		generic map ( n => 6, k => 60 )		
		port map ( min, KEY(0), minutes );
C5  : Counter 
		generic map ( n => 6, k => 24 )		
		port map ( hor, KEY(0), hours );
		

process (CLOCK_50) begin

	if falling_edge(CLOCK_50) then

		if (PERSEC = 49999999)then
			sec <= '1';
		else
			sec <= '0';
		end if;
		
		if (seconds = 59) then
			min <= '1';
		else
			min <= '0';
		end if; 
		
		if (minutes >= 59 ) then
			hor <= '1';
		else
			hor <= '0';
		end if;
		
		
		
	end if;

end process;
		

D1: Dseg PORT MAP (minutes, HEX3, HEX2);
D2: Dseg2 PORT MAP(seconds, HEX1, HEX0);



end Behavioral;