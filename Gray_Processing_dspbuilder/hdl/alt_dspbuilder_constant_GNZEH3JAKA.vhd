library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;

library lpm;
use lpm.lpm_components.all;
entity alt_dspbuilder_constant_GNZEH3JAKA is
	generic		( 			HDLTYPE : string := "STD_LOGIC_VECTOR";
			BitPattern : string := "000000000000000000001111";
			width : natural := 24);

	port(
		output : out std_logic_vector(23 downto 0));		
end entity;

architecture rtl of alt_dspbuilder_constant_GNZEH3JAKA is 
Begin
-- Constant
output		<=	"000000000000000000001111";				
end architecture;