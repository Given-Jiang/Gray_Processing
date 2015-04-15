-- Gray_Processing_GN.vhd

-- Generated using ACDS version 13.1 162 at 2015.02.12.11:11:33

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Gray_Processing_GN is
	port (
		Avalon_ST_Source_data          : out std_logic_vector(23 downto 0);                    --          Avalon_ST_Source_data.wire
		Avalon_ST_Source_startofpacket : out std_logic;                                        -- Avalon_ST_Source_startofpacket.wire
		Avalon_ST_Source_valid         : out std_logic;                                        --         Avalon_ST_Source_valid.wire
		Avalon_ST_Sink_valid           : in  std_logic                     := '0';             --           Avalon_ST_Sink_valid.wire
		Avalon_ST_Sink_startofpacket   : in  std_logic                     := '0';             --   Avalon_ST_Sink_startofpacket.wire
		Avalon_ST_Sink_ready           : out std_logic;                                        --           Avalon_ST_Sink_ready.wire
		Avalon_ST_Sink_data            : in  std_logic_vector(23 downto 0) := (others => '0'); --            Avalon_ST_Sink_data.wire
		Avalon_ST_Sink_endofpacket     : in  std_logic                     := '0';             --     Avalon_ST_Sink_endofpacket.wire
		Avalon_ST_Source_ready         : in  std_logic                     := '0';             --         Avalon_ST_Source_ready.wire
		Clock                          : in  std_logic                     := '0';             --                          Clock.clk
		aclr                           : in  std_logic                     := '0';             --                               .reset_n
		Avalon_ST_Source_endofpacket   : out std_logic                                         --   Avalon_ST_Source_endofpacket.wire
	);
end entity Gray_Processing_GN;

architecture rtl of Gray_Processing_GN is
	component alt_dspbuilder_clock_GNF343OQUJ is
		port (
			aclr      : in  std_logic := 'X'; -- reset
			aclr_n    : in  std_logic := 'X'; -- reset_n
			aclr_out  : out std_logic;        -- reset
			clock     : in  std_logic := 'X'; -- clk
			clock_out : out std_logic         -- clk
		);
	end component alt_dspbuilder_clock_GNF343OQUJ;

	component alt_dspbuilder_port_GNOC3SGKQJ is
		port (
			input  : in  std_logic_vector(23 downto 0) := (others => 'X'); -- wire
			output : out std_logic_vector(23 downto 0)                     -- wire
		);
	end component alt_dspbuilder_port_GNOC3SGKQJ;

	component alt_dspbuilder_port_GN37ALZBS4 is
		port (
			input  : in  std_logic := 'X'; -- wire
			output : out std_logic         -- wire
		);
	end component alt_dspbuilder_port_GN37ALZBS4;

	component Gray_Processing_GN_Gray_Processing_Gray_Processing_Module is
		port (
			data_out : out std_logic_vector(23 downto 0);                    -- wire
			sop      : in  std_logic                     := 'X';             -- wire
			eop      : in  std_logic                     := 'X';             -- wire
			Clock    : in  std_logic                     := 'X';             -- clk
			aclr     : in  std_logic                     := 'X';             -- reset
			data_in  : in  std_logic_vector(23 downto 0) := (others => 'X')  -- wire
		);
	end component Gray_Processing_GN_Gray_Processing_Gray_Processing_Module;

	signal avalon_st_sink_valid_0_output_wire                     : std_logic;                     -- Avalon_ST_Sink_valid_0:output -> Avalon_ST_Source_valid_0:input
	signal avalon_st_sink_startofpacket_0_output_wire             : std_logic;                     -- Avalon_ST_Sink_startofpacket_0:output -> [Avalon_ST_Source_startofpacket_0:input, Gray_Processing_Gray_Processing_Module_0:sop]
	signal avalon_st_sink_endofpacket_0_output_wire               : std_logic;                     -- Avalon_ST_Sink_endofpacket_0:output -> [Avalon_ST_Source_endofpacket_0:input, Gray_Processing_Gray_Processing_Module_0:eop]
	signal avalon_st_source_ready_0_output_wire                   : std_logic;                     -- Avalon_ST_Source_ready_0:output -> Avalon_ST_Sink_ready_0:input
	signal avalon_st_sink_data_0_output_wire                      : std_logic_vector(23 downto 0); -- Avalon_ST_Sink_data_0:output -> Gray_Processing_Gray_Processing_Module_0:data_in
	signal gray_processing_gray_processing_module_0_data_out_wire : std_logic_vector(23 downto 0); -- Gray_Processing_Gray_Processing_Module_0:data_out -> Avalon_ST_Source_data_0:input
	signal clock_0_clock_output_reset                             : std_logic;                     -- Clock_0:aclr_out -> Gray_Processing_Gray_Processing_Module_0:aclr
	signal clock_0_clock_output_clk                               : std_logic;                     -- Clock_0:clock_out -> Gray_Processing_Gray_Processing_Module_0:Clock

begin

	clock_0 : component alt_dspbuilder_clock_GNF343OQUJ
		port map (
			clock_out => clock_0_clock_output_clk,   -- clock_output.clk
			aclr_out  => clock_0_clock_output_reset, --             .reset
			clock     => Clock,                      --        clock.clk
			aclr_n    => aclr                        --             .reset_n
		);

	avalon_st_sink_data_0 : component alt_dspbuilder_port_GNOC3SGKQJ
		port map (
			input  => Avalon_ST_Sink_data,               --  input.wire
			output => avalon_st_sink_data_0_output_wire  -- output.wire
		);

	avalon_st_sink_endofpacket_0 : component alt_dspbuilder_port_GN37ALZBS4
		port map (
			input  => Avalon_ST_Sink_endofpacket,               --  input.wire
			output => avalon_st_sink_endofpacket_0_output_wire  -- output.wire
		);

	gray_processing_gray_processing_module_0 : component Gray_Processing_GN_Gray_Processing_Gray_Processing_Module
		port map (
			data_out => gray_processing_gray_processing_module_0_data_out_wire, -- data_out.wire
			sop      => avalon_st_sink_startofpacket_0_output_wire,             --      sop.wire
			eop      => avalon_st_sink_endofpacket_0_output_wire,               --      eop.wire
			Clock    => clock_0_clock_output_clk,                               --    Clock.clk
			aclr     => clock_0_clock_output_reset,                             --         .reset
			data_in  => avalon_st_sink_data_0_output_wire                       --  data_in.wire
		);

	avalon_st_source_valid_0 : component alt_dspbuilder_port_GN37ALZBS4
		port map (
			input  => avalon_st_sink_valid_0_output_wire, --  input.wire
			output => Avalon_ST_Source_valid              -- output.wire
		);

	avalon_st_sink_valid_0 : component alt_dspbuilder_port_GN37ALZBS4
		port map (
			input  => Avalon_ST_Sink_valid,               --  input.wire
			output => avalon_st_sink_valid_0_output_wire  -- output.wire
		);

	avalon_st_source_endofpacket_0 : component alt_dspbuilder_port_GN37ALZBS4
		port map (
			input  => avalon_st_sink_endofpacket_0_output_wire, --  input.wire
			output => Avalon_ST_Source_endofpacket              -- output.wire
		);

	avalon_st_source_startofpacket_0 : component alt_dspbuilder_port_GN37ALZBS4
		port map (
			input  => avalon_st_sink_startofpacket_0_output_wire, --  input.wire
			output => Avalon_ST_Source_startofpacket              -- output.wire
		);

	avalon_st_source_ready_0 : component alt_dspbuilder_port_GN37ALZBS4
		port map (
			input  => Avalon_ST_Source_ready,               --  input.wire
			output => avalon_st_source_ready_0_output_wire  -- output.wire
		);

	avalon_st_sink_ready_0 : component alt_dspbuilder_port_GN37ALZBS4
		port map (
			input  => avalon_st_source_ready_0_output_wire, --  input.wire
			output => Avalon_ST_Sink_ready                  -- output.wire
		);

	avalon_st_sink_startofpacket_0 : component alt_dspbuilder_port_GN37ALZBS4
		port map (
			input  => Avalon_ST_Sink_startofpacket,               --  input.wire
			output => avalon_st_sink_startofpacket_0_output_wire  -- output.wire
		);

	avalon_st_source_data_0 : component alt_dspbuilder_port_GNOC3SGKQJ
		port map (
			input  => gray_processing_gray_processing_module_0_data_out_wire, --  input.wire
			output => Avalon_ST_Source_data                                   -- output.wire
		);

end architecture rtl; -- of Gray_Processing_GN
