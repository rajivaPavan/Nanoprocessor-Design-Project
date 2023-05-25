library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Mux_8_4 is
    -- port();
end TB_Mux_8_4;

architecture Behavioral of TB_Mux_8_4 is
component Mux_8_4 is
    port (S : in std_logic_vector (2 downto 0); -- Control Bits
            -- Data Buses
            D7 : in std_logic_vector(3 downto 0); 
            D6 : in std_logic_vector(3 downto 0);
            D5 : in std_logic_vector(3 downto 0);
            D4 : in std_logic_vector(3 downto 0);
            D3 : in std_logic_vector(3 downto 0);
            D2 : in std_logic_vector(3 downto 0);
            D1 : in std_logic_vector(3 downto 0);
            D0 : in std_logic_vector(3 downto 0);
            EN : in std_logic; -- Enable
            Y : out std_logic_vector(3 downto 0)); -- Output
end component;

signal S : std_logic_vector(2 downto 0);
signal D7 : std_logic_vector(3 downto 0); 
signal D6 : std_logic_vector(3 downto 0);
signal D5 : std_logic_vector(3 downto 0);
signal D4 : std_logic_vector(3 downto 0);
signal D3 : std_logic_vector(3 downto 0);
signal D2 : std_logic_vector(3 downto 0);
signal D1 : std_logic_vector(3 downto 0);
signal D0 : std_logic_vector(3 downto 0);

signal Y : std_logic_vector(3 downto 0);
signal EN : std_logic := '1';
constant period : time := 10 ns;

begin
    uut: Mux_8_4 port map (
        S => S, 
        D7 => D7,
        D6 => D6, 
        D5 => D5, 
        D4 => D4, 
        D3 => D3,
        D2 => D2,
        D1 => D1,
        D0 => D0,
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
        D7 <= "0000"; D6 <= "0000";
        D5 <= "0010"; D4 <= "0001";
        D3 <= "0000"; 
        
        -- 479
        D2 <= "0100";
        D1 <= "0111"; D0 <= "1001";
        wait for period*8;
        
        -- 344
        D2 <= "0011";
        D1 <= "0100"; D0 <= "0100";
        wait; 
    end process;

end Behavioral;