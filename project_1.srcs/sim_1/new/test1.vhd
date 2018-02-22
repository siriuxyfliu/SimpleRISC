----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.02.2018 22:48:49
-- Design Name: 
-- Module Name: test1 - Behavioral
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

entity test1 is
--  Port ( );
end test1;

architecture Behavioral of test1 is
    component clock_divider
        port (
            clk_i_cd : in std_logic;
            clk_o : out std_logic;
            rst: in std_logic
        );
    end component;
    component cpu_a_top
    port(
        clk_i : in std_logic
    );
    end component;
    component adder
    Port 
    ( 
        clk_i : in STD_LOGIC;
        a1 : in STD_LOGIC_VECTOR (31 downto 0);
        a2 : in STD_LOGIC_VECTOR (31 downto 0);
        s1 : out STD_LOGIC_VECTOR (31 downto 0)
    );
    end component;
    signal ai1 : std_logic_vector (31 downto 0):=(others => '0');
    signal ai2 : std_logic_vector (31 downto 0):=(others => '0');
    signal so1 : std_logic_vector (31 downto 0):=(others => '0');
    signal clk_t : std_logic:='0';
    signal clk_r : std_logic;
    signal rst_t : std_logic:='0';
    constant period : time := 10 ns;
    
begin
    aut : adder
    port map 
    (
        clk_i=>clk_t,
        a1=>ai1,
        a2=>ai2,
        s1=>so1
    );
    
    process is
    begin
        wait for 10ns;
        ai1(0)<='0';
        ai2(0)<='0';
        wait for 10ns;
        ai1(0)<='1';
        ai2(0)<='0';
        wait for 10ns;
        ai1(0)<='0';
        ai2(0)<='1';
        wait for 10ns;
        ai1(0)<='1';
        ai2(0)<='1';
        wait ;        
    end process;
    
    uut : clock_divider
    port map (
        clk_i_cd =>clk_t,
        clk_o =>clk_r,
        rst => rst_t    
    );
    uut1 : cpu_a_top
        port map (
            clk_i =>clk_t             
        );
    
    process is
    begin
        clk_t<='0';
        wait for period/2;
        clk_t<='1';
        wait for period/2;
    end process;
   process is
    begin
        rst_t<='0';
        wait for 8ns;
        rst_t<='1';
        wait for 20ns;
        rst_t<='0';
        wait;
    end process;
end Behavioral;
