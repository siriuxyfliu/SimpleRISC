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
    Port ( fa0 : in STD_LOGIC;
           fa1 : in STD_LOGIC;
           fc_in : in STD_LOGIC;
           fsum : out std_logic;
           fc_out : out STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is

begin
    fc_out<= (fa0 and fa1) or (fa0 and fc_in) or (fa1 and fc_in);
    fsum<= ((NOT fc_in) and (fa0 xor fa1)) or (fc_in and (fa0 xnor fa1));
end Behavioral;
