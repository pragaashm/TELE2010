library ieee;
use ieee.std_logic_1164.all;

entity Bdc7seg is
	port
	(
		c		: in std_logic_vector(3 downto 0);
		disp	: out std_logic_vector(0 to 6)
	);
end Bdc7seg;

architecture Behavioral of Bdc7seg is
begin
	disp(0) <= (c(2) and not c(1) and not c(0)) or (not c(3) and not c(2) and not c(1) and c(0));
	disp(1) <= (c(2) and not c(1) and c(0)) or (c(2) and c(1) and not c(0));
	disp(2) <= not c(2) and c(1) and not c(0);
	disp(3) <= (c(2) and not c(1) and not c(0)) or (not c(3) and not c(2) and not c(1) and c(0)) or (c(2) and c(1) and c(0));
	disp(4) <= (c(2) and not c(1) and not c(0)) or c(0);
	disp(5) <= (not c(3) and not c(2) and not c(1) and c(0)) or (c(1) and c(0)) or (not c(2) and c(1) and not c(0));
	disp(6) <= (not c(3) and not c(2) and not c(1)) or (c(2) and c(1) and c(0));
end Behavioral;