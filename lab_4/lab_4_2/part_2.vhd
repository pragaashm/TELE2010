--Implementing a FSM
library ieee ;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity part_2 is
port(		SW		: in std_logic_vector(1 downto 0);
			KEY	: in std_logic_vector(1 downto 0);
			LEDR	: out std_logic_vector(9 downto 0)

			);
			
end part_2;

----------------------------------------------------------------

architecture behav of part_2 is
			signal W, R, clk, counter : std_logic;
			
			--defining states of FSM

			type t_states is (A, B, C, D, E, F, G, H, I);
			signal S : std_logic_vector(3 downto 0) := "0000"; --Start state
			shared variable ps_x, ps_y : integer range 0 to 7 := 0; --implementing save states for W high and low
			
			--setting up one-hot codes for states
			attribute enum_encoding : string;	
	      attribute enum_encoding of t_states : TYPE IS "0000 0001 0010 0011 0100 0101 0110 0111 1000";
			
			--Setting current and next state 
			signal c_state, n_state : t_states; 
			
begin 
			
	
			--setting up D Flip-flop
			state_reg: process(clk, R)
			begin
			
				if rising_edge(clk) then
				
			
					if (R='1') then
						c_state <= A;
						ps_y := 0;
						ps_x := 0; -- Resets and counter set to zero.
					elsif (clk'event and clk='1') then
						c_state <= n_state;

					end if;
					
				end if;
			
					
			end  process state_reg;
			
		
			
		
			
			comb: process(c_state, W)
			begin	
			
			if rising_edge(clk) then	
			
				if ((ps_y > 3) or (ps_x > 3)) then
				      counter <= '1';
						else
						counter <= '0';

					end if;						
					
			
			   case c_state is							
						
						when A =>
						if (W = '0') then 
						n_state <= B;
						S <= "0001";
						--Increment counter while resetting other if no repeat.

						ps_x := ps_x +1;
						ps_y := 0;
	
						else
						n_state <= F;
						ps_x := 0;
						ps_y := ps_y +1;
						S <= "0101";
						end if;
			
						when B =>
						if(W = '0') then 
						n_state <= C;
						ps_x := ps_x +1;
						ps_y := 0;
						S <= "0010";
						else
						n_state <= F;
						ps_x := 0;
						ps_y := ps_y +1;
						S <= "0101";
						end if;
			
						when C =>
						if(W = '0') then
						n_state <= D;
						ps_x := ps_x +1;
						ps_y := 0;
						S <= "0011";
						else
						n_state <= F;
						ps_x := 0;
						ps_y := ps_y +1;
						S <= "0101";
						end if;
			
						when D =>
						if(W = '0') then 
						n_state <= E;
						ps_x := ps_x +1;
						ps_y := 0;
						S <= "0100";
						else
						n_state <= F;
						ps_x := 0;
						ps_y := ps_y +1;
						S <= "0101";
						end if;
			
						when E =>
						if(W = '0') then
						n_state <= E;
						ps_x := ps_x +1;
						ps_y := 0;
						S <= "0100";
						else
						n_state <= F;
						ps_x := 0;
						ps_y := ps_y +1;
						S <= "0101";
						end if;
						
						when F =>
						if(W = '1') then 
						n_state <= G;
						ps_x := ps_x +1;
						ps_y := 0;
						S <= "0110";
						else
						n_state <= B;
						ps_x := 0;
						ps_y := ps_y +1;
						S <= "0001";
						end if;
						
						when G =>
						if(W = '1') then 
						n_state <= H;
						ps_x := ps_x +1;
						ps_y := 0;
						S <= "0111";
						else
						n_state <= B;
						ps_x := 0;
						ps_y := ps_y +1;
						S <= "0001";
						end if;
						
						when H =>
						if(W = '1') then
						n_state <= I;
						ps_x := ps_x +1;
						ps_y := 0;
						S <= "1000";
						else
						n_state <= B;
						ps_x := 0;
						ps_y := ps_y +1;
						S <= "0001";
						end if;
						
						when I =>
						if(W = '1')	then 
						n_state <= I;
						ps_x := ps_x +1;
						ps_y := 0;
						S <= "1000";
						else
						n_state <= B;
						ps_x := 0;
						ps_y := ps_y +1;
						S <= "0001";
						end if;
						
						
					
					end case;
					
				
				end if;
				
				end process comb;
		
			W <= SW(1);
			R <= SW(0);
			clk <= KEY(0);
			LEDR(3 downto 0) <= S;
			--LEDR(9) <= counter; --OBS! Error.

			
	
				
		
			

end architecture behav;