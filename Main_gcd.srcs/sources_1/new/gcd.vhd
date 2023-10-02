----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.10.2023 14:02:00
-- Design Name: 
-- Module Name: gcd - Behavioral
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


entity gcd is
  Port (xin, yin: in STD_LOGIC_VECTOR (7 downto 0);
        clr,clk,go: in STD_LOGIC; 
        done: out STD_LOGIC;
        gcd: out STD_LOGIC_VECTOR(7 downto 0));
end gcd;

architecture Behavioral of gcd is
signal x, y: STD_LOGIC_VECTOR(7 downto 0);

begin
algoritmo: process (clk,clr)
variable calc, donev: STD_LOGIC;
begin
    if(clr = '1') then
        x <=(others => '0');
        y <=(others => '0');
        gcd <=(others => '0');
        donev:= '0';
        calc := '0';
    elsif(rising_edge(clk))then
        donev:= '0';
        if(go = '1') then
            x <= xin;
            y <= yin;
            calc:= '1';
        elsif (calc = '1')then
            if (x = y)then
                gcd <= x;
                donev:= '1';
                calc:= '0';
            elsif(x < y) then
                y <= y - x;
            else
                x <= x -y;
            end if;
        end if;
     end if;
        
done <= donev;
end process algoritmo;
end Behavioral;
