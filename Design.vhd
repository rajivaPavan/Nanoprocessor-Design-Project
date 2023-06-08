library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.buses.data_bus;

entity Design is
    port(
        ClkIn : in std_logic; -- Clock
        ResetIn : in std_logic; -- Reset,
        Overflow: out std_logic; -- Overflow Flag
        Zero: out std_logic; -- Zero Flag
        Display: out std_logic_vector(3 downto 0);
        seg: out std_logic_vector(6 downto 0); -- Seven Segment Display
        led: out std_logic_vector(3 downto 0) -- Result
    );
end Design;

architecture Behavioral of Design is

component Nanoprocessor is
    port(
        Clk : in std_logic; -- Clock
        Res : in std_logic; -- Reset
        Overflow : out std_logic; -- Overflow Flag
        Zero : out std_logic; -- Zero Flag
        Data : out data_bus -- Last Register
    );
end component;

-- Slow clock
component Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

-- Seven Segment Display LUT
component SevenSegmentLUT is
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

-- Slow clock signal to Nanoprocessor
signal Clk : std_logic;
signal ProgramOut : std_logic_vector(3 downto 0);

begin
    -- Slow clock
    SlowClock_inst : Slow_Clk
    port map(
        Clk_in => ClkIn,
        Clk_out => Clk
    );

    -- Nanoprocessor
    Nanoprocessor_inst : Nanoprocessor
    port map(
        Clk => Clk,
        Res => ResetIn,
        Overflow => Overflow,
        Zero => Zero,
        Data => ProgramOut
    );

    -- Seven Segment Display LUT
    SevenSegmentLUT_inst : SevenSegmentLUT
    port map(
        address => ProgramOut,
        data => seg
    );

    Display <= "0111";
    led <= ProgramOut;

end Behavioral;
