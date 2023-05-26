library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.adders.RCA_3;
use work.buses.instruction_address;

entity PC_Inc is
    port(
        A_in: in instruction_address;
        A_out: out instruction_address
    );
end PC_Inc;

architecture Behavioral of PC_Inc is

begin

    Add: RCA_3 port map(
        A => A_in,
        B => "001",
        C_in => '0',
        S => A_out
    );

end Behavioral;
