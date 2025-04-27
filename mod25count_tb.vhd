
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

 
ENTITY mod25count_tb IS
END mod25count_tb;
 
ARCHITECTURE behavior OF mod25count_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MOD_25
    PORT(
         rst : IN  std_logic;
         pr : IN  std_logic;
         dir : IN  std_logic;
         clk : IN  std_logic;
         y_out : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal pr : std_logic := '0';
   signal dir : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal y_out : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MOD_25 PORT MAP (
          rst => rst,
          pr => pr,
          dir => dir,
          clk => clk,
          y_out => y_out
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
   dir_proc: process
   begin		
      -- hold reset state for 50 ns.
		dir <= '1';
		wait for 320 ns;
		dir <= '0';
		wait for 320 ns;
      -- insert stimulus here 
      wait;
   end process;
	
	
	   -- Stimulus process
   rst_proc: process
   begin		
      -- hold reset state for 50 ns.
		wait for 62.5 ns;
		rst <= '1';
		wait for 5 ns;
		rst <= '0';
      -- insert stimulus here 
      wait;
   end process;
	
	
	   -- Stimulus process
   pre_proc: process
   begin		
      -- hold reset state for 50 ns.
		wait for 325.5 ns;
		pr <= '1';
		wait for 5 ns;
		pr <= '0';
      -- insert stimulus here 
      wait;
   end process;

END;
