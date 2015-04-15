-- tb_Gray_Processing.vhd

-- Generated using ACDS version 13.1 162 at 2015.02.12.11:11:33

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_Gray_Processing is
end entity tb_Gray_Processing;

architecture rtl of tb_Gray_Processing is
	component Gray_Processing_GN is
		port (
			Clock                          : in  std_logic                     := 'X';             -- clk
			aclr                           : in  std_logic                     := 'X';             -- reset_n
			Avalon_ST_Sink_data            : in  std_logic_vector(23 downto 0) := (others => 'X'); -- wire
			Avalon_ST_Sink_endofpacket     : in  std_logic                     := 'X';             -- wire
			Avalon_ST_Source_valid         : out std_logic;                                        -- wire
			Avalon_ST_Sink_valid           : in  std_logic                     := 'X';             -- wire
			Avalon_ST_Source_endofpacket   : out std_logic;                                        -- wire
			Avalon_ST_Source_startofpacket : out std_logic;                                        -- wire
			Avalon_ST_Source_ready         : in  std_logic                     := 'X';             -- wire
			Avalon_ST_Sink_ready           : out std_logic;                                        -- wire
			Avalon_ST_Sink_startofpacket   : in  std_logic                     := 'X';             -- wire
			Avalon_ST_Source_data          : out std_logic_vector(23 downto 0)                     -- wire
		);
	end component Gray_Processing_GN;

	component alt_dspbuilder_testbench_clock_GNCGUFKHRR is
		generic (
			SIMULATION_START_CYCLE       : natural := 4;
			RESET_LATENCY                : natural := 0;
			RESET_REGISTER_CASCADE_DEPTH : natural := 0
		);
		port (
			aclr_out     : out std_logic;  -- reset
			clock_out    : out std_logic;  -- clk
			reg_aclr_out : out std_logic;  -- reset
			tb_aclr      : out std_logic   -- reset
		);
	end component alt_dspbuilder_testbench_clock_GNCGUFKHRR;

	component alt_dspbuilder_testbench_salt_GNOXVOQUET is
		generic (
			XFILE : string := "default"
		);
		port (
			clock  : in  std_logic                     := 'X'; -- clk
			aclr   : in  std_logic                     := 'X'; -- reset
			output : out std_logic_vector(23 downto 0)         -- wire
		);
	end component alt_dspbuilder_testbench_salt_GNOXVOQUET;

	component alt_dspbuilder_testbench_salt_GNDBMPYDND is
		generic (
			XFILE : string := "default"
		);
		port (
			clock  : in  std_logic := 'X'; -- clk
			aclr   : in  std_logic := 'X'; -- reset
			output : out std_logic         -- wire
		);
	end component alt_dspbuilder_testbench_salt_GNDBMPYDND;

	component alt_dspbuilder_testbench_capture_GNQX2JTRTZ is
		generic (
			XFILE    : string := "default";
			DSPBTYPE : string := ""
		);
		port (
			clock : in std_logic := 'X'; -- clk
			aclr  : in std_logic := 'X'; -- reset
			input : in std_logic := 'X'  -- wire
		);
	end component alt_dspbuilder_testbench_capture_GNQX2JTRTZ;

	component alt_dspbuilder_testbench_capture_GNHCRI5YMO is
		generic (
			XFILE    : string := "default";
			DSPBTYPE : string := ""
		);
		port (
			clock : in std_logic                     := 'X';             -- clk
			aclr  : in std_logic                     := 'X';             -- reset
			input : in std_logic_vector(23 downto 0) := (others => 'X')  -- wire
		);
	end component alt_dspbuilder_testbench_capture_GNHCRI5YMO;

	signal salt_avalon_st_sink_data_output_wire          : std_logic_vector(23 downto 0); -- salt_Avalon_ST_Sink_data:output -> dut:Avalon_ST_Sink_data
	signal clock_clock_tb_reset                          : std_logic;                     -- Clock:tb_aclr -> [salt_Avalon_ST_Sink_data:aclr, salt_Avalon_ST_Sink_endofpacket:aclr, salt_Avalon_ST_Sink_startofpacket:aclr, salt_Avalon_ST_Sink_valid:aclr, salt_Avalon_ST_Source_ready:aclr]
	signal clock_clock_tb_clk                            : std_logic;                     -- Clock:clock_out -> [capture_Avalon_ST_Sink_ready:clock, capture_Avalon_ST_Source_data:clock, capture_Avalon_ST_Source_endofpacket:clock, capture_Avalon_ST_Source_startofpacket:clock, capture_Avalon_ST_Source_valid:clock, dut:Clock, salt_Avalon_ST_Sink_data:clock, salt_Avalon_ST_Sink_endofpacket:clock, salt_Avalon_ST_Sink_startofpacket:clock, salt_Avalon_ST_Sink_valid:clock, salt_Avalon_ST_Source_ready:clock]
	signal salt_avalon_st_sink_endofpacket_output_wire   : std_logic;                     -- salt_Avalon_ST_Sink_endofpacket:output -> dut:Avalon_ST_Sink_endofpacket
	signal salt_avalon_st_sink_valid_output_wire         : std_logic;                     -- salt_Avalon_ST_Sink_valid:output -> dut:Avalon_ST_Sink_valid
	signal salt_avalon_st_source_ready_output_wire       : std_logic;                     -- salt_Avalon_ST_Source_ready:output -> dut:Avalon_ST_Source_ready
	signal salt_avalon_st_sink_startofpacket_output_wire : std_logic;                     -- salt_Avalon_ST_Sink_startofpacket:output -> dut:Avalon_ST_Sink_startofpacket
	signal dut_avalon_st_source_valid_wire               : std_logic;                     -- dut:Avalon_ST_Source_valid -> capture_Avalon_ST_Source_valid:input
	signal clock_clock_reg_reset_reset                   : std_logic;                     -- Clock:reg_aclr_out -> [capture_Avalon_ST_Sink_ready:aclr, capture_Avalon_ST_Source_data:aclr, capture_Avalon_ST_Source_endofpacket:aclr, capture_Avalon_ST_Source_startofpacket:aclr, capture_Avalon_ST_Source_valid:aclr]
	signal dut_avalon_st_source_endofpacket_wire         : std_logic;                     -- dut:Avalon_ST_Source_endofpacket -> capture_Avalon_ST_Source_endofpacket:input
	signal dut_avalon_st_source_startofpacket_wire       : std_logic;                     -- dut:Avalon_ST_Source_startofpacket -> capture_Avalon_ST_Source_startofpacket:input
	signal dut_avalon_st_sink_ready_wire                 : std_logic;                     -- dut:Avalon_ST_Sink_ready -> capture_Avalon_ST_Sink_ready:input
	signal dut_avalon_st_source_data_wire                : std_logic_vector(23 downto 0); -- dut:Avalon_ST_Source_data -> capture_Avalon_ST_Source_data:input
	signal clock_clock_output_reset                      : std_logic;                     -- Clock:aclr_out -> clock_clock_output_reset:in
	signal clock_clock_output_reset_ports_inv            : std_logic;                     -- clock_clock_output_reset:inv -> dut:aclr

begin

	dut : component Gray_Processing_GN
		port map (
			Clock                          => clock_clock_tb_clk,                            --                          Clock.clk
			aclr                           => clock_clock_output_reset_ports_inv,            --                               .reset_n
			Avalon_ST_Sink_data            => salt_avalon_st_sink_data_output_wire,          --            Avalon_ST_Sink_data.wire
			Avalon_ST_Sink_endofpacket     => salt_avalon_st_sink_endofpacket_output_wire,   --     Avalon_ST_Sink_endofpacket.wire
			Avalon_ST_Source_valid         => dut_avalon_st_source_valid_wire,               --         Avalon_ST_Source_valid.wire
			Avalon_ST_Sink_valid           => salt_avalon_st_sink_valid_output_wire,         --           Avalon_ST_Sink_valid.wire
			Avalon_ST_Source_endofpacket   => dut_avalon_st_source_endofpacket_wire,         --   Avalon_ST_Source_endofpacket.wire
			Avalon_ST_Source_startofpacket => dut_avalon_st_source_startofpacket_wire,       -- Avalon_ST_Source_startofpacket.wire
			Avalon_ST_Source_ready         => salt_avalon_st_source_ready_output_wire,       --         Avalon_ST_Source_ready.wire
			Avalon_ST_Sink_ready           => dut_avalon_st_sink_ready_wire,                 --           Avalon_ST_Sink_ready.wire
			Avalon_ST_Sink_startofpacket   => salt_avalon_st_sink_startofpacket_output_wire, --   Avalon_ST_Sink_startofpacket.wire
			Avalon_ST_Source_data          => dut_avalon_st_source_data_wire                 --          Avalon_ST_Source_data.wire
		);

	clock : component alt_dspbuilder_testbench_clock_GNCGUFKHRR
		generic map (
			SIMULATION_START_CYCLE       => 5,
			RESET_LATENCY                => 0,
			RESET_REGISTER_CASCADE_DEPTH => 0
		)
		port map (
			clock_out    => clock_clock_tb_clk,          --        clock_tb.clk
			tb_aclr      => clock_clock_tb_reset,        --                .reset
			aclr_out     => clock_clock_output_reset,    --    clock_output.reset
			reg_aclr_out => clock_clock_reg_reset_reset  -- clock_reg_reset.reset
		);

	salt_avalon_st_sink_data : component alt_dspbuilder_testbench_salt_GNOXVOQUET
		generic map (
			XFILE => "Gray%5FProcessing_Avalon-ST+Sink_data.salt"
		)
		port map (
			clock  => clock_clock_tb_clk,                   -- clock_aclr.clk
			aclr   => clock_clock_tb_reset,                 --           .reset
			output => salt_avalon_st_sink_data_output_wire  --     output.wire
		);

	salt_avalon_st_sink_endofpacket : component alt_dspbuilder_testbench_salt_GNDBMPYDND
		generic map (
			XFILE => "Gray%5FProcessing_Avalon-ST+Sink_endofpacket.salt"
		)
		port map (
			clock  => clock_clock_tb_clk,                          -- clock_aclr.clk
			aclr   => clock_clock_tb_reset,                        --           .reset
			output => salt_avalon_st_sink_endofpacket_output_wire  --     output.wire
		);

	salt_avalon_st_sink_valid : component alt_dspbuilder_testbench_salt_GNDBMPYDND
		generic map (
			XFILE => "Gray%5FProcessing_Avalon-ST+Sink_valid.salt"
		)
		port map (
			clock  => clock_clock_tb_clk,                    -- clock_aclr.clk
			aclr   => clock_clock_tb_reset,                  --           .reset
			output => salt_avalon_st_sink_valid_output_wire  --     output.wire
		);

	salt_avalon_st_source_ready : component alt_dspbuilder_testbench_salt_GNDBMPYDND
		generic map (
			XFILE => "Gray%5FProcessing_Avalon-ST+Source_ready.salt"
		)
		port map (
			clock  => clock_clock_tb_clk,                      -- clock_aclr.clk
			aclr   => clock_clock_tb_reset,                    --           .reset
			output => salt_avalon_st_source_ready_output_wire  --     output.wire
		);

	salt_avalon_st_sink_startofpacket : component alt_dspbuilder_testbench_salt_GNDBMPYDND
		generic map (
			XFILE => "Gray%5FProcessing_Avalon-ST+Sink_startofpacket.salt"
		)
		port map (
			clock  => clock_clock_tb_clk,                            -- clock_aclr.clk
			aclr   => clock_clock_tb_reset,                          --           .reset
			output => salt_avalon_st_sink_startofpacket_output_wire  --     output.wire
		);

	capture_avalon_st_source_valid : component alt_dspbuilder_testbench_capture_GNQX2JTRTZ
		generic map (
			XFILE    => "Gray%5FProcessing_Avalon-ST+Source_valid.capture.msim",
			DSPBTYPE => "BIT [1, 0]"
		)
		port map (
			clock => clock_clock_tb_clk,              -- clock_aclr.clk
			aclr  => clock_clock_reg_reset_reset,     --           .reset
			input => dut_avalon_st_source_valid_wire  --      input.wire
		);

	capture_avalon_st_source_endofpacket : component alt_dspbuilder_testbench_capture_GNQX2JTRTZ
		generic map (
			XFILE    => "Gray%5FProcessing_Avalon-ST+Source_endofpacket.capture.msim",
			DSPBTYPE => "BIT [1, 0]"
		)
		port map (
			clock => clock_clock_tb_clk,                    -- clock_aclr.clk
			aclr  => clock_clock_reg_reset_reset,           --           .reset
			input => dut_avalon_st_source_endofpacket_wire  --      input.wire
		);

	capture_avalon_st_source_startofpacket : component alt_dspbuilder_testbench_capture_GNQX2JTRTZ
		generic map (
			XFILE    => "Gray%5FProcessing_Avalon-ST+Source_startofpacket.capture.msim",
			DSPBTYPE => "BIT [1, 0]"
		)
		port map (
			clock => clock_clock_tb_clk,                      -- clock_aclr.clk
			aclr  => clock_clock_reg_reset_reset,             --           .reset
			input => dut_avalon_st_source_startofpacket_wire  --      input.wire
		);

	capture_avalon_st_sink_ready : component alt_dspbuilder_testbench_capture_GNQX2JTRTZ
		generic map (
			XFILE    => "Gray%5FProcessing_Avalon-ST+Sink_ready.capture.msim",
			DSPBTYPE => "BIT [1, 0]"
		)
		port map (
			clock => clock_clock_tb_clk,            -- clock_aclr.clk
			aclr  => clock_clock_reg_reset_reset,   --           .reset
			input => dut_avalon_st_sink_ready_wire  --      input.wire
		);

	capture_avalon_st_source_data : component alt_dspbuilder_testbench_capture_GNHCRI5YMO
		generic map (
			XFILE    => "Gray%5FProcessing_Avalon-ST+Source_data.capture.msim",
			DSPBTYPE => "UINT [24, 0]"
		)
		port map (
			clock => clock_clock_tb_clk,             -- clock_aclr.clk
			aclr  => clock_clock_reg_reset_reset,    --           .reset
			input => dut_avalon_st_source_data_wire  --      input.wire
		);

	clock_clock_output_reset_ports_inv <= not clock_clock_output_reset;

end architecture rtl; -- of tb_Gray_Processing
