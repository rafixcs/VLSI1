library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder_scancode_ascii_golden is
  port (
    ascii_out : out STD_LOGIC_VECTOR ( 7 downto 0 ); 
    scancode_in : in STD_LOGIC_VECTOR ( 7 downto 0 ) 
  );
end decoder_scancode_ascii_golden;

architecture decoder_scancode_ascii_golden of decoder_scancode_ascii_golden is

begin
  process (scancode_in)
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
      when x"15" => ascii_out <= x"51";
      when x"1d" => ascii_out <= x"57";
      when x"24" => ascii_out <= x"45";
      when x"2d" => ascii_out <= x"52";
      when x"2c" => ascii_out <= x"54";
      when x"35" => ascii_out <= x"59";
      when x"3c" => ascii_out <= x"55";
      when x"43" => ascii_out <= x"49";
      when x"44" => ascii_out <= x"4f";
      when x"4d" => ascii_out <= x"50";
      when x"1c" => ascii_out <= x"41";
      when x"1b" => ascii_out <= x"53";
      when x"23" => ascii_out <= x"44";
      when x"2b" => ascii_out <= x"46";
      when x"34" => ascii_out <= x"47";
      when x"33" => ascii_out <= x"48";
      when x"3b" => ascii_out <= x"4a";
      when x"42" => ascii_out <= x"4b";
      when x"4b" => ascii_out <= x"4c";
      when x"1a" => ascii_out <= x"5a";
      when x"22" => ascii_out <= x"58";
      when x"21" => ascii_out <= x"43";
      when x"2a" => ascii_out <= x"56";
      when x"32" => ascii_out <= x"42";
      when x"31" => ascii_out <= x"4e";
      when x"3a" => ascii_out <= x"4d";
      when others => ascii_out <= x"ff";
    end case;
  end process;
end decoder_scancode_ascii_golden;