library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.buses.data_bus;
use work.logic_components.D_FF;

entity Reg is
    Port ( D : in data_bus;
           Res: in STD_LOGIC;
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out data_bus);
end Reg;

architecture Behavioral of Reg is

begin
 
    D_Flip_Flops: for i in 0 to 3 generate
        D_FF_Inst: D_FF port map(
                D => D(i),
                Res => Res,
                Clk => Clk,
                Q => Q(i)
                ); 
    end generate D_Flip_Flops;
    
end Behavioral;