
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_8_to_1 is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0); -- Select
           D : in STD_LOGIC_VECTOR (7 downto 0); -- Data
           EN : in STD_LOGIC; -- Enable
           Y : out STD_LOGIC); -- Output
end Mux_8_to_1;

architecture Behavioral of Mux_8_to_1 is
    
component Decoder_3_to_8
    Port(I : in STD_LOGIC_VECTOR(2 downto 0);
            EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0)); 
end component;

SIGNAL Y0, Y1 : STD_LOGIC_VECTOR (7 downto 0);
begin
    Decoder_3_to_8_0 : Decoder_3_to_8 Port Map (
        I => S,
        EN => EN,
        Y => Y0
    );
    
    Y1 <= D AND Y0;
    Y <= Y1(0) OR Y1(1) OR Y1(2) OR Y1(3) OR Y1(4) OR Y1(5) OR Y1(6) OR Y1(7);

end Behavioral;
