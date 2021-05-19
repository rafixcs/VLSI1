library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	use IEEE.STD_LOGIC_UNSIGNED.ALL;
	use IEEE.STD_LOGIC_ARITH.ALL;
    use IEEE.NUMERIC_STD.ALL;

entity fsm_tb is

end fsm_tb;

architecture fsm_tb of fsm_tb is
	signal clk, rst, data_sr, sync, data_plen_out : std_logic := '0';
	signal data_pl : std_logic_vector(7 downto 0);

	type SM_tb is ( SendData, WaitData);
	signal sm_state : SM_tb := SendData;

	signal test_byte : std_logic_vector(7 downto 0);
	signal test_byte_send : integer range 0 to 17 := 0;
	signal index : integer range 0 to 7;

	signal already_rst : std_logic := '0';
begin

	test_byte <= x"a5" when test_byte_send = 0 else
				 x"a5" when test_byte_send = 1 else
				 x"a5" when test_byte_send = 2 else
				 x"01" when test_byte_send = 3 else
				 x"02" when test_byte_send = 4 else
				 x"03" when test_byte_send = 5 else
				 x"04" when test_byte_send = 6 else
				 x"50" when test_byte_send = 7 else
				 x"a5" when test_byte_send = 8 else
				 x"a5" when test_byte_send = 9 else
				 x"a5" when test_byte_send = 10 else
				 x"a0" when test_byte_send = 11 else
				 x"a5" when test_byte_send = 12 else
				 x"21" when test_byte_send = 13 else
				 x"22" when test_byte_send = 14 else
				 x"32" when test_byte_send = 15 else
				 x"42" when test_byte_send = 16 else
				 x"45" when test_byte_send = 17 else
				 x"ff";

	data_sr <= test_byte(index);


	cuv: entity work.rcv_fsm
	port map(
		clk_in => clk,
		rst_in => rst,
		data_sr_in => data_sr,
		data_pl_out => data_pl,
		data_pl_en_out => data_plen_out,
		sync_out => sync
	);

	-- Clock 100MHz
	process
	begin
		wait for 5 ns;
		clk <= not clk;
	end process;

	-- Reset the circuit
	rst <= '1', '0' after 150 ns;

	process (clk)
		--variable index : integer range 0 to 7;
		variable wait_for_it : integer range 0 to 1;
	begin
		if rising_edge(clk) then
			if rst = '1' then
				test_byte_send <= 0;
				index <= 7;
				sm_state <= SendData;
				wait_for_it := 0;
			else
				case sm_state is
					when SendData =>					
						if index > 0 then 
							index <= index - 1;										
						else
							sm_state <= WaitData;
							
							if test_byte_send < 17 then
								test_byte_send <= test_byte_send + 1;
							else
								test_byte_send <= 0;
							end if;
						end if;

					when WaitData =>
						if wait_for_it = 1 then
							index <= 7;
							sm_state <= SendData;
							wait_for_it := 0;
						else
							wait_for_it := 1;
							sm_state <= WaitData;
						end if;

					when others => sm_state <= SendData;					
				end case;		
			end if;			
		end if;
	end process;

end fsm_tb;
