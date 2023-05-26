library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package Common is

    ---- Custom Types -----------------
    -- Commonly used buses
    subtype bus_3 is std_logic_vector(2 downto 0); -- 3 bit bus
    subtype bus_4 is std_logic_vector(3 downto 0); -- 4 bit bus
    subtype bus_8 is std_logic_vector(7 downto 0); -- 8 bit bus
    subtype bus_12 is std_logic_vector(11 downto 0); -- 12 bit bus

    -- Array of buses
    type buses_8_4 is array (7 downto 0) of bus_4; -- 8 buses of 4 bits each
    type buses_4_8 is array (3 downto 0) of bus_8; -- 4 buses of 8 bits each 
    
    -- Extended Custom Types
    subtype data_buses is buses_8_4;
    subtype instruction_address is bus_3;
    subtype instruction_bus is bus_12;
    subtype data_bus is bus_4;
    subtype register_address is bus_3;

    -- OP Codes
    constant MOVI_OP : std_logic_vector(1 downto 0) := "10";
    constant ADD_OP : std_logic_vector(1 downto 0) := "00";
    constant NEG_OP : std_logic_vector(1 downto 0) := "01";
    constant JZR_OP : std_logic_vector(1 downto 0) := "11";
    constant MOVI: integer := to_integer(unsigned(MOVI_OP));
    constant ADD:  integer := to_integer(unsigned(ADD_OP));
    constant NEG:  integer := to_integer(unsigned(NEG_OP));
    constant JZR:  integer := to_integer(unsigned(JZR_OP));

    -- Clock
    constant clk_period : time := 10 ns;
    constant clk_half_period : time := clk_period / 2;

    ------- Nanoprocessor Component Declarations ------------

    -- 3 Bit Adder
    component Adder_3 is
        port (
            A       : in  std_logic_vector(2 downto 0);
            B       : in  std_logic_vector(2 downto 0);
            Cin     : in  std_logic;
            Sum     : out std_logic_vector(2 downto 0);
            Cout    : out std_logic
        );
    end component;

    -- 4 Bit Adder Subtractor
    component Add_Sub_4_bit is
        Port(A_AS : in STD_LOGIC_VECTOR (3 DOWNTO 0);
         B_AS : in STD_LOGIC_VECTOR (3 DOWNTO 0);
         CTRL : in STD_LOGIC;
         S_AS : out STD_LOGIC_VECTOR(3 DOWNTO 0);
         Zero : out STD_LOGIC;
         OverFlow : out STD_LOGIC);
    end component;


    -- Instruction Decoder
    component IDecoder is
        port(
            I: in instruction_bus; -- Instruction
            RCJump: in data_bus; -- Register Check for Jump
            REn: out register_address; -- Register Enable
            RSA: out register_address; -- Register Select A
            RSB: out register_address; -- Register Select B
            AS: out std_logic; -- Adder Subtractor Select
            IM: out data_bus; -- Immediate value
            J:out std_logic; -- Jump flag
            JA: out instruction_address; -- Jump Address,
            L: out std_logic -- Load Select
        );
    end component;

    -- Program Counter
    component PC is
        Port ( A : in instruction_address;
               Res : in STD_LOGIC;
               Clk : in STD_LOGIC;
               M : out instruction_address);
    end component;

    -- Register Bank
    component Register_Bank is
        Port ( Reg_En : in register_address;
               Res : in STD_LOGIC;
               Clk : in STD_LOGIC;
               Data : in data_bus;
               Data_Buses : out data_buses);
    end component;
    
    -- 8 way 4 bit Multiplexer
    component Mux_8_4 is
        port (S : in std_logic_vector (2 downto 0); -- Control Bits
                -- Data Buses
                D : in buses_8_4;
                EN : in std_logic; -- Enable
                Y : out std_logic_vector(3 downto 0)); -- Output
    end component;

end package Common;