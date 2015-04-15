library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;

library lpm;
use lpm.lpm_components.all;
entity alt_dspbuilder_multiply_add_GNKLXFKAO3 is
	generic		( 			family : string := "Cyclone V";
			direction : string := "AddAdd";
			data3b_const : string := "00011110";
			data2b_const : string := "10010110";
			representation : string := "UNSIGNED";
			dataWidth : integer := 8;
			data4b_const : string := "01001100";
			number_multipliers : integer := 3;
			pipeline_register : string := "NoRegister";
			use_dedicated_circuitry : integer := 1;
			data1b_const : string := "01001100";
			use_b_consts : natural := 1);

	port(
		clock : in std_logic;
		aclr : in std_logic;
		data1a : in std_logic_vector(7 downto 0);
		data2a : in std_logic_vector(7 downto 0);
		data3a : in std_logic_vector(7 downto 0);
		result : out std_logic_vector(17 downto 0);
		user_aclr : in std_logic;
		ena : in std_logic);		
end entity;

architecture rtl of alt_dspbuilder_multiply_add_GNKLXFKAO3 is 

Begin



MultiplyAddi : alt_dspbuilder_AltMultConst generic map (
				CA			=>	"01001100",
				CB			=>	"10010110",
				CC			=>	"00011110",
				CD			=>	"01001100",
				width_a			=>	8,
				width_r			=>	18,
				RegStruct		=>	NoRegister,
                                data_signed             => false
                                )
		port map (
				datain		=>  data1a ,
				datbin		=>  data2a ,
				datcin		=>  data3a ,
				datdin		=>  "00000000" ,											
				dataout		=>	result(17  downto 0),
				clock		=>	clock,
				ena			=>	ena,
				aclr		=>	aclr,
				user_aclr	=>	user_aclr
				);



end architecture;		