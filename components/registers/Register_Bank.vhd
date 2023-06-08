library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.buses.all;
use work.cpu_components.reg;
use work.Logic_Components.Decoder_3_to_8;

entity Register_Bank is
    Port ( Reg_En : in register_address;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Data : in data_bus;
           Data_Buses : out data_buses);
end Register_Bank;

architecture Behavioral of Register_Bank is

signal EN_inter : STD_LOGIC;
signal Reg_sel : STD_LOGIC_VECTOR(7 downto 0);

begin
    Decoder_3_to_8_0 : Decoder_3_to_8
        port map(
            I => Reg_En,
            EN => '1', -- Always enabled
            Y => Reg_Sel
        );

    -- Read Only Register
    reg_inst0: reg
            generic map(
                N => 4
            )
            port map(
                D => "0000",
                Res => Res,
                EN => '1',
                Clk => Clk,
                Q => Data_Buses(0)
            );

    registers : for i in 1 to 7 generate
       reg_inst: reg
            generic map(
                N => 4
            )
            port map(
                D => Data,
                Res => Res,
                EN => Reg_Sel(i),
                Clk => Clk,
                Q => Data_Buses(i)
            );
    end generate registers;
    
    

end Behavioral;
