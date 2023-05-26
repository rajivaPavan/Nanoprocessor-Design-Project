library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.buses.data_bus;
use work.logic_components.Mux_2_N;
use work.constants.Immediate_Load;

entity Load_Selector is
    port(
        LS : in std_logic; -- Load Select
        IM : in data_bus; -- Immediate Value
        R: in data_bus; -- Register Value
        O: out data_bus -- Output Value
    );
end Load_Selector;

architecture Behavioral of Load_Selector is
signal A, B : data_bus;

begin
    
    IM_LOAD : if '0' = Immediate_Load generate
            A <= IM;
            B <= R;
    end generate IM_LOAD;
    
    REG_LOAD : if '1' = Immediate_Load generate
            A <= R;
            B <= IM;
    end generate REG_LOAD;

    Mux_2_4: Mux_2_N
    generic map(
        N => 4
    )
    port map(
        S => LS,
        A => A,
        B => B,
        O => O
    );

end Behavioral;
