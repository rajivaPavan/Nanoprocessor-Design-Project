library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Mux_2_N is
    generic(
        N : integer
    );
    port(
        S: in std_logic; -- Control Bit (0 - A, 1 - B)
        D: in std_logic_vector(2*N - 1 downto 0); -- Data Buses 
        Y : out std_logic_vector(N-1 downto 0)
    );
end Mux_2_N;

architecture Behavioral of Mux_2_N is

signal Y1: std_logic_vector(N-1 downto 0); 

begin 
    
    Mux_Out: for i in 0 to N-1 generate
        Y1(i) <=  (D(i) and S) or (D(i+N) and (not(S))); 
    end generate Mux_Out;

    Y <= Y1;
    
end Behavioral;