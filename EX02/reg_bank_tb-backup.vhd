library IEEE;
    use IEEE.STD_LOGIC_1164.ALL;
    use IEEE.STD_LOGIC_UNSIGNED.ALL;
	use IEEE.STD_LOGIC_ARITH.ALL;
    use IEEE.NUMERIC_STD.ALL;

entity reg_bank_tb is

end reg_bank_tb;

architecture reg_bank_tb of reg_bank_tb is
	signal clk 		: std_logic := '0';
	signal rd_en	: std_logic := '0';
	signal rst		: std_logic := '0';
	signal wr_en 	: std_logic := '0';
	signal rd_data 	: std_logic_vector(7 downto 0) := x"00";
	signal rd_addr	: std_logic_vector(3 downto 0) := x"0";
	signal wr_data 	: std_logic_vector(7 downto 0) := x"00";
	signal wr_addr	: std_logic_vector(3 downto 0) := x"0";

	signal already_rst   : std_logic := '0';
	signal readWrite_tst : std_logic := '1'; -- 0 for read test and 1 for write test
	signal clock_latency : std_logic := '0';
	signal init_latency  : std_logic := '0';
	signal end_addr_iter : std_logic := '0';
	signal tested_write  : std_logic := '1';
begin

	-- Instanciating the circuit under verification
	cuv: entity work.reg_bank 
	port map (
		clk 		=> clk, 
	    rd_en 		=> rd_en,
	    rst 		=> rst,
	    wr_en 		=> wr_en,
	    rd_data 	=> rd_data,
	    rd_address 	=> rd_addr,
	    wr_data 	=> wr_data,
	    wr_address 	=> wr_addr
	);

	-- Power on reset, it awaits for 100 ns to finish power on the reg bank
	process (clk)
	begin
		if rising_edge(clk) then
			if already_rst = '0' then
				rst <= '1', '0' after 120 ns;
				already_rst <= '1';
			end if;
		end if;
	end process;

	-- Clock w/ 50MHz
	process
	begin		
		wait for 20 ns;
		clk <= not clk;		
	end process;

	-- Test reg bank integrality
	process(clk)
		variable a, b : integer;
	begin
		-- if it's already powered on, continue w/ the test
		-- the reg bank has 16 addrs
		-- first 6 is for read onlyy
		if rst = '0' and already_rst = '1' and rising_edge(clk) then							
			if readWrite_tst = '0' then -- read test reg bank
				if rd_addr <= x"f" and end_addr_iter = '0' then
					rd_en <= '1';
					if rising_edge(clk) then
						if clock_latency = '1' and init_latency = '1'then
							clock_latency <= '0';
							a := CONV_INTEGER(rd_addr);
				            b := CONV_INTEGER(rd_data);
							
							assert(rd_addr = x"0" and rd_data = x"32") report "READ => Addr: " & integer'image(a) & " | rd_data:" & integer'image(b);
							assert(rd_addr = x"1" and rd_data = x"30") report "READ => Addr: " & integer'image(a) & " | rd_data:" & integer'image(b);
							assert(rd_addr = x"2" and rd_data = x"31") report "READ => Addr: " & integer'image(a) & " | rd_data:" & integer'image(b);
							assert(rd_addr = x"3" and rd_data = x"37") report "READ => Addr: " & integer'image(a) & " | rd_data:" & integer'image(b);
							assert(rd_addr = x"4" and rd_data = x"30") report "READ => Addr: " & integer'image(a) & " | rd_data:" & integer'image(b);
							assert(rd_addr = x"5" and rd_data = x"39") report "READ => Addr: " & integer'image(a) & " | rd_data:" & integer'image(b);
							assert(rd_addr = x"6" and rd_data = x"06") report "READ => Addr: " & integer'image(a) & " | rd_data:" & integer'image(b);
							assert(rd_addr = x"7" and rd_data = x"07") report "READ => Addr: " & integer'image(a) & " | rd_data:" & integer'image(b);
							assert(rd_addr = x"8" and rd_data = x"08") report "READ => Addr: " & integer'image(a) & " | rd_data:" & integer'image(b);
							assert(rd_addr = x"9" and rd_data = x"09") report "READ => Addr: " & integer'image(a) & " | rd_data:" & integer'image(b);
							assert(rd_addr = x"a" and rd_data = x"0a") report "READ => Addr: " & integer'image(a) & " | rd_data:" & integer'image(b);
							assert(rd_addr = x"b" and rd_data = x"ff") report "READ => Addr: " & integer'image(a) & " | rd_data:" & integer'image(b);
							assert(rd_addr = x"c" and rd_data = x"ff") report "READ => Addr: " & integer'image(a) & " | rd_data:" & integer'image(b);
							assert(rd_addr = x"d" and rd_data = x"ff") report "READ => Addr: " & integer'image(a) & " | rd_data:" & integer'image(b);
							assert(rd_addr = x"e" and rd_data = x"ff") report "READ => Addr: " & integer'image(a) & " | rd_data:" & integer'image(b);
							assert(rd_addr = x"f" and rd_data = x"ff") report "READ => Addr: " & integer'image(a) & " | rd_data:" & integer'image(b);

							if rd_addr = x"f" then
								end_addr_iter <= '1';
								readWrite_tst <= '1';
							else
								rd_addr <= rd_addr + 1;
							end if;
						elsif init_latency = '0' then
							init_latency <= '1';
						else
							clock_latency <= '1';
						end if;
					end if;
				else
					rd_en <= '0';
					wr_en <= '1'; -- set write enable to test writing the reg bank
				end if;
			else
				rd_data <= x"00";
				if wr_addr <= x"f" and rising_edge(clk) then
						rd_en <= '0';
						wr_en <= '1';
						if clock_latency = '1' and init_latency = '1' then							
							tested_write <= '0';
							clock_latency <= '0';
						else
							if init_latency = '0' then
								init_latency <= '1';
							else
								wr_data <= x"11";
								clock_latency <= '1';
							end if;
						end if;
					else
						-- verify with the write was successuful
						wr_en <= '0';
						rd_en <= '1';
						if clock_latency = '1' then
							a := CONV_INTEGER(rd_addr);
				            b := CONV_INTEGER(rd_data);
							-- Testing the read only addrsses							
							assert(rd_addr = x"0" and rd_data = x"32") report "W/R => Addr: " & integer'image(a) & " | rd_data:" & integer'image(b);
							assert(rd_addr = x"1" and rd_data = x"30") report "W/R => Addr: " & integer'image(a) & " | rd_data:" & integer'image(b);
							assert(rd_addr = x"2" and rd_data = x"31") report "W/R => Addr: " & integer'image(a) & " | rd_data:" & integer'image(b);
							assert(rd_addr = x"3" and rd_data = x"37") report "W/R => Addr: " & integer'image(a) & " | rd_data:" & integer'image(b);
							assert(rd_addr = x"4" and rd_data = x"30") report "W/R => Addr: " & integer'image(a) & " | rd_data:" & integer'image(b);
							assert(rd_addr = x"5" and rd_data = x"39") report "W/R => Addr: " & integer'image(a) & " | rd_data:" & integer'image(b);
							-- Testing read/write addrsses
							assert (rd_data = x"11" or rd_addr >= "0110") report "W/R => Addr: " & integer'image(a) & " | rd_data:" & integer'image(b);

							tested_write <= '1';
							clock_latency <= '0';
							wr_addr <= wr_addr + 1;
							rd_addr <= rd_addr + 1;
						else
							clock_latency <= '1';
						end if;
					end if;
				end if;
			end if;
		end if;
	end process;


end reg_bank_tb;
