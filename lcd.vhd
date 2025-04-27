
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

entity lcd is
    Port ( rst : in  STD_LOGIC;
           clk_12Mhz : in  STD_LOGIC;
           lcd_rs : out  STD_LOGIC;
           lcd_en : out  STD_LOGIC;
           lcd_data : out  STD_LOGIC_VECTOR (7 downto 0));
end lcd;

architecture Behavioral of lcd is

signal div: std_logic_vector(15 downto 0); --delay timer 1
signal clk_fsm, lcd_rs_s:std_logic;

--LCD controller FSM states
type state is(reset, func,mode,cur,clear,d0,d1,d2,d3,d4,hold);
signal ps1,nx : state;
signal dataout_s : std_logic_vector(7 downto 0);

begin
	----clk divider----
	process(rst,clk_12Mhz)
	begin
		if (rst='1') then
			div <=(others=>'0');
		elsif(clk_12Mhz='1' ) then
			div <= div+1;
		end if;
			
	end process;
	
	---------------
	clk_fsm <= div(15);
	
	---preset state register----
	process(rst,clk_fsm)
	begin
		if(rst='1') then
			ps1 <= reset;
		elsif (rising_edge(clk_fsm)) then
			ps1 <= nx;
		end if;
	end process;
	
	--state and outut process
	process(ps1)
	begin
	case(ps1) is
			when reset => 
				nx <= func;
				lcd_rs_s <= '0';
				dataout_s <= "00111000";
				
			when func=>
				nx<= mode;
				lcd_rs_s <='0';
				dataout_s <= "00111000";
				
			when mode =>
				nx <= cur;
				lcd_rs_s <= '0';
				dataout_s <= "00000110";
				
			when cur=>
				nx <= clear;
				lcd_rs_s <='0';
				dataout_s <= "00001100";
				
			when clear=>
				nx <= d0;
				lcd_rs_s <='0';
				dataout_s <= "00000001";
				
			when d0=>
				lcd_rs_s <='1';
				dataout_s <= "01010000";
				nx <= d1;
				
			when d1=>
				lcd_rs_s <= '1';
				dataout_s <= "01001001";
				nx <= d2;
				
			when d2=>
				lcd_rs_s <= '1';
				dataout_s <= "01000011";
				nx <= d3;
				
			when d3=>
				lcd_rs_s <= '1';
				dataout_s <= "01010100";
				nx <= d4;
				
			when d4=>
				lcd_rs_s <= '1';
				dataout_s <= "00100000";
				nx <= hold;
				
			when hold=>
				lcd_rs_s <= '0';
				dataout_s <= "00000000";
				nx <= hold;
				
			when others =>
				nx <= reset;
				lcd_rs_s <='0';
				dataout_s <= "00000001";				
		end case;
	end process;	

	lcd_en <= clk_fsm;
	lcd_rs <= lcd_rs_s;
	lcd_data <= dataout_s;

end Behavioral;

