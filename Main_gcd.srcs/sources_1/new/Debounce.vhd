----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.09.2023 14:59:04
-- Design Name: 
-- Module Name: Debounce - Behavioral
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

entity Debounce is
Port (clk,clr: in STD_LOGIC;
      inp: in STD_LOGIC_VECTOR (3 downto 0);
      outp: out STD_LOGIC_VECTOR(3 downto 0));
end Debounce;

architecture Behavioral of Debounce is
signal delay1, delay2, delay3 : STD_LOGIC_VECTOR(3 downto 0);

begin
process(clk, clr) begin 
    if clr = '1' then
       delay1 <= "0000";
       delay2 <= "0000";
       delay3 <= "0000";
    elsif rising_edge(clk) then
       delay1 <= inp;
       delay2 <= delay1;
       delay3 <= delay2;
    end if;
end process;

outp <= delay1 and delay2 and delay3;

end Behavioral;
