library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 8 Way 4 Bit Multiplexer
entity Mux_8_4 is
    port (S : in std_logic_vector (2 downto 0); -- Control Bits
            -- Data Buses
            D7 : in std_logic_vector(3 downto 0); 
            D6 : in std_logic_vector(3 downto 0);
            D5 : in std_logic_vector(3 downto 0);
            D4 : in std_logic_vector(3 downto 0);
            D3 : in std_logic_vector(3 downto 0);
            D2 : in std_logic_vector(3 downto 0);
            D1 : in std_logic_vector(3 downto 0);
            D0 : in std_logic_vector(3 downto 0);
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
signal D_in_0 : std_logic_vector(7 downto 0);
signal D_in_1 : std_logic_vector(7 downto 0);
signal D_in_2 : std_logic_vector(7 downto 0);
signal D_in_3 : std_logic_vector(7 downto 0);

begin

    D_in_0 <= D7(0) & D6(0) & D5(0) & D4(0) & D3(0) & D2(0) & D1(0) & D0(0);
    mux0: Mux_8_to_1
        port map (
            S => S,
            D => D_in_0,
            En => EN,
            Y  => Y1(0)
        );

    D_in_1 <= D7(1) & D6(1) & D5(1) & D4(1) & D3(1) & D2(1) & D1(1) & D0(1);
    mux1: Mux_8_to_1
        port map (
            S => S,
            D => D_in_1,
            En => EN,
            Y  => Y1(1)
        );
    
    D_in_2 <= D7(2) & D6(2) & D5(2) & D4(2) & D3(2) & D2(2) & D1(2) & D0(2);
    mux2: Mux_8_to_1
        port map (
            S => S,
            D => D_in_2,
            En => EN,
            Y  => Y1(2)
        );

    D_in_3 <= D7(3) & D6(3) & D5(3) & D4(3) & D3(3) & D2(3) & D1(3) & D0(3);
    mux3: Mux_8_to_1
        port map (
            S => S,
            D => D_in_3,
            En => EN,
            Y  => Y1(3)
        ); 
               
    Y <= Y1;

end Behavioral;
