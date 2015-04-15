-- This file is not intended for synthesis, is is present so that simulators
-- see a complete view of the system.

-- You may use the entity declaration from this file as the basis for a
-- component declaration in a VHDL file instantiating this entity.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity alt_dspbuilder_barrelshifter is
	generic (
		DISTANCE_WIDTH : natural := 3;
		NDIRECTION : natural := 0;
		SIGNED : integer := 1;
		USE_DEDICATED_CIRCUITRY : string := "false";
		PIPELINE : natural := 0;
		WIDTH : natural := 8
	);
	port (
		user_aclr : in std_logic;
		distance : in std_logic_vector(DISTANCE_WIDTH-1 downto 0);
		r : out std_logic_vector(WIDTH-1 downto 0);
		clock : in std_logic;
		direction : in std_logic;
		a : in std_logic_vector(WIDTH-1 downto 0);
		aclr : in std_logic;
		ena : in std_logic
	);
end entity alt_dspbuilder_barrelshifter;

architecture rtl of alt_dspbuilder_barrelshifter is

component alt_dspbuilder_barrelshifter_GNV5DVAGHT is
	generic (
		DISTANCE_WIDTH : natural := 4;
		NDIRECTION : natural := 1;
		SIGNED : integer := 0;
		USE_DEDICATED_CIRCUITRY : string := "false";
		PIPELINE : natural := 0;
		WIDTH : natural := 18
	);
	port (
		a : in std_logic_vector(18-1 downto 0);
		aclr : in std_logic;
		clock : in std_logic;
		distance : in std_logic_vector(4-1 downto 0);
		ena : in std_logic;
		r : out std_logic_vector(18-1 downto 0);
		user_aclr : in std_logic
	);
end component alt_dspbuilder_barrelshifter_GNV5DVAGHT;

begin

alt_dspbuilder_barrelshifter_GNV5DVAGHT_0: if ((DISTANCE_WIDTH = 4) and (NDIRECTION = 1) and (SIGNED = 0) and (USE_DEDICATED_CIRCUITRY = "false") and (PIPELINE = 0) and (WIDTH = 18)) generate
	inst_alt_dspbuilder_barrelshifter_GNV5DVAGHT_0: alt_dspbuilder_barrelshifter_GNV5DVAGHT
		generic map(DISTANCE_WIDTH => 4, NDIRECTION => 1, SIGNED => 0, USE_DEDICATED_CIRCUITRY => "false", PIPELINE => 0, WIDTH => 18)
		port map(a => a, aclr => aclr, clock => clock, distance => distance, ena => ena, r => r, user_aclr => user_aclr);
end generate;

assert not (((DISTANCE_WIDTH = 4) and (NDIRECTION = 1) and (SIGNED = 0) and (USE_DEDICATED_CIRCUITRY = "false") and (PIPELINE = 0) and (WIDTH = 18)))
	report "Please run generate again" severity error;

end architecture rtl;

