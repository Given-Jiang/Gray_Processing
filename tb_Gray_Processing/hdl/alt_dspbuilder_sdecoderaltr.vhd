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


library ieee ;
use ieee.std_logic_1164.all;

library lpm;
use lpm.lpm_components.all;

library altera;
use altera.alt_dspbuilder_package.all;

entity alt_dspbuilder_sdecoderaltr is
	generic
	(
		width		: natural :=8; 
		pipeline	: natural :=0; 
		decode		: std_logic_vector :="00000000" 
	);
	port
	(
		data	: in std_logic_vector (width-1 downto 0);
		clock   : in std_logic;
		aclr    : in std_logic;
        user_aclr    : in std_logic;
		sclr    : in std_logic;
		dec		: out std_logic
	);
end alt_dspbuilder_sdecoderaltr;

architecture syn of alt_dspbuilder_sdecoderaltr is

signal sdec : std_logic_vector(width-1 downto 0);
signal idec : std_logic;
signal aclr_i : std_logic;

begin
    aclr_i <= aclr or user_aclr;

	gw: if width=(decode'length) generate
		idec <= '1' when data=decode else '0';	
	end generate gw;

	gg: if width<decode'length generate
		g:for i in 0 to width-1 generate
			sdec(i) <= decode(i);
		end generate g;
		idec <= '1' when data=sdec else '0';		
	end generate gg;
	
	gl: if width>decode'length generate
		sdec(decode'length-1 downto 0) <= decode(decode'length-1 downto 0);
		g:for i in decode'length to width-1 generate
			sdec(i) <= sdec(decode'length-1);
		end generate g;
		idec <= '1' when data=sdec else '0';		
	end generate gl;

	gcomb:if 0=pipeline generate
		dec<=idec;
	end generate gcomb;

	greg:if 0<pipeline generate
		process(clock,aclr_i)
		begin
            if aclr_i='1' then
			    dec<='0';
            elsif clock'event and clock='1' then
				if sclr='1' then
					dec<='0';
				else
					dec<=idec;
				end if;		
			end if;
		end process;
	end generate greg;

end syn;




