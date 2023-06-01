library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Header file for ALU
package ALU_H is

    constant N_Arithemetic_Ops : integer := 2;
    constant N_Logical_Ops : integer := 0;
    constant N_Total_Ops : integer := N_Arithemetic_Ops + N_Logical_Ops;
    
    subtype Operation_Sel is std_logic_vector(0 downto 0);    
    constant AU_ADD_SIGNAL : Operation_Sel := "0";
    constant AU_SUB_SIGNAL : Operation_Sel := "1";
    constant AU_ADD : integer := to_integer(unsigned(AU_ADD_SIGNAL));
    constant AU_SUB : integer := to_integer(unsigned(AU_SUB_SIGNAL));
    
end package ALU_H;