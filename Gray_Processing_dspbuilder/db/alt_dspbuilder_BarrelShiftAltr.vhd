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


library IEEE;
use IEEE.std_logic_1164.all;

library lpm;
use lpm.lpm_components.all;

library altera;
use altera.alt_dspbuilder_package.all;

entity alt_dspbuilder_BarrelShiftAltr is
	generic (     
				widthin		: natural :=32;
				widthd		: natural :=5;
				pipeline	: natural :=1;
				ndirection	: natural :=0;				
				use_dedicated_circuitry : natural :=0
			);
	port 	( 
				xin			: in std_logic_vector(widthin-1 downto 0);
				distance	: in std_logic_vector(widthd-1 downto 0);
				sclr		: in std_logic;
				ena			: in std_logic;
				clock		: in std_logic;
                aclr		: in std_logic;
				direction	: in std_logic;
				yout		: out std_logic_vector(widthin-1 downto 0)
			);
end alt_dspbuilder_BarrelShiftAltr;

architecture SYNTH of alt_dspbuilder_BarrelShiftAltr is

signal resdec		   : std_logic_vector(widthin-1 downto 0);
signal dxin			   : std_logic_vector(widthin-1 downto 0);
signal resmult		   : std_logic_vector(2*widthin downto 0);
signal sdirection	   : std_logic;
signal direction_dff   : std_logic_vector(2 downto 0);
signal resdec_ext	   : std_logic_vector(widthin downto 0);

signal distance_out	   : std_logic_vector(widthd-1 downto 0);
signal dist_out_reg    : std_logic_vector(widthd-1 downto 0);
signal max_distance	   : std_logic_vector(widthd-1 downto 0);
signal distance_sum	   : std_logic_vector(widthd-1 downto 0);
signal no_shift	       : std_logic;
constant distance_zero : std_logic_vector(widthd-1 downto 0):=(others=>'0');

begin


gsdir1:if ndirection=0 generate
	sdirection <='0';
end generate gsdir1;		

gsdir2:if ndirection=1 generate
	sdirection <= '0' when distance=distance_zero else '1';
end generate gsdir2;

gsdir3:if ndirection=2 generate
	sdirection <= '0' when distance=distance_zero else direction;
end generate gsdir3;

gnopipeline:if pipeline=0 generate

	gc:if use_dedicated_circuitry>0 generate

		U0 : lpm_decode	GENERIC MAP (lpm_width => widthd,
									lpm_decodes => widthin,
									lpm_type => "LPM_DECODE")
						PORT MAP 	(data => distance_out,
									eq => resdec);			
		
		U1 : lpm_mult	GENERIC MAP (lpm_widtha => widthin+1,
									lpm_widthb => widthin,
									lpm_widthp => 2*widthin+1,
									lpm_widths => 1,
									lpm_type => "LPM_MULT",
									lpm_representation => "SIGNED",
									lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=6")
							PORT MAP (dataa => resdec_ext,
									datab => xin,
									result => resmult);														

		resdec_ext(widthin-1 downto 0) <= resdec(widthin-1 downto 0);
		resdec_ext(widthin) <= '0';
		
		gleft:if ndirection=0 generate
			yout(widthin-1 downto 0) <= resmult(widthin-1 downto 0);
			distance_out	<= distance;
		end generate gleft;		
			
		grightleft:if ndirection>0 generate
			max_distance <= int2ustd(widthin, widthd);			
			UADD: lpm_add_sub 	generic map (
						lpm_width => widthd,
						lpm_direction => "SUB",
						lpm_type => "LPM_ADD_SUB",
						lpm_representation => "UNSIGNED",
						lpm_pipeline => 0)
					port map (
						dataa => max_distance,
						datab => distance,
						result => distance_sum,
						cin=>'1');		
			distance_out(widthd-1 downto 0)	<= distance_sum when (sdirection='1') else distance;
			yout(widthin-1 downto 0) 	<= resmult(2*widthin-1 downto widthin) when (sdirection='1') else resmult(widthin-1 downto 0);
		end generate grightleft;

	end generate gc;

	gndc:if use_dedicated_circuitry=0 generate
		U0 : lpm_clshift	GENERIC MAP (lpm_type => "LPM_CLSHIFT",
										lpm_shifttype => "ARITHMETIC",
										lpm_width => widthin,
										lpm_widthdist => widthd)
							PORT MAP (	distance => distance,
										direction => sdirection,
										data => xin,
										result => yout);
	end generate gndc;
	
end generate gnopipeline;


gpipeline:if pipeline>0 generate

	p:process(clock,aclr)
		begin	
        if aclr='1' then
		    dxin 			<= (others=>'0');
			direction_dff 	<= (others=>'0'); 
			dist_out_reg    <= (others=>'0');
        elsif clock'event and clock='1' then
			if sclr='1' then	
				dxin 			<= (others=>'0');
				direction_dff 	<= (others=>'0'); 
				dist_out_reg    <= (others=>'0');
			elsif ena='1' then
				dxin <= xin ;
				direction_dff(2)<= direction_dff(1);
				direction_dff(1)<= direction_dff(0);
				direction_dff(0)<= sdirection;
				dist_out_reg    <= distance_out;
			end if;
		end if;	
	end process p;
	
	U0 : lpm_decode GENERIC MAP (lpm_width => widthd,
								lpm_decodes => widthin,
								lpm_type => "LPM_DECODE",
								lpm_pipeline	=> 0)
					PORT MAP (	data	=> dist_out_reg,
								eq		=> resdec);
	
	gndc:if use_dedicated_circuitry=0 generate
		U1 : lpm_mult GENERIC MAP ( lpm_widtha 	=> widthin+1,
									lpm_widthb 	=> widthin,
									lpm_widthp 	=> 2*widthin+1,
									lpm_widths 	=> 1,
									lpm_pipeline	=> 2,
									lpm_type 	=> "LPM_MULT",
									lpm_representation => "SIGNED",
									lpm_hint 	=> "DEDICATED_MULTIPLIER_CIRCUITRY=NO,MAXIMIZE_SPEED=6")
					PORT MAP (	dataa	=> resdec_ext,
								datab	=> dxin,
								clock	=> clock,
								clken	=> ena,
								aclr	=> aclr,
								result	=> resmult);
	end generate gndc;

	gdc:if use_dedicated_circuitry=1 generate
		U1 : lpm_mult GENERIC MAP ( lpm_widtha 	=> widthin+1,
									lpm_widthb 	=> widthin,
									lpm_widthp 	=> 2*widthin+1,
									lpm_widths 	=> 1,
									lpm_pipeline	=> 2,
									lpm_type 	=> "LPM_MULT",
									lpm_representation => "SIGNED",
									lpm_hint 	=> "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=6")
					PORT MAP (	dataa	=> resdec_ext,
								datab	=> dxin,
								clock	=> clock,
								clken	=> ena,
								aclr	=> aclr,
								result	=> resmult);
	end generate gdc;

	resdec_ext(widthin-1 downto 0) <= resdec(widthin-1 downto 0);
	resdec_ext(widthin) <= '0';
	
	gleft:if ndirection=0 generate
		yout(widthin-1 downto 0) <= resmult(widthin-1 downto 0);
		distance_out	<= distance;
	end generate gleft;		
	
	grightleft:if ndirection>0 generate
		max_distance <= int2ustd(widthin, widthd);	
		UADD: lpm_add_sub 	generic map (lpm_width => widthd, lpm_direction => "SUB", lpm_type => "LPM_ADD_SUB", lpm_representation => "UNSIGNED", lpm_pipeline => 0)
							port map ( dataa => max_distance, datab => distance, result => distance_sum, cin=>'1');		
		distance_out(widthd-1 downto 0)	<= distance_sum when (sdirection='1') else distance;
		yout(widthin-1 downto 0) 	<= resmult(2*widthin-1 downto widthin) when (direction_dff(2)='1') else resmult(widthin-1 downto 0);
	end generate grightleft;

end generate gpipeline;

end SYNTH;


