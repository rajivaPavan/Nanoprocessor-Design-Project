library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.adders.HA;

entity FA is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end FA;

architecture Behavioral of FA is

SIGNAL HA0_S, HA0_C, HA1_S, HA1_C : STD_LOGIC;

begin
HA_0 : HA
 port map(
    A => A,
    B => B,
    S => HA0_S,
    C => HA0_C);
 
HA_1 : HA
    port map(
        A => HA0_S,
        B => C_in,
        S => HA1_S,
        C => HA1_C);

S <= HA1_S;
C_out <= HA0_C OR HA1_C;

end Behavioral;
