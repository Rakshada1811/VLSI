LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY fifo_test IS
END fifo_test;
 
ARCHITECTURE behavior OF fifo_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fifo_4_8
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         wr_en : IN  std_logic;
         rd_en : IN  std_logic;
         data_in : IN  std_logic_vector(7 downto 0);
         fifo_full : OUT  std_logic;
         fifo_empty : OUT  std_logic;
         data_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal wr_en : std_logic := '0';
   signal rd_en : std_logic := '0';
   signal data_in : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal fifo_full : std_logic;
   signal fifo_empty : std_logic;
   signal data_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fifo_4_8 PORT MAP (
          rst => rst,
          clk => clk,
          wr_en => wr_en,
          rd_en => rd_en,
          data_in => data_in,
          fifo_full => fifo_full,
          fifo_empty => fifo_empty,
          data_out => data_out
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
   stim_proc_input: process
   begin		
		data_in<="10101010";
		wait for 10 ns;
		data_in<=data_in+1;
		wait for 10 ns;
		data_in<=data_in+1;
		wait for 10 ns;
		data_in<=data_in+1;
      wait;
   end process;
	
	stim_proc_wr: process
   begin	
		wait for 5 ns;
		wr_en <= '1';
		wait for 40 ns;
		wr_en <= '0';
      wait;
   end process;
	
	stim_proc_rd: process
   begin	
		wait for 45 ns;
		rd_en <= '1';
		wait for 40 ns;
		rd_en <= '0';
      wait;
   end process;
	
	
--	stim_proc_rst: process
--   begin
--		wait for 22.5 ns;
--		rst <= '1';
--		wait for 30 ns;
--		rst <= '0';
--      wait;
--   end process;
END;
