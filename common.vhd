library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package Common is
    -- Buses
    type buses_8 is array (7 downto 0) of std_logic_vector(3 downto 0);
    
    -- OP Codes
    constant MOVI_OP : std_logic_vector(1 downto 0) := "10";
    constant ADD_OP : std_logic_vector(1 downto 0) := "00";
    constant NEG_OP : std_logic_vector(1 downto 0) := "01";
    constant JZR_OP : std_logic_vector(1 downto 0) := "11";
    constant MOVI: to_integer(unsigned(MOVI_OP));
    constant ADD: to_integer(unsigned(ADD_OP));
    constant NEG: to_integer(unsigned(NEG_OP));
    constant JZR: to_integer(unsigned(JZR_OP));

    -- Clock
    constant clk_period : time := 10 ns;
    constant clk_half_period : time := clk_period / 2;

end package Common;