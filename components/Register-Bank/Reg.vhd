library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Reg is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           Res: in STD_LOGIC;
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end Reg;


architecture Behavioral of Reg is
component D_FF

    Port ( D : in STD_LOGIC;
       Res : in STD_LOGIC;
       Clk : in STD_LOGIC;
       Q : out STD_LOGIC;
       Qbar : out STD_LOGIC);
end component;

begin
 
D_Flip_Flops: for i in 0 to 3 generate
        D_FF_Inst: D_FF port map(
                D => D(i),
                Res => Res,
                Clk => Clk,
                Q => Q(i)
                ); 
    end generate D_Flip_Flops;
end Behavioral;