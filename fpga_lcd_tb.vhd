--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Rakshada Renapurkar
--
-- Create Date:   19:51:41 09/25/2024
-- Design Name:   FPGA LCD Interface
-- Module Name:   fpga_lcd_tb.vhd - Testbench
-- Project Name:  fpga_lcd
-- Target Device: Any (Simulation)
-- Description:   Testbench for simulating LCD FSM behavior.
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fpga_lcd_tb is
end fpga_lcd_tb;

architecture behavior of fpga_lcd_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component fpga_lcd
        port(
            rst       : in  std_logic;
            clk_12Mhz : in  std_logic;
            LCD_rs    : out std_logic;
            LCD_en    : out std_logic;
            LCD_data  : out std_logic_vector(7 downto 0)
        );
    end component;

    -- Testbench signals
    signal rst       : std_logic := '0';
    signal clk_12Mhz : std_logic := '0';
    signal LCD_rs    : std_logic;
    signal LCD_en    : std_logic;
    signal LCD_data  : std_logic_vector(7 downto 0);

    -- Clock period definition
    constant clk_12Mhz_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: fpga_lcd
        port map (
            rst        => rst,
            clk_12Mhz  => clk_12Mhz,
            LCD_rs     => LCD_rs,
            LCD_en     => LCD_en,
            LCD_data   => LCD_data
        );

    -- Clock generation
    clk_process: process
    begin
        clk_12Mhz <= '0';
        wait for clk_12Mhz_period/2;
        clk_12Mhz <= '1';
        wait for clk_12Mhz_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Apply Reset
        rst <= '1';
        wait for 20 ns;
        rst <= '0';

        -- Wait for FSM operations to complete
        wait for 2 ms;

        -- End simulation
        report "Simulation completed successfully." severity note;
        wait;
    end process;

end behavior;
