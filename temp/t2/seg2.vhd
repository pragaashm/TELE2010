library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seg2 is

port (
		  SW: in std_logic_vector(3 downto 0);  --BCD input
        Display : out std_logic_vector(0 to 7)  -- 7 bit decoded output.
     );
end seg2;


architecture Behavior of seg2 is

begin

process (SW)

BEGIN

case  SW is

	when "0000"=> Display  <="11000000";  
	when "0001"=> Display  <="11111001";  
	when "0010"=> Display  <="10100100";  
	when "0011"=> Display  <="10110000";  
	when "0100"=> Display  <="10011001";  
	when "0101"=> Display  <="10010010";  
	when "0110"=> Display  <="10000010";  
	when "0111"=> Display  <="11111000";  
	when "1000"=> Display  <="10000000";  
	when "1001"=> Display  <="10010000";  
	WHEN OTHERS => Display <="11111111";


END CASE;
END PROCESS;
END Behavior;




