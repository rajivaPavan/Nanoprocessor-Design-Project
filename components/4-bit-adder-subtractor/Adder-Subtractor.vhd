library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Adder_Subtractor_4 is
    Port(A : in STD_LOGIC_VECTOR (3 downto 0);
         B : in STD_LOGIC_VECTOR (3 downto 0);
         M : in STD_LOGIC;
         S : out STD_LOGIC_VECTOR(3 DOWNTO 0);
         Zero : out STD_LOGIC;
         C_out : out STD_LOGIC);
--  Port ( );
end Adder_Subtractor_4;

architecture Behavioral of Adder_Subtractor_4 is

component RCA4
Port(A : in STD_LOGIC_VECTOR (3 downto 0);
     B : in STD_LOGIC_VECTOR (3 downto 0);
     C_in: in STD_LOGIC;
     S : out STD_LOGIC_VECTOR(3 DOWNTO 0);
     C_out : out STD_LOGIC);

end COMPONENT;

signal MB: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal S_inter: STD_LOGIC_VECTOR(3 DOWNTO 0);

begin

RCA4_0 : RCA4
    port map(
        A => A,
        B => MB,
        C_in => '0',
        S => S_INTER,
        C_out => C_out);
        
  process (S_inter)
      begin
        if S_inter = "0000" then
          Zero <= '1';
        else
          Zero <= '0';
        end if;
      end process;

MB(0) <= B(0) XOR M;
MB(1) <= B(1) XOR M;
MB(2) <= B(2) XOR M;
MB(3) <= B(3) XOR M;

S <= S_inter;

end Behavioral;
