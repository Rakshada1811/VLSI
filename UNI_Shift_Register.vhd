----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:16:49 08/02/2024 
-- Design Name: 
-- Module Name:    UNI_Shift_Register - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UNI_Shift_Register is
    Port ( Pout : out  STD_LOGIC_VECTOR (3 downto 0);
           Sout : out  STD_LOGIC;
           Pin : in  STD_LOGIC_VECTOR (3 downto 0);
           Sin : in  STD_LOGIC ;
           rst : in  STD_LOGIC;
			  mode : in STD_LOGIC_VECTOR (1 downto 0);
           clk : in  STD_LOGIC);
end UNI_Shift_Register;

     architecture Behavioral of UNI_Shift_Register is
signal temp: STD_LOGIC_VECTOR (3 downto 0):="0000";
	begin
		process(rst,clk,mode,Sin,Pin)
		begin
			if rst='1' then
				Pout<="0000";
				Sout<='0';
			elsif falling_edge(clk) then
				case mode is
					when "00"=>
						temp(3 downto 1)<=temp(2 downto 0);
						temp(0)<=Sin;
						Sout<=temp(3);
						Pout<="0000";
						
					when "01"=>
						temp(3 downto 1)<=temp(2 downto 0);
						temp(0)<=Sin;
						Pout<=temp;
						Sout<='0';
						
					when "10"=>
						temp<=Pin;
						Sout<=temp(3);
						temp(3 downto 1)<=temp(2 downto 0);
						Pout<="0000";
						
					when others=>
					temp<=Pin;
					Pout<=temp;
					Sout<='0';
					
				end case;	
			end if;
		end process;

end Behavioral;

