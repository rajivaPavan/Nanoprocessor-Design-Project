library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package Common is
    -- Custom Types
    type buses_8 is array (7 downto 0) of std_logic_vector(3 downto 0);
    type buses_8_4 is array (7 downto 0) of std_logic_vector(3 downto 0); --- 8 buses of 4 bits each
    
    -- Extended Custom Types
    type data_buses is buses_8_4;
    
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

    component PC is
        Port ( A : in STD_LOGIC_VECTOR(2 downto 0);
               Res : in STD_LOGIC;
               Clk : in STD_LOGIC;
               M : out STD_LOGIC_VECTOR(2 downto 0));
    end component;

    component Register_Bank is
        Port ( Reg_En : in STD_LOGIC_VECTOR (2 downto 0);
               Res : in STD_LOGIC;
               Clk : in STD_LOGIC;
               Data : in STD_LOGIC_VECTOR(3 downto 0);
               Data_Buses : out buses_8);
    end component;



end package Common;