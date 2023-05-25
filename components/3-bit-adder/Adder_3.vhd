library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder_3 is
    port (
        A       : in  std_logic_vector(2 downto 0);
        B       : in  std_logic_vector(2 downto 0);
        Cin     : in  std_logic;
        Sum     : out std_logic_vector(2 downto 0);
        Cout    : out std_logic
    );
end Adder_3;

architecture Behavioral of Adder_3 is
    component RCA_3 is
        port (
            A       : in  std_logic_vector(2 downto 0);
            B       : in  std_logic_vector(2 downto 0);
            Cin     : in  std_logic;
            Sum     : out std_logic_vector(2 downto 0);
            Cout    : out std_logic
        );
    end component;
    
begin

    Adder: RCA_3
    port map (
            A       => A,
            B       => B,
            Cin     => Cin,
            Sum     => Sum,
            Cout    => Cout
        ); 
    
end Behavioral;
