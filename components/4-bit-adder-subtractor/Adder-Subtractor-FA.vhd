----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/22/2023 06:52:28 PM
-- Design Name: 
-- Module Name: Adder_Subtractor_4 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder_Subtractor_4 is
    Port(A : in STD_LOGIC_VECTOR (3 downto 0);
         B : in STD_LOGIC_VECTOR (3 downto 0);
         C_in : in STD_LOGIC;
         M : in STD_LOGIC;
         S : out STD_LOGIC_VECTOR(3 DOWNTO 0);
         C_out : out STD_LOGIC);
--  Port ( );
end Adder_Subtractor_4;

architecture Behavioral of Adder_Subtractor_4 is

component FA
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end component;

signal MB: STD_LOGIC_VECTOR(3 DOWNTO 0);
signal FA0_C, FA1_C, FA2_C : STD_LOGIC;

begin
     FA_0 : FA 
        port map ( 
        A => A(0), 
        B => MB(0), 
        C_in => '0', 
        S => S(0), 
        C_Out => FA0_C); 

FA_1 : FA
 
    port map ( 
        A => A(1), 
        B => MB(1), 
        C_in => FA0_C, 
        S => S(1), 
        C_Out => FA1_C);

FA_2 : FA 
    port map ( 
        A => A(2), 
        B => MB(2), 
        C_in => FA1_C, 
        S => S(2), 
        C_Out => FA2_C);
 
FA_3 : FA 
    port map ( 
        A => A(3), 
        B => MB(3), 
        C_in => FA2_C, 
        S => S(3), 
        C_Out => C_out); 

MB(0) <= B(0) XOR M;
MB(1) <= B(1) XOR M;
MB(2) <= B(2) XOR M;
MB(3) <= B(3) XOR M;

end Behavioral;
