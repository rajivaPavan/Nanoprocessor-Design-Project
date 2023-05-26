library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package Constants is

    -- Clock
    constant clk_period : time := 10 ns;
    constant clk_half_period : time := clk_period / 2;    

    -- Load Select
    constant Immediate_Load : std_logic := '0';
    constant Register_Load : std_logic := not(Immediate_Load);

end package Constants;