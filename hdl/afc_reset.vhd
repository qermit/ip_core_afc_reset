----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/11/2016 02:05:58 PM
-- Design Name: 
-- Module Name: afc_reset - Behavioral
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

entity afc_reset is
    Generic (
        g_reset_positive: boolean:= true;
        g_reset_in_cycles: natural:= 16;
        g_reset_out_cycles: natural:=16
    );
    Port ( clk : in STD_LOGIC;
           aux_reset_in : in STD_LOGIC := '0';
           aux_reset_out : out STD_LOGIC);
end afc_reset;

architecture Behavioral of afc_reset is

    type state_type is (s_init, s_reset_wait, s_reset_active,s_reset_finish);  --type of state machine.
    signal current_reset_state: state_type := s_init;

    signal r_reset_init: std_logic := '0';
    signal reset_reg: std_logic := '0';
    signal prereset_counter: natural := g_reset_in_cycles ;
begin

p_reset_counter: process (clk)
begin
    if rising_edge(clk) then
        if current_reset_state = s_init then
            current_reset_state <= s_reset_wait;
            prereset_counter <= g_reset_in_cycles;
        elsif current_reset_state = s_reset_wait then
            if prereset_counter = 0 then
              current_reset_state <= s_reset_active;
            else
               prereset_counter <=  prereset_counter-1;
            end if;
        elsif  current_reset_state = s_reset_active then
            if aux_reset_in = '0' then
                current_reset_state <= s_reset_finish;
            end if;
            reset_reg <= '1';
        else 
            reset_reg <= '0';
            if aux_reset_in = '1' then
              current_reset_state <= s_reset_active;
            end if;
        end if;
    end if;
end process;

aux_reset_out <= reset_reg;

end Behavioral;
