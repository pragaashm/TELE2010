--Part 4
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity part_4 is

	port
	(	
		SW		: in std_logic_vector(9 downto 0);
		KEY	: in std_logic_vector(1 downto 0);
		LEDR 	: out std_logic_vector(9 downto 0); 
		HEX0, HEX1, HEX2, HEX3 : out std_logic_vector(0 to 6)
	);
	
end part_4;

architecture behav of part_4 is

	--hex display
	component Hex7 port
		(
			c		: in std_logic_vector(3 downto 0);
			disp	: out std_logic_vector(0 to 6)
	   );
	end component;
	
	signal Set : std_logic_vector(1 downto 0);
	signal A,B,sw0 : std_logic_vector(7 downto 0);
	signal S : std_logic_vector(16 downto 0);
	
	begin
		
		Set <= SW(9 downto 8);
		sw0 <= SW(7 downto 0);
		
		process(KEY, A,B)
		variable ivec : std_logic_vector(7 downto 0);
		variable s0 : std_logic_vector(7 downto 0);
		variable s1	: std_logic_vector(16 downto 0);
		
		begin
			if rising_edge(KEY(1)) then --manual clock	
				if ((KEY(0) = '0')) then --RESET
					S <= "00000000000000000";
					A <= "00000000";
					B <= "00000000";
				else
				if(Set  = "10") then
					A <= sw0;
				elsif(Set = "01") then
					B <= sw0;
				elsif(Set ="11") then
					for i in 0 to 7 loop
						 ivec := (A(7) and B(i), A(6) and B(i), A(5) and B(i), A(4) and B(i), A(3) and B(i), A(2) and B(i), A(1) and B(i), A(0) and B(i));
                   S0 := S1((i+7) downto i);
                   S1((i+8) downto i) := (("0" & S0) + ("0" & ivec));
                end loop;
					 S <= s1;
					 A <= "00000000";
					 B <= "00000000";
					end if;
				end if;
			end if;
		end process;
	process(S,set,A,B)
	begin
		case Set is
		when "10" => LEDR(7 downto 0) <= A;
		when "01" => LEDR(7 downto 0) <= B;
		when others => LEDR(7 downto 0) <= "00000000";
		end case;
	end process;

		
		
	--Display
	disp_0 : Hex7 port map (S(3 downto 0), HEX0);
	disp_1 : Hex7 port map (S(7 downto 4), HEX1);

	disp_3 : Hex7 port map (S(11 downto 8), HEX2);
	disp_4 : Hex7 port map (s(15 downto 12), HEX3);
	
end behav;
		
		
		
		