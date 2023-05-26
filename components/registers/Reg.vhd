library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.logic_components.D_FF;

-- Generic N bit Register
entity Reg is
    generic(
        N : integer
    );
    Port ( D : in std_logic_vector(N-1 downto 0);
           Res: in STD_LOGIC;
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out std_logic_vector(N-1 downto 0));
end Reg;

architecture Behavioral of Reg is

begin
 
    D_Flip_Flops: for i in 0 to N-1 generate
        D_FF_Inst: D_FF port map(
                D => D(i),
                Res => Res,
                Clk => Clk,
                Q => Q(i)
                ); 
    end generate D_Flip_Flops;
    
end Behavioral;