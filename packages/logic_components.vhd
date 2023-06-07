library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.buses.buses_8_4;

package Logic_Components is

    -- 4 Bit Adder Subtractor
    component Add_Sub_4_bit is
        Port(A_AS : in STD_LOGIC_VECTOR (3 DOWNTO 0);
         B_AS : in STD_LOGIC_VECTOR (3 DOWNTO 0);
         CTRL : in STD_LOGIC;
         S_AS : out STD_LOGIC_VECTOR(3 DOWNTO 0);
         Zero : out STD_LOGIC;
         OverFlow : out STD_LOGIC);
    end component;
    
     -- 2 way N bit Multiplexer

    component Mux_2_N is 
        generic(
            N : integer
        );
        port(
            S: in std_logic; -- Control Bit (0 - A, 1 - B)
            A: in std_logic_vector(N - 1 downto 0); -- Data Bus
            B: in std_logic_vector(N - 1 downto 0); -- Data Bus 
            O : out std_logic_vector(N-1 downto 0)
        );
    end component;
    
    -- 8 way 4 bit Multiplexer
    component Mux_8_4 is
        port (S : in std_logic_vector (2 downto 0); -- Control Bits
                -- Data Buses
                D : in buses_8_4;
                EN : in std_logic := '1'; -- Enable
                Y : out std_logic_vector(3 downto 0)); -- Output
    end component;
    
    component Decoder_3_to_8 is
        Port (I : in STD_LOGIC_VECTOR(2 downto 0);
            EN : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component Decoder_2_to_4
        Port ( I : in STD_LOGIC_VECTOR (1 downto 0);
                EN: in STD_LOGIC;
               Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    -- D Flip Flop
    component D_FF
        Port ( D : in STD_LOGIC := '0';
            Res : in STD_LOGIC;
            Clk : in STD_LOGIC;
            Q : out STD_LOGIC;
            Qbar : out STD_LOGIC);
    end component;

end package Logic_Components;