LIBRARY ieee;
USE ieee.std_logic_1164.all;


Entity	modded_sseg IS 
PORT(
	bcd: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
	Cout: IN  STD_LOGIC;
	leds: OUT  STD_LOGIC_VECTOR(0 TO 6);
	negleds: OUT STD_LOGIC_VECTOR(0 TO 6));
END modded_sseg;

ARCHITECTURE Behaviour OF modded_sseg IS
BEGIN
	PROCESS(bcd)
	BEGIN
		CASE bcd IS -- abcdefg
			WHEN "0000" => leds <= not("0010101"); -- n
			WHEN "0001" => leds <= not("0111011"); -- y 	
			WHEN OTHERS => leds <= ("-------");
		END CASE;
	END PROCESS;
END Behaviour;