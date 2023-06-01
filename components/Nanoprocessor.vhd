library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.buses.all;
use work.cpu_components.all;

entity Nanoprocessor is
    port(
        Clk : in std_logic; -- Clock
        Res : in std_logic; -- Reset
        Overflow : in std_logic; -- Overflow Flag
        Zero : out std_logic; -- Zero Flag
        Data : out std_logic_vector(7 downto 0) -- Last Register
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

begin
    Clock <= Clk;
    Reset <= Reset;

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
        
    );


    
end Behavioral;
