library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.adders.FA;

entity RCA_4 is
Port(A : in STD_LOGIC_VECTOR (3 downto 0);
         B : in STD_LOGIC_VECTOR (3 downto 0);
         C_in : in STD_LOGIC;
         S : out STD_LOGIC_VECTOR(3 DOWNTO 0);
         C_out : out STD_LOGIC);
end RCA_4;

architecture Behavioral of RCA_4 is

signal Carry_Out : STD_LOGIC_VECTOR(3 downto 0);
signal Carry_In : STD_LOGIC_VECTOR(4 downto 0);

begin
    Carry_In(0) <= C_in;
    
    FAs : for i in 0 to 3 generate
        FA_inst : FA 
            port map (
                A => A(i), 
                B => B(i),
                C_in => Carry_In(i),
                S => S(i), 
                C_Out => Carry_Out(i)
            );
            
        last_carry: if i < 3 generate
            Carry_In(i+1) <= Carry_Out(i);            
        end generate last_carry;
        
    end generate FAs;
 
    C_out <= Carry_Out(3);

end Behavioral;
