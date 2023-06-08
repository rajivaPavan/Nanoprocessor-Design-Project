library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.buses.all; 
use work.constants.all;
use work.ALU_H.all;

-- Instruction Decoder
entity IDecoder is
    port(
        I: in instruction_bus; -- Instruction
        RCJump: in data_bus; -- Register Check for Jump
        REn: out register_address; -- Register Enable
        RSA: out register_address; -- Register Select A
        RSB: out register_address; -- Register Select B
        OpS: out Operation_Sel; -- Operation Select
        IM: out data_bus; -- Immediate value
        J:out std_logic; -- Jump flag
        JA: out instruction_address; -- Jump Address,
        L: out std_logic -- Load Select
    );
end IDecoder;

architecture Behavioral of IDecoder is

signal IEn: std_logic_vector(1 downto 0); -- Instruction Enable
signal RCJ: std_logic_vector(3 downto 0); -- Register Check for Jump
constant Jump : std_logic := '1';
begin
    IEn <= I(11 downto 10); -- Instruction Bits 11 and 10
    RCJ <= RCJump;
    
    decode: process(IEn, RCJ, I)
    begin
        J <= '0';
        case IEn is
            when MOVI_OP => 
                IM <= I(3 downto 0); 
                L <= Immediate_Load; 
                REn <= I(9 downto 7);
            when ADD_OP => 
                OpS <= AU_ADD_SIGNAL;
                RSA <= I(9 downto 7);
                RSB <= I(6 downto 4);
                REn <= I(9 downto 7);
                L <= Register_Load;
            when NEG_OP => 
                OpS <= AU_SUB_SIGNAL;
                RSA <= "000"; -- Zeroth Register
                RSB <= I(9 downto 7);
                REn <= I(9 downto 7);
                L <= Register_Load;
            when JZR_OP => 
                if RCJ = "0000" then
                    J <= Jump;
                    JA <= I(2 downto 0);
                end if;
            when others => 
                -- do nothing
        end case;



    end process decode;

end Behavioral;
