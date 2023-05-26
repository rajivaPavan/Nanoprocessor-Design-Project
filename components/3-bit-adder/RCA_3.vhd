library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.adders.FA;

entity RCA_3 is
    Port ( A : in STD_LOGIC_VECTOR(2 DOWNTO 0);
            B: in STD_LOGIC_VECTOR(2 DOWNTO 0);
           C_in : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR(2 DOWNTO 0);
           C_out : out STD_LOGIC);
end RCA_3;

architecture Behavioral of RCA_3 is

    constant N : integer := 3;
    signal Carry_Out : STD_LOGIC_VECTOR(N-1 downto 0);
    signal Carry_In : STD_LOGIC_VECTOR(N-1 downto 0);
    
    begin
        Carry_In(0) <= C_in;
        
        FAs : for i in 0 to N-1 generate
            FA_inst : FA 
                port map (
                    A => A(i), 
                    B => B(i),
                    C_in => Carry_In(i),
                    S => S(i), 
                    C_Out => Carry_Out(i)
                );
                
            last_carry: if i < N-1 generate
                Carry_In(i+1) <= Carry_Out(i);            
            end generate last_carry;
            
        end generate FAs;
     
        C_out <= Carry_Out(N-1);
    
    end Behavioral;