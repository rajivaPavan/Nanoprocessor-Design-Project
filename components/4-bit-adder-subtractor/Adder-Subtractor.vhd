library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Adder_Sub_4_bit is
    Port(A_AS : in STD_LOGIC_VECTOR (3 DOWNTO 0);
         B_AS : in STD_LOGIC_VECTOR (3 DOWNTO 0);
         CTRL : in STD_LOGIC;
         S : out STD_LOGIC_VECTOR(3 DOWNTO 0);
         C_out : out STD_LOGIC);
--  Port ( );
end Adder_Sub_4_bit;

architecture Behavioral of Adder_Sub_4_bit is

COMPONENT RCA_4
    Port ( A0 : in STD_LOGIC;
       A1 : in STD_LOGIC;
       A2 : in STD_LOGIC;
       A3 : in STD_LOGIC;
       B0 : in STD_LOGIC;
       B1 : in STD_LOGIC;
       B2 : in STD_LOGIC;
       B3 : in STD_LOGIC;
       C_in : in STD_LOGIC;
       S0 : out STD_LOGIC;
       S1 : out STD_LOGIC;
       S2 : out STD_LOGIC;
       S3 : out STD_LOGIC;
       C_out : out STD_LOGIC);
--  Port ( );
END COMPONENT;

signal B_inter: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal S_inter: STD_LOGIC_VECTOR(3 DOWNTO 0);

begin



RCA_4_0 : RCA_4
    port map(
        A0 => A_AS(0),
        A1 => A_AS(0),
        A2 => A_AS(0),
        A3 => A_AS(0),
        B0 => B_inter(0),
        B1 => B_inter(1),
        B2 => B_inter(2),
        B3 => B_inter(3),
        C_in => CTRL,
        S0 => S(0),
        S1 => S(1),
        S2 => S(2),
        S3 => S(3),
        C_out => C_out);
        
B_inter(0) <= B_AS(0) XOR CTRL;
B_inter(1) <= B_AS(1) XOR CTRL;
B_inter(2) <= B_AS(2) XOR CTRL;
B_inter(3) <= B_AS(3) XOR CTRL;

S <= S_inter;

end Behavioral;
