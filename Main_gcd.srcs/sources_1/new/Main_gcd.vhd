----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.10.2023 17:10:23
-- Design Name: 
-- Module Name: Main_gcd - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Main_gcd is
  Port ( BTN: in STD_LOGIC_VECTOR (3 downto 0);
         X,Y: in STD_LOGIC_VECTOR (7 downto 0);
         mclk: in STD_LOGIC;
         xled,yled: out STD_LOGIC_VECTOR (7 downto 0);
         A_to_G:out STD_LOGIC_VECTOR(6 downto 0);
         AN : out STD_LOGIC_VECTOR (3 downto 0));
end Main_gcd;

architecture Behavioral of Main_gcd is
signal btnd: STD_LOGIC_VECTOR (3 downto 0);
signal clk190,clkM25,go1,xin,yin,clr: STD_LOGIC;
signal gcd_7seg: STD_LOGIC_VECTOR(15 downto 0):= "0000000000000000";
signal count_1: std_logic_vector(17 downto 0);

begin

--Divisor de frecuencia 190
    count_1 <= count_1 + 1 when rising_edge(mclk);
    clk190 <= count_1(17);
--Divisor de frecuencia 25M
    count_1 <= count_1 + 1 when rising_edge(mclk);
    clkM25 <= count_1(1);
    
xled <= X;
yled <= Y;
clr <= BTN(3);

U1: entity work.Debounce port map(
    clk => clk190,
    clr => clr,
    inp => BTN,
    outp => btnd
    );
U2: entity work.create_pulse port map(
    clk => clk190,
    clr => clr,
    inp => btnd(0),
    outp => go1
    );
    
U3: entity work.gcd port map(
    clk => clkM25,
    go => go1,
    clr => clr,
    xin => X,
    yin => Y,
    gcd(0) => gcd_7seg(0),
    gcd(1) => gcd_7seg(1), 
    gcd(2) => gcd_7seg(2), 
    gcd(3) => gcd_7seg(3), 
    gcd(4) => gcd_7seg(4), 
    gcd(5) => gcd_7seg(5), 
    gcd(6) => gcd_7seg(6), 
    gcd(7) => gcd_7seg(7) 
    );
U4: entity work.disp7 port map(
    cclk => mclk,
    clr => clr,
    x => gcd_7seg,
    an => AN,
    a_to_g =>A_to_G
    );
end Behavioral;
