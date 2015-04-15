library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;

library lpm;
use lpm.lpm_components.all;
entity alt_dspbuilder_logical_bit_op_GNA5ZFEL7V is
	generic		( 			LogicalOp : string := "AltAND";
			number_inputs : positive := 2);

	port(
		result : out std_logic;
		data0 : in std_logic;
		data1 : in std_logic);		
end entity;

architecture rtl of alt_dspbuilder_logical_bit_op_GNA5ZFEL7V is 

Begin

-- Logical Bit Operation - Simulink Block "LogicalBitOperator"
LogicalBitOperatori : alt_dspbuilder_SBitLogical	generic map (
				LPM_WIDTH      => 2,
				LOP            => AltAND)
			port map (
									dataa(0) => data0,
									dataa(1) => data1,
								result => result);



end architecture;