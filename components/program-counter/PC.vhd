library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC is
    Port ( A : in STD_LOGIC_VECTOR(2 downto 0);
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           M : out STD_LOGIC_VECTOR(2 downto 0));
end PC;

architecture Behavioral of PC is

component D_FF
    port (D, Res, Clk : in STD_LOGIC;
    Q, Qbar : out STD_LOGIC);
end component;

begin

    D_FF0 : D_FF port map (
        D => A(0), 
        Res => Res, 
        Clk => Clk, 
        Q => M(0));

    D_FF1 : D_FF port map (
        D => A(1), 
        Res => Res, 
        Clk => Clk, 
        Q => M(1));

    D_FF2 : D_FF port map (
        D => A(2), 
        Res => Res, 
        Clk => Clk, 
        Q => M(2));
    
end Behavioral;