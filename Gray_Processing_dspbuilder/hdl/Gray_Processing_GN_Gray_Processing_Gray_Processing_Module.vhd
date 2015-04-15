-- Gray_Processing_GN_Gray_Processing_Gray_Processing_Module.vhd

-- Generated using ACDS version 13.1 162 at 2015.02.27.10:14:00

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Gray_Processing_GN_Gray_Processing_Gray_Processing_Module is
	port (
		eop      : in  std_logic                     := '0';             --      eop.wire
		Clock    : in  std_logic                     := '0';             --    Clock.clk
		aclr     : in  std_logic                     := '0';             --         .reset
		data_in  : in  std_logic_vector(23 downto 0) := (others => '0'); --  data_in.wire
		data_out : out std_logic_vector(23 downto 0);                    -- data_out.wire
		sop      : in  std_logic                     := '0'              --      sop.wire
	);
end entity Gray_Processing_GN_Gray_Processing_Gray_Processing_Module;

architecture rtl of Gray_Processing_GN_Gray_Processing_Gray_Processing_Module is
	component alt_dspbuilder_clock_GNQFU4PUDH is
		port (
			aclr      : in  std_logic := 'X'; -- reset
			aclr_n    : in  std_logic := 'X'; -- reset_n
			aclr_out  : out std_logic;        -- reset
			clock     : in  std_logic := 'X'; -- clk
			clock_out : out std_logic         -- clk
		);
	end component alt_dspbuilder_clock_GNQFU4PUDH;

	component alt_dspbuilder_cast_GNKXX25S2S is
		generic (
			round    : natural := 0;
			saturate : natural := 0
		);
		port (
			input  : in  std_logic_vector(23 downto 0) := (others => 'X'); -- wire
			output : out std_logic_vector(7 downto 0)                      -- wire
		);
	end component alt_dspbuilder_cast_GNKXX25S2S;

	component alt_dspbuilder_cast_GN6OMCQQS7 is
		generic (
			round    : natural := 0;
			saturate : natural := 0
		);
		port (
			input  : in  std_logic_vector(23 downto 0) := (others => 'X'); -- wire
			output : out std_logic_vector(7 downto 0)                      -- wire
		);
	end component alt_dspbuilder_cast_GN6OMCQQS7;

	component alt_dspbuilder_cast_GN7IAAYCSZ is
		generic (
			round    : natural := 0;
			saturate : natural := 0
		);
		port (
			input  : in  std_logic_vector(23 downto 0) := (others => 'X'); -- wire
			output : out std_logic_vector(7 downto 0)                      -- wire
		);
	end component alt_dspbuilder_cast_GN7IAAYCSZ;

	component alt_dspbuilder_logical_bit_op_GNA5ZFEL7V is
		generic (
			LogicalOp     : string   := "AltAND";
			number_inputs : positive := 2
		);
		port (
			result : out std_logic;        -- wire
			data0  : in  std_logic := 'X'; -- wire
			data1  : in  std_logic := 'X'  -- wire
		);
	end component alt_dspbuilder_logical_bit_op_GNA5ZFEL7V;

	component alt_dspbuilder_barrelshifter_GNV5DVAGHT is
		generic (
			DISTANCE_WIDTH          : natural := 3;
			NDIRECTION              : natural := 0;
			SIGNED                  : integer := 1;
			use_dedicated_circuitry : string  := "false";
			PIPELINE                : natural := 0;
			WIDTH                   : natural := 8
		);
		port (
			a         : in  std_logic_vector(WIDTH-1 downto 0)          := (others => 'X'); -- wire
			aclr      : in  std_logic                                   := 'X';             -- clk
			clock     : in  std_logic                                   := 'X';             -- clk
			direction : in  std_logic                                   := 'X';             -- wire
			distance  : in  std_logic_vector(DISTANCE_WIDTH-1 downto 0) := (others => 'X'); -- wire
			ena       : in  std_logic                                   := 'X';             -- wire
			r         : out std_logic_vector(WIDTH-1 downto 0);                             -- wire
			user_aclr : in  std_logic                                   := 'X'              -- wire
		);
	end component alt_dspbuilder_barrelshifter_GNV5DVAGHT;

	component alt_dspbuilder_gnd_GN is
		port (
			output : out std_logic   -- wire
		);
	end component alt_dspbuilder_gnd_GN;

	component alt_dspbuilder_vcc_GN is
		port (
			output : out std_logic   -- wire
		);
	end component alt_dspbuilder_vcc_GN;

	component alt_dspbuilder_multiply_add_GNKLXFKAO3 is
		generic (
			family                  : string  := "Stratix";
			direction               : string  := "AddAdd";
			data3b_const            : string  := "00000000";
			data2b_const            : string  := "00000000";
			representation          : string  := "SIGNED";
			dataWidth               : integer := 8;
			data4b_const            : string  := "00000000";
			number_multipliers      : integer := 2;
			pipeline_register       : string  := "NoRegister";
			use_dedicated_circuitry : integer := 0;
			data1b_const            : string  := "00000000";
			use_b_consts            : natural := 0
		);
		port (
			clock     : in  std_logic                     := 'X';             -- clk
			aclr      : in  std_logic                     := 'X';             -- reset
			data1a    : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- wire
			data2a    : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- wire
			data3a    : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- wire
			result    : out std_logic_vector(17 downto 0);                    -- wire
			user_aclr : in  std_logic                     := 'X';             -- wire
			ena       : in  std_logic                     := 'X'              -- wire
		);
	end component alt_dspbuilder_multiply_add_GNKLXFKAO3;

	component alt_dspbuilder_multiplexer_GNCALBUTDR is
		generic (
			HDLTYPE                : string   := "STD_LOGIC_VECTOR";
			use_one_hot_select_bus : natural  := 0;
			width                  : positive := 8;
			pipeline               : natural  := 0;
			number_inputs          : natural  := 4
		);
		port (
			clock     : in  std_logic                     := 'X';             -- clk
			aclr      : in  std_logic                     := 'X';             -- reset
			sel       : in  std_logic_vector(0 downto 0)  := (others => 'X'); -- wire
			result    : out std_logic_vector(23 downto 0);                    -- wire
			ena       : in  std_logic                     := 'X';             -- wire
			user_aclr : in  std_logic                     := 'X';             -- wire
			in0       : in  std_logic_vector(23 downto 0) := (others => 'X'); -- wire
			in1       : in  std_logic_vector(23 downto 0) := (others => 'X')  -- wire
		);
	end component alt_dspbuilder_multiplexer_GNCALBUTDR;

	component alt_dspbuilder_cast_GNJGR7GQ2L is
		generic (
			round    : natural := 0;
			saturate : natural := 0
		);
		port (
			input  : in  std_logic_vector(17 downto 0) := (others => 'X'); -- wire
			output : out std_logic_vector(7 downto 0)                      -- wire
		);
	end component alt_dspbuilder_cast_GNJGR7GQ2L;

	component alt_dspbuilder_constant_GNZEH3JAKA is
		generic (
			HDLTYPE    : string  := "STD_LOGIC_VECTOR";
			BitPattern : string  := "0000";
			width      : natural := 4
		);
		port (
			output : out std_logic_vector(23 downto 0)   -- wire
		);
	end component alt_dspbuilder_constant_GNZEH3JAKA;

	component alt_dspbuilder_if_statement_GN7VA7SRUP is
		generic (
			use_else_output : natural := 0;
			bwr             : natural := 0;
			use_else_input  : natural := 0;
			signed          : natural := 1;
			HDLTYPE         : string  := "STD_LOGIC_VECTOR";
			if_expression   : string  := "a";
			number_inputs   : integer := 1;
			width           : natural := 8
		);
		port (
			true : out std_logic;                                        -- wire
			a    : in  std_logic_vector(23 downto 0) := (others => 'X'); -- wire
			b    : in  std_logic_vector(23 downto 0) := (others => 'X'); -- wire
			c    : in  std_logic_vector(23 downto 0) := (others => 'X')  -- wire
		);
	end component alt_dspbuilder_if_statement_GN7VA7SRUP;

	component alt_dspbuilder_port_GN37ALZBS4 is
		port (
			input  : in  std_logic := 'X'; -- wire
			output : out std_logic         -- wire
		);
	end component alt_dspbuilder_port_GN37ALZBS4;

	component alt_dspbuilder_bus_concat_GN55ETJ4VI is
		generic (
			widthB : natural := 8;
			widthA : natural := 8
		);
		port (
			a      : in  std_logic_vector(widthA-1 downto 0)        := (others => 'X'); -- wire
			aclr   : in  std_logic                                  := 'X';             -- clk
			b      : in  std_logic_vector(widthB-1 downto 0)        := (others => 'X'); -- wire
			clock  : in  std_logic                                  := 'X';             -- clk
			output : out std_logic_vector(widthA+widthB-1 downto 0)                     -- wire
		);
	end component alt_dspbuilder_bus_concat_GN55ETJ4VI;

	component alt_dspbuilder_delay_GNHYCSAEGT is
		generic (
			ClockPhase : string   := "1";
			delay      : positive := 1;
			use_init   : natural  := 0;
			BitPattern : string   := "00000001";
			width      : positive := 8
		);
		port (
			aclr   : in  std_logic                          := 'X';             -- clk
			clock  : in  std_logic                          := 'X';             -- clk
			ena    : in  std_logic                          := 'X';             -- wire
			input  : in  std_logic_vector(width-1 downto 0) := (others => 'X'); -- wire
			output : out std_logic_vector(width-1 downto 0);                    -- wire
			sclr   : in  std_logic                          := 'X'              -- wire
		);
	end component alt_dspbuilder_delay_GNHYCSAEGT;

	component alt_dspbuilder_bus_concat_GNIIOZRPJD is
		generic (
			widthB : natural := 8;
			widthA : natural := 8
		);
		port (
			a      : in  std_logic_vector(widthA-1 downto 0)        := (others => 'X'); -- wire
			aclr   : in  std_logic                                  := 'X';             -- clk
			b      : in  std_logic_vector(widthB-1 downto 0)        := (others => 'X'); -- wire
			clock  : in  std_logic                                  := 'X';             -- clk
			output : out std_logic_vector(widthA+widthB-1 downto 0)                     -- wire
		);
	end component alt_dspbuilder_bus_concat_GNIIOZRPJD;

	component alt_dspbuilder_constant_GNNKZSYI73 is
		generic (
			HDLTYPE    : string  := "STD_LOGIC_VECTOR";
			BitPattern : string  := "0000";
			width      : natural := 4
		);
		port (
			output : out std_logic_vector(23 downto 0)   -- wire
		);
	end component alt_dspbuilder_constant_GNNKZSYI73;

	component alt_dspbuilder_delay_GNUECIBFDH is
		generic (
			ClockPhase : string   := "1";
			delay      : positive := 1;
			use_init   : natural  := 0;
			BitPattern : string   := "00000001";
			width      : positive := 8
		);
		port (
			aclr   : in  std_logic                          := 'X';             -- clk
			clock  : in  std_logic                          := 'X';             -- clk
			ena    : in  std_logic                          := 'X';             -- wire
			input  : in  std_logic_vector(width-1 downto 0) := (others => 'X'); -- wire
			output : out std_logic_vector(width-1 downto 0);                    -- wire
			sclr   : in  std_logic                          := 'X'              -- wire
		);
	end component alt_dspbuilder_delay_GNUECIBFDH;

	component alt_dspbuilder_constant_GNPXZ5JSVR is
		generic (
			HDLTYPE    : string  := "STD_LOGIC_VECTOR";
			BitPattern : string  := "0000";
			width      : natural := 4
		);
		port (
			output : out std_logic_vector(3 downto 0)   -- wire
		);
	end component alt_dspbuilder_constant_GNPXZ5JSVR;

	component alt_dspbuilder_port_GNOC3SGKQJ is
		port (
			input  : in  std_logic_vector(23 downto 0) := (others => 'X'); -- wire
			output : out std_logic_vector(23 downto 0)                     -- wire
		);
	end component alt_dspbuilder_port_GNOC3SGKQJ;

	component alt_dspbuilder_cast_GNSB3OXIQS is
		generic (
			round    : natural := 0;
			saturate : natural := 0
		);
		port (
			input  : in  std_logic_vector(0 downto 0) := (others => 'X'); -- wire
			output : out std_logic                                        -- wire
		);
	end component alt_dspbuilder_cast_GNSB3OXIQS;

	component alt_dspbuilder_cast_GN46N4UJ5S is
		generic (
			round    : natural := 0;
			saturate : natural := 0
		);
		port (
			input  : in  std_logic                    := 'X'; -- wire
			output : out std_logic_vector(0 downto 0)         -- wire
		);
	end component alt_dspbuilder_cast_GN46N4UJ5S;

	signal barrel_shifteruser_aclrgnd_output_wire : std_logic;                     -- Barrel_Shifteruser_aclrGND:output -> Barrel_Shifter:user_aclr
	signal barrel_shifterenavcc_output_wire       : std_logic;                     -- Barrel_ShifterenaVCC:output -> Barrel_Shifter:ena
	signal multiply_adduser_aclrgnd_output_wire   : std_logic;                     -- Multiply_Adduser_aclrGND:output -> Multiply_Add:user_aclr
	signal multiply_addenavcc_output_wire         : std_logic;                     -- Multiply_AddenaVCC:output -> Multiply_Add:ena
	signal multiplexeruser_aclrgnd_output_wire    : std_logic;                     -- Multiplexeruser_aclrGND:output -> Multiplexer:user_aclr
	signal multiplexerenavcc_output_wire          : std_logic;                     -- MultiplexerenaVCC:output -> Multiplexer:ena
	signal delay1sclrgnd_output_wire              : std_logic;                     -- Delay1sclrGND:output -> Delay1:sclr
	signal delay1enavcc_output_wire               : std_logic;                     -- Delay1enaVCC:output -> Delay1:ena
	signal delay2sclrgnd_output_wire              : std_logic;                     -- Delay2sclrGND:output -> Delay2:sclr
	signal delay2enavcc_output_wire               : std_logic;                     -- Delay2enaVCC:output -> Delay2:ena
	signal bus_concatenation_output_wire          : std_logic_vector(15 downto 0); -- Bus_Concatenation:output -> Bus_Concatenation1:b
	signal barrel_shifter_r_wire                  : std_logic_vector(17 downto 0); -- Barrel_Shifter:r -> Bus_Conversion:input
	signal bus_conversion_output_wire             : std_logic_vector(7 downto 0);  -- Bus_Conversion:output -> [Bus_Concatenation1:a, Bus_Concatenation:a, Bus_Concatenation:b]
	signal data_in_0_output_wire                  : std_logic_vector(23 downto 0); -- data_in_0:output -> [Bus_Conversion1:input, Bus_Conversion2:input, Bus_Conversion3:input, If_Statement1:a, Multiplexer:in0]
	signal constant1_output_wire                  : std_logic_vector(3 downto 0);  -- Constant1:output -> Barrel_Shifter:distance
	signal delay2_output_wire                     : std_logic_vector(0 downto 0);  -- Delay2:output -> [Delay:input, cast1:input]
	signal constant3_output_wire                  : std_logic_vector(23 downto 0); -- Constant3:output -> If_Statement1:b
	signal constant4_output_wire                  : std_logic_vector(23 downto 0); -- Constant4:output -> If_Statement1:c
	signal if_statement1_true_wire                : std_logic;                     -- If_Statement1:true -> Logical_Bit_Operator:data0
	signal sop_0_output_wire                      : std_logic;                     -- sop_0:output -> Logical_Bit_Operator:data1
	signal eop_0_output_wire                      : std_logic;                     -- eop_0:output -> Logical_Bit_Operator1:data0
	signal delay_output_wire                      : std_logic_vector(0 downto 0);  -- Delay:output -> [Multiplexer:sel, cast3:input]
	signal bus_concatenation1_output_wire         : std_logic_vector(23 downto 0); -- Bus_Concatenation1:output -> Multiplexer:in1
	signal bus_conversion3_output_wire            : std_logic_vector(7 downto 0);  -- Bus_Conversion3:output -> Multiply_Add:data1a
	signal bus_conversion2_output_wire            : std_logic_vector(7 downto 0);  -- Bus_Conversion2:output -> Multiply_Add:data2a
	signal bus_conversion1_output_wire            : std_logic_vector(7 downto 0);  -- Bus_Conversion1:output -> Multiply_Add:data3a
	signal multiply_add_result_wire               : std_logic_vector(17 downto 0); -- Multiply_Add:result -> Barrel_Shifter:a
	signal multiplexer_result_wire                : std_logic_vector(23 downto 0); -- Multiplexer:result -> data_out_0:input
	signal delay1_output_wire                     : std_logic_vector(0 downto 0);  -- Delay1:output -> cast0:input
	signal cast0_output_wire                      : std_logic;                     -- cast0:output -> Delay:sclr
	signal cast1_output_wire                      : std_logic;                     -- cast1:output -> Delay:ena
	signal logical_bit_operator_result_wire       : std_logic;                     -- Logical_Bit_Operator:result -> cast2:input
	signal cast2_output_wire                      : std_logic_vector(0 downto 0);  -- cast2:output -> Delay2:input
	signal cast3_output_wire                      : std_logic;                     -- cast3:output -> Logical_Bit_Operator1:data1
	signal logical_bit_operator1_result_wire      : std_logic;                     -- Logical_Bit_Operator1:result -> cast4:input
	signal cast4_output_wire                      : std_logic_vector(0 downto 0);  -- cast4:output -> Delay1:input
	signal clock_0_clock_output_reset             : std_logic;                     -- Clock_0:aclr_out -> [Barrel_Shifter:aclr, Bus_Concatenation1:aclr, Bus_Concatenation:aclr, Delay1:aclr, Delay2:aclr, Delay:aclr, Multiplexer:aclr, Multiply_Add:aclr]
	signal clock_0_clock_output_clk               : std_logic;                     -- Clock_0:clock_out -> [Barrel_Shifter:clock, Bus_Concatenation1:clock, Bus_Concatenation:clock, Delay1:clock, Delay2:clock, Delay:clock, Multiplexer:clock, Multiply_Add:clock]

begin

	clock_0 : component alt_dspbuilder_clock_GNQFU4PUDH
		port map (
			clock_out => clock_0_clock_output_clk,   -- clock_output.clk
			aclr_out  => clock_0_clock_output_reset, --             .reset
			clock     => Clock,                      --        clock.clk
			aclr      => aclr                        --             .reset
		);

	bus_conversion1 : component alt_dspbuilder_cast_GNKXX25S2S
		generic map (
			round    => 0,
			saturate => 0
		)
		port map (
			input  => data_in_0_output_wire,       --  input.wire
			output => bus_conversion1_output_wire  -- output.wire
		);

	bus_conversion2 : component alt_dspbuilder_cast_GN6OMCQQS7
		generic map (
			round    => 0,
			saturate => 0
		)
		port map (
			input  => data_in_0_output_wire,       --  input.wire
			output => bus_conversion2_output_wire  -- output.wire
		);

	bus_conversion3 : component alt_dspbuilder_cast_GN7IAAYCSZ
		generic map (
			round    => 0,
			saturate => 0
		)
		port map (
			input  => data_in_0_output_wire,       --  input.wire
			output => bus_conversion3_output_wire  -- output.wire
		);

	logical_bit_operator : component alt_dspbuilder_logical_bit_op_GNA5ZFEL7V
		generic map (
			LogicalOp     => "AltAND",
			number_inputs => 2
		)
		port map (
			result => logical_bit_operator_result_wire, -- result.wire
			data0  => if_statement1_true_wire,          --  data0.wire
			data1  => sop_0_output_wire                 --  data1.wire
		);

	barrel_shifter : component alt_dspbuilder_barrelshifter_GNV5DVAGHT
		generic map (
			DISTANCE_WIDTH          => 4,
			NDIRECTION              => 1,
			SIGNED                  => 0,
			use_dedicated_circuitry => "false",
			PIPELINE                => 0,
			WIDTH                   => 18
		)
		port map (
			clock     => clock_0_clock_output_clk,               -- clock_aclr.clk
			aclr      => clock_0_clock_output_reset,             --           .reset
			a         => multiply_add_result_wire,               --          a.wire
			r         => barrel_shifter_r_wire,                  --          r.wire
			distance  => constant1_output_wire,                  --   distance.wire
			ena       => barrel_shifterenavcc_output_wire,       --        ena.wire
			user_aclr => barrel_shifteruser_aclrgnd_output_wire  --  user_aclr.wire
		);

	barrel_shifteruser_aclrgnd : component alt_dspbuilder_gnd_GN
		port map (
			output => barrel_shifteruser_aclrgnd_output_wire  -- output.wire
		);

	barrel_shifterenavcc : component alt_dspbuilder_vcc_GN
		port map (
			output => barrel_shifterenavcc_output_wire  -- output.wire
		);

	multiply_add : component alt_dspbuilder_multiply_add_GNKLXFKAO3
		generic map (
			family                  => "Cyclone V",
			direction               => "AddAdd",
			data3b_const            => "00011110",
			data2b_const            => "10010110",
			representation          => "UNSIGNED",
			dataWidth               => 8,
			data4b_const            => "01001100",
			number_multipliers      => 3,
			pipeline_register       => "NoRegister",
			use_dedicated_circuitry => 1,
			data1b_const            => "01001100",
			use_b_consts            => 1
		)
		port map (
			clock     => clock_0_clock_output_clk,             -- clock_aclr.clk
			aclr      => clock_0_clock_output_reset,           --           .reset
			data1a    => bus_conversion3_output_wire,          --     data1a.wire
			data2a    => bus_conversion2_output_wire,          --     data2a.wire
			data3a    => bus_conversion1_output_wire,          --     data3a.wire
			result    => multiply_add_result_wire,             --     result.wire
			user_aclr => multiply_adduser_aclrgnd_output_wire, --  user_aclr.wire
			ena       => multiply_addenavcc_output_wire        --        ena.wire
		);

	multiply_adduser_aclrgnd : component alt_dspbuilder_gnd_GN
		port map (
			output => multiply_adduser_aclrgnd_output_wire  -- output.wire
		);

	multiply_addenavcc : component alt_dspbuilder_vcc_GN
		port map (
			output => multiply_addenavcc_output_wire  -- output.wire
		);

	multiplexer : component alt_dspbuilder_multiplexer_GNCALBUTDR
		generic map (
			HDLTYPE                => "STD_LOGIC_VECTOR",
			use_one_hot_select_bus => 0,
			width                  => 24,
			pipeline               => 0,
			number_inputs          => 2
		)
		port map (
			clock     => clock_0_clock_output_clk,            -- clock_aclr.clk
			aclr      => clock_0_clock_output_reset,          --           .reset
			sel       => delay_output_wire,                   --        sel.wire
			result    => multiplexer_result_wire,             --     result.wire
			ena       => multiplexerenavcc_output_wire,       --        ena.wire
			user_aclr => multiplexeruser_aclrgnd_output_wire, --  user_aclr.wire
			in0       => data_in_0_output_wire,               --        in0.wire
			in1       => bus_concatenation1_output_wire       --        in1.wire
		);

	multiplexeruser_aclrgnd : component alt_dspbuilder_gnd_GN
		port map (
			output => multiplexeruser_aclrgnd_output_wire  -- output.wire
		);

	multiplexerenavcc : component alt_dspbuilder_vcc_GN
		port map (
			output => multiplexerenavcc_output_wire  -- output.wire
		);

	bus_conversion : component alt_dspbuilder_cast_GNJGR7GQ2L
		generic map (
			round    => 0,
			saturate => 0
		)
		port map (
			input  => barrel_shifter_r_wire,      --  input.wire
			output => bus_conversion_output_wire  -- output.wire
		);

	constant4 : component alt_dspbuilder_constant_GNZEH3JAKA
		generic map (
			HDLTYPE    => "STD_LOGIC_VECTOR",
			BitPattern => "000000000000000000001111",
			width      => 24
		)
		port map (
			output => constant4_output_wire  -- output.wire
		);

	if_statement1 : component alt_dspbuilder_if_statement_GN7VA7SRUP
		generic map (
			use_else_output => 0,
			bwr             => 0,
			use_else_input  => 0,
			signed          => 0,
			HDLTYPE         => "STD_LOGIC_VECTOR",
			if_expression   => "(a=b) and (a /= c)",
			number_inputs   => 3,
			width           => 24
		)
		port map (
			true => if_statement1_true_wire, -- true.wire
			a    => data_in_0_output_wire,   --    a.wire
			b    => constant3_output_wire,   --    b.wire
			c    => constant4_output_wire    --    c.wire
		);

	sop_0 : component alt_dspbuilder_port_GN37ALZBS4
		port map (
			input  => sop,               --  input.wire
			output => sop_0_output_wire  -- output.wire
		);

	bus_concatenation1 : component alt_dspbuilder_bus_concat_GN55ETJ4VI
		generic map (
			widthB => 16,
			widthA => 8
		)
		port map (
			clock  => clock_0_clock_output_clk,       -- clock_aclr.clk
			aclr   => clock_0_clock_output_reset,     --           .reset
			a      => bus_conversion_output_wire,     --          a.wire
			b      => bus_concatenation_output_wire,  --          b.wire
			output => bus_concatenation1_output_wire  --     output.wire
		);

	delay1 : component alt_dspbuilder_delay_GNHYCSAEGT
		generic map (
			ClockPhase => "1",
			delay      => 1,
			use_init   => 0,
			BitPattern => "0",
			width      => 1
		)
		port map (
			input  => cast4_output_wire,          --      input.wire
			clock  => clock_0_clock_output_clk,   -- clock_aclr.clk
			aclr   => clock_0_clock_output_reset, --           .reset
			output => delay1_output_wire,         --     output.wire
			sclr   => delay1sclrgnd_output_wire,  --       sclr.wire
			ena    => delay1enavcc_output_wire    --        ena.wire
		);

	delay1sclrgnd : component alt_dspbuilder_gnd_GN
		port map (
			output => delay1sclrgnd_output_wire  -- output.wire
		);

	delay1enavcc : component alt_dspbuilder_vcc_GN
		port map (
			output => delay1enavcc_output_wire  -- output.wire
		);

	bus_concatenation : component alt_dspbuilder_bus_concat_GNIIOZRPJD
		generic map (
			widthB => 8,
			widthA => 8
		)
		port map (
			clock  => clock_0_clock_output_clk,      -- clock_aclr.clk
			aclr   => clock_0_clock_output_reset,    --           .reset
			a      => bus_conversion_output_wire,    --          a.wire
			b      => bus_conversion_output_wire,    --          b.wire
			output => bus_concatenation_output_wire  --     output.wire
		);

	constant3 : component alt_dspbuilder_constant_GNNKZSYI73
		generic map (
			HDLTYPE    => "STD_LOGIC_VECTOR",
			BitPattern => "000000000000000000000000",
			width      => 24
		)
		port map (
			output => constant3_output_wire  -- output.wire
		);

	delay2 : component alt_dspbuilder_delay_GNHYCSAEGT
		generic map (
			ClockPhase => "1",
			delay      => 1,
			use_init   => 0,
			BitPattern => "0",
			width      => 1
		)
		port map (
			input  => cast2_output_wire,          --      input.wire
			clock  => clock_0_clock_output_clk,   -- clock_aclr.clk
			aclr   => clock_0_clock_output_reset, --           .reset
			output => delay2_output_wire,         --     output.wire
			sclr   => delay2sclrgnd_output_wire,  --       sclr.wire
			ena    => delay2enavcc_output_wire    --        ena.wire
		);

	delay2sclrgnd : component alt_dspbuilder_gnd_GN
		port map (
			output => delay2sclrgnd_output_wire  -- output.wire
		);

	delay2enavcc : component alt_dspbuilder_vcc_GN
		port map (
			output => delay2enavcc_output_wire  -- output.wire
		);

	delay : component alt_dspbuilder_delay_GNUECIBFDH
		generic map (
			ClockPhase => "1",
			delay      => 1,
			use_init   => 1,
			BitPattern => "0",
			width      => 1
		)
		port map (
			input  => delay2_output_wire,         --      input.wire
			clock  => clock_0_clock_output_clk,   -- clock_aclr.clk
			aclr   => clock_0_clock_output_reset, --           .reset
			output => delay_output_wire,          --     output.wire
			sclr   => cast0_output_wire,          --       sclr.wire
			ena    => cast1_output_wire           --        ena.wire
		);

	constant1 : component alt_dspbuilder_constant_GNPXZ5JSVR
		generic map (
			HDLTYPE    => "STD_LOGIC_VECTOR",
			BitPattern => "1000",
			width      => 4
		)
		port map (
			output => constant1_output_wire  -- output.wire
		);

	data_out_0 : component alt_dspbuilder_port_GNOC3SGKQJ
		port map (
			input  => multiplexer_result_wire, --  input.wire
			output => data_out                 -- output.wire
		);

	data_in_0 : component alt_dspbuilder_port_GNOC3SGKQJ
		port map (
			input  => data_in,               --  input.wire
			output => data_in_0_output_wire  -- output.wire
		);

	eop_0 : component alt_dspbuilder_port_GN37ALZBS4
		port map (
			input  => eop,               --  input.wire
			output => eop_0_output_wire  -- output.wire
		);

	logical_bit_operator1 : component alt_dspbuilder_logical_bit_op_GNA5ZFEL7V
		generic map (
			LogicalOp     => "AltAND",
			number_inputs => 2
		)
		port map (
			result => logical_bit_operator1_result_wire, -- result.wire
			data0  => eop_0_output_wire,                 --  data0.wire
			data1  => cast3_output_wire                  --  data1.wire
		);

	cast0 : component alt_dspbuilder_cast_GNSB3OXIQS
		generic map (
			round    => 0,
			saturate => 0
		)
		port map (
			input  => delay1_output_wire, --  input.wire
			output => cast0_output_wire   -- output.wire
		);

	cast1 : component alt_dspbuilder_cast_GNSB3OXIQS
		generic map (
			round    => 0,
			saturate => 0
		)
		port map (
			input  => delay2_output_wire, --  input.wire
			output => cast1_output_wire   -- output.wire
		);

	cast2 : component alt_dspbuilder_cast_GN46N4UJ5S
		generic map (
			round    => 0,
			saturate => 0
		)
		port map (
			input  => logical_bit_operator_result_wire, --  input.wire
			output => cast2_output_wire                 -- output.wire
		);

	cast3 : component alt_dspbuilder_cast_GNSB3OXIQS
		generic map (
			round    => 0,
			saturate => 0
		)
		port map (
			input  => delay_output_wire, --  input.wire
			output => cast3_output_wire  -- output.wire
		);

	cast4 : component alt_dspbuilder_cast_GN46N4UJ5S
		generic map (
			round    => 0,
			saturate => 0
		)
		port map (
			input  => logical_bit_operator1_result_wire, --  input.wire
			output => cast4_output_wire                  -- output.wire
		);

end architecture rtl; -- of Gray_Processing_GN_Gray_Processing_Gray_Processing_Module
