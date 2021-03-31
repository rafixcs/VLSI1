library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity decoder_scancode_ascii_golden is
  port (
    ascii_out : out STD_LOGIC_VECTOR ( 7 downto 0 ); 
    scancode_in : in STD_LOGIC_VECTOR ( 7 downto 0 ) 
  );
end decoder_scancode_ascii_golden;

architecture decoder_scancode_ascii_golden of decoder_scancode_ascii_golden is

begin
    process(scancode_in):
    begin
        case (scancode_in) is
            when x"16" => ascii_out <= x"31";
            when x"1e" => ascii_out <= x"32";
            when x"26" => ascii_out <= x"33";
            when x"25" => ascii_out <= x"34";
            when x"2e" => ascii_out <= x"35";
            when x"36" => ascii_out <= x"36";
            when x"3d" => ascii_out <= x"37";
            when x"3e" => ascii_out <= x"38";
            when x"46" => ascii_out <= x"39";
            when x"45" => ascii_out <= x"30";
            when x"4e" => ascii_out <= x"2d";
            when x"55" => ascii_out <= x"3d";
            when x"0e" => ascii_out <= x"7e";
            when x"5d" => ascii_out <= x"5c";
            when x"15" => ascii_out <= x"71";
            when x"1d" => ascii_out <= x"77";
            when x"24" => ascii_out <= x"65";
            when x"2d" => ascii_out <= x"72";
            when x"2c" => ascii_out <= x"74";
            when x"35" => ascii_out <= x"79";
            when x"3c" => ascii_out <= x"75";
            when x"43" => ascii_out <= x"69";
            when x"44" => ascii_out <= x"6f";
            when x"4d" => ascii_out <= x"70";
            when x"54" => ascii_out <= x"5b";
            when x"5b" => ascii_out <= x"5d";
            when x"1c" => ascii_out <= x"61";
            when x"1b" => ascii_out <= x"73";
            when x"23" => ascii_out <= x"64";
            when x"2b" => ascii_out <= x"66";
            when x"34" => ascii_out <= x"67";
            when x"33" => ascii_out <= x"68";
            when x"3b" => ascii_out <= x"6a";
            when x"42" => ascii_out <= x"6b";
            when x"4b" => ascii_out <= x"6c";
            when x"4c" => ascii_out <= x"3b";
            when x"52" => ascii_out <= x"27";
            when x"1a" => ascii_out <= x"7a";
            when x"22" => ascii_out <= x"78";
            when x"21" => ascii_out <= x"63";
            when x"2a" => ascii_out <= x"76";
            when x"32" => ascii_out <= x"62";
            when x"31" => ascii_out <= x"6e";
            when x"3a" => ascii_out <= x"6d";
            when x"41" => ascii_out <= x"2c";
            when x"49" => ascii_out <= x"2e";
            when x"4a" => ascii_out <= x"2f";
        end case;
    end process;
end decoder_scancode_ascii_golden