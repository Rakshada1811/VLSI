--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:00:42 09/06/2024
-- Design Name:   
-- Module Name:   D:/Kaushal_42238/LCD_FSM/LCD_FSM_tb.vhd
-- Project Name:  LCD_FSM
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: LCD_FSM
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY LCD_FSM_tb IS
END LCD_FSM_tb;
 
ARCHITECTURE behavior OF LCD_FSM_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT LCD_FSM
    PORT(
         clk_12Mhz : IN  std_logic;
         rst : IN  std_logic;
         lcd_en : OUT  std_logic;
         lcd_rs : OUT  std_logic;
         lcd_data : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_12Mhz : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal lcd_en : std_logic;
   signal lcd_rs : std_logic;
   signal lcd_data : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_12Mhz_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: LCD_FSM PORT MAP (
          clk_12Mhz => clk_12Mhz,
          rst => rst,
          lcd_en => lcd_en,
          lcd_rs => lcd_rs,
          lcd_data => lcd_data
        );

   -- Clock process definitions
   clk_12Mhz_process :process
   begin
		clk_12Mhz <= '0';
		wait for clk_12Mhz_period/2;
		clk_12Mhz <= '1';
		wait for clk_12Mhz_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		rst<='1';
      wait for 20 ns;
		rst<='0';
      wait;
   end process;

END;
