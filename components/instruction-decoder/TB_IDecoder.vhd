library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.common.all;

entity TB_IDecoder is
    -- port();
end TB_IDecoder;

architecture Behavioral of TB_IDecoder is
component IDecoder is
    port(
        I: in std_logic_vector(11 downto 0); -- Instruction
        RCJump: in std_logic_vector(3 downto 0); -- Register Check for Jump
        REn: out std_logic_vector(2 downto 0); -- Register Enable
        RSA: out std_logic_vector(2 downto 0); -- Register Select A
        RSB: out std_logic_vector(2 downto 0); -- Register Select B
        AS: out std_logic; -- Adder Subtractor Select
        IM: out std_logic_vector(3 downto 0); -- Immediate value
        J:out std_logic; -- Jump flag
        JA: out std_logic_vector(2 downto 0); -- Jump Address,
        L: out std_logic -- Load Select
    );
end component;

signal I: std_logic_vector(11 downto 0);
signal RCJump: std_logic_vector(3 downto 0):="0001";
signal REn: std_logic_vector(2 downto 0);
signal RSA: std_logic_vector(2 downto 0);
signal RSB: std_logic_vector(2 downto 0);
signal AS: std_logic;
signal IM: std_logic_vector(3 downto 0);
signal J: std_logic;
signal JA: std_logic_vector(2 downto 0);
signal L: std_logic; 
signal Clk: std_logic; -- Clock
begin
    UUT: IDecoder port map(
        I => I,
        RCJump => RCJump,
        REn => REn,
        RSA => RSA,
        RSB => RSB,
        AS => AS,
        IM => IM,
        J => J,
        JA => JA,
        L => L
    );

    clock: process
    begin
        Clk <= '0';
        wait for clk_half_period;
        Clk <= '1';
        wait for clk_half_period;
    end process clock;

    stim: process
    begin
        I <= "101010001111"; --MOVI 5, 15
        wait for clk_period;
        I <= "001111000000"; --ADD 7, 4
        wait for clk_period; 
        I <= "011100000000"; -- NEG 6
        wait for clk_period;
        I <= "110110000010"; -- JZR 3, 2
        wait for clk_period;
        RCJump <= "0000";
        I <= "110110000010"; -- JZR 3, 2
        wait for clk_period;
    end process stim;
        
end Behavioral;
