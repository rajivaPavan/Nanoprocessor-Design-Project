library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.buses.all;
use work.logic_components.Mux_2_N;

entity Address_Selector is
    port(
        PC : in instruction_address; -- Next Program Counter Address
        JA : in instruction_address; -- Jump Address
        J : in std_logic; -- Jump Flag
        A : out instruction_address -- Selected Address
    );
end Address_Selector;

architecture Behavioral of Address_Selector is

begin

    Mux_2_3: Mux_2_N
    generic map(
        N => 3
    )
    port map(
        S => J,
        A => PC,
        B => JA,
        O => A
    );

end Behavioral;
