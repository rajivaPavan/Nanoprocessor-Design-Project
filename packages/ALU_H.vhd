library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Header file for ALU
package ALU_H is

    constant N_Arithemetic_Ops : integer := 2;
    constant N_Logical_Ops : integer := 0;
    constant N_Total_Ops : integer := N_Arithemetic_Ops + N_Logical_Ops;

    function number_of_bits(number : natural) return natural;
    
    subtype Operation_Sel is std_logic_vector(number_of_bits(N_Total_Ops - 1) downto 0);    
    constant AU_ADD_SIGNAL : Operation_Sel := "0";
    constant AU_SUB_SIGNAL : Operation_Sel := "1";
    
end package ALU_H;

package body ALU_H is

    function number_of_bits(number : natural) return natural is
        variable bits : natural := 0;
        variable num : natural := number;
        begin
          while num > 0 loop
              num := num / 2;
            bits := bits + 1;
          end loop;
        
          return bits;
        end function;

end package body ALU_H;