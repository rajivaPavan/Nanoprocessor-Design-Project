library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.common.all;

entity TB_Mux_8_4 is
    -- port();
end TB_Mux_8_4;

architecture Behavioral of TB_Mux_8_4 is

signal S : std_logic_vector(2 downto 0);
signal D : data_buses;

signal Y : std_logic_vector(3 downto 0);
signal EN : std_logic := '1';
constant period : time := 10 ns;

begin
    uut: Mux_8_4 port map (
        S => S, 
        D => D,
        EN => EN,
        Y => Y);

    clock: process
    begin
        S <= "111";
        wait for period;
        
        S<= "110";
        wait for period;
        
        S <= "101";
        wait for period;

        S <= "100";
        wait for period;

        S <= "011";
        wait for period;

        S <= "010";
        wait for period;
        
        S <= "001";
        wait for period;
                
        S <= "000";
        wait for period;
    end process;

    stim: process
    begin
        -- following values are from index numbers 210479 L and 210344U
        -- 00210
        D(7) <= "0000"; D(6) <= "0000";
        D(5) <= "0010"; D(4) <= "0001";
        D(3) <= "0000";
        
        -- 479
        D(2) <= "0100";
        D(1) <= "0111"; D(0) <= "1001";
        wait for period*8;
        
        -- 344
        D(2) <= "0011";
        D(1) <= "0100"; D(0) <= "0100";
        wait; 
    end process;

end Behavioral;