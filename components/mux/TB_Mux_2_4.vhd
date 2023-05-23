library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Mux_2_4 is
    -- port();
end TB_Mux_2_4;

architecture Behavioral of TB_Mux_2_4 is
component Mux_2_4 is
    port(
        S: in std_logic; -- Control Bit (0 - A, 1 - B)
        D: in std_logic_vector(7 downto 0); -- Data Buses 
        Y : out std_logic_vector(3 downto 0)
    );
end component;

signal S: std_logic;
signal D: std_logic_vector(7 downto 0);
signal Y: std_logic_vector(3 downto 0);

begin
    uut : Mux_2_4 port map(
        S => S,
        D => D,
        Y => Y
    );

    process
    begin
        -- Selecting last 3 digits of index numbers
        -- 210479L and  210344U using the MUX
        D <= "01000011"; -- 4, 3 in binary
        S <= '0';
        wait for 10 ns;
        S <= '1';
        wait for 10 ns;
        D <= "01110100"; -- 7, 4 in binary
        S <= '0';
        wait for 10 ns;
        S <= '1';
        wait for 10 ns;
        D <= "10010100"; -- 9, 4 in binary
        S <= '0';
        wait for 10 ns;
        S <= '1';
        wait for 10 ns;
        -- Other test case
        D <= "10101010"; -- 10, 10 in binary
        S <= '0';
        wait for 10 ns;
        S <= '1';
        wait for 10 ns;
    end process;

end Behavioral;