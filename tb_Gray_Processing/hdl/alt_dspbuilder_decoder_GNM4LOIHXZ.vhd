library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;

library lpm;
use lpm.lpm_components.all;
entity alt_dspbuilder_decoder_GNM4LOIHXZ is
	generic		( 			decode : string := "01";
			pipeline : natural := 1;
			width : natural := 2);

	port(
		aclr : in std_logic;
		clock : in std_logic;
		data : in std_logic_vector((width)-1 downto 0);
		dec : out std_logic;
		ena : in std_logic;
		sclr : in std_logic);		
end entity;

architecture rtl of alt_dspbuilder_decoder_GNM4LOIHXZ is 
Begin

-- DSP Builder Block - Simulink Block "Decoder"
Decoderi : alt_dspbuilder_sdecoderaltr  Generic map (
				width	=>	2,
				decode	=>	"01",
				pipeline	=>	1)
		port map (
				aclr => aclr,
				user_aclr => '0',
				sclr	=>	sclr,				
				clock	=>	clock,
				data	=> data,
				dec	=>	dec);

end architecture;