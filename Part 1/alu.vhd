library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
port(
	Clk : in  std_logic;
	A,B : in  unsigned(7 downto 0);
	OP  : in  unsigned(15 downto 0);
	Neg : out std_logic;
	R1  : out unsigned(3 downto 0);
	R2  : out unsigned(3 downto 0)
);
end ALU;

architecture calculation of ALU is
	signal Subtraction : unsigned(7 downto 0);
	signal Result : unsigned(7 downto 0);
begin
	Subtraction <= (A - B) when (A > B) else (NOT(A - B) + 1);
	Neg <= '1' when (OP = x"0002" and B > A) else '0';
	
	Result <=
		(A + B) when (OP = x"0001") else
		(Subtraction) when (OP = x"0002") else
		(not A) when (OP = x"0004") else
		(not(A and B)) when (OP = x"0008") else
		(not(A or B)) when (OP = x"0010") else
		(A and B) when (OP = x"0020") else
		(A xor B) when (OP = x"0040") else
		(A or B) when (OP = x"0080") else
		(A xnor B) when (OP = x"0100") else
		"--------";

--	process (OP)
--	begin
--		CASE (OP) IS
--			WHEN x"0001" => Result <= A + B;
--			WHEN x"0002" => Result <= Subtraction;
--			WHEN x"0004" => Result <= NOT A;
--			WHEN x"0008" => Result <= NOT (A AND B);
--			WHEN x"0010" => Result <= NOT (A OR B);
--			WHEN x"0020" => Result <= A AND B;
--			WHEN x"0040" => Result <= A XOR B;
--			WHEN x"0080" => Result <= A OR B;
--			WHEN x"0100" => Result <= A XNOR B;
--			WHEN OTHERS => Result <= "--------";
--		end case;
--	end process;
	
R1 <= Result(3 downto 0);
R2 <= Result(7 downto 4);
end calculation;