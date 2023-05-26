library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.buses.all; 

-- Instruction Decoder
entity IDecoder is
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
end IDecoder;

architecture Behavioral of IDecoder is

signal IEn: std_logic_vector(1 downto 0); -- Instruction Enable
signal RCJ: std_logic_vector(3 downto 0);

-- OP Codes
constant MOVI_OP : std_logic_vector(1 downto 0) := "10";
constant ADD_OP : std_logic_vector(1 downto 0) := "00";
constant NEG_OP : std_logic_vector(1 downto 0) := "01";
constant JZR_OP : std_logic_vector(1 downto 0) := "11";

begin
    IEn <= I(11 downto 10); -- Instruction Bits 11 and 10
    RCJ <= RCJump;
    
    decode: process(IEn, RCJ)
    begin
        case IEn is
            when MOVI_OP => 
                IM <= I(3 downto 0); 
                L <= '1'; 
                REn <= I(9 downto 7);
            when ADD_OP => 
                AS <= '0';
                RSA <= I(9 downto 7);
                RSB <= I(6 downto 4);
                REn <= I(9 downto 7);
                L <= '0';
            when NEG_OP => 
                AS <= '1';
                RSA <= "000";
                RSB <= I(9 downto 7);
                REn <= I(6 downto 4);
                L <= '0';
            when JZR_OP => 
                if RCJ = "0000" then
                    J <= '1';
                end if;
            when others => 
                -- do nothing
        end case;

        JA <= I(2 downto 0);

    end process decode;

end Behavioral;
