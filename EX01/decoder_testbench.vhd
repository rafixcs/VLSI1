library IEEE;
    use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
    use UNISIM.VCOMPONENTS.ALL;
    use UNISIM.VPKG.ALL;

entity decoder_testbench is

end decoder_testbench;

architecture decoder_testbench of decoder_testbench is
    signal scancode_in        : std_logic_vector(7 downto 0);
    signal ascii_out_duv      : std_logic_vector(7 downto 0);
    signal ascii_out_golden   : std_logic_vector(7 downto 0);

    signal comparator         : std_logic;

begin
    duv: entity work.decoder_scancode_ascii_map
    port map 
    (
        ascii_out   => ascii_out_duv,
        scancode_in => scancode_in
    );

    golden: entity work.decoder_scancode_ascii_golden
    port map
    (
        scancode_in => scancode_in,
        ascii_out   => ascii_out_golden
    );


    process
    begin
        if scancode_in < x"7" then
            scancode_in <= scancode_in + 1;
        else
            scancode_in <= x"00";
        end if;

        wait for 25 ns;
            if (ascii_out_golden != ascii_out_duv)
                report "as saidas sao diferentes"
                comparator := '1';
            else
                comparator := '0';
            end if;
        

        wait for 25 ns;
    end process;

end decoder_testbench;