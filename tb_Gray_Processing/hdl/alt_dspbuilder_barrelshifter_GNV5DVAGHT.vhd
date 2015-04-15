library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;

library lpm;
use lpm.lpm_components.all;
entity alt_dspbuilder_barrelshifter_GNV5DVAGHT is
	generic		( 			DISTANCE_WIDTH : natural := 4;
			NDIRECTION : natural := 1;
			SIGNED : integer := 0;
			use_dedicated_circuitry : string := "false";
			PIPELINE : natural := 0;
			WIDTH : natural := 18);

	port(
		a : in std_logic_vector((WIDTH)-1 downto 0);
		aclr : in std_logic;
		clock : in std_logic;
		direction : in std_logic;
		distance : in std_logic_vector((DISTANCE_WIDTH)-1 downto 0);
		ena : in std_logic;
		r : out std_logic_vector((WIDTH)-1 downto 0);
		user_aclr : in std_logic);		
end entity;

--- The DSPBuilder BarrelShifter
architecture rtl of alt_dspbuilder_barrelshifter_GNV5DVAGHT is

	signal clear : std_logic;
	signal a_ext : std_logic_vector(18 downto 0);
	signal d_ext : std_logic_vector(5 - 1 downto 0);
	signal r_ext : std_logic_vector(18 downto 0);

Begin

	clear <= aclr or user_aclr;
	a_ext(18 - 1 downto 0) <= a;
	a_ext(18) <= '0';
	d_ext(4 - 1 downto 0) <= distance;
 	d_ext(5 - 1 downto 4) <= (others => '0');
 
BarrelShifteri : alt_dspbuilder_BarrelShiftAltr  Generic map (
				widthin					=>	WIDTH  + 1 ,
				pipeline				=>	PIPELINE,
				use_dedicated_circuitry	=>	 0  ,
				widthd					=>	 5 ,
				ndirection				=>	NDIRECTION )
		port map (
				clock		=>	clock,
				aclr		=>	clear,
				sclr		=>	'0',
				ena			=>	ena,
				direction	=>	'0',		
				xin			=>	 a_ext ,
				distance	=>	 d_ext ,
				yout		=>	 r_ext  );

	r <= r_ext(18 - 1 downto 0);

end architecture;