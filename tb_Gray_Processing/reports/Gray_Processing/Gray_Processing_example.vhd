library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
entity Gray_Processing_example is  
	port(
		Avalon_ST_Sink_data : in STD_LOGIC_VECTOR(23 downto 0);
		Avalon_ST_Source_startofpacket : out STD_LOGIC;
		Avalon_ST_Sink_endofpacket : in STD_LOGIC;
		Avalon_ST_Source_valid : out STD_LOGIC;
		Avalon_ST_Sink_valid : in STD_LOGIC;
		Clock : in STD_LOGIC;
		aclr : in STD_LOGIC;
		Avalon_ST_Source_ready : in STD_LOGIC;
		Avalon_ST_Sink_ready : out STD_LOGIC;
		Avalon_ST_Sink_startofpacket : in STD_LOGIC;
		Avalon_ST_Source_endofpacket : out STD_LOGIC;
		Avalon_ST_Source_data : out STD_LOGIC_VECTOR(23 downto 0)); 
end entity;
architecture rtl of Gray_Processing_example is
component Gray_Processing
	  
	port(
		Avalon_ST_Sink_data : in STD_LOGIC_VECTOR(23 downto 0);
		Avalon_ST_Source_startofpacket : out STD_LOGIC;
		Avalon_ST_Sink_endofpacket : in STD_LOGIC;
		Avalon_ST_Source_valid : out STD_LOGIC;
		Avalon_ST_Sink_valid : in STD_LOGIC;
		Clock : in STD_LOGIC;
		aclr : in STD_LOGIC;
		Avalon_ST_Source_ready : in STD_LOGIC;
		Avalon_ST_Sink_ready : out STD_LOGIC;
		Avalon_ST_Sink_startofpacket : in STD_LOGIC;
		Avalon_ST_Source_endofpacket : out STD_LOGIC;
		Avalon_ST_Source_data : out STD_LOGIC_VECTOR(23 downto 0)); 
end component;
begin
	Gray_Processing_instance : 
		component Gray_Processing
			port map(
				Avalon_ST_Sink_data => Avalon_ST_Sink_data,
				Avalon_ST_Source_startofpacket => Avalon_ST_Source_startofpacket,
				Avalon_ST_Sink_endofpacket => Avalon_ST_Sink_endofpacket,
				Avalon_ST_Source_valid => Avalon_ST_Source_valid,
				Avalon_ST_Sink_valid => Avalon_ST_Sink_valid,
				Clock => Clock,
				aclr => aclr,
				Avalon_ST_Source_ready => Avalon_ST_Source_ready,
				Avalon_ST_Sink_ready => Avalon_ST_Sink_ready,
				Avalon_ST_Sink_startofpacket => Avalon_ST_Sink_startofpacket,
				Avalon_ST_Source_endofpacket => Avalon_ST_Source_endofpacket,
				Avalon_ST_Source_data => Avalon_ST_Source_data);
end architecture rtl;
