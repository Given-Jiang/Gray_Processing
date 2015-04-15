
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

library altera;
use altera.alt_dspbuilder_package.all;

library lpm;
use lpm.lpm_components.all;

entity alt_dspbuilder_if_statement_GN7VA7SRUP is
	generic		( 			use_else_output : natural := 0;
			bwr : natural := 0;
			use_else_input : natural := 0;
			signed : natural := 0;
			HDLTYPE : string := "STD_LOGIC_VECTOR";
			if_expression : string := "(a=b) and (a /= c)";
			number_inputs : integer := 3;
			width : natural := 24);

	port(
		true : out std_logic;
		a : in std_logic_vector(23 downto 0);
		b : in std_logic_vector(23 downto 0);
		c : in std_logic_vector(23 downto 0));		
end entity;

architecture rtl of alt_dspbuilder_if_statement_GN7VA7SRUP is 
    signal   result : std_logic;
    constant zero  : STD_LOGIC_VECTOR(23 DOWNTO 0) :=  (others=>'0');
    constant one   : STD_LOGIC_VECTOR(23 DOWNTO 0) :=  (0 => '1', others => '0');

    function myFunc ( Value: boolean )
      return std_logic is
        variable func_result : std_logic;
    begin
        if (Value) then
            func_result := '1';
        else
            func_result := '0';
        end if;
        return func_result;
    end;

    function myFunc ( Value: std_logic )
      return std_logic is
    begin
        return Value;
    end;

Begin

-- DSP Builder Block - Simulink Block "IfStatement"
result <= myFunc((a=b) and (a /= c))  ;
true <= result;

end architecture;
