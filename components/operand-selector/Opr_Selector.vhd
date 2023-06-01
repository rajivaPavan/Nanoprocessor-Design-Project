library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.buses.data_bus;
use work.buses.data_buses;
use work.buses.register_address;
use work.logic_components.Mux_8_4;

entity Opr_Selector is
    port (Control : in register_address; -- Control Bits
            -- Data Buses
            Data : in data_buses;
            Selected : out data_bus); -- Output
end Opr_Selector;

architecture Behavioral of Opr_Selector is

begin
    Mux_8_4_0 : Mux_8_4 port map (
        S => Control, 
        D => Data, 
        Y => Selected);
end Behavioral;