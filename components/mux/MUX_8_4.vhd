library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.common.all;

-- 8 Way 4 Bit Multiplexer
entity Mux_8_4 is
    port (S : in std_logic_vector (2 downto 0); -- Control Bits
            -- Data Buses
            D : in data_buses;
            EN : in std_logic; -- Enable
            Y : out std_logic_vector(3 downto 0)); -- Output
end Mux_8_4;

architecture Behavioral of Mux_8_4 is
    
component Mux_8_to_1 is
    port(S : in std_logic_vector (2 downto 0);
    D : in std_logic_vector (7 downto 0);
    EN : in std_logic;
    Y : out std_logic);
end component;

signal Y1 : std_logic_vector(3 downto 0);
signal Mux_In : buses_4_8;

begin

    multiplexers: for i in 0 to 3 generate
        Mux_In(i) <= D(7)(i) & D(6)(i) & D(5)(i) & D(4)(i) & D(3)(i) & D(2)(i) & D(1)(i) & D(0)(i);
        mux_inst: Mux_8_to_1
            port map (
                S => S,
                D => Mux_In(i),
                En => EN,
                Y  => Y1(i)
                );
    end generate multiplexers;
               
    Y <= Y1;

end Behavioral;
