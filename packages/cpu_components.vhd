library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.buses.all;
use work.ALU_H.all;

package Cpu_Components is

    -- Instruction Decoder
    component IDecoder is
        port(
            I: in instruction_bus; -- Instruction
            RCJump: in data_bus; -- Register Check for Jump
            REn: out register_address := "000"; -- Register Enable
            RSA: out register_address := "000"; -- Register Select A
            RSB: out register_address := "000"; -- Register Select B
            OpS: out Operation_Sel; -- Adder Subtractor Select
            IM: out data_bus; -- Immediate value
            J:out std_logic := '0'; -- Jump flag
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
        Port ( Reg_En : in register_address := "000";
               Res : in STD_LOGIC;
               Clk : in STD_LOGIC;
               Data : in data_bus := "0000";
               Data_Buses : out data_buses);
    end component;

    -- Register
    component Reg
    generic(
        N : integer
    );
    Port ( D : in std_logic_vector(N-1 downto 0);
           Res: in STD_LOGIC;
           En : in STD_LOGIC := '0';
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
            J : in std_logic := '0'; -- Jump Flag
            A : out instruction_address -- Selected Address
        );
    end component;

    component Program_ROM is
        port(ROM_address : in instruction_address; -- Memory Select
             I: out instruction_bus);  -- Instruction
    end component;

    component Opr_Selector is
        port (Control : in register_address := "000"; -- Control Bits
                -- Data Buses
                Data : in data_buses;
                Selected : out data_bus); -- Output
    end component;
    
    
    component AU is 
        port(
            I1 : in data_bus := "0000";
            I2 : in data_bus := "0000";
            O : out data_bus;
            Overflow : out std_logic := '0';
            Zero : out std_logic := '0';
            Operation : in Operation_Sel := "0"
        );
    end component;


end package Cpu_Components;