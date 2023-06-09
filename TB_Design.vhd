library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Design is
    -- port();
end TB_Design;

architecture Behavioral of TB_Design is

    component Design is
        port(
            ClkIn : in std_logic; -- Clock
            ResetIn : in std_logic; -- Reset,
            Overflow: out std_logic; -- Overflow Flag
            Zero: out std_logic; -- Zero Flag
            Display: out std_logic_vector(3 downto 0);
            seg: out std_logic_vector(6 downto 0); -- Seven Segment Display
            led: out std_logic_vector(3 downto 0) -- Result
        );
    end component;

    -- internal signals for the ports
    signal ClkIn : std_logic := '0';
    signal ResetIn : std_logic := '0';
    signal Overflow: std_logic;
    signal Zero: std_logic;
    signal Display: std_logic_vector(3 downto 0);
    signal seg: std_logic_vector(6 downto 0);
    signal led: std_logic_vector(3 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Design port map (
        ClkIn => ClkIn,
        ResetIn => ResetIn,
        Overflow => Overflow,
        Zero => Zero,
        Display => Display,
        seg => seg,
        led => led
    );

    -- Clock process definitions
    Clk_process :process
    begin
        ClkIn <= '0';
        wait for 5 ns;
        ClkIn <= '1';
        wait for 5 ns;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- hold reset state for 100 ns.
        ResetIn <= '1';
        wait for 100 ns;
        ResetIn <= '0';
        wait;
    end process;



end Behavioral;
