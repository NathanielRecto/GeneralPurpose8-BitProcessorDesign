library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity part3Alu is
port(Clk:in std_logic;
A,B : in unsigned(7 downto 0);
student_id : in unsigned(3 downto 0);
OP : in unsigned(15 downto 0);
R1: out unsigned(3 downto 0));

end part3Alu;
architecture calculation of part3Alu is
signal Result : unsigned(3 downto 0) :=(others=> '0');
begin	
	process(student_id)
	begin
	 if (student_id(0) = '1') then
		Result <= "0001"; -- 'Y'
	 else 
		Result <= "0000"; -- 'N'
	 end if;
	 end process;
R1 <= Result(3 downto 0);
end calculation;