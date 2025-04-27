--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   03:28:22 08/05/2024
-- Design Name:   
-- Module Name:   D:/Piyush_42154/mod_n/mod_25_test.vhd
-- Project Name:  mod_n
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mod_25
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
 
ENTITY mod_25_test IS
END mod_25_test;
 
ARCHITECTURE behavior OF mod_25_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mod_25
    PORT(
         rst : IN  std_logic;
         pr : IN  std_logic;
         clk : IN  std_logic;
         dir : IN  std_logic;
         q : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal pr : std_logic := '0';
   signal clk : std_logic := '0';
   signal dir : std_logic := '1';

 	--Outputs
   signal q : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mod_25 PORT MAP (
          rst => rst,
          pr => pr,
          clk => clk,
          dir => dir,
          q => q
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc_dir: process
   begin		
      wait for 260 ns;	
		dir <= '0';
      wait;
   end process;
	
	stim_proc_rst: process
   begin		
      wait for 52.5 ns;	
		rst <= '1';
      wait for 50 ns;
		rst <= '0';
		wait;
   end process;
	
		
	stim_proc_pr: process
   begin		
      wait for 302.5 ns;	
		pr <= '1';
      wait for 50 ns;
		pr <= '0';
		wait;
   end process;

END;
