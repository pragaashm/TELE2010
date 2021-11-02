LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;


ENTITY O_6 IS
PORT(
	SW  :IN STD_LOGIC_VECTOR(9 DOWNTO 0);
	KEY :IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	HEX0,HEX1,HEX2,HEX3,HEX4,HEX5 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END O_6;

ARCHITECTURE hex_7_3 OF O_6 IS 
	SIGNAL SC : STD_LOGIC_VECTOR(7 DOWNTO 0); -- SIGNAL given character
	SIGNAL SP : STD_LOGIC_VECTOR(2 DOWNTO 0); -- SIGNAL given position
	SIGNAL C,C0,C1,C2,C3 : STD_LOGIC_VECTOR(6 DOWNTO 0);
	
BEGIN
	SC <= SW(7 DOWNTO 0);
	SP <= (SW(9),SW(8),(NOT KEY(1))); 
	C <= "1111111"; -- Set to 'blank'
	
	
	C0 <= ((SC(1)),(NOT SC(0)),(SC(1) AND (NOT SC(0))),(SC(1) AND (NOT SC(0))),((NOT SC(1)) AND SC(0)),((NOT SC(1)) AND SC(0)),(NOT SC(0)));
	C1 <= ((SC(3)),(NOT SC(2)),(SC(3) AND (NOT SC(2))),(SC(3) AND (NOT SC(2))),((NOT SC(3)) AND SC(2)),((NOT SC(3)) AND SC(2)),(NOT SC(2)));
	C2 <= ((SC(5)),(NOT SC(4)),(SC(5) AND (NOT SC(4))),(SC(5) AND (NOT SC(4))),((NOT SC(5)) AND SC(4)),((NOT SC(5)) AND SC(4)),(NOT SC(4)));
	C3 <= ((SC(7)),(NOT SC(6)),(SC(7) AND (NOT SC(6))),(SC(7) AND (NOT SC(6))),((NOT SC(7)) AND SC(6)),((NOT SC(7)) AND SC(6)),(NOT SC(6)));
	
	
	
	HEX0 <= C0 when (SP = "000") else
       C when (SP = "001") else
       C when (SP = "010") else
       C3 when (SP = "011") else
       C2 when (SP = "100") else
       C1 when (SP = "101") else
       C0 when (SP = "110") else
       C;
	HEX1 <= C1 when (SP = "000") else
       C0 when (SP = "001") else
       C when (SP = "010") else
       C when (SP = "011") else
       C3 when (SP = "100") else
       C2 when (SP = "101") else
       C1 when (SP = "110") else
       C0;
	HEX2 <= C2 when (SP = "000") else
       C1 when (SP = "001") else
       C0 when (SP = "010") else
       C when (SP = "011") else
       C when (SP = "100") else
       C3 when (SP = "101") else
       C2 when (SP = "110") else
       C1;
	HEX3 <= C3 when (SP = "000") else
       C2 when (SP = "001") else
       C1 when (SP = "010") else
       C0 when (SP = "011") else	
       C when (SP = "100") else
       C when (SP = "101") else
       C3 when (SP = "110") else
       C2;
	HEX4 <= C when (SP = "000") else
       C3 when (SP = "001") else
       C2 when (SP = "010") else
       C1 when (SP = "011") else
       C0 when (SP = "100") else
       C when (SP = "101") else
       C when (SP = "110") else
       C3;
	HEX5 <= C when (SP = "000") else
       C when (SP = "001") else
       C3 when (SP = "010") else
       C2 when (SP = "011") else
       C1 when (SP = "100") else
       C0 when (SP = "101") else
       C when (SP = "110") else
       C;
END hex_7_3;