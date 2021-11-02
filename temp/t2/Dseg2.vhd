library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;


entity Dseg2 is

port (
		  SW: in std_logic_vector(5 downto 0);  --BCD input
        Display2,Display1 : out std_logic_vector(0 to 7)  -- 7 bit decoded output.
     );
end Dseg2;


architecture Behavior of Dseg2 is

signal ones,tens: std_logic_vector (3 downto 0);
signal switch : std_logic_vector(5 downto 0);

--signal a,b,c: integer;



component seg2 is

	port (
		  SW: in std_logic_vector(3 downto 0);  --BCD input
        Display : out std_logic_vector(0 to 7) -- 7 bit decoded output.
		  
		  );
end component;

begin


switch <= SW;

process(switch)

	variable a,b,c : integer;


begin
	
	a := to_integer(unsigned(switch));
	b := to_integer(unsigned(ones));
	c := to_integer(unsigned(tens));

	b :=  a rem 10;
	c := (a-b)/10;
	
	ones <= std_logic_vector(to_unsigned(b,ones'length));
	tens <= std_logic_vector(to_unsigned(c,tens'length));

end process;

DP2: seg2 PORT MAP(tens, display2);			
DP1: seg2 PORT MAP(ones, display1);

		


end Behavior;