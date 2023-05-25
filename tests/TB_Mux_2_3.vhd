library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Mux_2_3 is
    -- port();
end TB_Mux_2_3;

architecture Behavioral of TB_Mux_2_3 is

component Mux_2_3 is
    port(
        S: in std_logic; -- Control Bit (0 - A, 1 - B)
        D: in std_logic_vector(5 downto 0); -- Data Buses 
        Y : out std_logic_vector(2 downto 0)
    );
end component;

signal S: std_logic;
signal D: std_logic_vector(5 downto 0);
signal Y: std_logic_vector(2 downto 0);

begin

    uut: Mux_2_3 port map(
        S => S,
        D => D,
        Y => Y
    );

    process
    begin
        -- -- Selecting 1 digit from a pair of digits in the index numbers
        -- 210479L and  210344U using the MUX
        D <= "100011"; -- 4, 3
        S <= '0';
        wait for 10 ns;
        S <= '1';
        wait for 10 ns;
        D <= "111100"; -- 7, 4
        S <= '0';
        wait for 10 ns;
        S <= '1';
        wait for 10 ns;
    end process;    

end Behavioral;