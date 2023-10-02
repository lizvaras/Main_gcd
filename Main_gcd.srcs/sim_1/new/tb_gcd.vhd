----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.10.2023 19:17:48
-- Design Name: 
-- Module Name: tb_gcd - Behavioral
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

entity tb_gcd is
--  Port ( );
end tb_gcd;

architecture Behavioral of tb_gcd is
signal BTN: STD_LOGIC_VECTOR (3 downto 0);
signal X,Y: STD_LOGIC_VECTOR (7 downto 0);
signal mclk: STD_LOGIC;
signal xled,yled: STD_LOGIC_VECTOR (7 downto 0);
signal A_to_G: STD_LOGIC_VECTOR(6 downto 0);
signal AN : STD_LOGIC_VECTOR (3 downto 0);


begin

uut: entity work.Main_gcd port map(BTN=>BTN, X=>X, Y=>Y ,mclk=>mclk, xled=>xled,
                                   yled=>yled, A_to_G=>A_to_G, AN=>AN);
stimulus:process begin

        X <= "10011001";
        Y <= "01100110";
        mclk<='1';
        BTN<= "0000";
        wait for 10ns;
        mclk<='0';
        wait for 10ns;
        mclk<='1';
        BTN<="0001";
        wait for 10ns;
        mclk<='0';
        wait for 10ns;
        mclk<='1';
        wait for 10ns;
        mclk<='0';
        wait for 10ns;
        mclk<='1';
        wait for 10ns;
        mclk<='0';
        wait for 10ns;
        mclk<='1';
        wait for 10ns;
        mclk<='0';
        wait for 10ns;
        mclk<='1';
        wait for 10ns;
        mclk<='0';
        wait for 10ns;
        mclk<='1';
        wait for 10ns;
        mclk<='0';
        wait for 10ns;
        mclk<='1';
        wait for 10ns;
        mclk<='0';
        wait for 10ns;
        mclk<='1';
        wait for 10ns;
end process;


end Behavioral;
