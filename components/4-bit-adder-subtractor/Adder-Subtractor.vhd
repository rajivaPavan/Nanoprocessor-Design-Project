library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Add_Sub_4_bit is
        Port(A_AS : in STD_LOGIC_VECTOR (3 DOWNTO 0);
         B_AS : in STD_LOGIC_VECTOR (3 DOWNTO 0);
         CTRL : in STD_LOGIC;
         S_AS : out STD_LOGIC_VECTOR(3 DOWNTO 0);
         Zero : out STD_LOGIC;
         OverFlow : out STD_LOGIC);
--  Port ( );
end Add_Sub_4_bit;

architecture Behavioral of Add_Sub_4_bit is

COMPONENT RCA_4

    Port(A : in STD_LOGIC_VECTOR (3 downto 0);
         B : in STD_LOGIC_VECTOR (3 downto 0);
         C_in : in STD_LOGIC;
         S : out STD_LOGIC_VECTOR(3 DOWNTO 0);
         C_out : out STD_LOGIC);
END COMPONENT;

SIGNAL B_inter, S_inter: STD_LOGIC_VECTOR(3 DOWNTO 0);

begin
RCA_4_0 : RCA_4
    port map(
        A => A_AS,
        B => B_inter,
        C_in => CTRL,
        S => S_inter,
        C_out => OverFlow);

B_inter(0) <= B_AS(0) XOR CTRL;
B_inter(1) <= B_AS(1) XOR CTRL;
B_inter(2) <= B_AS(2) XOR CTRL;
B_inter(3) <= B_AS(3) XOR CTRL;

process (S_inter)
      begin
        if S_inter = "0000" then
          Zero <= '1';
        else
          Zero <= '0';
        end if;
      end process;
S_AS <= S_inter;

end Behavioral;

