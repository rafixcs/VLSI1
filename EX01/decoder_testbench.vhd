library IEEE;
    use IEEE.STD_LOGIC_1164.ALL;
    use IEEE.STD_LOGIC_UNSIGNED.ALL;
    use IEEE.STD_LOGIC_ARITH.ALL;

entity decoder_testbench is

end decoder_testbench;

architecture decoder_testbench of decoder_testbench is
    signal scancode_in_tb        : std_logic_vector(7 downto 0) := x"00";
    signal ascii_out_duv      : std_logic_vector(7 downto 0)    := x"00";
    signal ascii_out_golden   : std_logic_vector(7 downto 0)    := x"00";

    signal comparator         : std_logic;

begin
    duv: entity work.decoder_scancode_ascii
    port map 
    (
        ascii_out   => ascii_out_duv,
        scancode_in => scancode_in_tb
    );

    golden: entity work.decoder_scancode_ascii_golden
    port map
    (
        scancode_in => scancode_in_tb,
        ascii_out   => ascii_out_golden
    );


    process
    begin
        if scancode_in_tb < x"ff" then
            scancode_in_tb <= scancode_in_tb + 1;
        else
            scancode_in_tb <= x"00";
        end if;

        wait for 15 ns;
            if not (ascii_out_golden = ascii_out_duv) then
                report "as saidas sao diferentes";
                comparator <= '1';
            else
                comparator <= '0';
            end if;
        

        wait for 15 ns;
    end process;

end decoder_testbench;