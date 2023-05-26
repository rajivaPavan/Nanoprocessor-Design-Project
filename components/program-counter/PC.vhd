library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.buses.instruction_address;
use work.Cpu_Components.Reg;

entity PC is
    Port ( A : in instruction_address;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           M : out instruction_address);
end PC;

architecture Behavioral of PC is

begin

    -- 3 bit register 
    Reg_0 : Reg
        generic map (N => 3)
        port map(
                D => A,
                Res => Res,
                EN => '1',
                Clk => Clk,
                Q => M
            );

    
end Behavioral;