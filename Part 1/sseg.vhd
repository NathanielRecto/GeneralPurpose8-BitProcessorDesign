--sseg.vhd (from Figure 6.47)

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sseg IS
PORT (
    neg : IN STD_LOGIC;
	bin : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	leds1 : OUT STD_LOGIC_VECTOR(0 TO 6);
	leds2  : OUT STD_LOGIC_VECTOR(0 TO 6) );
END sseg;

ARCHITECTURE Behavior OF sseg IS
BEGIN
    PROCESS (bin)
    BEGIN
			CASE bin IS 		       	    --abcdefg
				WHEN "0000"  => leds1 <= not("1111110");
				WHEN "0001"  => leds1 <= not("0110000");
				WHEN "0010"  => leds1 <= not("1101101");
				WHEN "0011"  => leds1 <= not("1111001");
				WHEN "0100"  => leds1 <= not("0110011");
				WHEN "0101"  => leds1 <= not("1011011");
				WHEN "0110"  => leds1 <= not("1011111");
				WHEN "0111"  => leds1 <= not("1110000");
				WHEN "1000"  => leds1 <= not("1111111");
				WHEN "1001"  => leds1 <= not("1110011");
				WHEN "1010"  => leds1 <= not("1110111");
				WHEN "1011"  => leds1 <= not("0011111");
				WHEN "1100"  => leds1 <= not("1001110");
				WHEN "1101"  => leds1 <= not("0111101");
				WHEN "1110"  => leds1 <= not("1001111");
				WHEN "1111"  => leds1 <= not("1000111");
			END CASE;
	END PROCESS;
	
	PROCESS(neg)
	BEGIN
		IF (neg = '0') THEN
			leds2 <= not("0000000");
		ELSE
			leds2 <= not("0000001");
		END IF;
	END PROCESS;
END Behavior;