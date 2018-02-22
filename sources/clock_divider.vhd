----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.02.2018 22:02:00
-- Design Name: 
-- Module Name: clock_divider - Behavioral
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
use ieee.numeric_std.all;  
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_divider is
    Port ( clk_i_cd : in STD_LOGIC;
           clk_o : out STD_LOGIC;
           rst: in STD_LOGIC);
end clock_divider;

architecture Behavioral of clock_divider is
    signal clk_1: std_logic:='0';
    signal cnt1 : std_logic_vector (2 downto 0):="000";
    signal bcnt : std_logic_vector (3 downto 0):="0000";
    signal gcnt : std_logic_vector (3 downto 0):="0000";
    signal step_p: std_logic_vector (1 downto 0):="00";
    signal step_n: std_logic_vector (1 downto 0):="00";
    signal step5_p :std_logic_vector (2 downto 0):="000";
    signal step5_n :std_logic_vector (2 downto 0):="000";
begin
    clk_o<= (step5_p(2) AND (NOT step5_p(1)) AND (NOT step5_p(0))) or ((NOT step5_p(2)) AND step5_p(1) AND step5_p(0))
         or (step5_n(2) AND (NOT step5_n(1)) AND (NOT step5_n(0))) or ((NOT step5_n(2)) AND step5_n(1) AND step5_n(0));
    process (clk_i_cd,rst)
    begin
        if rising_edge(clk_i_cd) then
            if(rst='1') then
                step5_p<="000";
            else
                case step5_p is 
                    when "000"=> 
                        step5_p<="001";
                    when "001"=> 
                        step5_p<="010";
                    when "010"=> 
                        step5_p<="011";
                    when "011"=> 
                        step5_p<="100";
                    when others =>
                        step5_p<="000";
                end case;
            end if;
        end if;
    end process;
    process (clk_i_cd,rst)
    begin
        if falling_edge(clk_i_cd) then
            if(rst='1') then
                step5_n<="000";
            elsif (step5_p="000") then
                step5_n<="000";
            else
                case step5_n is 
                    when "000"=> 
                        step5_n<="001";
                    when "001"=> 
                        step5_n<="010";
                    when "010"=> 
                        step5_n<="011";
                    when "011"=> 
                        step5_n<="100";
                    when others =>
                        step5_n<="000";
                end case;
            end if;
        end if;
    end process;

   
   
    process (clk_i_cd,rst)
    begin
        if rst='1' then
            step_p<="00";
        elsif rising_edge(clk_i_cd) then
            case step_p is 
                when "00"=> 
                    step_p<="01";
                when "01"=> 
                    step_p<="10";
                when "10"=> 
                    step_p<="00";
                when others =>
                    step_p<="00";
            end case;
        end if;
    end process;

    process (clk_i_cd)
    begin
        if falling_edge(clk_i_cd) then
            case step_n is 
                when "00"=> 
                    step_n<="01";
                when "01"=> 
                    step_n<="10";
                when "10"=> 
                    step_n<="00";
                when others =>
                    step_n<="00";
            end case;
        end if;
    end process;
 --   clk_o<= step_n(1) or step_p(1);

    --Gray code
    process (clk_i_cd)
    begin
        if rising_edge(clk_i_cd) then
            bcnt<=bcnt+1;
            gcnt<= (bcnt(3),bcnt(3) xor bcnt(2),bcnt(2) xor bcnt(1),bcnt(1) xor bcnt(0));
        end if;
    end process;



    process (clk_i_cd)
    begin
        if falling_edge(clk_i_cd) then
            --cnt1<="001";
            if cnt1 = "010" then
                cnt1<="000";
            else
                cnt1<=cnt1+"001";
            end if;
        end if;
    end process;
    process (clk_i_cd)
    begin
        if rising_edge(clk_i_cd) then
            if cnt1 = "010" then
                clk_1<= NOT clk_1;
            end if;
        end if;
     end process; 
end Behavioral;
