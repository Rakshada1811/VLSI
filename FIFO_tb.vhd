--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:34:36 08/16/2024
-- Design Name:   
-- Module Name:   D:/Kaushal_42238/FIFO/FIFO_tb.vhd
-- Project Name:  FIFO
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FIFO
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
 
ENTITY FIFO_tb IS
END FIFO_tb;
 
ARCHITECTURE behavior OF FIFO_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FIFO
    PORT(
         RST : IN  std_logic;
         CLK : IN  std_logic;
         rd_en : IN  std_logic;
         wr_en : IN  std_logic;
         data_in : IN  std_logic_vector(7 downto 0);
         data_out : OUT  std_logic_vector(7 downto 0);
         fifo_empty : OUT  std_logic;
         fifo_full : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal RST : std_logic := '0';
   signal CLK : std_logic := '0';
   signal rd_en : std_logic := '0';
   signal wr_en : std_logic := '0';
   signal data_in : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal data_out : std_logic_vector(7 downto 0);
   signal fifo_empty : std_logic;
   signal fifo_full : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FIFO PORT MAP (
          RST => RST,
          CLK => CLK,
          rd_en => rd_en,
          wr_en => wr_en,
          data_in => data_in,
          data_out => data_out,
          fifo_empty => fifo_empty,
          fifo_full => fifo_full
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc_rst: process
   begin		
      RST<='1';
	--	wait for 10 ns;
	--	RST<='0';
		RST<='1';
		wait for 10 ns;
		RST<='0';
		wait;	
   end process;
	
	stim_proc_rd: process
   begin		
		wait for 160 ns;
      rd_en<='1';
		wait for 160 ns;
		rd_en<='0';	
   end process;
	
	stim_proc_wr: process
   begin		
      wr_en<='1';
		wait for 160 ns;
		wr_en<='0';
		wait for 160 ns;
   end process;
	
	stim_proc_data: process
   begin		
      data_in<="11100000";
		wait for 10 ns;
		data_in<="10101010";
		wait for 10 ns;
		data_in<="11110000";
		wait for 10 ns;
		data_in<="10100000";
		wait for 10 ns;
		
   end process;

END;
