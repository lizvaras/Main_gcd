----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.09.2023 14:51:16
-- Design Name: 
-- Module Name: create_pulse - Behavioral
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

entity create_pulse is
    Port ( inp, cclk, clr : in STD_LOGIC;
           outp: out STD_LOGIC);
end create_pulse;

architecture Behavioral of create_pulse is
signal delay1, delay2,delay3: STD_LOGIC;

begin

process(cclk,clr)
begin
    
    if clr = '1' then
       delay1 <= '0';
       delay2 <= '0';
       delay3 <= '0';
    elsif rising_edge(cclk) then
       delay1 <= inp;
       delay2 <= delay1;
       delay3 <= delay2;
    end if;

end process;
outp <= delay1 and delay2 and (not delay3);

end Behavioral;
