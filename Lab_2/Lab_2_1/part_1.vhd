LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY part_1 IS
PORT(
	SW : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	HEX0, HEX1 : OUT STD_LOGIC_VECTOR(0 TO 6));
END part_1;

ARCHITECTURE lab_1 OF part_1 IS
BEGIN

	PROCESS(SW)
	BEGIN
		CASE SW(3 DOWNTO 0) IS
			WHEN "0000" => HEX0 <= "0000001"; --0
			WHEN "0001" => HEX0 <= "1001111"; --1
			WHEN "0010" => HEX0 <= "0010010"; --2
			WHEN "0011" => HEX0 <= "0000110"; --3
			WHEN "0100" => HEX0 <= "1001100"; --4
			WHEN "0101" => HEX0 <= "0100100"; --5
			WHEN "0110" => HEX0 <= "0100000"; --6
			WHEN "0111" => HEX0 <= "0001101"; --7
			WHEN "1000" => HEX0 <= "0000000"; --8
			WHEN "1001" => HEX0 <= "0000100"; --9
			WHEN others => HEX0 <= (others => '-'); --Don't care
		END CASE;
		
		CASE SW(7 DOWNTO 4) IS
			WHEN "0000" => HEX1 <= "0000001"; --0
			WHEN "0001" => HEX1 <= "1001111"; --1
			WHEN "0010" => HEX1 <= "0010010"; --2
			WHEN "0011" => HEX1 <= "0000110"; --3
			WHEN "0100" => HEX1 <= "1001100"; --4
			WHEN "0101" => HEX1 <= "0100100"; --5
			WHEN "0110" => HEX1 <= "0100000"; --6
			WHEN "0111" => HEX1 <= "0001101"; --7
			WHEN "1000" => HEX1 <= "0000000"; --8
			WHEN "1001" => HEX1 <= "0000100"; --9
			WHEN others => HEX1 <= (others => '-'); --Don't care
		END CASE;
		
	END PROCESS;
END lab_1;