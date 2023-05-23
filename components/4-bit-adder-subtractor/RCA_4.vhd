library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity RCA_4 is
Port(A : in STD_LOGIC_VECTOR (3 downto 0);
         B : in STD_LOGIC_VECTOR (3 downto 0);
         C_in : in STD_LOGIC;
         S : out STD_LOGIC_VECTOR(3 DOWNTO 0);
         C_out : out STD_LOGIC);
--  Port ( );
end RCA_4;

architecture Behavioral of RCA_4 is

component FA
    Port ( A : in STD_LOGIC;
       B : in STD_LOGIC;
       C_in : in STD_LOGIC;
       S : out STD_LOGIC;
       C_out : out STD_LOGIC);
end component;
     
signal FA0_C, FA1_C, FA2_C : STD_LOGIC;

begin

 FA_0 : FA 
    port map (
    A => A(0), 
    B => B(0),
    C_in => C_in,
    S => S(0), 
    C_Out => FA0_C); 

FA_1 : FA
 
    port map ( 
        A => A(1), 
        B => B(1), 
        C_in => FA0_C, 
        S => S(1), 
        C_out => FA1_C);

FA_2 : FA 
    port map ( 
        A => A(2), 
        B => B(2), 
        C_in => FA1_C, 
        S => S(2), 
        C_out => FA2_C);
 
FA_3 : FA 
    port map ( 
        A => A(3), 
        B => B(3), 
        C_in => FA2_C, 
        S => S(3), 
        C_out => C_out); 

end Behavioral;
