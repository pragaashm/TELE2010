--4bit shift registers
library ieee ;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity p_3 is
port(		SW		: in std_logic_vector(3 downto 0);
			KEY	: in std_logic_vector(1 downto 0);
			LEDR	: out std_logic_vector(5 downto 0)

			);
			
end p_3;

architecture behav of p_3 is

signal R, clk, counter : std_logic;
signal W,Z,R,clk,P_State : STD_LOGIC;
shared variable P_Counter,P_Pos,Pos : INTEGER range 0 to 7 := 0;
shared variable Counter : INTEGER range 0 to 7 := 1;
signal S : STD_LOGIC_VECTOR(7 downto 0) :=  "00000001";

begin 

	W <= SW(1);
	R <= SW(0);
	clk <= KEY(0);
	LEDR(3 downto 0) <= S;
	LEDR(5) <= Z;

	check_zero process(clk)
	begin
		if rising_edge(clk) then
		
			if (R='1') then
						Z <= "0000";
					elsif (clk'event and clk='1') then
						Z <= "0000";
						end if;
		
		
	
	