library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity fpga_lcd is
    Port (
        rst       : in  std_logic;
        clk_12Mhz : in  std_logic;
        LCD_rs    : out std_logic;
        LCD_en    : out std_logic;
        LCD_data  : out std_logic_vector(7 downto 0)
    );
end fpga_lcd;

architecture Behavioral of fpga_lcd is

    -- Define state type
    type state_type is (init, cmd1, cmd2, cmd3, done);
    signal state : state_type := init;

    -- Temporary signal for enable pulse
    signal en_pulse : std_logic := '0';

begin

    process(clk_12Mhz, rst)
    begin
        if rst = '1' then
            state     <= init;
            LCD_rs    <= '0';
            LCD_data  <= (others => '0');
            en_pulse  <= '0';
        elsif rising_edge(clk_12Mhz) then
            case state is
                when init =>
                    LCD_rs   <= '0';
                    LCD_data <= "00110000";  -- Function set
                    en_pulse <= '1';
                    state    <= cmd1;

                when cmd1 =>
                    LCD_rs   <= '0';
                    LCD_data <= "00001100";  -- Display ON, cursor OFF
                    en_pulse <= '1';
                    state    <= cmd2;

                when cmd2 =>
                    LCD_rs   <= '0';
                    LCD_data <= "00000001";  -- Clear display
                    en_pulse <= '1';
                    state    <= cmd3;

                when cmd3 =>
                    LCD_rs   <= '0';
                    LCD_data <= "00000110";  -- Entry mode set
                    en_pulse <= '1';
                    state    <= done;

                when done =>
                    LCD_rs   <= '0';
                    LCD_data <= (others => '0');
                    en_pulse <= '0';

                when others =>
                    state    <= done;
            end case;

            -- ? Proper single assignment to LCD_en
            LCD_en <= en_pulse;
        end if;
    end process;

end Behavioral;
