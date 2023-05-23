library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Mux_8_4 is
    -- port();
end TB_Mux_8_4;

architecture Behavioral of TB_Mux_8_4 is
component Mux_8_4 is
    port ( S : in std_logic_vector (2 downto 0); -- Control Bits
           D : in std_logic_vector(31 downto 0); -- Data Buses
           EN : in std_logic; -- Enable
           Y : out std_logic_vector(3 downto 0)); -- Output
end component;

signal S : std_logic_vector(2 downto 0);
signal D : std_logic_vector(31 downto 0);
signal Y : std_logic_vector(3 downto 0);
signal EN : std_logic := '1';
constant period : time := 10 ns;

begin
    uut: Mux_8_4 port map (S => S, D => D, EN => EN, Y => Y);

    clock: process
    begin
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
        D <= "00000000001000010000010001111001";
        wait for period*6;
        
        D <= "00000000001000010000001101000100";
        wait; 
    end process;

end Behavioral;
