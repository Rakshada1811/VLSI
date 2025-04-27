--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:22:12 07/22/2024
-- Design Name:   
-- Module Name:   D:/Piyush_42154/uni_shift_reg/USR_Test.vhd
-- Project Name:  uni_shift_reg
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: USR
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
 
ENTITY USR_Test IS
END USR_Test;
 
ARCHITECTURE behavior OF USR_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT USR
    PORT(
         Pin : IN  std_logic_vector(3 downto 0);
         Sin : IN  std_logic;
         mode : IN  std_logic_vector(1 downto 0);
         rst : IN  std_logic;
         clk : IN  std_logic;
         Pout : OUT  std_logic_vector(3 downto 0);
         Sout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Pin : std_logic_vector(3 downto 0) := "1010";
   signal Sin : std_logic := '0';
   signal mode : std_logic_vector(1 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal clk : std_logic := '1';

 	--Outputs
   signal Pout : std_logic_vector(3 downto 0) := "0000";
   signal Sout : std_logic := '0';

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: USR PORT MAP (
          Pin => Pin,
          Sin => Sin,
          mode => mode,
          rst => rst,
          clk => clk,
          Pout => Pout,
          Sout => Sout
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
   stim_proc_mode: process
   begin		
		mode<="00";
		wait for 80 ns;
		mode<="01";
		wait for 50 ns;
		mode<="10";
		wait for 50 ns;
		mode<="11";
		wait for 20 ns;
		mode<="00";
		wait;
   end process;
	
	stim_proc_rst: process
   begin		
		wait for 67.5ns;
		rst<='1';
		wait for 40 ns;
		rst<='0';
		wait;
   end process;
	

	
	stim_proc_sin: process
   begin		
		Sin<='1';
		wait for 10 ns;
		Sin<='0';
		wait for 10 ns;
		Sin<='1';
		wait for 10 ns;
		Sin<='0';
		wait for 50 ns;
		Sin<='1';
		wait for 10 ns;
		Sin<='0';
		wait for 10 ns;
		Sin<='1';
		wait for 10 ns;
		Sin<='0';
		wait;
   end process;

END;
