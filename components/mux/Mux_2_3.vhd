library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.logic_components.Mux_2_N;

entity Mux_2_3 is
    port(
        S: in std_logic; -- Control Bit (0 - A, 1 - B)
        D: in std_logic_vector(5 downto 0); -- Data Buses 
        Y : out std_logic_vector(2 downto 0)
    );
end Mux_2_3;

architecture Behavioral of Mux_2_3 is

begin 
    Mux_2_3_0: Mux_2_N
    generic map(
        N => 3
    )
    port map(
        S => S,
        D => D,
        Y => Y
    );
end Behavioral;