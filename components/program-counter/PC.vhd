library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.buses.instruction_address;
use work.logic_components.D_FF;

entity PC is
    Port ( A : in instruction_address;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           M : out instruction_address);
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