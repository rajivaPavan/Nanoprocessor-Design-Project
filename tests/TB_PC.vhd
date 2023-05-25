-- Test Bench for Program Counter
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_PC is
    -- Port();
end TB_PC;

architecture Behavioral of TB_PC is

component PC is
    port ( A : in STD_LOGIC_VECTOR(2 downto 0);
    Res : in STD_LOGIC;
    Clk : in STD_LOGIC;
    M : out STD_LOGIC_VECTOR(2 downto 0));
end component;

signal A : STD_LOGIC_VECTOR(2 downto 0);
signal Res : STD_LOGIC;
signal Clk : STD_LOGIC;
signal M : STD_LOGIC_VECTOR(2 downto 0);

constant clk_period : time := 10 ns; --Clock period 10 ns

begin

    uut : PC port map (
        A => A, 
        Res => Res, 
        Clk => Clk, 
        M => M);

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
        wait for clk_period/2;
        Res <= '0';
        A <= "010"; -- 2
        wait for clk_period;
        A <= "001"; -- 1
        wait for clk_period;
        A <= "000"; -- 0
        wait for clk_period;
        A <= "100"; -- 4
        wait for clk_period;
        A <= "111"; -- 7
        wait for clk_period;
        Res <= '1';
        wait;
    end process;
end Behavioral;