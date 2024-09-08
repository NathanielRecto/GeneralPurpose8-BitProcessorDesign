library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity decoder is
    Port (
        CurrentState : in std_logic_vector(3 downto 0);
        Enable       : in std_logic;
        OP           : out std_logic_vector(15 downto 0) := (others => '0')
    );
end decoder;

architecture Behavioral of Decoder is
	signal opval : unsigned(15 downto 0);
begin
	opval <= (x"0001" sll to_integer(unsigned(CurrentState))) when (Enable = '1') else (others => '0');
	OP <= std_logic_vector(opval);
	-- OP <= (to_integer(CurrentState) => '1', others => 0) else (others => 0);
--
--    process (CurrentState, Enable)
--    begin
--        if Enable = '1' then
--            case CurrentState is
--                when "0000" =>
--                    OP <= "0000000000000001";  -- Operation 1
--                when "0001" =>
--                    OP <= "0000000000000010";  -- Operation 2
--                when "0010" =>
--                    OP <= "0000000000000100";  -- Operation 3
--                when "0011" =>
--                    OP <= "0000000000001000";  -- Operation 4
--                when "0100" =>
--                    OP <= "0000000000010000";  -- Operation 5
--                when "0101" =>
--                    OP <= "0000000000100000";  -- Operation 6
--                when "0110" =>
--                    OP <= "0000000001000000";  -- Operation 7
--                when "0111" =>
--                    OP <= "0000000010000000";  -- Operation 8
--                when "1000" =>
--                    OP <= "0000000100000000";  -- Operation 9
--                when others =>
--                    OP <= "----------------";  -- Default (No operation)
--            end case;
--        end if;
--    end process;
end Behavioral;
