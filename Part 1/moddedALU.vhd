library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity moddedALU is
port(
	Clk : in  std_logic;
	A,B : in  unsigned(7 downto 0);
	OP  : in  unsigned(15 downto 0);
	Neg : out std_logic;
	R1  : out unsigned(3 downto 0);
	R2  : out unsigned(3 downto 0)
);
end moddedALU;

architecture calculation of moddedALU is
	signal Result : unsigned(7 downto 0);
begin
	R1 <= Result(3 downto 0);
	R2 <= Result(7 downto 4);

	process(OP, A, B)
	begin	
		case OP is
			WHEN "0000000000000001" =>
					Result <= A + "00000010";		
					
			WHEN "0000000000000010" =>
					Result <= "00" & B(7 downto 2);
					
			WHEN "0000000000000100" => 
					Result <= "1111" & A(7 downto 4);
			
			WHEN "0000000000001000" => 	
					if(A <= B) then
						Result <= A;
					else
						Result <= B;
					end if;
					
			WHEN "0000000000010000" =>
				Result <= A ror 2;		
								
			WHEN "0000000000100000" => 
				Result(0) <= B(7);
				Result(1) <= B(6);
				Result(2) <= B(5);
				Result(3) <= B(4);
				Result(4) <= B(3);
				Result(5) <= B(2);
				Result(6) <= B(1);
				Result(7) <= B(0);
			
			WHEN "0000000001000000" => 
				Result <= A xor B;
					
			WHEN "0000000010000000" => 
				Result <= (A + B) - "00000100";
			
			WHEN "0000000100000000" => 
				Result <= (others => '1');
				
			WHEN OTHERS => 
				Result <= "--------";
		
			end case;
	end process;
end calculation;