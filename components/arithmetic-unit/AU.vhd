library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Logic_Components.Add_Sub_4_bit;
use work.buses.all;
use work.ALU_H.all;
use IEEE.NUMERIC_STD.ALL;

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

signal AS_CTRL : std_logic;

begin

    process(Operation)
    begin
        case Operation is
            when AU_ADD_SIGNAL =>
                AS_CTRL <= '0';
            when AU_SUB_SIGNAL =>
                AS_CTRL <= '1';
            when others =>
                -- Do nothing
        end case;
    end process;
    
    Adder_Subtractor : 
        Add_Sub_4_bit port map(
            A_AS => I1,           
            B_AS => I2,           
            CTRL => AS_CTRL,      
            S_AS => O,            
            Zero => Zero,         
            OverFlow => Overflow);

end Behavioral;

