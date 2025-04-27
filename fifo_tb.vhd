--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:06:22 09/26/2024
-- Design Name:   
-- Module Name:   C:/Users/ADMIN/Downloads/xilinx_software/Xilinx_ISE_DS_Win_14.7_1015_1/Eshaan_iseprojects/FIFO/fifo/fifo_tb.vhd
-- Project Name:  fifo
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fifo
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
USE ieee.std_logic_arith.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY fifo_tb IS
END fifo_tb;
 
ARCHITECTURE behavior OF fifo_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
   -- COMPONENT fifo
    --PORT(
     --    clk : IN  std_logic;
       --  reset : IN  std_logic;
   --      enr : IN  std_logic;
     --    enw : IN  std_logic;
       --  data_in : IN  std_logic_vector(7 downto 0);
         --data_out : OUT  std_logic_vector(7 downto 0);
         --fifo_empty : OUT  std_logic;
         --fifo_full : OUT  std_logic
      --  );
    --END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal enr : std_logic := '0';
   signal enw : std_logic := '0';
   signal data_in : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal data_out : std_logic_vector(7 downto 0);
   signal fifo_empty : std_logic;
   signal fifo_full : std_logic;
	
	signal i: integer :=0;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
	constant depth : integer:=16;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: entity work.fifo generic map(depth=>depth) PORT MAP 
	(
          clk ,
          reset,
          enr ,
          enw ,
          data_in ,
          data_out ,
          fifo_empty,
          fifo_full 
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
   stim_proc: process
   begin		
	reset <= '1'; --apply reset for one clock cycle.
wait for clk_period;
reset <= '0';
wait for clk_period*3; --wait for 3 clock periods(simply)
enw <= '1'; enr <= '0'; --write 10 values to fifo.
for i in 1 to 10 loop
Data_In <= conv_std_logic_vector(i,8);
wait for clk_period;
end loop;
enw <= '0'; enr <= '1'; --read 4 values from fifo.
wait for clk_period*4;
enw <= '0'; enr <= '0';
wait for clk_period*10; --wait for some clock cycles.

	enw <= '1'; enr <= '0'; --write 10 values to fifo.
for i in 11 to 20 loop
Data_In <= conv_std_logic_vector(i,8);
wait for clk_period;
end loop;
enw <= '0'; enr <= '0';
wait for clk_period*10; --wait for some clock cycles.
enw <= '0'; enr <= '1'; --read 4 values from fifo.
wait for clk_period*4;
enw <= '0'; enr <= '0';
wait for clk_period;
enw <= '0'; enr <= '1'; --read 4 values from fifo.
wait for clk_period*8;
enw <= '0'; enr <= '0';
wait for clk_period;
enw <= '0'; enr <= '1'; --read 8 values from fifo.
wait for clk_period*4;
enw <= '0'; enr <= '0';
wait for clk_period;
enw <= '0'; enr <= '1'; --read 4 values from fifo.
wait for clk_period*4;
enw <= '0'; enr <= '0';
wait;
     

   end process;

END;
