LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

ENTITY O_5 IS
PORT(
	SW  :IN STD_LOGIC_VECTOR(9 DOWNTO 0);
	HEX0,HEX1,HEX2,HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	LEDR : OUT STD_LOGIC_VECTOR (6 DOWNTO 0));
END O_5 ;

ARCHITECTURE hex_7_2 OF O_5 IS 
	SIGNAL SC : STD_LOGIC_VECTOR(7 DOWNTO 0); -- SIGNAL FOR C (character)
	SIGNAL SP : STD_LOGIC_VECTOR(1 DOWNTO 0); -- SIGNAL FOR P (position)
	SIGNAL C0,C1,C2,C3 : STD_LOGIC_VECTOR(6 DOWNTO 0);
	
BEGIN
	SC <= SW(7 DOWNTO 0);
	SP <= SW(9 DOWNTO 8);
	C0 <= ((SC(1)),(NOT SC(0)),(SC(1) AND (NOT SC(0))),(SC(1) AND (NOT SC(0))),((NOT SC(1)) AND SC(0)),((NOT SC(1)) AND SC(0)),(NOT SC(0)));
	C1 <= ((SC(3)),(NOT SC(2)),(SC(3) AND (NOT SC(2))),(SC(3) AND (NOT SC(2))),((NOT SC(3)) AND SC(2)),((NOT SC(3)) AND SC(2)),(NOT SC(2)));
	C2 <= ((SC(5)),(NOT SC(4)),(SC(5) AND (NOT SC(4))),(SC(5) AND (NOT SC(4))),((NOT SC(5)) AND SC(4)),((NOT SC(5)) AND SC(4)),(NOT SC(4)));
	C3 <= ((SC(7)),(NOT SC(6)),(SC(7) AND (NOT SC(6))),(SC(7) AND (NOT SC(6))),((NOT SC(7)) AND SC(6)),((NOT SC(7)) AND SC(6)),(NOT SC(6)));
	HEX0 <= C0 when (SP = "00") else
       C3 when (SP = "01") else
       C2 when (SP = "10") else
       C1;
	HEX1 <= C1 when (SP = "00") else
       C0 when (SP = "01") else
       C3 when (SP = "10") else
       C2;
	HEX2 <= C2 when (SP = "00") else
       C1 when (SP = "01") else
       C0 when (SP = "10") else
       C3;
	HEX3 <= C3 when (SP = "00") else
       C2 when (SP = "01") else
       C1 when (SP = "10") else
       C0;
END hex_7_2;