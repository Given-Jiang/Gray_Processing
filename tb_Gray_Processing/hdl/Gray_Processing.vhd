-- This file is not intended for synthesis, is is present so that simulators
-- see a complete view of the system.

-- You may use the entity declaration from this file as the basis for a
-- component declaration in a VHDL file instantiating this entity.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity Gray_Processing is
	port (
		Avalon_ST_Sink_data : in std_logic_vector(24-1 downto 0);
		Avalon_ST_Sink_endofpacket : in std_logic;
		Avalon_ST_Sink_ready : out std_logic;
		Avalon_ST_Sink_startofpacket : in std_logic;
		Avalon_ST_Sink_valid : in std_logic;
		Avalon_ST_Source_data : out std_logic_vector(24-1 downto 0);
		Avalon_ST_Source_endofpacket : out std_logic;
		Avalon_ST_Source_ready : in std_logic;
		Avalon_ST_Source_startofpacket : out std_logic;
		Avalon_ST_Source_valid : out std_logic;
		Clock : in std_logic;
		aclr : in std_logic
	);
end entity Gray_Processing;

architecture rtl of Gray_Processing is

component Gray_Processing_GN is
	port (
		Avalon_ST_Sink_data : in std_logic_vector(24-1 downto 0);
		Avalon_ST_Sink_endofpacket : in std_logic;
		Avalon_ST_Sink_ready : out std_logic;
		Avalon_ST_Sink_startofpacket : in std_logic;
		Avalon_ST_Sink_valid : in std_logic;
		Avalon_ST_Source_data : out std_logic_vector(24-1 downto 0);
		Avalon_ST_Source_endofpacket : out std_logic;
		Avalon_ST_Source_ready : in std_logic;
		Avalon_ST_Source_startofpacket : out std_logic;
		Avalon_ST_Source_valid : out std_logic;
		Clock : in std_logic;
		aclr : in std_logic
	);
end component Gray_Processing_GN;

begin

Gray_Processing_GN_0: if true generate
	inst_Gray_Processing_GN_0: Gray_Processing_GN
		port map(Avalon_ST_Sink_data => Avalon_ST_Sink_data, Avalon_ST_Sink_endofpacket => Avalon_ST_Sink_endofpacket, Avalon_ST_Sink_ready => Avalon_ST_Sink_ready, Avalon_ST_Sink_startofpacket => Avalon_ST_Sink_startofpacket, Avalon_ST_Sink_valid => Avalon_ST_Sink_valid, Avalon_ST_Source_data => Avalon_ST_Source_data, Avalon_ST_Source_endofpacket => Avalon_ST_Source_endofpacket, Avalon_ST_Source_ready => Avalon_ST_Source_ready, Avalon_ST_Source_startofpacket => Avalon_ST_Source_startofpacket, Avalon_ST_Source_valid => Avalon_ST_Source_valid, Clock => Clock, aclr => aclr);
end generate;

end architecture rtl;

