library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.COMMON.all;

entity Register_Bank is
    Port ( Reg_En : in register_address;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Data : in data_bus;
           Data_Buses : out data_buses);
end Register_Bank;

architecture Behavioral of Register_Bank is

COMPONENT Reg
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           Res: in STD_LOGIC;
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;

COMPONENT Decoder_3_to_8

    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR(7 downto 0));
               
END COMPONENT;
signal EN_inter : STD_LOGIC;
signal Reg_sel : STD_LOGIC_VECTOR(7 downto 0);


begin

    registers : for i in 0 to 7 generate
       reg_inst: reg
            port map(
                D => Data,
                Res => Res,
                EN => Reg_Sel(i),
                Clk => Clk,
                Q => Data_Buses(i)
            );
    end generate registers;
    Decoder_3_to_8_0 : Decoder_3_to_8
        port map(
            I => Reg_En,
            EN => '1', -- Always enabled
            Y => Reg_Sel
            );

end Behavioral;
