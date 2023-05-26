library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.logic_components.Decoder_2_to_4;

entity Decoder_3_to_8 is
    Port ( I : in STD_LOGIC_VECTOR(2 downto 0);
            EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end Decoder_3_to_8;

architecture Behavioral of Decoder_3_to_8 is

signal Y0, Y1: STD_LOGIC_VECTOR (3 downto 0);
signal I0, I1: STD_LOGIC_VECTOR (1 downto 0);
signal EN0, EN1, I2 : STD_LOGIC;

begin

    Decoder_2_to_4_0 : Decoder_2_to_4 Port Map (
        I => I0,
        EN => EN0,
        Y => Y0
    );

    Decoder_2_to_4_1 : Decoder_2_to_4 Port Map (
        I => I1,
        EN => EN1,
        Y => Y1
    );

    I0 <= I(1 downto 0);
    I1 <= I(1 downto 0);
    I2 <= I(2);
    EN0 <= NOT I(2) AND EN;
    EN1 <= I(2) AND EN;
    Y(3 downto 0) <= Y0;
    Y(7 downto 4) <= Y1;

    
end Behavioral;
