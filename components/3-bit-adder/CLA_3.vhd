library ieee;
use ieee.std_logic_1164.all;

entity CLA_3 is
    port (
        A       : in  std_logic_vector(2 downto 0);
        B       : in  std_logic_vector(2 downto 0);
        Cin     : in  std_logic;
        Sum     : out std_logic_vector(2 downto 0);
        Cout    : out std_logic
    );
end CLA_3;

architecture behavioral of CLA_3 is
    signal G, P   : std_logic_vector(2 downto 0); 
    signal C       : std_logic_vector(1 downto 0);

begin
    -- Generate and Propagate signals
    G <= A and B;
    P <= A xor B;

    -- Carry signals
    C(0) <= G(0) or (P(0) and Cin);
    C(1) <= G(1) or (P(1) and G(0)) or (P(1) and P(0) and Cin);


    -- Calculate Sum
    Sum(0) <= P(0) xor Cin;
    Sum(1) <= P(1) xor C(0);
    Sum(2) <= P(2) xor C(1);

    -- Calculate Carry Out
    Cout <= G(2) or (P(2) and G(1)) or (P(2) and P(1) and P(0) and Cin);
end behavioral;
