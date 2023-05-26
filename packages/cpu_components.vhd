library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.buses.all;

package Cpu_Components is

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

    -- PC Incrementer
    component PC_Inc is
        port(
            A_in: in instruction_address;
            A_out: out instruction_address
        );
    end component;

    -- Register Bank
    component Register_Bank is
        Port ( Reg_En : in register_address;
               Res : in STD_LOGIC;
               Clk : in STD_LOGIC;
               Data : in data_bus;
               Data_Buses : out data_buses);
    end component;

    -- Register
    component Reg
    generic(
        N : integer
    );
    Port ( D : in std_logic_vector(N-1 downto 0);
           Res: in STD_LOGIC;
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out std_logic_vector(N-1 downto 0));
    end component;

    
    component Load_Selector is
        port(
            LS : in std_logic; -- Load Select
            IM : in data_bus; -- Immediate Value
            R: in data_bus; -- Register Value
            O: out data_bus -- Output Value
        );
    end component;

    component Address_Selector is
        port(
            PC : in instruction_address; -- Next Program Counter Address
            JA : in instruction_address; -- Jump Address
            J : in std_logic; -- Jump Flag
            A : in instruction_address -- Selected Address
        );
    end component;



end package Cpu_Components;