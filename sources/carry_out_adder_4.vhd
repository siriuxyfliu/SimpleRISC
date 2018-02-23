----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.02.2018 14:55:28
-- Design Name: 
-- Module Name: carry_out_adder_4 - Behavioral
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

entity carry_out_adder_4 is
    Port ( a1 : in STD_LOGIC_VECTOR (3 downto 0);
           a0 : in STD_LOGIC_VECTOR (3 downto 0);
           sum : out STD_LOGIC_VECTOR (3 downto 0);
           c_in : in STD_LOGIC;
           c_out : out STD_LOGIC);
end carry_out_adder_4;

architecture Behavioral of carry_out_adder_4 is

begin


end Behavioral;
