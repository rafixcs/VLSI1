--------------------------------------------------
-- Autor:  Prof. Me. Marlon Moraes
-- E-mail:  marlon.moraes@pucrs.br
-- Criado em 25/03/21.
--------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity decoder_scancode_ascii is
  port (
    ascii_out : out STD_LOGIC_VECTOR ( 7 downto 0 ); 
    scancode_in : in STD_LOGIC_VECTOR ( 7 downto 0 ) 
  );
end decoder_scancode_ascii;

architecture Structure of decoder_scancode_ascii is
  signal N5 : STD_LOGIC; 
  signal N56 : STD_LOGIC; 
  signal N6 : STD_LOGIC; 
  signal N62 : STD_LOGIC; 
  signal N66 : STD_LOGIC; 
  signal N68 : STD_LOGIC; 
  signal N70 : STD_LOGIC; 
  signal N72 : STD_LOGIC; 
  signal N74 : STD_LOGIC; 
  signal N76 : STD_LOGIC; 
  signal N77 : STD_LOGIC; 
  signal N78 : STD_LOGIC; 
  signal N79 : STD_LOGIC; 
  signal N80 : STD_LOGIC; 
  signal N81 : STD_LOGIC; 
  signal N82 : STD_LOGIC; 
  signal N83 : STD_LOGIC; 
  signal N9 : STD_LOGIC; 
  signal N91 : STD_LOGIC; 
  signal ascii_out_0_100_20 : STD_LOGIC; 
  signal ascii_out_0_115_21 : STD_LOGIC; 
  signal ascii_out_0_130_22 : STD_LOGIC; 
  signal ascii_out_0_26_23 : STD_LOGIC; 
  signal ascii_out_0_28_24 : STD_LOGIC; 
  signal ascii_out_0_5 : STD_LOGIC; 
  signal ascii_out_0_83_26 : STD_LOGIC; 
  signal ascii_out_1_102 : STD_LOGIC; 
  signal ascii_out_1_1021_29 : STD_LOGIC; 
  signal ascii_out_1_1022_30 : STD_LOGIC; 
  signal ascii_out_1_133_31 : STD_LOGIC; 
  signal ascii_out_1_138_32 : STD_LOGIC; 
  signal ascii_out_1_16_33 : STD_LOGIC; 
  signal ascii_out_1_29_34 : STD_LOGIC; 
  signal ascii_out_1_77_35 : STD_LOGIC; 
  signal ascii_out_2_12_37 : STD_LOGIC; 
  signal ascii_out_2_143_38 : STD_LOGIC; 
  signal ascii_out_2_159_39 : STD_LOGIC; 
  signal ascii_out_2_187_40 : STD_LOGIC; 
  signal ascii_out_2_197 : STD_LOGIC; 
  signal ascii_out_2_1971_42 : STD_LOGIC; 
  signal ascii_out_2_310_43 : STD_LOGIC; 
  signal ascii_out_2_333 : STD_LOGIC; 
  signal ascii_out_2_3331_45 : STD_LOGIC; 
  signal ascii_out_2_3332_46 : STD_LOGIC; 
  signal ascii_out_2_84_47 : STD_LOGIC; 
  signal ascii_out_2_92_48 : STD_LOGIC; 
  signal ascii_out_3_134_50 : STD_LOGIC; 
  signal ascii_out_3_152_51 : STD_LOGIC; 
  signal ascii_out_3_42 : STD_LOGIC; 
  signal ascii_out_3_421_53 : STD_LOGIC; 
  signal ascii_out_3_422_54 : STD_LOGIC; 
  signal ascii_out_3_46_55 : STD_LOGIC; 
  signal ascii_out_3_46_SW0 : STD_LOGIC; 
  signal ascii_out_3_46_SW01_57 : STD_LOGIC; 
  signal ascii_out_3_63_58 : STD_LOGIC; 
  signal ascii_out_3_69_59 : STD_LOGIC; 
  signal ascii_out_3_92_60 : STD_LOGIC; 
  signal ascii_out_4_124_62 : STD_LOGIC; 
  signal ascii_out_4_141_63 : STD_LOGIC; 
  signal ascii_out_4_141_SW0 : STD_LOGIC; 
  signal ascii_out_4_141_SW01_65 : STD_LOGIC; 
  signal ascii_out_4_159_66 : STD_LOGIC; 
  signal ascii_out_4_17_67 : STD_LOGIC; 
  signal ascii_out_4_173_68 : STD_LOGIC; 
  signal ascii_out_4_187_69 : STD_LOGIC; 
  signal ascii_out_4_48_70 : STD_LOGIC; 
  signal ascii_out_4_5_71 : STD_LOGIC; 
  signal ascii_out_4_64_72 : STD_LOGIC; 
  signal ascii_out_5_124 : STD_LOGIC; 
  signal ascii_out_5_1241_75 : STD_LOGIC; 
  signal ascii_out_5_1242_76 : STD_LOGIC; 
  signal ascii_out_5_139_77 : STD_LOGIC; 
  signal ascii_out_5_14_78 : STD_LOGIC; 
  signal ascii_out_5_161_79 : STD_LOGIC; 
  signal ascii_out_5_31 : STD_LOGIC; 
  signal ascii_out_5_311_81 : STD_LOGIC; 
  signal ascii_out_5_312_82 : STD_LOGIC; 
  signal ascii_out_5_63_83 : STD_LOGIC; 
  signal ascii_out_5_72_84 : STD_LOGIC; 
  signal ascii_out_5_86_85 : STD_LOGIC; 
  signal ascii_out_6_37_87 : STD_LOGIC; 
  signal ascii_out_6_57_88 : STD_LOGIC; 
  signal ascii_out_6_8_89 : STD_LOGIC; 
  signal ascii_out_7_13_91 : STD_LOGIC; 
  signal ascii_out_7_2_92 : STD_LOGIC; 
  signal ascii_out_7_27_93 : STD_LOGIC; 
  signal ascii_out_7_58_94 : STD_LOGIC; 
  signal ascii_out_7_8_95 : STD_LOGIC; 
  signal ascii_out_7_94 : STD_LOGIC; 
  signal ascii_out_7_941_97 : STD_LOGIC; 
  signal ascii_out_7_942_98 : STD_LOGIC; 
  signal ascii_out_0_OBUF_99 : STD_LOGIC; 
  signal ascii_out_1_OBUF_100 : STD_LOGIC; 
  signal ascii_out_2_OBUF_101 : STD_LOGIC; 
  signal ascii_out_3_OBUF_102 : STD_LOGIC; 
  signal ascii_out_4_OBUF_103 : STD_LOGIC; 
  signal ascii_out_5_OBUF_104 : STD_LOGIC; 
  signal ascii_out_6_OBUF_105 : STD_LOGIC; 
  signal ascii_out_7_OBUF_106 : STD_LOGIC; 
  signal scancode_in_0_IBUF_115 : STD_LOGIC; 
  signal scancode_in_1_IBUF_116 : STD_LOGIC; 
  signal scancode_in_2_IBUF_117 : STD_LOGIC; 
  signal scancode_in_3_IBUF_118 : STD_LOGIC; 
  signal scancode_in_4_IBUF_119 : STD_LOGIC; 
  signal scancode_in_5_IBUF_120 : STD_LOGIC; 
  signal scancode_in_6_IBUF_121 : STD_LOGIC; 
  signal scancode_in_7_IBUF_122 : STD_LOGIC; 
begin
  ascii_out_1_31 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => scancode_in_1_IBUF_116,
      I1 => scancode_in_2_IBUF_117,
      O => N91
    );
  ascii_out_6_8 : LUT4
    generic map(
      INIT => X"4440"
    )
    port map (
      I0 => scancode_in_2_IBUF_117,
      I1 => scancode_in_1_IBUF_116,
      I2 => scancode_in_6_IBUF_121,
      I3 => scancode_in_4_IBUF_119,
      O => ascii_out_6_8_89
    );
  ascii_out_6_57 : LUT4
    generic map(
      INIT => X"C8CC"
    )
    port map (
      I0 => scancode_in_3_IBUF_118,
      I1 => scancode_in_0_IBUF_115,
      I2 => scancode_in_1_IBUF_116,
      I3 => scancode_in_2_IBUF_117,
      O => ascii_out_6_57_88
    );
  ascii_out_6_63 : LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => scancode_in_1_IBUF_116,
      I1 => scancode_in_2_IBUF_117,
      I2 => scancode_in_4_IBUF_119,
      O => ascii_out_0_5
    );
  ascii_out_7_2 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => scancode_in_2_IBUF_117,
      I1 => scancode_in_1_IBUF_116,
      I2 => scancode_in_0_IBUF_115,
      O => ascii_out_7_2_92
    );
  ascii_out_7_8 : LUT3
    generic map(
      INIT => X"C8"
    )
    port map (
      I0 => scancode_in_2_IBUF_117,
      I1 => scancode_in_4_IBUF_119,
      I2 => scancode_in_3_IBUF_118,
      O => ascii_out_7_8_95
    );
  ascii_out_7_13 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => scancode_in_1_IBUF_116,
      I1 => scancode_in_0_IBUF_115,
      I2 => scancode_in_4_IBUF_119,
      I3 => scancode_in_2_IBUF_117,
      O => ascii_out_7_13_91
    );
  ascii_out_7_27 : LUT4
    generic map(
      INIT => X"A888"
    )
    port map (
      I0 => scancode_in_6_IBUF_121,
      I1 => ascii_out_7_8_95,
      I2 => scancode_in_5_IBUF_120,
      I3 => ascii_out_7_13_91,
      O => ascii_out_7_27_93
    );
  ascii_out_7_58 : LUT4
    generic map(
      INIT => X"5D08"
    )
    port map (
      I0 => scancode_in_1_IBUF_116,
      I1 => scancode_in_4_IBUF_119,
      I2 => scancode_in_3_IBUF_118,
      I3 => scancode_in_0_IBUF_115,
      O => ascii_out_7_58_94
    );
  ascii_out_0_26 : LUT4
    generic map(
      INIT => X"8880"
    )
    port map (
      I0 => scancode_in_6_IBUF_121,
      I1 => scancode_in_5_IBUF_120,
      I2 => scancode_in_0_IBUF_115,
      I3 => scancode_in_4_IBUF_119,
      O => ascii_out_0_26_23
    );
  ascii_out_0_100 : LUT4
    generic map(
      INIT => X"F040"
    )
    port map (
      I0 => scancode_in_2_IBUF_117,
      I1 => scancode_in_5_IBUF_120,
      I2 => scancode_in_3_IBUF_118,
      I3 => scancode_in_6_IBUF_121,
      O => ascii_out_0_100_20
    );
  ascii_out_0_115 : LUT4
    generic map(
      INIT => X"0455"
    )
    port map (
      I0 => scancode_in_4_IBUF_119,
      I1 => scancode_in_2_IBUF_117,
      I2 => scancode_in_3_IBUF_118,
      I3 => scancode_in_5_IBUF_120,
      O => ascii_out_0_115_21
    );
  ascii_out_0_130 : LUT3
    generic map(
      INIT => X"32"
    )
    port map (
      I0 => ascii_out_0_115_21,
      I1 => scancode_in_0_IBUF_115,
      I2 => ascii_out_0_100_20,
      O => ascii_out_0_130_22
    );
  ascii_out_0_157 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => N5,
      I1 => ascii_out_0_28_24,
      I2 => ascii_out_0_83_26,
      I3 => ascii_out_0_130_22,
      O => ascii_out_0_OBUF_99
    );
  ascii_out_1_21 : LUT4
    generic map(
      INIT => X"EAAA"
    )
    port map (
      I0 => N5,
      I1 => scancode_in_6_IBUF_121,
      I2 => scancode_in_5_IBUF_120,
      I3 => scancode_in_1_IBUF_116,
      O => N9
    );
  ascii_out_2_2_SW0 : LUT4
    generic map(
      INIT => X"FF02"
    )
    port map (
      I0 => scancode_in_3_IBUF_118,
      I1 => scancode_in_2_IBUF_117,
      I2 => scancode_in_1_IBUF_116,
      I3 => scancode_in_7_IBUF_122,
      O => N56
    );
  ascii_out_2_2 : LUT4
    generic map(
      INIT => X"FF01"
    )
    port map (
      I0 => scancode_in_6_IBUF_121,
      I1 => scancode_in_5_IBUF_120,
      I2 => scancode_in_4_IBUF_119,
      I3 => N56,
      O => N5
    );
  ascii_out_5_14 : LUT4
    generic map(
      INIT => X"AE04"
    )
    port map (
      I0 => scancode_in_4_IBUF_119,
      I1 => scancode_in_3_IBUF_118,
      I2 => scancode_in_0_IBUF_115,
      I3 => scancode_in_6_IBUF_121,
      O => ascii_out_5_14_78
    );
  ascii_out_5_63 : LUT3
    generic map(
      INIT => X"9F"
    )
    port map (
      I0 => scancode_in_0_IBUF_115,
      I1 => scancode_in_1_IBUF_116,
      I2 => scancode_in_2_IBUF_117,
      O => ascii_out_5_63_83
    );
  ascii_out_5_72 : LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => scancode_in_5_IBUF_120,
      I1 => scancode_in_6_IBUF_121,
      I2 => scancode_in_3_IBUF_118,
      O => ascii_out_5_72_84
    );
  ascii_out_5_86 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => ascii_out_5_14_78,
      I1 => ascii_out_5_31,
      I2 => ascii_out_5_63_83,
      I3 => ascii_out_5_72_84,
      O => ascii_out_5_86_85
    );
  ascii_out_5_139 : LUT3
    generic map(
      INIT => X"F9"
    )
    port map (
      I0 => scancode_in_4_IBUF_119,
      I1 => scancode_in_5_IBUF_120,
      I2 => scancode_in_3_IBUF_118,
      O => ascii_out_5_139_77
    );
  ascii_out_5_161 : LUT4
    generic map(
      INIT => X"A888"
    )
    port map (
      I0 => scancode_in_2_IBUF_117,
      I1 => ascii_out_5_124,
      I2 => scancode_in_1_IBUF_116,
      I3 => ascii_out_5_139_77,
      O => ascii_out_5_161_79
    );
  ascii_out_5_174 : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => N9,
      I1 => ascii_out_5_86_85,
      I2 => ascii_out_5_161_79,
      O => ascii_out_5_OBUF_104
    );
  ascii_out_3_63 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => scancode_in_1_IBUF_116,
      I1 => scancode_in_2_IBUF_117,
      I2 => scancode_in_5_IBUF_120,
      I3 => scancode_in_6_IBUF_121,
      O => ascii_out_3_63_58
    );
  ascii_out_3_69 : LUT3
    generic map(
      INIT => X"8C"
    )
    port map (
      I0 => scancode_in_6_IBUF_121,
      I1 => scancode_in_4_IBUF_119,
      I2 => scancode_in_3_IBUF_118,
      O => ascii_out_3_69_59
    );
  ascii_out_3_92 : LUT4
    generic map(
      INIT => X"0B01"
    )
    port map (
      I0 => scancode_in_5_IBUF_120,
      I1 => scancode_in_1_IBUF_116,
      I2 => scancode_in_2_IBUF_117,
      I3 => scancode_in_3_IBUF_118,
      O => ascii_out_3_92_60
    );
  ascii_out_3_134 : LUT3
    generic map(
      INIT => X"C8"
    )
    port map (
      I0 => scancode_in_2_IBUF_117,
      I1 => scancode_in_6_IBUF_121,
      I2 => scancode_in_3_IBUF_118,
      O => ascii_out_3_134_50
    );
  ascii_out_3_152 : LUT4
    generic map(
      INIT => X"04AE"
    )
    port map (
      I0 => scancode_in_3_IBUF_118,
      I1 => scancode_in_1_IBUF_116,
      I2 => scancode_in_4_IBUF_119,
      I3 => scancode_in_5_IBUF_120,
      O => ascii_out_3_152_51
    );
  ascii_out_2_310 : LUT4
    generic map(
      INIT => X"0400"
    )
    port map (
      I0 => scancode_in_3_IBUF_118,
      I1 => scancode_in_4_IBUF_119,
      I2 => scancode_in_5_IBUF_120,
      I3 => scancode_in_1_IBUF_116,
      O => ascii_out_2_310_43
    );
  ascii_out_2_350 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => N5,
      I1 => ascii_out_2_310_43,
      I2 => scancode_in_6_IBUF_121,
      I3 => ascii_out_2_333,
      O => N6
    );
  ascii_out_2_12 : LUT4
    generic map(
      INIT => X"111F"
    )
    port map (
      I0 => scancode_in_1_IBUF_116,
      I1 => scancode_in_4_IBUF_119,
      I2 => scancode_in_2_IBUF_117,
      I3 => scancode_in_5_IBUF_120,
      O => ascii_out_2_12_37
    );
  ascii_out_2_84 : LUT4
    generic map(
      INIT => X"F115"
    )
    port map (
      I0 => scancode_in_2_IBUF_117,
      I1 => scancode_in_1_IBUF_116,
      I2 => scancode_in_4_IBUF_119,
      I3 => scancode_in_6_IBUF_121,
      O => ascii_out_2_84_47
    );
  ascii_out_2_92 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => scancode_in_3_IBUF_118,
      I1 => scancode_in_6_IBUF_121,
      I2 => scancode_in_5_IBUF_120,
      O => ascii_out_2_92_48
    );
  ascii_out_2_143 : LUT4
    generic map(
      INIT => X"40C0"
    )
    port map (
      I0 => scancode_in_1_IBUF_116,
      I1 => scancode_in_5_IBUF_120,
      I2 => scancode_in_4_IBUF_119,
      I3 => scancode_in_2_IBUF_117,
      O => ascii_out_2_143_38
    );
  ascii_out_2_159 : LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => scancode_in_3_IBUF_118,
      I1 => scancode_in_4_IBUF_119,
      I2 => scancode_in_2_IBUF_117,
      O => ascii_out_2_159_39
    );
  ascii_out_4_5 : LUT4
    generic map(
      INIT => X"CCC8"
    )
    port map (
      I0 => scancode_in_0_IBUF_115,
      I1 => scancode_in_1_IBUF_116,
      I2 => scancode_in_4_IBUF_119,
      I3 => scancode_in_6_IBUF_121,
      O => ascii_out_4_5_71
    );
  ascii_out_4_17 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => scancode_in_4_IBUF_119,
      I1 => scancode_in_5_IBUF_120,
      I2 => scancode_in_0_IBUF_115,
      I3 => scancode_in_3_IBUF_118,
      O => ascii_out_4_17_67
    );
  ascii_out_4_48 : LUT4
    generic map(
      INIT => X"AA28"
    )
    port map (
      I0 => scancode_in_5_IBUF_120,
      I1 => scancode_in_3_IBUF_118,
      I2 => scancode_in_0_IBUF_115,
      I3 => scancode_in_6_IBUF_121,
      O => ascii_out_4_48_70
    );
  ascii_out_4_64 : LUT4
    generic map(
      INIT => X"CCC8"
    )
    port map (
      I0 => ascii_out_4_5_71,
      I1 => scancode_in_2_IBUF_117,
      I2 => ascii_out_4_17_67,
      I3 => ascii_out_4_48_70,
      O => ascii_out_4_64_72
    );
  ascii_out_4_124 : LUT4
    generic map(
      INIT => X"0257"
    )
    port map (
      I0 => scancode_in_1_IBUF_116,
      I1 => scancode_in_6_IBUF_121,
      I2 => scancode_in_0_IBUF_115,
      I3 => scancode_in_5_IBUF_120,
      O => ascii_out_4_124_62
    );
  ascii_out_4_159 : LUT3
    generic map(
      INIT => X"AB"
    )
    port map (
      I0 => scancode_in_3_IBUF_118,
      I1 => scancode_in_2_IBUF_117,
      I2 => scancode_in_6_IBUF_121,
      O => ascii_out_4_159_66
    );
  ascii_out_4_173 : LUT3
    generic map(
      INIT => X"45"
    )
    port map (
      I0 => scancode_in_1_IBUF_116,
      I1 => scancode_in_6_IBUF_121,
      I2 => scancode_in_4_IBUF_119,
      O => ascii_out_4_173_68
    );
  ascii_out_4_187 : LUT4
    generic map(
      INIT => X"F040"
    )
    port map (
      I0 => scancode_in_5_IBUF_120,
      I1 => ascii_out_4_159_66,
      I2 => scancode_in_0_IBUF_115,
      I3 => ascii_out_4_173_68,
      O => ascii_out_4_187_69
    );
  ascii_out_1_16 : LUT4
    generic map(
      INIT => X"888D"
    )
    port map (
      I0 => scancode_in_5_IBUF_120,
      I1 => scancode_in_4_IBUF_119,
      I2 => scancode_in_6_IBUF_121,
      I3 => scancode_in_1_IBUF_116,
      O => ascii_out_1_16_33
    );
  ascii_out_1_29 : LUT4
    generic map(
      INIT => X"88F8"
    )
    port map (
      I0 => N91,
      I1 => scancode_in_6_IBUF_121,
      I2 => ascii_out_1_16_33,
      I3 => scancode_in_3_IBUF_118,
      O => ascii_out_1_29_34
    );
  ascii_out_1_77 : LUT4
    generic map(
      INIT => X"888D"
    )
    port map (
      I0 => scancode_in_6_IBUF_121,
      I1 => scancode_in_4_IBUF_119,
      I2 => scancode_in_5_IBUF_120,
      I3 => scancode_in_2_IBUF_117,
      O => ascii_out_1_77_35
    );
  ascii_out_1_138 : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => ascii_out_1_77_35,
      I1 => ascii_out_1_102,
      I2 => ascii_out_1_133_31,
      O => ascii_out_1_138_32
    );
  ascii_out_1_154 : LUT4
    generic map(
      INIT => X"EFEE"
    )
    port map (
      I0 => N9,
      I1 => ascii_out_1_138_32,
      I2 => scancode_in_0_IBUF_115,
      I3 => ascii_out_1_29_34,
      O => ascii_out_1_OBUF_100
    );
  scancode_in_7_IBUF : IBUF
    port map (
      I => scancode_in(7),
      O => scancode_in_7_IBUF_122
    );
  scancode_in_6_IBUF : IBUF
    port map (
      I => scancode_in(6),
      O => scancode_in_6_IBUF_121
    );
  scancode_in_5_IBUF : IBUF
    port map (
      I => scancode_in(5),
      O => scancode_in_5_IBUF_120
    );
  scancode_in_4_IBUF : IBUF
    port map (
      I => scancode_in(4),
      O => scancode_in_4_IBUF_119
    );
  scancode_in_3_IBUF : IBUF
    port map (
      I => scancode_in(3),
      O => scancode_in_3_IBUF_118
    );
  scancode_in_2_IBUF : IBUF
    port map (
      I => scancode_in(2),
      O => scancode_in_2_IBUF_117
    );
  scancode_in_1_IBUF : IBUF
    port map (
      I => scancode_in(1),
      O => scancode_in_1_IBUF_116
    );
  scancode_in_0_IBUF : IBUF
    port map (
      I => scancode_in(0),
      O => scancode_in_0_IBUF_115
    );
  ascii_out_7_OBUF : OBUF
    port map (
      I => ascii_out_7_OBUF_106,
      O => ascii_out(7)
    );
  ascii_out_6_OBUF : OBUF
    port map (
      I => ascii_out_6_OBUF_105,
      O => ascii_out(6)
    );
  ascii_out_5_OBUF : OBUF
    port map (
      I => ascii_out_5_OBUF_104,
      O => ascii_out(5)
    );
  ascii_out_4_OBUF : OBUF
    port map (
      I => ascii_out_4_OBUF_103,
      O => ascii_out(4)
    );
  ascii_out_3_OBUF : OBUF
    port map (
      I => ascii_out_3_OBUF_102,
      O => ascii_out(3)
    );
  ascii_out_2_OBUF : OBUF
    port map (
      I => ascii_out_2_OBUF_101,
      O => ascii_out(2)
    );
  ascii_out_1_OBUF : OBUF
    port map (
      I => ascii_out_1_OBUF_100,
      O => ascii_out(1)
    );
  ascii_out_0_OBUF : OBUF
    port map (
      I => ascii_out_0_OBUF_99,
      O => ascii_out(0)
    );
  ascii_out_6_86 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => N6,
      I1 => ascii_out_6_37_87,
      I2 => ascii_out_6_57_88,
      I3 => ascii_out_0_5,
      O => ascii_out_6_OBUF_105
    );
  ascii_out_7_137_SW0 : LUT4
    generic map(
      INIT => X"2232"
    )
    port map (
      I0 => ascii_out_7_94,
      I1 => scancode_in_5_IBUF_120,
      I2 => ascii_out_7_58_94,
      I3 => scancode_in_2_IBUF_117,
      O => N62
    );
  ascii_out_7_137 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => N5,
      I1 => ascii_out_7_2_92,
      I2 => ascii_out_7_27_93,
      I3 => N62,
      O => ascii_out_7_OBUF_106
    );
  ascii_out_4_209 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => N9,
      I1 => ascii_out_4_64_72,
      I2 => ascii_out_4_141_63,
      I3 => ascii_out_4_187_69,
      O => ascii_out_4_OBUF_103
    );
  ascii_out_6_37_SW0 : LUT3
    generic map(
      INIT => X"1F"
    )
    port map (
      I0 => scancode_in_4_IBUF_119,
      I1 => scancode_in_0_IBUF_115,
      I2 => scancode_in_5_IBUF_120,
      O => N66
    );
  ascii_out_6_37 : LUT4
    generic map(
      INIT => X"EBEA"
    )
    port map (
      I0 => ascii_out_6_8_89,
      I1 => scancode_in_3_IBUF_118,
      I2 => scancode_in_6_IBUF_121,
      I3 => N66,
      O => ascii_out_6_37_87
    );
  ascii_out_2_342_SW0 : LUT3
    generic map(
      INIT => X"DF"
    )
    port map (
      I0 => scancode_in_1_IBUF_116,
      I1 => scancode_in_4_IBUF_119,
      I2 => scancode_in_2_IBUF_117,
      O => N68
    );
  ascii_out_4_141 : LUT4
    generic map(
      INIT => X"FF02"
    )
    port map (
      I0 => ascii_out_4_124_62,
      I1 => scancode_in_2_IBUF_117,
      I2 => scancode_in_4_IBUF_119,
      I3 => N70,
      O => ascii_out_4_141_63
    );
  ascii_out_1_133_SW0 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => scancode_in_3_IBUF_118,
      I1 => scancode_in_4_IBUF_119,
      I2 => scancode_in_5_IBUF_120,
      I3 => scancode_in_6_IBUF_121,
      O => N72
    );
  ascii_out_1_133 : LUT4
    generic map(
      INIT => X"F090"
    )
    port map (
      I0 => scancode_in_1_IBUF_116,
      I1 => scancode_in_2_IBUF_117,
      I2 => scancode_in_0_IBUF_115,
      I3 => N72,
      O => ascii_out_1_133_31
    );
  ascii_out_3_46 : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => N56,
      I1 => ascii_out_3_42,
      I2 => N74,
      O => ascii_out_3_46_55
    );
  ascii_out_3_191 : MUXF5
    port map (
      I0 => N76,
      I1 => N77,
      S => scancode_in_0_IBUF_115,
      O => ascii_out_3_OBUF_102
    );
  ascii_out_3_191_F : LUT4
    generic map(
      INIT => X"EFEE"
    )
    port map (
      I0 => ascii_out_3_46_55,
      I1 => ascii_out_3_134_50,
      I2 => scancode_in_2_IBUF_117,
      I3 => ascii_out_3_152_51,
      O => N76
    );
  ascii_out_3_191_G : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => ascii_out_3_46_55,
      I1 => ascii_out_3_63_58,
      I2 => ascii_out_3_69_59,
      I3 => ascii_out_3_92_60,
      O => N77
    );
  ascii_out_2_187 : MUXF5
    port map (
      I0 => N78,
      I1 => N79,
      S => scancode_in_0_IBUF_115,
      O => ascii_out_2_187_40
    );
  ascii_out_2_187_F : LUT4
    generic map(
      INIT => X"FCF8"
    )
    port map (
      I0 => scancode_in_6_IBUF_121,
      I1 => scancode_in_3_IBUF_118,
      I2 => ascii_out_2_159_39,
      I3 => ascii_out_2_143_38,
      O => N78
    );
  ascii_out_2_187_G : LUT4
    generic map(
      INIT => X"FCF8"
    )
    port map (
      I0 => scancode_in_1_IBUF_116,
      I1 => scancode_in_2_IBUF_117,
      I2 => ascii_out_2_84_47,
      I3 => ascii_out_2_92_48,
      O => N79
    );
  ascii_out_0_83 : MUXF5
    port map (
      I0 => N80,
      I1 => N81,
      S => scancode_in_2_IBUF_117,
      O => ascii_out_0_83_26
    );
  ascii_out_0_83_F : LUT4
    generic map(
      INIT => X"888C"
    )
    port map (
      I0 => scancode_in_6_IBUF_121,
      I1 => scancode_in_1_IBUF_116,
      I2 => scancode_in_3_IBUF_118,
      I3 => scancode_in_5_IBUF_120,
      O => N80
    );
  ascii_out_0_83_G : LUT4
    generic map(
      INIT => X"C8CC"
    )
    port map (
      I0 => scancode_in_6_IBUF_121,
      I1 => scancode_in_1_IBUF_116,
      I2 => scancode_in_0_IBUF_115,
      I3 => scancode_in_4_IBUF_119,
      O => N81
    );
  ascii_out_0_28 : MUXF5
    port map (
      I0 => N82,
      I1 => N83,
      S => scancode_in_2_IBUF_117,
      O => ascii_out_0_28_24
    );
  ascii_out_0_28_F : LUT3
    generic map(
      INIT => X"BA"
    )
    port map (
      I0 => ascii_out_0_26_23,
      I1 => scancode_in_5_IBUF_120,
      I2 => scancode_in_0_IBUF_115,
      O => N82
    );
  ascii_out_0_28_G : LUT3
    generic map(
      INIT => X"BA"
    )
    port map (
      I0 => ascii_out_0_26_23,
      I1 => scancode_in_1_IBUF_116,
      I2 => scancode_in_4_IBUF_119,
      O => N83
    );
  ascii_out_5_311 : LUT4
    generic map(
      INIT => X"0504"
    )
    port map (
      I0 => scancode_in_1_IBUF_116,
      I1 => scancode_in_0_IBUF_115,
      I2 => scancode_in_2_IBUF_117,
      I3 => scancode_in_4_IBUF_119,
      O => ascii_out_5_311_81
    );
  ascii_out_5_312 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => scancode_in_4_IBUF_119,
      I1 => scancode_in_0_IBUF_115,
      I2 => scancode_in_1_IBUF_116,
      I3 => scancode_in_2_IBUF_117,
      O => ascii_out_5_312_82
    );
  ascii_out_5_31_f5 : MUXF5
    port map (
      I0 => ascii_out_5_312_82,
      I1 => ascii_out_5_311_81,
      S => scancode_in_6_IBUF_121,
      O => ascii_out_5_31
    );
  ascii_out_5_1241 : LUT4
    generic map(
      INIT => X"FF02"
    )
    port map (
      I0 => scancode_in_0_IBUF_115,
      I1 => scancode_in_4_IBUF_119,
      I2 => scancode_in_3_IBUF_118,
      I3 => scancode_in_5_IBUF_120,
      O => ascii_out_5_1241_75
    );
  ascii_out_5_1242 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => scancode_in_0_IBUF_115,
      I1 => scancode_in_4_IBUF_119,
      I2 => scancode_in_3_IBUF_118,
      O => ascii_out_5_1242_76
    );
  ascii_out_5_124_f5 : MUXF5
    port map (
      I0 => ascii_out_5_1242_76,
      I1 => ascii_out_5_1241_75,
      S => scancode_in_6_IBUF_121,
      O => ascii_out_5_124
    );
  ascii_out_3_421 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => scancode_in_1_IBUF_116,
      I1 => scancode_in_2_IBUF_117,
      I2 => scancode_in_3_IBUF_118,
      I3 => scancode_in_5_IBUF_120,
      O => ascii_out_3_421_53
    );
  ascii_out_3_422 : LUT4
    generic map(
      INIT => X"0006"
    )
    port map (
      I0 => scancode_in_1_IBUF_116,
      I1 => scancode_in_2_IBUF_117,
      I2 => scancode_in_3_IBUF_118,
      I3 => scancode_in_5_IBUF_120,
      O => ascii_out_3_422_54
    );
  ascii_out_3_42_f5 : MUXF5
    port map (
      I0 => ascii_out_3_422_54,
      I1 => ascii_out_3_421_53,
      S => scancode_in_6_IBUF_121,
      O => ascii_out_3_42
    );
  ascii_out_2_1971 : LUT3
    generic map(
      INIT => X"EF"
    )
    port map (
      I0 => ascii_out_2_187_40,
      I1 => N6,
      I2 => N68,
      O => ascii_out_2_197
    );
  ascii_out_2_1972 : LUT4
    generic map(
      INIT => X"EFEE"
    )
    port map (
      I0 => N6,
      I1 => ascii_out_2_187_40,
      I2 => scancode_in_6_IBUF_121,
      I3 => ascii_out_2_12_37,
      O => ascii_out_2_1971_42
    );
  ascii_out_2_197_f5 : MUXF5
    port map (
      I0 => ascii_out_2_1971_42,
      I1 => ascii_out_2_197,
      S => scancode_in_3_IBUF_118,
      O => ascii_out_2_OBUF_101
    );
  ascii_out_1_1021 : LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => scancode_in_5_IBUF_120,
      I1 => scancode_in_1_IBUF_116,
      I2 => scancode_in_3_IBUF_118,
      O => ascii_out_1_1021_29
    );
  ascii_out_1_1022 : LUT4
    generic map(
      INIT => X"084C"
    )
    port map (
      I0 => scancode_in_1_IBUF_116,
      I1 => scancode_in_3_IBUF_118,
      I2 => scancode_in_5_IBUF_120,
      I3 => scancode_in_4_IBUF_119,
      O => ascii_out_1_1022_30
    );
  ascii_out_1_102_f5 : MUXF5
    port map (
      I0 => ascii_out_1_1022_30,
      I1 => ascii_out_1_1021_29,
      S => scancode_in_6_IBUF_121,
      O => ascii_out_1_102
    );
  ascii_out_7_941 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => scancode_in_0_IBUF_115,
      I1 => scancode_in_4_IBUF_119,
      O => ascii_out_7_941_97
    );
  ascii_out_7_942 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => scancode_in_2_IBUF_117,
      I1 => scancode_in_0_IBUF_115,
      I2 => scancode_in_6_IBUF_121,
      I3 => scancode_in_1_IBUF_116,
      O => ascii_out_7_942_98
    );
  ascii_out_7_94_f5 : MUXF5
    port map (
      I0 => ascii_out_7_942_98,
      I1 => ascii_out_7_941_97,
      S => scancode_in_3_IBUF_118,
      O => ascii_out_7_94
    );
  ascii_out_2_3331 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => scancode_in_0_IBUF_115,
      I1 => scancode_in_1_IBUF_116,
      I2 => scancode_in_2_IBUF_117,
      I3 => scancode_in_4_IBUF_119,
      O => ascii_out_2_3331_45
    );
  ascii_out_2_3332 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => scancode_in_2_IBUF_117,
      I1 => scancode_in_1_IBUF_116,
      I2 => scancode_in_0_IBUF_115,
      O => ascii_out_2_3332_46
    );
  ascii_out_2_333_f5 : MUXF5
    port map (
      I0 => ascii_out_2_3332_46,
      I1 => ascii_out_2_3331_45,
      S => scancode_in_5_IBUF_120,
      O => ascii_out_2_333
    );
  ascii_out_4_141_SW01 : LUT4
    generic map(
      INIT => X"FCF8"
    )
    port map (
      I0 => scancode_in_5_IBUF_120,
      I1 => scancode_in_4_IBUF_119,
      I2 => scancode_in_3_IBUF_118,
      I3 => scancode_in_1_IBUF_116,
      O => ascii_out_4_141_SW0
    );
  ascii_out_4_141_SW02 : LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => scancode_in_5_IBUF_120,
      I1 => scancode_in_1_IBUF_116,
      I2 => scancode_in_4_IBUF_119,
      O => ascii_out_4_141_SW01_65
    );
  ascii_out_4_141_SW0_f5 : MUXF5
    port map (
      I0 => ascii_out_4_141_SW01_65,
      I1 => ascii_out_4_141_SW0,
      S => scancode_in_6_IBUF_121,
      O => N70
    );
  ascii_out_3_46_SW01 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => scancode_in_5_IBUF_120,
      I1 => scancode_in_4_IBUF_119,
      O => ascii_out_3_46_SW0
    );
  ascii_out_3_46_SW02 : LUT4
    generic map(
      INIT => X"9111"
    )
    port map (
      I0 => scancode_in_5_IBUF_120,
      I1 => scancode_in_4_IBUF_119,
      I2 => scancode_in_1_IBUF_116,
      I3 => scancode_in_3_IBUF_118,
      O => ascii_out_3_46_SW01_57
    );
  ascii_out_3_46_SW0_f5 : MUXF5
    port map (
      I0 => ascii_out_3_46_SW01_57,
      I1 => ascii_out_3_46_SW0,
      S => scancode_in_6_IBUF_121,
      O => N74
    );

end Structure;

