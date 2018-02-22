----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.02.2018 18:22:10
-- Design Name: 
-- Module Name: full_adder - Behavioral
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

entity full_adder is
    Port ( a0 : in STD_LOGIC;
           a1 : in STD_LOGIC;
           c_in : in STD_LOGIC;
           sum : out std_logic;
           c_out : out STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is

begin
    c_out<= (a0 and a1) or (a0 and c_in) or (a1 and c_in);
    sum<= ((NOT c_in) and (a0 xor a1)) or (c_in and (a0 xnor a1));
end Behavioral;
