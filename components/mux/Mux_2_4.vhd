library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Mux_2_4 is
    port(
        S: in std_logic; -- Control Bit (0 - A, 1 - B)
        D: in std_logic_vector(7 downto 0); -- Data Buses 
        Y : out std_logic_vector(3 downto 0)
    );
end Mux_2_4;

architecture Behavioral of Mux_2_4 is
component Mux_2_N is 
    generic(
        N : integer
    );
    port(
        S: in std_logic; -- Control Bit (0 - A, 1 - B)
        D: in std_logic_vector(2*N - 1 downto 0); -- Data Buses 
        Y : out std_logic_vector(N-1 downto 0)
    );
end component;

begin 
    Mux_2_4_0: Mux_2_N
    generic map(
        N => 4
    )
    port map(
        S => S,
        D => D,
        Y => Y
    );
end Behavioral;