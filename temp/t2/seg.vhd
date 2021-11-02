library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seg is

port (
		  SW: in std_logic_vector(3 downto 0);  --BCD input
        Display : out std_logic_vector(0 to 7)  -- 7 bit decoded output.
     );
end seg;


architecture Behavior of seg is

begin

process (SW)

BEGIN

case  SW is

	when "0000"=> Display  <="01000000";  
	when "0001"=> Display  <="01111001";  
	when "0010"=> Display  <="00100100";  
	when "0011"=> Display  <="00110000";  
	when "0100"=> Display  <="00011001";  
	when "0101"=> Display  <="00010010";  
	when "0110"=> Display  <="00000010";  
	when "0111"=> Display  <="01111000";  
	when "1000"=> Display  <="00000000";  
	when "1001"=> Display  <="00010000";  
	WHEN OTHERS => Display <="01111111";


END CASE;
END PROCESS;
END Behavior;




