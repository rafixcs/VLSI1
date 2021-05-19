library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	use IEEE.STD_LOGIC_UNSIGNED.ALL;
	use IEEE.STD_LOGIC_ARITH.ALL;
    use IEEE.NUMERIC_STD.ALL;

entity rcv_fsm is
	port(
		clk_in 	    : in std_logic;	-- Master clock (100MHz)
		rst_in 	    : in std_logic;	-- Sincro reset 
		data_sr_in  : in std_logic; -- Serial data in
		data_pl_out : out std_logic_vector(0 to 7); -- Paralel data out
		data_pl_en_out : out std_logic;	-- Valid data out
		sync_out	: out std_logic -- Sync state
	);
end rcv_fsm;	

architecture rcv_fsm of rcv_fsm is
	-- State machine for dataflow controll
	type t_SM_rcv is (s_RCV_Bit, s_CheckData, s_CountAligment, s_Payload, s_DiscartData);
	signal sm_state : t_SM_rcv := s_RCV_Bit;
	
	-- input serial data buffer
	signal v_buffer : std_logic_vector(7 downto 0) := (others => '0');
	signal i_indx_buffer : integer range 0 to 7 := 0;
	
	signal b_sync : std_logic := '0';
	signal b_data_pl_en : std_logic := '0';
	signal i_count_aligment : integer range 0 to 3 := 0;

	-- payload buffer
	signal v_payload_buff : std_logic_vector(7 downto 0) := (others => '0');
	signal b_payload_get : std_logic := '0';
	signal i_counter_payload : integer range 0 to 5 := 0;

begin
	data_pl_out <= v_buffer;	
	data_pl_en_out <= b_data_pl_en;
	sync_out <= '1' when i_count_aligment=3 else
				'0';

	p_SERIAL: process (clk_in)
	begin
		if rising_edge(clk_in) then
			if rst_in = '1' then
				b_sync <= '0';
				v_buffer <= (others => '0');
				i_count_aligment <= 0;
				b_data_pl_en <= '0';
				sm_state <= s_RCV_Bit;
				i_indx_buffer <= 7;
				i_counter_payload <= 0;
			else
				case sm_state is
				when s_RCV_Bit =>
						b_data_pl_en <= '0';
						if i_counter_payload = 5 then
							i_counter_payload <= 0;
							i_count_aligment <= 0;
						end if;

						if i_indx_buffer > 0 then
							v_buffer(i_indx_buffer) <= data_sr_in;
							i_indx_buffer <= i_indx_buffer - 1;
						else
							v_buffer(i_indx_buffer) <= data_sr_in;
							i_indx_buffer <= 7;
							sm_state <= s_CheckData;
						end if;

				when s_CheckData =>						
						if i_count_aligment = 3 then
							sm_state <= s_Payload;
						elsif v_buffer = x"a5" then
							sm_state <= s_CountAligment;
						else
							sm_state <= s_DiscartData;
						end if;

				when s_CountAligment =>
						if i_count_aligment < 3 then
							i_count_aligment <= i_count_aligment + 1;
						end if;
						sm_state <= s_RCV_bit;

				when s_Payload =>
						if i_counter_payload < 5 then
							i_counter_payload <= i_counter_payload + 1;
						end if;
						b_data_pl_en <= '1';
						sm_state <= s_RCV_bit;

				when s_DiscartData =>
						i_count_aligment <= 0;
						i_counter_payload <= 0;
						b_data_pl_en <= '0';
						sm_state <= s_RCV_bit;
				end case;
			end if;
		end if;
	end process p_Serial;	
end rcv_fsm;
