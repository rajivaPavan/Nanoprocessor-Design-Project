library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.buses.all; 
use work.buses.instruction_address;



entity Program_ROM is
    port(ROM_address : in instruction_address;
         I: out instruction_bus
         ); 
--  Port ( );
end Program_ROM;

architecture Behavioral of Program_ROM is

type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);

    signal add_1_to_3 : rom_type := (
        "101110000011", --MOVI R7,3 
        "100010000001", --MOVI R1,1 
        "010010000000",  --NEG R1 
        "100100000011", --MOVI R2,3 
        "000100010000", --ADD R2,R1 
        "001110100000",  --ADD R7,R2 
        "110100000110",  --JZR R2,6 
        "110000000100"  -- JZR R0,4 
    );
        
begin
    I <= add_1_to_3(to_integer(unsigned(ROM_address)));
end Behavioral;
