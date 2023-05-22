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
    M : in STD_LOGIC_VECTOR(2 downto 0));;
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
        R <= '0';
        wait for clk_period/2;
        Clk <= '0';
        A <= "000";
        wait for clk_period/2;
        Clk <= '1';
        A <= "001";
        wait for clk_period/2;
        Clk <= '0';
        A <= "010";
        wait for clk_period/2;
        Clk <= '1';
        A <= "011";
        wait for clk_period/2;
        Clk <= '0';
        A <= "100";
        wait for clk_period/2;
    end process;
    
    stim_proc: process
    begin
        wait for 5 ns; -- wait for intialization
        wait for 10 ns; --Stimulate for 100 ns then stop
        wait;
    end process;

    
end Behavioral;