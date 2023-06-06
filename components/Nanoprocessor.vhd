library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.buses.all;
use work.cpu_components.all;
use work.ALU_H.all;

entity Nanoprocessor is
    port(
        Clk : in std_logic; -- Clock
        Res : in std_logic; -- Reset
        Overflow : out std_logic; -- Overflow Flag
        Zero : out std_logic; -- Zero Flag
        Data : out data_bus -- Last Register
    );
end Nanoprocessor;

architecture Behavioral of Nanoprocessor is

signal Clock : std_logic; -- Clock
signal Reset : std_logic; -- Reset

signal Next_Address : instruction_address; -- Next Address
signal Current_Address : instruction_address; -- Memory Select
signal Selected_Address : instruction_address; -- Selected Address
signal Jump_Address : instruction_address; -- Jump Address
signal Jump_Flag : std_logic; -- Jump Flag
signal Instruction : instruction_bus; -- Instruction

signal Load_Selection : std_logic; -- Load Selection
signal Immediate_Value : data_bus; -- Immediate Data From Instruction
signal OprASelect : register_address; -- Operand A Select
signal OprBSelect : register_address; -- Operand B Select
signal OprAData : data_bus; -- Operand A Data
signal OprBData : data_bus; -- Operand B Data
signal Operation_Res : data_bus; -- Output of AU
signal Register_Data : data_buses; -- Register Data
signal AddSubSelect : Operation_Sel; -- Add/Subtract Select
signal Register_Enable : register_address; -- Register Enable
signal Selected_Load : data_bus; -- Selected Load

begin
    Clock <= Clk;
    Reset <= Res;

    -- Program Counter
    Program_Counter : PC port map(
        A => Selected_Address, -- From Address Selector
        Clk => Clock,
        Res => Reset,
        M => Current_Address -- Goes to ROM
    );

    -- Program Counter Incrementer
    PC_Incrementer : PC_Inc port map(
        A_in => Current_Address, -- From PC
        A_out => Next_Address -- To Address Selector
    );

    -- Address Selector
    Address_Selector_0 : Address_Selector port map(
        PC => Next_Address, -- From PC Incrementer
        JA => Jump_Address, -- From Instruction Decoder
        J => Jump_Flag, -- From Instruction Decoder
        A => Selected_Address -- To Program Counter
    );

    -- Program ROM
    Program_ROM_0 : Program_ROM port map(
        ROM_address => Current_Address, -- From PC
        I => Instruction -- To Instruction Decoder
    ); 

    -- Instruction Decoder
    Instruction_Decoder : IDecoder port map(
        I => Instruction, -- From Program ROM
        RCJump => OprAData, -- From Operand Selector A
        REN => Register_Enable, -- To Register Bank 
        RSA => OprASelect, -- To Operand Selector A
        RSB => OprBSelect, -- To Operand Selector B
        OpS => AddSubSelect, -- To AU
        IM => Immediate_Value, -- To Load Selector
        J => Jump_Flag, -- To Address Selector
        JA => Jump_Address, -- To Address Selector
        L => Load_Selection -- To Load Selector
    );

    -- Load Selector
    Load_Selector_0 : Load_Selector port map(
        LS => Load_Selection, -- From Instruction Decoder
        IM => Immediate_Value, -- From Instruction Decoder
        R => Operation_Res, -- From AU
        O => Selected_Load -- To Register Bank
    );

    -- Operand Selector (Multiplexer) A
    Opr_Selector_A : Opr_Selector port map(
        Control => OprASelect, -- From Instruction Decoder
        Data => Register_Data, -- From Register Bank
        Selected => OprAData -- To AU
    );

    -- Operand Selector (Multiplexer) B
    Opr_Selector_B : Opr_Selector port map(
        Control => OprBSelect, -- From Instruction Decoder
        Data => Register_Data, -- From Register Bank
        Selected => OprBData -- To AU
    );

    -- Arithmetic Unit
    Arithmetic_Unit_0 : AU port map(
        I1 => OprAData, -- From Operand Selector A
        I2 => OprBData, -- From Operand Selector B
        O => Operation_Res, -- To Load Selector
        Overflow => Overflow, -- To Overflow Flag
        Zero => Zero, -- To Zero Flag
        Operation => AddSubSelect -- From Instruction Decoder
    );

    -- Register Bank
    Register_Bank_0 : Register_Bank port map(
        Reg_EN => Register_Enable, -- From Instruction Decoder
        Res => Reset, -- Reset
        Clk => Clock,
        Data => Selected_Load, -- From Load Selector
        Data_Buses => Register_Data -- To Operand Selectors
    );

    Data <= Register_Data(7); -- Last Register Data
    
end Behavioral;
