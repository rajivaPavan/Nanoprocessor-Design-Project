library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package Adders is

    component RCA_4
        Port(A : in STD_LOGIC_VECTOR (3 downto 0);
            B : in STD_LOGIC_VECTOR (3 downto 0);
            C_in : in STD_LOGIC;
            S : out STD_LOGIC_VECTOR(3 DOWNTO 0);
            C_out : out STD_LOGIC);
    end component;
    
    component RCA_3 is
        Port ( A : in STD_LOGIC_VECTOR(2 DOWNTO 0);
                B: in STD_LOGIC_VECTOR(2 DOWNTO 0);
               C_in : in STD_LOGIC;
               S : out STD_LOGIC_VECTOR(2 DOWNTO 0);
               C_out : out STD_LOGIC);
    end component;
    
        
    component FA
        Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
    end component;
    
    component HA 
    port(
        A: in std_logic;
        B: in std_logic;
        S: out std_logic;
        C: out std_logic);
    end component;


end package Adders;