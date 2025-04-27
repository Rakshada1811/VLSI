----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:17:34 08/23/2024 
-- Design Name: 
-- Module Name:    LCD_FSM - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LCD_FSM is
    Port ( clk_12Mhz : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           lcd_en : out  STD_LOGIC;
           lcd_rs : out  STD_LOGIC;
           lcd_data : out  STD_LOGIC_VECTOR (7 downto 0));
end LCD_FSM;

architecture Behavioral of LCD_FSM is

signal div: std_logic_vector(15 downto 0); -- delay timer 1
signal clk_fsm,lcd_rs_s: std_logic;
-- LCD controller FSM states
type state is (reset,func,mode,cur,clear,d0,d1,d2,d3,d4,d5,d6,d7,hold);
signal ps1,nx :state;
signal dataout_s: std_logic_vector(7 downto 0); -- internal data command multiplexer

begin
 -- clk divider----------------------
    process(rst,clk_12Mhz)
    begin
    if(rst='1') then
        div<=(others=>'0');
    elsif(rising_edge(clk_12Mhz)) then
        div<=div+1;
        end if;
    end process;    
    ------------------------
    clk_fsm<=div(15);
    
    ---Presetn state Register-------
    process(rst,clk_fsm)
    begin
    if(rst='1') then
        ps1<= reset;
    elsif(rising_edge(clk_fsm)) then
        ps1<=nx;
    end if;
    end process;
    
    ----- state and output decoding process
    process(ps1)
    begin
    case(ps1) is
        when reset=>    
            nx<= func;
            lcd_rs_s<='0';
            dataout_s<="00111000"; --38h
        
        when func =>
            nx<=mode;
            lcd_rs_s<='0';
            dataout_s<="00111000"; --38h
            
        when mode =>
            nx<=cur;
            lcd_rs_s<='0';
            dataout_s<="00000110"; --06h    
        
        when cur =>
            nx<=clear;
            lcd_rs_s<='0';
            dataout_s<="00001100"; --0Ch cursor at starting point of line1
            
        when clear=>
            nx<=d0;
            lcd_rs_s<='0';
            dataout_s<="00000001"; --01h
            
        when d0 =>
            lcd_rs_s <= '1';
            dataout_s<="01010010"; --R(52h)P(50h)I(49h)C(43h)T(54h)
            nx<=d1;
            
        when d1 =>
            lcd_rs_s <= '1';
            dataout_s<="01000001"; --A(41h)
            nx<=d2;
            
        when d2 =>
            lcd_rs_s <= '1';
            dataout_s<="01001011"; --K(4Bh)
            nx<=d3;
            
        when d3 =>
            lcd_rs_s <= '1';
            dataout_s<="01010011"; --S(53h)
            nx<=d4;
            
        when d4 =>
            lcd_rs_s <= '1';
            dataout_s<="01001000"; --H(48h)
            nx<=d5;
            
        when d5 =>
            lcd_rs_s <= '1';
            dataout_s<="01000001"; --A(41h)
            nx<=d6;
            
        when d6 =>
            lcd_rs_s <= '1';
            dataout_s<="01000100"; --D(44h)
            nx<=d7;
            
        when d7 =>
            lcd_rs_s <= '1';
            dataout_s<="01000001"; --A(41h)
            nx<=hold;
            
        when hold =>
            lcd_rs_s <= '0';
            dataout_s<="00000000"; --hold(Decimal=00, Hex=00)
            nx<=hold;
            
        when others =>
            nx <= reset;
            lcd_rs_s <= '0';
            dataout_s<="00000001"; --hold(Decimal=1, Hex=01)
    end case;
    end process;
    
    lcd_en<=clk_fsm;
    lcd_rs<=lcd_rs_s;
    lcd_data<=dataout_s;

end Behavioral;
