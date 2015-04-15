--------------------------------------------------------------------------------------------
-- DSP Builder (Version 9.1)
-- Quartus II development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: © 2001 Altera Corporation. All rights reserved.  Your use of Altera 
-- Corporation's design tools, logic functions and other software and tools, and its 
-- AMPP partner logic functions, and any output files any of the foregoing 
-- (including device programming or simulation files), and any associated 
-- documentation or information are expressly subject to the terms and conditions 
-- of the Altera Program License Subscription Agreement, Altera MegaCore Function 
-- License Agreement, or other applicable license agreement, including, without 
-- limitation, that your use is for the sole purpose of programming logic devices 
-- manufactured by Altera and sold by Altera or its authorized distributors.  
-- Please refer to the applicable agreement for further details.
--------------------------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;

entity alt_dspbuilder_SBitLogical is
		generic (     
				lpm_width	:	positive 	    := 8           ;
				lop			:	LogicalOperator	:= AltAND			
				);
		port 	( 
				dataa		: in std_logic_vector(lpm_width-1 downto 0);
				result		: out std_logic 
				);	
end alt_dspbuilder_SBitLogical;

architecture SBitLogical_SYNTH of alt_dspbuilder_SBitLogical is

signal worand	  : std_logic_vector(lpm_width-1 downto 0);
signal ndataa	  : std_logic_vector(lpm_width-1 downto 0);
signal result_int : std_logic;

begin

u0: alt_dspbuilder_sAltrBitPropagate generic map(QTB=>DSPBuilderQTB, QTB_PRODUCT => DSPBuilderProduct, QTB_VERSION => DSPBuilderVersion)
                      port map   (d => result_int, r => result);

------------------AND--------------------------------
	go1p:if lop = AltAND generate
		gi:for i in 0 to lpm_width-1 generate
			worand(i) <= '1';
		end generate gi;
		result_int <= '1' when (worand=dataa) else '0';
	end generate;

------------------OR--------------------------------
	go2p:if lop = AltOR generate
		gi:for i in 0 to lpm_width-1 generate
			worand(i) <= '1';
			ndataa(i) <= not (dataa(i));
		end generate gi;
		result_int <= '0' when (ndataa=worand) else '1';
	end generate;

------------------XOR--------------------------------
	go3p:if lop = AltXOR generate
		gif:if (lpm_width>2) generate
			process(dataa)
			variable interes : std_logic ;
			begin
				interes := dataa(0) xor dataa(1);
				for i in 2 to lpm_width-1 loop
					interes := dataa(i) xor interes;
				end loop;
				result_int <= interes;
			end process;
		end generate;
		gif2:if (lpm_width<3) generate
			result_int <= dataa(0) xor dataa(1);
		end generate;
	end generate;
	
------------------NOR--------------------------------
	go4p:if lop = AltNOR generate
		gi:for i in 0 to lpm_width-1 generate
			worand(i) <= '1';
			ndataa(i) <= not (dataa(i));
		end generate gi;
		result_int <= '1' when (ndataa=worand) else '0';
	end generate;

------------------NAND--------------------------------
	go5p:if lop = AltNAND generate
		gi:for i in 0 to lpm_width-1 generate
			worand(i) <= '1';
		end generate gi;
		result_int <= '0' when (worand=dataa) else '1';
	end generate;
	
------------------NOT (Single Bit only)---------------
	go6p:if lop = AltNOT generate
		result_int <= not (dataa(0));
	end generate;
end SBitLogical_SYNTH;

