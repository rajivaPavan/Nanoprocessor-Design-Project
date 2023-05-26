library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package Buses is

    -- Busesly used buses
    subtype bus_3 is std_logic_vector(2 downto 0); -- 3 bit bus
    subtype bus_4 is std_logic_vector(3 downto 0); -- 4 bit bus
    subtype bus_8 is std_logic_vector(7 downto 0); -- 8 bit bus
    subtype bus_12 is std_logic_vector(11 downto 0); -- 12 bit bus

    -- Array of buses
    type buses_8_4 is array (7 downto 0) of bus_4; -- 8 buses of 4 bits each
    type buses_4_8 is array (3 downto 0) of bus_8; -- 4 buses of 8 bits each 
    
    -- Extended Custom Buses
    subtype data_buses is buses_8_4;
    subtype instruction_address is bus_3;
    subtype instruction_bus is bus_12;
    subtype data_bus is bus_4;
    subtype register_address is bus_3;

end package Buses;