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
    process
    begin
        -- case 
        case to_integer(unsigned(Operation_Sel)) is
            when AU_ADD =>
                Adder_Subtractor : Add_Sub_4_bit port map(I1, I2, O, Overflow, Zero, '0');
            when AU_SUB =>
                Adder_Subtractor : Add_Sub_4_bit port map(I1, I2, O, Overflow, Zero, '1');
            when others =>
            -- None;
        end case;
    end process;

end Behavioral;

