library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Add_Sub_4_bit is
--  Port ( );
end TB_Add_Sub_4_bit;

architecture Behavioral of TB_Add_Sub_4_bit is

COMPONENT Add_Sub_4_bit
    Port(A_AS : in STD_LOGIC_VECTOR (3 DOWNTO 0);
         B_AS : in STD_LOGIC_VECTOR (3 DOWNTO 0);
         CTRL : in STD_LOGIC;
         S_AS : out STD_LOGIC_VECTOR(3 DOWNTO 0);
         C_out : out STD_LOGIC);
END COMPONENT;
signal A, B, S : STD_LOGIC_VECTOR(3 DOWNTO 0);
signal CTRL, C_out : STD_LOGIC;

begin

uut : Add_Sub_4_bit
    port map(
        A_AS => A,
        B_AS => B,
        CTRL => CTRL,
        S_AS => S,
        C_out => C_out);

process
begin
    A <= "0100";
    wait for 40 ns; 
    B <= "0010";
    wait for 40 ns;
    CTRL <= '0' ;
    wait for 40 ns;
    A <= "0100";
    wait for 40 ns; 
    B <= "0010";
    wait for 40 ns;
    CTRL <= '1';
    wait for 40 ns;
end process;
        
    
end Behavioral;
