----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.02.2018 15:11:23
-- Design Name: 
-- Module Name: cpu_a_top - Behavioral
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

entity cpu_a_top is
    Port ( clk_i : in STD_LOGIC);
end cpu_a_top;

architecture Behavioral of cpu_a_top is
    component clock_divider
        port 
        (
           clk_i_cd : in std_logic;
           clk_o : out std_logic;
           rst : in std_logic
        );
    end component;
    signal clk_i_cd : std_logic;
    signal clk_o_cd : std_logic;
    signal rst_cd : std_logic;
begin
    clk_i_cd<=clk_i;
    i_clock_divider : clock_divider
    port map 
    (
        clk_i_cd => clk_i_cd,
        clk_o => clk_o_cd,
        rst=>rst_cd
    );
        

end Behavioral;
