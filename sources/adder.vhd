----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.02.2018 16:15:47
-- Design Name: 
-- Module Name: adder - Behavioral
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

entity adder is
    Port ( clk_i : in STD_LOGIC;
           rst : in std_logic;
           a1 : in STD_LOGIC_VECTOR (31 downto 0);
           a2 : in STD_LOGIC_VECTOR (31 downto 0);
           s1 : out STD_LOGIC_VECTOR (31 downto 0));
end adder;

architecture Behavioral of adder is
   signal step : std_logic_vector (3 downto 0); 
   signal carry : std_logic_vector (31 downto 0); 
begin
    process (clk_i)
    begin
        if rising_edge(clk_i) then
            if rst='1' then
                step <= "0000";
                s1<=(others=>'0');     
                carry<=(others=>'0');
            else
                if step="0000" then
                    carry<=
                else
                -- s1(0) <= a1(0) xor a1(0); 
                --s1(1) <= a1(0) and a2(0); 
                s1<=(a1(0) and a2(0),a1(0) xor a2(0),others=>'0');
            
            
            end if;
        end if;
    end process;

end Behavioral;
