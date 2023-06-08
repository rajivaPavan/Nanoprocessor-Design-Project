library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SevenSegmentLUT is
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end SevenSegmentLUT;

architecture Behavioral of SevenSegmentLUT is

type rom_type is array (0 to 15) of std_logic_vector(6 downto 0);
    
    signal sevenSegment_ROM : rom_type := (
                "0000001", --0
                "1001111", --1
                "0010010", --2
                "0000110", --3
                "1001100", --4
                "0100100", --5
                "0100000", --6
                "0001111",--7
                "0000000", --8
                "0000100", --9
                "0001000", --A
                "1100000", --B
                "0110001", --C
                "1000010", --D
                "0110000", --E
                "0111000"  --F
);            

begin

data <= sevenSegment_ROM(to_integer(unsigned(address)));

end Behavioral;
