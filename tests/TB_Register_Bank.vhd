library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.buses.Data_Buses;

entity TB_Register_Bank is
--  Port ( );
end TB_Register_Bank;

architecture Behavioral of TB_Register_Bank is

COMPONENT Register_Bank
    Port ( Reg_En : in STD_LOGIC_VECTOR (2 downto 0);
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Data : in STD_LOGIC_VECTOR(3 downto 0);
           Data_Buses : out Data_Buses);
END COMPONENT;

signal Reg_En :  STD_LOGIC_VECTOR (2 downto 0);
signal Res,Clk : STD_LOGIC;
signal Data_Buses : Data_Buses;
signal Data: STD_LOGIC_VECTOR(3 downto 0);
constant clk_period : time := 100ns;

begin

uut: Register_Bank
    port map(Reg_En => Reg_En,
             Res => Res,
             Clk => Clk,
             Data => Data,
             Data_Buses => Data_Buses);
    clock: process
    begin
        Clk <= '0';
        wait for clk_period/2;
        Clk <= '1';
        wait for clk_period/2;
    end process;
    
    stim: process
    
    begin
        Res <= '1';
        wait for clk_period;
        Res <= '0';
        Reg_En <= "110";    --Enable Reg 6
        Data <= "0010";      --Put 2 into the Register 6
        wait for clk_period;
        Reg_En <= "111";    --Enable Reg 7
        Data <= "0101";      --Put 5 into the Register 7
        wait for clk_period;
        Reg_En <= "110";    --Enable Reg 6
        Data <= "0111";     --Put 7 into the Register 6
        wait for clk_period;    
        Reg_En <= "111";    --Enable Reg 7
        Res <= '1';        --Reset 
        wait for clk_period;
    end process;       
end Behavioral;
