library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Logic_Components.Add_Sub_4_bit;
use work.buses.all;
use work.ALU_H.all;

entity AU is
    Port(
        I1 : in data_bus;
        I2 : in data_bus;
        O : out data_bus;
        Overflow : out std_logic;
        Zero : out std_logic;
        Operation : in Operation_Sel
    );
end AU;

architecture Behavioral of AU is

begin
    

end Behavioral;

