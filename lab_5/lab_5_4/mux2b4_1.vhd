--2bit 4-1 MUX
library ieee;
use ieee.std_logic_1164.all;

entity  mux2b4_1 is
	port
	(
		s				: in std_logic_vector(1 downto 0);
		u,v,w,x		: in std_logic_vector(0 to 6);

		m				: out std_logic_vector(0 to 6)
	);
	
end mux2b4_1;

architecture behav of mux2b4_1 is
begin

	process (s, u, v, w, x)
	begin
		case s is
			when "00" => m <= u;
			when "01" => m <= v;
			when "10" => m <= w;
			when "11" => m <= x;
			when others => m <= (others => 'Z');
			
		end case;
	end process;
end behav;