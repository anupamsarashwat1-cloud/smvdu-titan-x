* Functional test stimulus file for 10ns period

* TT process corner
.include "/home/anupam-sarashwat/OpenRAM/technology/scn4m_subm/models/nom/pmos.sp"
.include "/home/anupam-sarashwat/OpenRAM/technology/scn4m_subm/models/nom/nmos.sp"
.include "/tmp/openram_anupam-sarashwat_5149_temp/sram.sp"

* Global Power Supplies
Vvdd vdd 0 5.0

*Nodes gnd and 0 are the same global ground node in ngspice/hspice/xa. Otherwise, this source may be needed.
*Vgnd gnd 0 0.0

* Instantiation of the SRAM
Xsram_32x64_180nm din0_0 din0_1 din0_2 din0_3 din0_4 din0_5 din0_6 din0_7 din0_8 din0_9 din0_10 din0_11 din0_12 din0_13 din0_14 din0_15 din0_16 din0_17 din0_18 din0_19 din0_20 din0_21 din0_22 din0_23 din0_24 din0_25 din0_26 din0_27 din0_28 din0_29 din0_30 din0_31 a0_0 a0_1 a0_2 a0_3 a0_4 a0_5 CSB0 WEB0 clk0 WMASK0_0 WMASK0_1 WMASK0_2 WMASK0_3 dout0_0 dout0_1 dout0_2 dout0_3 dout0_4 dout0_5 dout0_6 dout0_7 dout0_8 dout0_9 dout0_10 dout0_11 dout0_12 dout0_13 dout0_14 dout0_15 dout0_16 dout0_17 dout0_18 dout0_19 dout0_20 dout0_21 dout0_22 dout0_23 dout0_24 dout0_25 dout0_26 dout0_27 dout0_28 dout0_29 dout0_30 dout0_31 vdd gnd sram_32x64_180nm

* SRAM output loads
CD00 dout0_0  0 39.2968f
CD01 dout0_1  0 39.2968f
CD02 dout0_2  0 39.2968f
CD03 dout0_3  0 39.2968f
CD04 dout0_4  0 39.2968f
CD05 dout0_5  0 39.2968f
CD06 dout0_6  0 39.2968f
CD07 dout0_7  0 39.2968f
CD08 dout0_8  0 39.2968f
CD09 dout0_9  0 39.2968f
CD010 dout0_10  0 39.2968f
CD011 dout0_11  0 39.2968f
CD012 dout0_12  0 39.2968f
CD013 dout0_13  0 39.2968f
CD014 dout0_14  0 39.2968f
CD015 dout0_15  0 39.2968f
CD016 dout0_16  0 39.2968f
CD017 dout0_17  0 39.2968f
CD018 dout0_18  0 39.2968f
CD019 dout0_19  0 39.2968f
CD020 dout0_20  0 39.2968f
CD021 dout0_21  0 39.2968f
CD022 dout0_22  0 39.2968f
CD023 dout0_23  0 39.2968f
CD024 dout0_24  0 39.2968f
CD025 dout0_25  0 39.2968f
CD026 dout0_26  0 39.2968f
CD027 dout0_27  0 39.2968f
CD028 dout0_28  0 39.2968f
CD029 dout0_29  0 39.2968f
CD030 dout0_30  0 39.2968f
CD031 dout0_31  0 39.2968f


* Important signals for debug
* bl:	xsram:xbank0:bl_0_0
* br:	xsram:xbank0:br_0_0
* s_en:	xsram:s_en
* q:	xsram:xbank0:xbitcell_array:xbitcell_array:xbit_r0_c0.Q
* qbar:	xsram:xbank0:xbitcell_array:xbitcell_array:xbit_r0_c0.Q_bar


* Sequence of operations
*	Idle during cycle 0 (0ns - 10ns)
*	Writing 10001010001111111001111001100010  to  address 111101 (from port 0) during cycle 1 (10ns - 20ns)
*	Writing 00010011001000101111110000111100  to  address 111101 (from port 0) during cycle 2 (20ns - 30ns)
*	Writing 10111000110110001100000000110111  to  address 000000 (from port 0) during cycle 3 (30ns - 40ns)
*	Reading 10111000110110001100000000110111 from address 000000 (from port 0) during cycle 4 (40ns - 50ns)
*	Writing (partial) 10000100001100110001100001010111  to  address 000000 with mask bit 1110 (from port 0) during cycle 5 (50ns - 60ns)
*	Writing (partial) 00111111011100001011111101001010  to  address 000000 with mask bit 1010 (from port 0) during cycle 6 (60ns - 70ns)
*	Writing (partial) 11100010110110111101010010000001  to  address 000000 with mask bit 0011 (from port 0) during cycle 7 (70ns - 80ns)
*	Writing 00010011011011011011001001111010  to  address 000001 (from port 0) during cycle 8 (80ns - 90ns)
*	Reading 00111111001100111101010010000001 from address 000000 (from port 0) during cycle 10 (100ns - 110ns)
*	Reading 00010011001000101111110000111100 from address 111101 (from port 0) during cycle 12 (120ns - 130ns)
*	Writing 11110101100110001001001111110011  to  address 111101 (from port 0) during cycle 13 (130ns - 140ns)
*	Writing (partial) 00000111101000011010110110110101  to  address 000001 with mask bit 0001 (from port 0) during cycle 15 (150ns - 160ns)
*	Writing 11011100111001101100010100000001  to  address 000001 (from port 0) during cycle 16 (160ns - 170ns)
*	Writing 10110111000101110010000010001010  to  address 111110 (from port 0) during cycle 17 (170ns - 180ns)
*	Reading 11110101100110001001001111110011 from address 111101 (from port 0) during cycle 18 (180ns - 190ns)
*	Reading 11011100111001101100010100000001 from address 000001 (from port 0) during cycle 21 (210ns - 220ns)
*	Writing (partial) 10110011010110101011011001100111  to  address 000001 with mask bit 0100 (from port 0) during cycle 22 (220ns - 230ns)
*	Reading 11110101100110001001001111110011 from address 111101 (from port 0) during cycle 24 (240ns - 250ns)
*	Writing 00100111011101101001010010100111  to  address 111101 (from port 0) during cycle 25 (250ns - 260ns)
*	Reading 11011100010110101100010100000001 from address 000001 (from port 0) during cycle 26 (260ns - 270ns)
*	Reading 00111111001100111101010010000001 from address 000000 (from port 0) during cycle 27 (270ns - 280ns)
*	Writing 00010000001001110011000011011001  to  address 111101 (from port 0) during cycle 28 (280ns - 290ns)
*	Reading 11011100010110101100010100000001 from address 000001 (from port 0) during cycle 29 (290ns - 300ns)
*	Writing (partial) 00111010110001011110110110010100  to  address 111101 with mask bit 0101 (from port 0) during cycle 30 (300ns - 310ns)
*	Reading 00010000110001010011000010010100 from address 111101 (from port 0) during cycle 32 (320ns - 330ns)
*	Reading 11011100010110101100010100000001 from address 000001 (from port 0) during cycle 36 (360ns - 370ns)
*	Reading 00111111001100111101010010000001 from address 000000 (from port 0) during cycle 37 (370ns - 380ns)
*	Reading 00010000110001010011000010010100 from address 111101 (from port 0) during cycle 38 (380ns - 390ns)
*	Writing 10110001011011111111001000000001  to  address 111101 (from port 0) during cycle 39 (390ns - 400ns)
*	Writing 11101111111110101111110100101010  to  address 111110 (from port 0) during cycle 40 (400ns - 410ns)
*	Writing (partial) 11111111110111011010111011010101  to  address 111110 with mask bit 1110 (from port 0) during cycle 41 (410ns - 420ns)
*	Writing (partial) 01111111110010011001000101100111  to  address 111110 with mask bit 1110 (from port 0) during cycle 42 (420ns - 430ns)
*	Writing (partial) 00100101001110111001111001011101  to  address 111101 with mask bit 1000 (from port 0) during cycle 43 (430ns - 440ns)
*	Reading 01111111110010011001000100101010 from address 111110 (from port 0) during cycle 44 (440ns - 450ns)
*	Writing 01011010111001010101011010000100  to  address 000001 (from port 0) during cycle 45 (450ns - 460ns)
*	Writing (partial) 10000111011100000011010000110100  to  address 000000 with mask bit 1011 (from port 0) during cycle 47 (470ns - 480ns)
*	Writing 01010010110000101000100010100101  to  address 000001 (from port 0) during cycle 48 (480ns - 490ns)
*	Writing 00111111101110000100110000100010  to  address 000000 (from port 0) during cycle 49 (490ns - 500ns)
*	Writing (partial) 01011000001111001101100011100101  to  address 111101 with mask bit 1000 (from port 0) during cycle 51 (510ns - 520ns)
*	Reading 01010010110000101000100010100101 from address 000001 (from port 0) during cycle 52 (520ns - 530ns)
*	Writing 11110010000001110010000001010100  to  address 000001 (from port 0) during cycle 53 (530ns - 540ns)
*	Writing 00010011101100101001111110100001  to  address 000000 (from port 0) during cycle 54 (540ns - 550ns)
*	Reading 00010011101100101001111110100001 from address 000000 (from port 0) during cycle 56 (560ns - 570ns)
*	Reading 01111111110010011001000100101010 from address 111110 (from port 0) during cycle 57 (570ns - 580ns)
*	Reading 11110010000001110010000001010100 from address 000001 (from port 0) during cycle 58 (580ns - 590ns)
*	Writing (partial) 11000101011110011011100001101100  to  address 111110 with mask bit 0001 (from port 0) during cycle 59 (590ns - 600ns)
*	Writing 10010001111000111100111101100010  to  address 111110 (from port 0) during cycle 60 (600ns - 610ns)
*	Writing 01101010011100100010010010101001  to  address 000001 (from port 0) during cycle 61 (610ns - 620ns)
*	Reading 01101010011100100010010010101001 from address 000001 (from port 0) during cycle 62 (620ns - 630ns)
*	Reading 10010001111000111100111101100010 from address 111110 (from port 0) during cycle 63 (630ns - 640ns)
*	Writing 00011010001110000110001000111011  to  address 111110 (from port 0) during cycle 64 (640ns - 650ns)
*	Reading 01101010011100100010010010101001 from address 000001 (from port 0) during cycle 65 (650ns - 660ns)
*	Writing 01111011100011010110101000100101  to  address 000001 (from port 0) during cycle 66 (660ns - 670ns)
*	Writing 11101111001100000111001100100100  to  address 111110 (from port 0) during cycle 67 (670ns - 680ns)
*	Writing 00100110010101011000001111010110  to  address 000001 (from port 0) during cycle 68 (680ns - 690ns)
*	Reading 11101111001100000111001100100100 from address 111110 (from port 0) during cycle 69 (690ns - 700ns)
*	Reading 00100110010101011000001111010110 from address 000001 (from port 0) during cycle 71 (710ns - 720ns)
*	Writing (partial) 01100100011001011111010010011101  to  address 111110 with mask bit 1011 (from port 0) during cycle 72 (720ns - 730ns)
*	Writing (partial) 10101010001000110110001000000001  to  address 111101 with mask bit 1010 (from port 0) during cycle 74 (740ns - 750ns)
*	Writing 11011011001111111001000001011001  to  address 111110 (from port 0) during cycle 75 (750ns - 760ns)
*	Writing (partial) 10010001010010110110110100000110  to  address 111101 with mask bit 0110 (from port 0) during cycle 76 (760ns - 770ns)
*	Reading 10101010010010110110110100000001 from address 111101 (from port 0) during cycle 77 (770ns - 780ns)
*	Writing (partial) 11100011000011111101101011001010  to  address 000000 with mask bit 1100 (from port 0) during cycle 78 (780ns - 790ns)
*	Reading 11011011001111111001000001011001 from address 111110 (from port 0) during cycle 79 (790ns - 800ns)
*	Reading 11011011001111111001000001011001 from address 111110 (from port 0) during cycle 80 (800ns - 810ns)
*	Reading 00100110010101011000001111010110 from address 000001 (from port 0) during cycle 81 (810ns - 820ns)
*	Writing (partial) 01111001000000111101000001110010  to  address 111101 with mask bit 1101 (from port 0) during cycle 82 (820ns - 830ns)
*	Reading 00100110010101011000001111010110 from address 000001 (from port 0) during cycle 83 (830ns - 840ns)
*	Reading 00100110010101011000001111010110 from address 000001 (from port 0) during cycle 84 (840ns - 850ns)
*	Writing (partial) 00100000101011111011110011110001  to  address 111110 with mask bit 0010 (from port 0) during cycle 85 (850ns - 860ns)
*	Reading 00100110010101011000001111010110 from address 000001 (from port 0) during cycle 86 (860ns - 870ns)
*	Reading 01111001000000110110110101110010 from address 111101 (from port 0) during cycle 89 (890ns - 900ns)
*	Reading 00100110010101011000001111010110 from address 000001 (from port 0) during cycle 90 (900ns - 910ns)
*	Writing (partial) 00100100110000110101110011110001  to  address 111101 with mask bit 0100 (from port 0) during cycle 91 (910ns - 920ns)
*	Reading 11100011000011111001111110100001 from address 000000 (from port 0) during cycle 93 (930ns - 940ns)
*	Writing (partial) 11000011100111101001111010101001  to  address 000000 with mask bit 0011 (from port 0) during cycle 95 (950ns - 960ns)
*	Reading 11011011001111111011110001011001 from address 111110 (from port 0) during cycle 96 (960ns - 970ns)
*	Writing (partial) 11010100100001100010000100001111  to  address 111110 with mask bit 0001 (from port 0) during cycle 97 (970ns - 980ns)
*	Reading 11011011001111111011110000001111 from address 111110 (from port 0) during cycle 98 (980ns - 990ns)
*	Reading 01111001110000110110110101110010 from address 111101 (from port 0) during cycle 99 (990ns - 1000ns)
*	Writing (partial) 00111110000110111011011111010111  to  address 111101 with mask bit 1011 (from port 0) during cycle 100 (1000ns - 1010ns)
*	Reading 11011011001111111011110000001111 from address 111110 (from port 0) during cycle 101 (1010ns - 1020ns)
*	Writing (partial) 10001010001100011001101000101100  to  address 111101 with mask bit 1011 (from port 0) during cycle 102 (1020ns - 1030ns)
*	Reading 00100110010101011000001111010110 from address 000001 (from port 0) during cycle 103 (1030ns - 1040ns)
*	Reading 00100110010101011000001111010110 from address 000001 (from port 0) during cycle 104 (1040ns - 1050ns)
*	Reading 10001010110000111001101000101100 from address 111101 (from port 0) during cycle 105 (1050ns - 1060ns)
*	Reading 10001010110000111001101000101100 from address 111101 (from port 0) during cycle 106 (1060ns - 1070ns)
*	Writing (partial) 10010010001011001011110100101000  to  address 000000 with mask bit 1000 (from port 0) during cycle 107 (1070ns - 1080ns)
*	Writing 01000100101011111111000000001101  to  address 000001 (from port 0) during cycle 108 (1080ns - 1090ns)
*	Writing (partial) 11000010100101010110110100011100  to  address 111110 with mask bit 1001 (from port 0) during cycle 109 (1090ns - 1100ns)
*	Reading 10010010000011111001111010101001 from address 000000 (from port 0) during cycle 110 (1100ns - 1110ns)
*	Writing 11001000010000010111011110110111  to  address 111101 (from port 0) during cycle 111 (1110ns - 1120ns)
*	Writing (partial) 01111110000111111100101010001011  to  address 000001 with mask bit 0100 (from port 0) during cycle 112 (1120ns - 1130ns)
*	Reading 11001000010000010111011110110111 from address 111101 (from port 0) during cycle 114 (1140ns - 1150ns)
*	Writing (partial) 00000001111101000001110111101010  to  address 111110 with mask bit 0011 (from port 0) during cycle 115 (1150ns - 1160ns)
*	Writing 10100110101011101100001111100001  to  address 000001 (from port 0) during cycle 116 (1160ns - 1170ns)
*	Reading 11000010001111110001110111101010 from address 111110 (from port 0) during cycle 118 (1180ns - 1190ns)
*	Writing (partial) 11010010001111011111010110011010  to  address 000001 with mask bit 1000 (from port 0) during cycle 119 (1190ns - 1200ns)
*	Writing 00111110001000100010010101111010  to  address 000001 (from port 0) during cycle 120 (1200ns - 1210ns)
*	Writing (partial) 11100100110010100010010011011010  to  address 111110 with mask bit 1000 (from port 0) during cycle 122 (1220ns - 1230ns)
*	Writing 11010001110111010110001000010101  to  address 111101 (from port 0) during cycle 123 (1230ns - 1240ns)
*	Reading 00111110001000100010010101111010 from address 000001 (from port 0) during cycle 124 (1240ns - 1250ns)
*	Reading 10010010000011111001111010101001 from address 000000 (from port 0) during cycle 125 (1250ns - 1260ns)
*	Reading 11010001110111010110001000010101 from address 111101 (from port 0) during cycle 126 (1260ns - 1270ns)
*	Writing (partial) 00010111010111010110011110101010  to  address 000000 with mask bit 1100 (from port 0) during cycle 127 (1270ns - 1280ns)
*	Writing (partial) 00001101101001111111111101010001  to  address 111101 with mask bit 0011 (from port 0) during cycle 128 (1280ns - 1290ns)
*	Reading 11100100001111110001110111101010 from address 111110 (from port 0) during cycle 129 (1290ns - 1300ns)
*	Writing (partial) 10001010111001011010100111101100  to  address 111110 with mask bit 1000 (from port 0) during cycle 130 (1300ns - 1310ns)
*	Writing 11101111000000111010011111011100  to  address 111110 (from port 0) during cycle 131 (1310ns - 1320ns)
*	Writing 10000011010011101010111111001000  to  address 000000 (from port 0) during cycle 132 (1320ns - 1330ns)
*	Writing 10001001011000111101110001111010  to  address 000000 (from port 0) during cycle 133 (1330ns - 1340ns)
*	Reading 00111110001000100010010101111010 from address 000001 (from port 0) during cycle 135 (1350ns - 1360ns)
*	Reading 10001001011000111101110001111010 from address 000000 (from port 0) during cycle 137 (1370ns - 1380ns)
*	Writing 01110001110110000000101011111100  to  address 111101 (from port 0) during cycle 138 (1380ns - 1390ns)
*	Writing (partial) 00110001101010111010110110010001  to  address 111101 with mask bit 1001 (from port 0) during cycle 139 (1390ns - 1400ns)
*	Reading 00111110001000100010010101111010 from address 000001 (from port 0) during cycle 140 (1400ns - 1410ns)
*	Writing (partial) 10101001110010100010101000011010  to  address 000001 with mask bit 1101 (from port 0) during cycle 144 (1440ns - 1450ns)
*	Reading 10101001110010100010010100011010 from address 000001 (from port 0) during cycle 145 (1450ns - 1460ns)
*	Reading 00110001110110000000101010010001 from address 111101 (from port 0) during cycle 146 (1460ns - 1470ns)
*	Reading 10001001011000111101110001111010 from address 000000 (from port 0) during cycle 147 (1470ns - 1480ns)
*	Writing (partial) 11000100110100001001110010001000  to  address 000000 with mask bit 0100 (from port 0) during cycle 148 (1480ns - 1490ns)
*	Reading 10001001110100001101110001111010 from address 000000 (from port 0) during cycle 149 (1490ns - 1500ns)
*	Writing (partial) 01000111000100101111001101110010  to  address 111110 with mask bit 0101 (from port 0) during cycle 150 (1500ns - 1510ns)
*	Writing 00001000101111011011000000101000  to  address 111101 (from port 0) during cycle 151 (1510ns - 1520ns)
*	Writing (partial) 01111011001110101111110110000101  to  address 111110 with mask bit 0001 (from port 0) during cycle 152 (1520ns - 1530ns)
*	Writing 11101010111111011101100001111010  to  address 111110 (from port 0) during cycle 153 (1530ns - 1540ns)
*	Writing 00000001010101101110101011001101  to  address 111110 (from port 0) during cycle 154 (1540ns - 1550ns)
*	Writing (partial) 10001100110001010001011000100011  to  address 111110 with mask bit 1011 (from port 0) during cycle 155 (1550ns - 1560ns)
*	Writing 00101000101000110000101011100100  to  address 111110 (from port 0) during cycle 156 (1560ns - 1570ns)
*	Reading 00101000101000110000101011100100 from address 111110 (from port 0) during cycle 158 (1580ns - 1590ns)
*	Writing 11101100101010010100110101100001  to  address 111110 (from port 0) during cycle 159 (1590ns - 1600ns)
*	Reading 11101100101010010100110101100001 from address 111110 (from port 0) during cycle 160 (1600ns - 1610ns)
*	Reading 10101001110010100010010100011010 from address 000001 (from port 0) during cycle 162 (1620ns - 1630ns)
*	Reading 10001001110100001101110001111010 from address 000000 (from port 0) during cycle 163 (1630ns - 1640ns)
*	Writing 11111100010010011111001111101111  to  address 000001 (from port 0) during cycle 164 (1640ns - 1650ns)
*	Reading 10001001110100001101110001111010 from address 000000 (from port 0) during cycle 166 (1660ns - 1670ns)
*	Reading 10001001110100001101110001111010 from address 000000 (from port 0) during cycle 167 (1670ns - 1680ns)
*	Reading 11111100010010011111001111101111 from address 000001 (from port 0) during cycle 168 (1680ns - 1690ns)
*	Reading 00001000101111011011000000101000 from address 111101 (from port 0) during cycle 169 (1690ns - 1700ns)
*	Reading 11101100101010010100110101100001 from address 111110 (from port 0) during cycle 171 (1710ns - 1720ns)
*	Writing 11000110100001011110101001000101  to  address 111110 (from port 0) during cycle 172 (1720ns - 1730ns)
*	Writing 01011100101111011111111101000110  to  address 111101 (from port 0) during cycle 173 (1730ns - 1740ns)
*	Reading 11000110100001011110101001000101 from address 111110 (from port 0) during cycle 174 (1740ns - 1750ns)
*	Writing 01100110001010001101101110001010  to  address 000001 (from port 0) during cycle 176 (1760ns - 1770ns)
*	Writing (partial) 11111011111010101111110110011011  to  address 000001 with mask bit 0100 (from port 0) during cycle 177 (1770ns - 1780ns)
*	Writing 00011011111110011010101100000001  to  address 000000 (from port 0) during cycle 178 (1780ns - 1790ns)
*	Writing (partial) 10111001000110001000111101011011  to  address 000000 with mask bit 0010 (from port 0) during cycle 179 (1790ns - 1800ns)
*	Writing 01110110101100000101011010001000  to  address 000001 (from port 0) during cycle 181 (1810ns - 1820ns)
*	Reading 01110110101100000101011010001000 from address 000001 (from port 0) during cycle 182 (1820ns - 1830ns)
*	Reading 00011011111110011000111100000001 from address 000000 (from port 0) during cycle 183 (1830ns - 1840ns)
*	Writing (partial) 01000010100000111000110011110110  to  address 000001 with mask bit 1011 (from port 0) during cycle 184 (1840ns - 1850ns)
*	Writing (partial) 00100011110110011100111111011010  to  address 111110 with mask bit 1100 (from port 0) during cycle 185 (1850ns - 1860ns)
*	Writing (partial) 01000110010100110101010000011110  to  address 000000 with mask bit 1110 (from port 0) during cycle 186 (1860ns - 1870ns)
*	Reading 00100011110110011110101001000101 from address 111110 (from port 0) during cycle 187 (1870ns - 1880ns)
*	Writing 01000010101001011111101011110110  to  address 111110 (from port 0) during cycle 188 (1880ns - 1890ns)
*	Writing 10000010011100001100001100111100  to  address 000000 (from port 0) during cycle 189 (1890ns - 1900ns)
*	Reading 01011100101111011111111101000110 from address 111101 (from port 0) during cycle 190 (1900ns - 1910ns)
*	Writing 01011001010001110101101111011111  to  address 000001 (from port 0) during cycle 193 (1930ns - 1940ns)
*	Reading 01011100101111011111111101000110 from address 111101 (from port 0) during cycle 194 (1940ns - 1950ns)
*	Reading 10000010011100001100001100111100 from address 000000 (from port 0) during cycle 195 (1950ns - 1960ns)
*	Reading 01000010101001011111101011110110 from address 111110 (from port 0) during cycle 196 (1960ns - 1970ns)
*	Writing 11110111001000100011110100101101  to  address 111101 (from port 0) during cycle 197 (1970ns - 1980ns)
*	Writing 00101010001001101010000001001101  to  address 000000 (from port 0) during cycle 198 (1980ns - 1990ns)
*	Reading 00101010001001101010000001001101 from address 000000 (from port 0) during cycle 199 (1990ns - 2000ns)
*	Reading 01000010101001011111101011110110 from address 111110 (from port 0) during cycle 200 (2000ns - 2010ns)
*	Reading 00101010001001101010000001001101 from address 000000 (from port 0) during cycle 201 (2010ns - 2020ns)
*	Writing (partial) 01011011111100010011010000000101  to  address 111110 with mask bit 0110 (from port 0) during cycle 203 (2030ns - 2040ns)
*	Reading 11110111001000100011110100101101 from address 111101 (from port 0) during cycle 204 (2040ns - 2050ns)
*	Idle during cycle 205 (2050ns - 2060ns)

* Generation of data and address signals
* (time, data): [(0, 0), (10, 0), (20, 0), (30, 1), (40, 1), (50, 1), (60, 0), (70, 1), (80, 0), (90, 0), (100, 0), (110, 0), (120, 0), (130, 1), (140, 1), (150, 1), (160, 1), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 1), (230, 1), (240, 1), (250, 1), (260, 1), (270, 1), (280, 1), (290, 1), (300, 0), (310, 0), (320, 0), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 0), (390, 1), (400, 0), (410, 1), (420, 1), (430, 1), (440, 1), (450, 0), (460, 0), (470, 0), (480, 1), (490, 0), (500, 0), (510, 1), (520, 1), (530, 0), (540, 1), (550, 1), (560, 1), (570, 1), (580, 1), (590, 0), (600, 0), (610, 1), (620, 1), (630, 1), (640, 1), (650, 1), (660, 1), (670, 0), (680, 0), (690, 0), (700, 0), (710, 0), (720, 1), (730, 1), (740, 1), (750, 1), (760, 0), (770, 0), (780, 0), (790, 0), (800, 0), (810, 0), (820, 0), (830, 0), (840, 0), (850, 1), (860, 1), (870, 1), (880, 1), (890, 1), (900, 1), (910, 1), (920, 1), (930, 1), (940, 1), (950, 1), (960, 1), (970, 1), (980, 1), (990, 1), (1000, 1), (1010, 1), (1020, 0), (1030, 0), (1040, 0), (1050, 0), (1060, 0), (1070, 0), (1080, 1), (1090, 0), (1100, 0), (1110, 1), (1120, 1), (1130, 1), (1140, 1), (1150, 0), (1160, 1), (1170, 1), (1180, 1), (1190, 0), (1200, 0), (1210, 0), (1220, 0), (1230, 1), (1240, 1), (1250, 1), (1260, 1), (1270, 0), (1280, 1), (1290, 1), (1300, 0), (1310, 0), (1320, 0), (1330, 0), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 0), (1390, 1), (1400, 1), (1410, 1), (1420, 1), (1430, 1), (1440, 0), (1450, 0), (1460, 0), (1470, 0), (1480, 0), (1490, 0), (1500, 0), (1510, 0), (1520, 1), (1530, 0), (1540, 1), (1550, 1), (1560, 0), (1570, 0), (1580, 0), (1590, 1), (1600, 1), (1610, 1), (1620, 1), (1630, 1), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 1), (1700, 1), (1710, 1), (1720, 1), (1730, 0), (1740, 0), (1750, 0), (1760, 0), (1770, 1), (1780, 1), (1790, 1), (1800, 1), (1810, 0), (1820, 0), (1830, 0), (1840, 0), (1850, 0), (1860, 0), (1870, 0), (1880, 0), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 1), (1940, 1), (1950, 1), (1960, 1), (1970, 1), (1980, 1), (1990, 1), (2000, 1), (2010, 1), (2020, 1), (2030, 1), (2040, 1), (2050, 1)]
Vdin0_0  din0_0  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 0.0v 19.45n 0.0v 19.55n 0.0v 29.45n 0.0v 29.55n 5.0v 39.45n 5.0v 39.55n 5.0v 49.45n 5.0v 49.55n 5.0v 59.45n 5.0v 59.55n 0.0v 69.45n 0.0v 69.55n 5.0v 79.45n 5.0v 79.55n 0.0v 89.45n 0.0v 89.55n 0.0v 99.45n 0.0v 99.55n 0.0v 109.45n 0.0v 109.55n 0.0v 119.45n 0.0v 119.55n 0.0v 129.45n 0.0v 129.55n 5.0v 139.45n 5.0v 139.55n 5.0v 149.45n 5.0v 149.55n 5.0v 159.45n 5.0v 159.55n 5.0v 169.45n 5.0v 169.55n 0.0v 179.45n 0.0v 179.55n 0.0v 189.45n 0.0v 189.55n 0.0v 199.45n 0.0v 199.55n 0.0v 209.45n 0.0v 209.55n 0.0v 219.45n 0.0v 219.55n 5.0v 229.45n 5.0v 229.55n 5.0v 239.45n 5.0v 239.55n 5.0v 249.45n 5.0v 249.55n 5.0v 259.45n 5.0v 259.55n 5.0v 269.45n 5.0v 269.55n 5.0v 279.45n 5.0v 279.55n 5.0v 289.45n 5.0v 289.55n 5.0v 299.45n 5.0v 299.55n 0.0v 309.45n 0.0v 309.55n 0.0v 319.45n 0.0v 319.55n 0.0v 329.45n 0.0v 329.55n 0.0v 339.45n 0.0v 339.55n 0.0v 349.45n 0.0v 349.55n 0.0v 359.45n 0.0v 359.55n 0.0v 369.45n 0.0v 369.55n 0.0v 379.45n 0.0v 379.55n 0.0v 389.45n 0.0v 389.55n 5.0v 399.45n 5.0v 399.55n 0.0v 409.45n 0.0v 409.55n 5.0v 419.45n 5.0v 419.55n 5.0v 429.45n 5.0v 429.55n 5.0v 439.45n 5.0v 439.55n 5.0v 449.45n 5.0v 449.55n 0.0v 459.45n 0.0v 459.55n 0.0v 469.45n 0.0v 469.55n 0.0v 479.45n 0.0v 479.55n 5.0v 489.45n 5.0v 489.55n 0.0v 499.45n 0.0v 499.55n 0.0v 509.45n 0.0v 509.55n 5.0v 519.45n 5.0v 519.55n 5.0v 529.45n 5.0v 529.55n 0.0v 539.45n 0.0v 539.55n 5.0v 549.45n 5.0v 549.55n 5.0v 559.45n 5.0v 559.55n 5.0v 569.45n 5.0v 569.55n 5.0v 579.45n 5.0v 579.55n 5.0v 589.45n 5.0v 589.55n 0.0v 599.45n 0.0v 599.55n 0.0v 609.45n 0.0v 609.55n 5.0v 619.45n 5.0v 619.55n 5.0v 629.45n 5.0v 629.55n 5.0v 639.45n 5.0v 639.55n 5.0v 649.45n 5.0v 649.55n 5.0v 659.45n 5.0v 659.55n 5.0v 669.45n 5.0v 669.55n 0.0v 679.45n 0.0v 679.55n 0.0v 689.45n 0.0v 689.55n 0.0v 699.45n 0.0v 699.55n 0.0v 709.45n 0.0v 709.55n 0.0v 719.45n 0.0v 719.55n 5.0v 729.45n 5.0v 729.55n 5.0v 739.45n 5.0v 739.55n 5.0v 749.45n 5.0v 749.55n 5.0v 759.45n 5.0v 759.55n 0.0v 769.45n 0.0v 769.55n 0.0v 779.45n 0.0v 779.55n 0.0v 789.45n 0.0v 789.55n 0.0v 799.45n 0.0v 799.55n 0.0v 809.45n 0.0v 809.55n 0.0v 819.45n 0.0v 819.55n 0.0v 829.45n 0.0v 829.55n 0.0v 839.45n 0.0v 839.55n 0.0v 849.45n 0.0v 849.55n 5.0v 859.45n 5.0v 859.55n 5.0v 869.45n 5.0v 869.55n 5.0v 879.45n 5.0v 879.55n 5.0v 889.45n 5.0v 889.55n 5.0v 899.45n 5.0v 899.55n 5.0v 909.45n 5.0v 909.55n 5.0v 919.45n 5.0v 919.55n 5.0v 929.45n 5.0v 929.55n 5.0v 939.45n 5.0v 939.55n 5.0v 949.45n 5.0v 949.55n 5.0v 959.45n 5.0v 959.55n 5.0v 969.45n 5.0v 969.55n 5.0v 979.45n 5.0v 979.55n 5.0v 989.45n 5.0v 989.55n 5.0v 999.45n 5.0v 999.55n 5.0v 1009.45n 5.0v 1009.55n 5.0v 1019.45n 5.0v 1019.55n 0.0v 1029.45n 0.0v 1029.55n 0.0v 1039.45n 0.0v 1039.55n 0.0v 1049.45n 0.0v 1049.55n 0.0v 1059.45n 0.0v 1059.55n 0.0v 1069.45n 0.0v 1069.55n 0.0v 1079.45n 0.0v 1079.55n 5.0v 1089.45n 5.0v 1089.55n 0.0v 1099.45n 0.0v 1099.55n 0.0v 1109.45n 0.0v 1109.55n 5.0v 1119.45n 5.0v 1119.55n 5.0v 1129.45n 5.0v 1129.55n 5.0v 1139.45n 5.0v 1139.55n 5.0v 1149.45n 5.0v 1149.55n 0.0v 1159.45n 0.0v 1159.55n 5.0v 1169.45n 5.0v 1169.55n 5.0v 1179.45n 5.0v 1179.55n 5.0v 1189.45n 5.0v 1189.55n 0.0v 1199.45n 0.0v 1199.55n 0.0v 1209.45n 0.0v 1209.55n 0.0v 1219.45n 0.0v 1219.55n 0.0v 1229.45n 0.0v 1229.55n 5.0v 1239.45n 5.0v 1239.55n 5.0v 1249.45n 5.0v 1249.55n 5.0v 1259.45n 5.0v 1259.55n 5.0v 1269.45n 5.0v 1269.55n 0.0v 1279.45n 0.0v 1279.55n 5.0v 1289.45n 5.0v 1289.55n 5.0v 1299.45n 5.0v 1299.55n 0.0v 1309.45n 0.0v 1309.55n 0.0v 1319.45n 0.0v 1319.55n 0.0v 1329.45n 0.0v 1329.55n 0.0v 1339.45n 0.0v 1339.55n 0.0v 1349.45n 0.0v 1349.55n 0.0v 1359.45n 0.0v 1359.55n 0.0v 1369.45n 0.0v 1369.55n 0.0v 1379.45n 0.0v 1379.55n 0.0v 1389.45n 0.0v 1389.55n 5.0v 1399.45n 5.0v 1399.55n 5.0v 1409.45n 5.0v 1409.55n 5.0v 1419.45n 5.0v 1419.55n 5.0v 1429.45n 5.0v 1429.55n 5.0v 1439.45n 5.0v 1439.55n 0.0v 1449.45n 0.0v 1449.55n 0.0v 1459.45n 0.0v 1459.55n 0.0v 1469.45n 0.0v 1469.55n 0.0v 1479.45n 0.0v 1479.55n 0.0v 1489.45n 0.0v 1489.55n 0.0v 1499.45n 0.0v 1499.55n 0.0v 1509.45n 0.0v 1509.55n 0.0v 1519.45n 0.0v 1519.55n 5.0v 1529.45n 5.0v 1529.55n 0.0v 1539.45n 0.0v 1539.55n 5.0v 1549.45n 5.0v 1549.55n 5.0v 1559.45n 5.0v 1559.55n 0.0v 1569.45n 0.0v 1569.55n 0.0v 1579.45n 0.0v 1579.55n 0.0v 1589.45n 0.0v 1589.55n 5.0v 1599.45n 5.0v 1599.55n 5.0v 1609.45n 5.0v 1609.55n 5.0v 1619.45n 5.0v 1619.55n 5.0v 1629.45n 5.0v 1629.55n 5.0v 1639.45n 5.0v 1639.55n 5.0v 1649.45n 5.0v 1649.55n 5.0v 1659.45n 5.0v 1659.55n 5.0v 1669.45n 5.0v 1669.55n 5.0v 1679.45n 5.0v 1679.55n 5.0v 1689.45n 5.0v 1689.55n 5.0v 1699.45n 5.0v 1699.55n 5.0v 1709.45n 5.0v 1709.55n 5.0v 1719.45n 5.0v 1719.55n 5.0v 1729.45n 5.0v 1729.55n 0.0v 1739.45n 0.0v 1739.55n 0.0v 1749.45n 0.0v 1749.55n 0.0v 1759.45n 0.0v 1759.55n 0.0v 1769.45n 0.0v 1769.55n 5.0v 1779.45n 5.0v 1779.55n 5.0v 1789.45n 5.0v 1789.55n 5.0v 1799.45n 5.0v 1799.55n 5.0v 1809.45n 5.0v 1809.55n 0.0v 1819.45n 0.0v 1819.55n 0.0v 1829.45n 0.0v 1829.55n 0.0v 1839.45n 0.0v 1839.55n 0.0v 1849.45n 0.0v 1849.55n 0.0v 1859.45n 0.0v 1859.55n 0.0v 1869.45n 0.0v 1869.55n 0.0v 1879.45n 0.0v 1879.55n 0.0v 1889.45n 0.0v 1889.55n 0.0v 1899.45n 0.0v 1899.55n 0.0v 1909.45n 0.0v 1909.55n 0.0v 1919.45n 0.0v 1919.55n 0.0v 1929.45n 0.0v 1929.55n 5.0v 1939.45n 5.0v 1939.55n 5.0v 1949.45n 5.0v 1949.55n 5.0v 1959.45n 5.0v 1959.55n 5.0v 1969.45n 5.0v 1969.55n 5.0v 1979.45n 5.0v 1979.55n 5.0v 1989.45n 5.0v 1989.55n 5.0v 1999.45n 5.0v 1999.55n 5.0v 2009.45n 5.0v 2009.55n 5.0v 2019.45n 5.0v 2019.55n 5.0v 2029.45n 5.0v 2029.55n 5.0v 2039.45n 5.0v 2039.55n 5.0v 2049.45n 5.0v 2049.55n 5.0v )
* (time, data): [(0, 0), (10, 1), (20, 0), (30, 1), (40, 1), (50, 1), (60, 1), (70, 0), (80, 1), (90, 1), (100, 1), (110, 1), (120, 1), (130, 1), (140, 1), (150, 0), (160, 0), (170, 1), (180, 1), (190, 1), (200, 1), (210, 1), (220, 1), (230, 1), (240, 1), (250, 1), (260, 1), (270, 1), (280, 0), (290, 0), (300, 0), (310, 0), (320, 0), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 0), (390, 0), (400, 1), (410, 0), (420, 1), (430, 0), (440, 0), (450, 0), (460, 0), (470, 0), (480, 0), (490, 1), (500, 1), (510, 0), (520, 0), (530, 0), (540, 0), (550, 0), (560, 0), (570, 0), (580, 0), (590, 0), (600, 1), (610, 0), (620, 0), (630, 0), (640, 1), (650, 1), (660, 0), (670, 0), (680, 1), (690, 1), (700, 1), (710, 1), (720, 0), (730, 0), (740, 0), (750, 0), (760, 1), (770, 1), (780, 1), (790, 1), (800, 1), (810, 1), (820, 1), (830, 1), (840, 1), (850, 0), (860, 0), (870, 0), (880, 0), (890, 0), (900, 0), (910, 0), (920, 0), (930, 0), (940, 0), (950, 0), (960, 0), (970, 1), (980, 1), (990, 1), (1000, 1), (1010, 1), (1020, 0), (1030, 0), (1040, 0), (1050, 0), (1060, 0), (1070, 0), (1080, 0), (1090, 0), (1100, 0), (1110, 1), (1120, 1), (1130, 1), (1140, 1), (1150, 1), (1160, 0), (1170, 0), (1180, 0), (1190, 1), (1200, 1), (1210, 1), (1220, 1), (1230, 0), (1240, 0), (1250, 0), (1260, 0), (1270, 1), (1280, 0), (1290, 0), (1300, 0), (1310, 0), (1320, 0), (1330, 1), (1340, 1), (1350, 1), (1360, 1), (1370, 1), (1380, 0), (1390, 0), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 1), (1450, 1), (1460, 1), (1470, 1), (1480, 0), (1490, 0), (1500, 1), (1510, 0), (1520, 0), (1530, 1), (1540, 0), (1550, 1), (1560, 0), (1570, 0), (1580, 0), (1590, 0), (1600, 0), (1610, 0), (1620, 0), (1630, 0), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 1), (1700, 1), (1710, 1), (1720, 0), (1730, 1), (1740, 1), (1750, 1), (1760, 1), (1770, 1), (1780, 0), (1790, 1), (1800, 1), (1810, 0), (1820, 0), (1830, 0), (1840, 1), (1850, 1), (1860, 1), (1870, 1), (1880, 1), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 1), (1940, 1), (1950, 1), (1960, 1), (1970, 0), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 0), (2030, 0), (2040, 0), (2050, 0)]
Vdin0_1  din0_1  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 5.0v 19.45n 5.0v 19.55n 0.0v 29.45n 0.0v 29.55n 5.0v 39.45n 5.0v 39.55n 5.0v 49.45n 5.0v 49.55n 5.0v 59.45n 5.0v 59.55n 5.0v 69.45n 5.0v 69.55n 0.0v 79.45n 0.0v 79.55n 5.0v 89.45n 5.0v 89.55n 5.0v 99.45n 5.0v 99.55n 5.0v 109.45n 5.0v 109.55n 5.0v 119.45n 5.0v 119.55n 5.0v 129.45n 5.0v 129.55n 5.0v 139.45n 5.0v 139.55n 5.0v 149.45n 5.0v 149.55n 0.0v 159.45n 0.0v 159.55n 0.0v 169.45n 0.0v 169.55n 5.0v 179.45n 5.0v 179.55n 5.0v 189.45n 5.0v 189.55n 5.0v 199.45n 5.0v 199.55n 5.0v 209.45n 5.0v 209.55n 5.0v 219.45n 5.0v 219.55n 5.0v 229.45n 5.0v 229.55n 5.0v 239.45n 5.0v 239.55n 5.0v 249.45n 5.0v 249.55n 5.0v 259.45n 5.0v 259.55n 5.0v 269.45n 5.0v 269.55n 5.0v 279.45n 5.0v 279.55n 0.0v 289.45n 0.0v 289.55n 0.0v 299.45n 0.0v 299.55n 0.0v 309.45n 0.0v 309.55n 0.0v 319.45n 0.0v 319.55n 0.0v 329.45n 0.0v 329.55n 0.0v 339.45n 0.0v 339.55n 0.0v 349.45n 0.0v 349.55n 0.0v 359.45n 0.0v 359.55n 0.0v 369.45n 0.0v 369.55n 0.0v 379.45n 0.0v 379.55n 0.0v 389.45n 0.0v 389.55n 0.0v 399.45n 0.0v 399.55n 5.0v 409.45n 5.0v 409.55n 0.0v 419.45n 0.0v 419.55n 5.0v 429.45n 5.0v 429.55n 0.0v 439.45n 0.0v 439.55n 0.0v 449.45n 0.0v 449.55n 0.0v 459.45n 0.0v 459.55n 0.0v 469.45n 0.0v 469.55n 0.0v 479.45n 0.0v 479.55n 0.0v 489.45n 0.0v 489.55n 5.0v 499.45n 5.0v 499.55n 5.0v 509.45n 5.0v 509.55n 0.0v 519.45n 0.0v 519.55n 0.0v 529.45n 0.0v 529.55n 0.0v 539.45n 0.0v 539.55n 0.0v 549.45n 0.0v 549.55n 0.0v 559.45n 0.0v 559.55n 0.0v 569.45n 0.0v 569.55n 0.0v 579.45n 0.0v 579.55n 0.0v 589.45n 0.0v 589.55n 0.0v 599.45n 0.0v 599.55n 5.0v 609.45n 5.0v 609.55n 0.0v 619.45n 0.0v 619.55n 0.0v 629.45n 0.0v 629.55n 0.0v 639.45n 0.0v 639.55n 5.0v 649.45n 5.0v 649.55n 5.0v 659.45n 5.0v 659.55n 0.0v 669.45n 0.0v 669.55n 0.0v 679.45n 0.0v 679.55n 5.0v 689.45n 5.0v 689.55n 5.0v 699.45n 5.0v 699.55n 5.0v 709.45n 5.0v 709.55n 5.0v 719.45n 5.0v 719.55n 0.0v 729.45n 0.0v 729.55n 0.0v 739.45n 0.0v 739.55n 0.0v 749.45n 0.0v 749.55n 0.0v 759.45n 0.0v 759.55n 5.0v 769.45n 5.0v 769.55n 5.0v 779.45n 5.0v 779.55n 5.0v 789.45n 5.0v 789.55n 5.0v 799.45n 5.0v 799.55n 5.0v 809.45n 5.0v 809.55n 5.0v 819.45n 5.0v 819.55n 5.0v 829.45n 5.0v 829.55n 5.0v 839.45n 5.0v 839.55n 5.0v 849.45n 5.0v 849.55n 0.0v 859.45n 0.0v 859.55n 0.0v 869.45n 0.0v 869.55n 0.0v 879.45n 0.0v 879.55n 0.0v 889.45n 0.0v 889.55n 0.0v 899.45n 0.0v 899.55n 0.0v 909.45n 0.0v 909.55n 0.0v 919.45n 0.0v 919.55n 0.0v 929.45n 0.0v 929.55n 0.0v 939.45n 0.0v 939.55n 0.0v 949.45n 0.0v 949.55n 0.0v 959.45n 0.0v 959.55n 0.0v 969.45n 0.0v 969.55n 5.0v 979.45n 5.0v 979.55n 5.0v 989.45n 5.0v 989.55n 5.0v 999.45n 5.0v 999.55n 5.0v 1009.45n 5.0v 1009.55n 5.0v 1019.45n 5.0v 1019.55n 0.0v 1029.45n 0.0v 1029.55n 0.0v 1039.45n 0.0v 1039.55n 0.0v 1049.45n 0.0v 1049.55n 0.0v 1059.45n 0.0v 1059.55n 0.0v 1069.45n 0.0v 1069.55n 0.0v 1079.45n 0.0v 1079.55n 0.0v 1089.45n 0.0v 1089.55n 0.0v 1099.45n 0.0v 1099.55n 0.0v 1109.45n 0.0v 1109.55n 5.0v 1119.45n 5.0v 1119.55n 5.0v 1129.45n 5.0v 1129.55n 5.0v 1139.45n 5.0v 1139.55n 5.0v 1149.45n 5.0v 1149.55n 5.0v 1159.45n 5.0v 1159.55n 0.0v 1169.45n 0.0v 1169.55n 0.0v 1179.45n 0.0v 1179.55n 0.0v 1189.45n 0.0v 1189.55n 5.0v 1199.45n 5.0v 1199.55n 5.0v 1209.45n 5.0v 1209.55n 5.0v 1219.45n 5.0v 1219.55n 5.0v 1229.45n 5.0v 1229.55n 0.0v 1239.45n 0.0v 1239.55n 0.0v 1249.45n 0.0v 1249.55n 0.0v 1259.45n 0.0v 1259.55n 0.0v 1269.45n 0.0v 1269.55n 5.0v 1279.45n 5.0v 1279.55n 0.0v 1289.45n 0.0v 1289.55n 0.0v 1299.45n 0.0v 1299.55n 0.0v 1309.45n 0.0v 1309.55n 0.0v 1319.45n 0.0v 1319.55n 0.0v 1329.45n 0.0v 1329.55n 5.0v 1339.45n 5.0v 1339.55n 5.0v 1349.45n 5.0v 1349.55n 5.0v 1359.45n 5.0v 1359.55n 5.0v 1369.45n 5.0v 1369.55n 5.0v 1379.45n 5.0v 1379.55n 0.0v 1389.45n 0.0v 1389.55n 0.0v 1399.45n 0.0v 1399.55n 0.0v 1409.45n 0.0v 1409.55n 0.0v 1419.45n 0.0v 1419.55n 0.0v 1429.45n 0.0v 1429.55n 0.0v 1439.45n 0.0v 1439.55n 5.0v 1449.45n 5.0v 1449.55n 5.0v 1459.45n 5.0v 1459.55n 5.0v 1469.45n 5.0v 1469.55n 5.0v 1479.45n 5.0v 1479.55n 0.0v 1489.45n 0.0v 1489.55n 0.0v 1499.45n 0.0v 1499.55n 5.0v 1509.45n 5.0v 1509.55n 0.0v 1519.45n 0.0v 1519.55n 0.0v 1529.45n 0.0v 1529.55n 5.0v 1539.45n 5.0v 1539.55n 0.0v 1549.45n 0.0v 1549.55n 5.0v 1559.45n 5.0v 1559.55n 0.0v 1569.45n 0.0v 1569.55n 0.0v 1579.45n 0.0v 1579.55n 0.0v 1589.45n 0.0v 1589.55n 0.0v 1599.45n 0.0v 1599.55n 0.0v 1609.45n 0.0v 1609.55n 0.0v 1619.45n 0.0v 1619.55n 0.0v 1629.45n 0.0v 1629.55n 0.0v 1639.45n 0.0v 1639.55n 5.0v 1649.45n 5.0v 1649.55n 5.0v 1659.45n 5.0v 1659.55n 5.0v 1669.45n 5.0v 1669.55n 5.0v 1679.45n 5.0v 1679.55n 5.0v 1689.45n 5.0v 1689.55n 5.0v 1699.45n 5.0v 1699.55n 5.0v 1709.45n 5.0v 1709.55n 5.0v 1719.45n 5.0v 1719.55n 0.0v 1729.45n 0.0v 1729.55n 5.0v 1739.45n 5.0v 1739.55n 5.0v 1749.45n 5.0v 1749.55n 5.0v 1759.45n 5.0v 1759.55n 5.0v 1769.45n 5.0v 1769.55n 5.0v 1779.45n 5.0v 1779.55n 0.0v 1789.45n 0.0v 1789.55n 5.0v 1799.45n 5.0v 1799.55n 5.0v 1809.45n 5.0v 1809.55n 0.0v 1819.45n 0.0v 1819.55n 0.0v 1829.45n 0.0v 1829.55n 0.0v 1839.45n 0.0v 1839.55n 5.0v 1849.45n 5.0v 1849.55n 5.0v 1859.45n 5.0v 1859.55n 5.0v 1869.45n 5.0v 1869.55n 5.0v 1879.45n 5.0v 1879.55n 5.0v 1889.45n 5.0v 1889.55n 0.0v 1899.45n 0.0v 1899.55n 0.0v 1909.45n 0.0v 1909.55n 0.0v 1919.45n 0.0v 1919.55n 0.0v 1929.45n 0.0v 1929.55n 5.0v 1939.45n 5.0v 1939.55n 5.0v 1949.45n 5.0v 1949.55n 5.0v 1959.45n 5.0v 1959.55n 5.0v 1969.45n 5.0v 1969.55n 0.0v 1979.45n 0.0v 1979.55n 0.0v 1989.45n 0.0v 1989.55n 0.0v 1999.45n 0.0v 1999.55n 0.0v 2009.45n 0.0v 2009.55n 0.0v 2019.45n 0.0v 2019.55n 0.0v 2029.45n 0.0v 2029.55n 0.0v 2039.45n 0.0v 2039.55n 0.0v 2049.45n 0.0v 2049.55n 0.0v )
* (time, data): [(0, 0), (10, 0), (20, 1), (30, 1), (40, 1), (50, 1), (60, 0), (70, 0), (80, 0), (90, 0), (100, 0), (110, 0), (120, 0), (130, 0), (140, 0), (150, 1), (160, 0), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 1), (230, 1), (240, 1), (250, 1), (260, 1), (270, 1), (280, 0), (290, 0), (300, 1), (310, 1), (320, 1), (330, 1), (340, 1), (350, 1), (360, 1), (370, 1), (380, 1), (390, 0), (400, 0), (410, 1), (420, 1), (430, 1), (440, 1), (450, 1), (460, 1), (470, 1), (480, 1), (490, 0), (500, 0), (510, 1), (520, 1), (530, 1), (540, 0), (550, 0), (560, 0), (570, 0), (580, 0), (590, 1), (600, 0), (610, 0), (620, 0), (630, 0), (640, 0), (650, 0), (660, 1), (670, 1), (680, 1), (690, 1), (700, 1), (710, 1), (720, 1), (730, 1), (740, 0), (750, 0), (760, 1), (770, 1), (780, 0), (790, 0), (800, 0), (810, 0), (820, 0), (830, 0), (840, 0), (850, 0), (860, 0), (870, 0), (880, 0), (890, 0), (900, 0), (910, 0), (920, 0), (930, 0), (940, 0), (950, 0), (960, 0), (970, 1), (980, 1), (990, 1), (1000, 1), (1010, 1), (1020, 1), (1030, 1), (1040, 1), (1050, 1), (1060, 1), (1070, 0), (1080, 1), (1090, 1), (1100, 1), (1110, 1), (1120, 0), (1130, 0), (1140, 0), (1150, 0), (1160, 0), (1170, 0), (1180, 0), (1190, 0), (1200, 0), (1210, 0), (1220, 0), (1230, 1), (1240, 1), (1250, 1), (1260, 1), (1270, 0), (1280, 0), (1290, 0), (1300, 1), (1310, 1), (1320, 0), (1330, 0), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 1), (1390, 0), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 0), (1450, 0), (1460, 0), (1470, 0), (1480, 0), (1490, 0), (1500, 0), (1510, 0), (1520, 1), (1530, 0), (1540, 1), (1550, 0), (1560, 1), (1570, 1), (1580, 1), (1590, 0), (1600, 0), (1610, 0), (1620, 0), (1630, 0), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 1), (1700, 1), (1710, 1), (1720, 1), (1730, 1), (1740, 1), (1750, 1), (1760, 0), (1770, 0), (1780, 0), (1790, 0), (1800, 0), (1810, 0), (1820, 0), (1830, 0), (1840, 1), (1850, 0), (1860, 1), (1870, 1), (1880, 1), (1890, 1), (1900, 1), (1910, 1), (1920, 1), (1930, 1), (1940, 1), (1950, 1), (1960, 1), (1970, 1), (1980, 1), (1990, 1), (2000, 1), (2010, 1), (2020, 1), (2030, 1), (2040, 1), (2050, 1)]
Vdin0_2  din0_2  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 0.0v 19.45n 0.0v 19.55n 5.0v 29.45n 5.0v 29.55n 5.0v 39.45n 5.0v 39.55n 5.0v 49.45n 5.0v 49.55n 5.0v 59.45n 5.0v 59.55n 0.0v 69.45n 0.0v 69.55n 0.0v 79.45n 0.0v 79.55n 0.0v 89.45n 0.0v 89.55n 0.0v 99.45n 0.0v 99.55n 0.0v 109.45n 0.0v 109.55n 0.0v 119.45n 0.0v 119.55n 0.0v 129.45n 0.0v 129.55n 0.0v 139.45n 0.0v 139.55n 0.0v 149.45n 0.0v 149.55n 5.0v 159.45n 5.0v 159.55n 0.0v 169.45n 0.0v 169.55n 0.0v 179.45n 0.0v 179.55n 0.0v 189.45n 0.0v 189.55n 0.0v 199.45n 0.0v 199.55n 0.0v 209.45n 0.0v 209.55n 0.0v 219.45n 0.0v 219.55n 5.0v 229.45n 5.0v 229.55n 5.0v 239.45n 5.0v 239.55n 5.0v 249.45n 5.0v 249.55n 5.0v 259.45n 5.0v 259.55n 5.0v 269.45n 5.0v 269.55n 5.0v 279.45n 5.0v 279.55n 0.0v 289.45n 0.0v 289.55n 0.0v 299.45n 0.0v 299.55n 5.0v 309.45n 5.0v 309.55n 5.0v 319.45n 5.0v 319.55n 5.0v 329.45n 5.0v 329.55n 5.0v 339.45n 5.0v 339.55n 5.0v 349.45n 5.0v 349.55n 5.0v 359.45n 5.0v 359.55n 5.0v 369.45n 5.0v 369.55n 5.0v 379.45n 5.0v 379.55n 5.0v 389.45n 5.0v 389.55n 0.0v 399.45n 0.0v 399.55n 0.0v 409.45n 0.0v 409.55n 5.0v 419.45n 5.0v 419.55n 5.0v 429.45n 5.0v 429.55n 5.0v 439.45n 5.0v 439.55n 5.0v 449.45n 5.0v 449.55n 5.0v 459.45n 5.0v 459.55n 5.0v 469.45n 5.0v 469.55n 5.0v 479.45n 5.0v 479.55n 5.0v 489.45n 5.0v 489.55n 0.0v 499.45n 0.0v 499.55n 0.0v 509.45n 0.0v 509.55n 5.0v 519.45n 5.0v 519.55n 5.0v 529.45n 5.0v 529.55n 5.0v 539.45n 5.0v 539.55n 0.0v 549.45n 0.0v 549.55n 0.0v 559.45n 0.0v 559.55n 0.0v 569.45n 0.0v 569.55n 0.0v 579.45n 0.0v 579.55n 0.0v 589.45n 0.0v 589.55n 5.0v 599.45n 5.0v 599.55n 0.0v 609.45n 0.0v 609.55n 0.0v 619.45n 0.0v 619.55n 0.0v 629.45n 0.0v 629.55n 0.0v 639.45n 0.0v 639.55n 0.0v 649.45n 0.0v 649.55n 0.0v 659.45n 0.0v 659.55n 5.0v 669.45n 5.0v 669.55n 5.0v 679.45n 5.0v 679.55n 5.0v 689.45n 5.0v 689.55n 5.0v 699.45n 5.0v 699.55n 5.0v 709.45n 5.0v 709.55n 5.0v 719.45n 5.0v 719.55n 5.0v 729.45n 5.0v 729.55n 5.0v 739.45n 5.0v 739.55n 0.0v 749.45n 0.0v 749.55n 0.0v 759.45n 0.0v 759.55n 5.0v 769.45n 5.0v 769.55n 5.0v 779.45n 5.0v 779.55n 0.0v 789.45n 0.0v 789.55n 0.0v 799.45n 0.0v 799.55n 0.0v 809.45n 0.0v 809.55n 0.0v 819.45n 0.0v 819.55n 0.0v 829.45n 0.0v 829.55n 0.0v 839.45n 0.0v 839.55n 0.0v 849.45n 0.0v 849.55n 0.0v 859.45n 0.0v 859.55n 0.0v 869.45n 0.0v 869.55n 0.0v 879.45n 0.0v 879.55n 0.0v 889.45n 0.0v 889.55n 0.0v 899.45n 0.0v 899.55n 0.0v 909.45n 0.0v 909.55n 0.0v 919.45n 0.0v 919.55n 0.0v 929.45n 0.0v 929.55n 0.0v 939.45n 0.0v 939.55n 0.0v 949.45n 0.0v 949.55n 0.0v 959.45n 0.0v 959.55n 0.0v 969.45n 0.0v 969.55n 5.0v 979.45n 5.0v 979.55n 5.0v 989.45n 5.0v 989.55n 5.0v 999.45n 5.0v 999.55n 5.0v 1009.45n 5.0v 1009.55n 5.0v 1019.45n 5.0v 1019.55n 5.0v 1029.45n 5.0v 1029.55n 5.0v 1039.45n 5.0v 1039.55n 5.0v 1049.45n 5.0v 1049.55n 5.0v 1059.45n 5.0v 1059.55n 5.0v 1069.45n 5.0v 1069.55n 0.0v 1079.45n 0.0v 1079.55n 5.0v 1089.45n 5.0v 1089.55n 5.0v 1099.45n 5.0v 1099.55n 5.0v 1109.45n 5.0v 1109.55n 5.0v 1119.45n 5.0v 1119.55n 0.0v 1129.45n 0.0v 1129.55n 0.0v 1139.45n 0.0v 1139.55n 0.0v 1149.45n 0.0v 1149.55n 0.0v 1159.45n 0.0v 1159.55n 0.0v 1169.45n 0.0v 1169.55n 0.0v 1179.45n 0.0v 1179.55n 0.0v 1189.45n 0.0v 1189.55n 0.0v 1199.45n 0.0v 1199.55n 0.0v 1209.45n 0.0v 1209.55n 0.0v 1219.45n 0.0v 1219.55n 0.0v 1229.45n 0.0v 1229.55n 5.0v 1239.45n 5.0v 1239.55n 5.0v 1249.45n 5.0v 1249.55n 5.0v 1259.45n 5.0v 1259.55n 5.0v 1269.45n 5.0v 1269.55n 0.0v 1279.45n 0.0v 1279.55n 0.0v 1289.45n 0.0v 1289.55n 0.0v 1299.45n 0.0v 1299.55n 5.0v 1309.45n 5.0v 1309.55n 5.0v 1319.45n 5.0v 1319.55n 0.0v 1329.45n 0.0v 1329.55n 0.0v 1339.45n 0.0v 1339.55n 0.0v 1349.45n 0.0v 1349.55n 0.0v 1359.45n 0.0v 1359.55n 0.0v 1369.45n 0.0v 1369.55n 0.0v 1379.45n 0.0v 1379.55n 5.0v 1389.45n 5.0v 1389.55n 0.0v 1399.45n 0.0v 1399.55n 0.0v 1409.45n 0.0v 1409.55n 0.0v 1419.45n 0.0v 1419.55n 0.0v 1429.45n 0.0v 1429.55n 0.0v 1439.45n 0.0v 1439.55n 0.0v 1449.45n 0.0v 1449.55n 0.0v 1459.45n 0.0v 1459.55n 0.0v 1469.45n 0.0v 1469.55n 0.0v 1479.45n 0.0v 1479.55n 0.0v 1489.45n 0.0v 1489.55n 0.0v 1499.45n 0.0v 1499.55n 0.0v 1509.45n 0.0v 1509.55n 0.0v 1519.45n 0.0v 1519.55n 5.0v 1529.45n 5.0v 1529.55n 0.0v 1539.45n 0.0v 1539.55n 5.0v 1549.45n 5.0v 1549.55n 0.0v 1559.45n 0.0v 1559.55n 5.0v 1569.45n 5.0v 1569.55n 5.0v 1579.45n 5.0v 1579.55n 5.0v 1589.45n 5.0v 1589.55n 0.0v 1599.45n 0.0v 1599.55n 0.0v 1609.45n 0.0v 1609.55n 0.0v 1619.45n 0.0v 1619.55n 0.0v 1629.45n 0.0v 1629.55n 0.0v 1639.45n 0.0v 1639.55n 5.0v 1649.45n 5.0v 1649.55n 5.0v 1659.45n 5.0v 1659.55n 5.0v 1669.45n 5.0v 1669.55n 5.0v 1679.45n 5.0v 1679.55n 5.0v 1689.45n 5.0v 1689.55n 5.0v 1699.45n 5.0v 1699.55n 5.0v 1709.45n 5.0v 1709.55n 5.0v 1719.45n 5.0v 1719.55n 5.0v 1729.45n 5.0v 1729.55n 5.0v 1739.45n 5.0v 1739.55n 5.0v 1749.45n 5.0v 1749.55n 5.0v 1759.45n 5.0v 1759.55n 0.0v 1769.45n 0.0v 1769.55n 0.0v 1779.45n 0.0v 1779.55n 0.0v 1789.45n 0.0v 1789.55n 0.0v 1799.45n 0.0v 1799.55n 0.0v 1809.45n 0.0v 1809.55n 0.0v 1819.45n 0.0v 1819.55n 0.0v 1829.45n 0.0v 1829.55n 0.0v 1839.45n 0.0v 1839.55n 5.0v 1849.45n 5.0v 1849.55n 0.0v 1859.45n 0.0v 1859.55n 5.0v 1869.45n 5.0v 1869.55n 5.0v 1879.45n 5.0v 1879.55n 5.0v 1889.45n 5.0v 1889.55n 5.0v 1899.45n 5.0v 1899.55n 5.0v 1909.45n 5.0v 1909.55n 5.0v 1919.45n 5.0v 1919.55n 5.0v 1929.45n 5.0v 1929.55n 5.0v 1939.45n 5.0v 1939.55n 5.0v 1949.45n 5.0v 1949.55n 5.0v 1959.45n 5.0v 1959.55n 5.0v 1969.45n 5.0v 1969.55n 5.0v 1979.45n 5.0v 1979.55n 5.0v 1989.45n 5.0v 1989.55n 5.0v 1999.45n 5.0v 1999.55n 5.0v 2009.45n 5.0v 2009.55n 5.0v 2019.45n 5.0v 2019.55n 5.0v 2029.45n 5.0v 2029.55n 5.0v 2039.45n 5.0v 2039.55n 5.0v 2049.45n 5.0v 2049.55n 5.0v )
* (time, data): [(0, 0), (10, 0), (20, 1), (30, 0), (40, 0), (50, 0), (60, 1), (70, 0), (80, 1), (90, 1), (100, 1), (110, 1), (120, 1), (130, 0), (140, 0), (150, 0), (160, 0), (170, 1), (180, 1), (190, 1), (200, 1), (210, 1), (220, 0), (230, 0), (240, 0), (250, 0), (260, 0), (270, 0), (280, 1), (290, 1), (300, 0), (310, 0), (320, 0), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 0), (390, 0), (400, 1), (410, 0), (420, 0), (430, 1), (440, 1), (450, 0), (460, 0), (470, 0), (480, 0), (490, 0), (500, 0), (510, 0), (520, 0), (530, 0), (540, 0), (550, 0), (560, 0), (570, 0), (580, 0), (590, 1), (600, 0), (610, 1), (620, 1), (630, 1), (640, 1), (650, 1), (660, 0), (670, 0), (680, 0), (690, 0), (700, 0), (710, 0), (720, 1), (730, 1), (740, 0), (750, 1), (760, 0), (770, 0), (780, 1), (790, 1), (800, 1), (810, 1), (820, 0), (830, 0), (840, 0), (850, 0), (860, 0), (870, 0), (880, 0), (890, 0), (900, 0), (910, 0), (920, 0), (930, 0), (940, 0), (950, 1), (960, 1), (970, 1), (980, 1), (990, 1), (1000, 0), (1010, 0), (1020, 1), (1030, 1), (1040, 1), (1050, 1), (1060, 1), (1070, 1), (1080, 1), (1090, 1), (1100, 1), (1110, 0), (1120, 1), (1130, 1), (1140, 1), (1150, 1), (1160, 0), (1170, 0), (1180, 0), (1190, 1), (1200, 1), (1210, 1), (1220, 1), (1230, 0), (1240, 0), (1250, 0), (1260, 0), (1270, 1), (1280, 0), (1290, 0), (1300, 1), (1310, 1), (1320, 1), (1330, 1), (1340, 1), (1350, 1), (1360, 1), (1370, 1), (1380, 1), (1390, 0), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 1), (1450, 1), (1460, 1), (1470, 1), (1480, 1), (1490, 1), (1500, 0), (1510, 1), (1520, 0), (1530, 1), (1540, 1), (1550, 0), (1560, 0), (1570, 0), (1580, 0), (1590, 0), (1600, 0), (1610, 0), (1620, 0), (1630, 0), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 1), (1700, 1), (1710, 1), (1720, 0), (1730, 0), (1740, 0), (1750, 0), (1760, 1), (1770, 1), (1780, 0), (1790, 1), (1800, 1), (1810, 1), (1820, 1), (1830, 1), (1840, 0), (1850, 1), (1860, 1), (1870, 1), (1880, 0), (1890, 1), (1900, 1), (1910, 1), (1920, 1), (1930, 1), (1940, 1), (1950, 1), (1960, 1), (1970, 1), (1980, 1), (1990, 1), (2000, 1), (2010, 1), (2020, 1), (2030, 0), (2040, 0), (2050, 0)]
Vdin0_3  din0_3  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 0.0v 19.45n 0.0v 19.55n 5.0v 29.45n 5.0v 29.55n 0.0v 39.45n 0.0v 39.55n 0.0v 49.45n 0.0v 49.55n 0.0v 59.45n 0.0v 59.55n 5.0v 69.45n 5.0v 69.55n 0.0v 79.45n 0.0v 79.55n 5.0v 89.45n 5.0v 89.55n 5.0v 99.45n 5.0v 99.55n 5.0v 109.45n 5.0v 109.55n 5.0v 119.45n 5.0v 119.55n 5.0v 129.45n 5.0v 129.55n 0.0v 139.45n 0.0v 139.55n 0.0v 149.45n 0.0v 149.55n 0.0v 159.45n 0.0v 159.55n 0.0v 169.45n 0.0v 169.55n 5.0v 179.45n 5.0v 179.55n 5.0v 189.45n 5.0v 189.55n 5.0v 199.45n 5.0v 199.55n 5.0v 209.45n 5.0v 209.55n 5.0v 219.45n 5.0v 219.55n 0.0v 229.45n 0.0v 229.55n 0.0v 239.45n 0.0v 239.55n 0.0v 249.45n 0.0v 249.55n 0.0v 259.45n 0.0v 259.55n 0.0v 269.45n 0.0v 269.55n 0.0v 279.45n 0.0v 279.55n 5.0v 289.45n 5.0v 289.55n 5.0v 299.45n 5.0v 299.55n 0.0v 309.45n 0.0v 309.55n 0.0v 319.45n 0.0v 319.55n 0.0v 329.45n 0.0v 329.55n 0.0v 339.45n 0.0v 339.55n 0.0v 349.45n 0.0v 349.55n 0.0v 359.45n 0.0v 359.55n 0.0v 369.45n 0.0v 369.55n 0.0v 379.45n 0.0v 379.55n 0.0v 389.45n 0.0v 389.55n 0.0v 399.45n 0.0v 399.55n 5.0v 409.45n 5.0v 409.55n 0.0v 419.45n 0.0v 419.55n 0.0v 429.45n 0.0v 429.55n 5.0v 439.45n 5.0v 439.55n 5.0v 449.45n 5.0v 449.55n 0.0v 459.45n 0.0v 459.55n 0.0v 469.45n 0.0v 469.55n 0.0v 479.45n 0.0v 479.55n 0.0v 489.45n 0.0v 489.55n 0.0v 499.45n 0.0v 499.55n 0.0v 509.45n 0.0v 509.55n 0.0v 519.45n 0.0v 519.55n 0.0v 529.45n 0.0v 529.55n 0.0v 539.45n 0.0v 539.55n 0.0v 549.45n 0.0v 549.55n 0.0v 559.45n 0.0v 559.55n 0.0v 569.45n 0.0v 569.55n 0.0v 579.45n 0.0v 579.55n 0.0v 589.45n 0.0v 589.55n 5.0v 599.45n 5.0v 599.55n 0.0v 609.45n 0.0v 609.55n 5.0v 619.45n 5.0v 619.55n 5.0v 629.45n 5.0v 629.55n 5.0v 639.45n 5.0v 639.55n 5.0v 649.45n 5.0v 649.55n 5.0v 659.45n 5.0v 659.55n 0.0v 669.45n 0.0v 669.55n 0.0v 679.45n 0.0v 679.55n 0.0v 689.45n 0.0v 689.55n 0.0v 699.45n 0.0v 699.55n 0.0v 709.45n 0.0v 709.55n 0.0v 719.45n 0.0v 719.55n 5.0v 729.45n 5.0v 729.55n 5.0v 739.45n 5.0v 739.55n 0.0v 749.45n 0.0v 749.55n 5.0v 759.45n 5.0v 759.55n 0.0v 769.45n 0.0v 769.55n 0.0v 779.45n 0.0v 779.55n 5.0v 789.45n 5.0v 789.55n 5.0v 799.45n 5.0v 799.55n 5.0v 809.45n 5.0v 809.55n 5.0v 819.45n 5.0v 819.55n 0.0v 829.45n 0.0v 829.55n 0.0v 839.45n 0.0v 839.55n 0.0v 849.45n 0.0v 849.55n 0.0v 859.45n 0.0v 859.55n 0.0v 869.45n 0.0v 869.55n 0.0v 879.45n 0.0v 879.55n 0.0v 889.45n 0.0v 889.55n 0.0v 899.45n 0.0v 899.55n 0.0v 909.45n 0.0v 909.55n 0.0v 919.45n 0.0v 919.55n 0.0v 929.45n 0.0v 929.55n 0.0v 939.45n 0.0v 939.55n 0.0v 949.45n 0.0v 949.55n 5.0v 959.45n 5.0v 959.55n 5.0v 969.45n 5.0v 969.55n 5.0v 979.45n 5.0v 979.55n 5.0v 989.45n 5.0v 989.55n 5.0v 999.45n 5.0v 999.55n 0.0v 1009.45n 0.0v 1009.55n 0.0v 1019.45n 0.0v 1019.55n 5.0v 1029.45n 5.0v 1029.55n 5.0v 1039.45n 5.0v 1039.55n 5.0v 1049.45n 5.0v 1049.55n 5.0v 1059.45n 5.0v 1059.55n 5.0v 1069.45n 5.0v 1069.55n 5.0v 1079.45n 5.0v 1079.55n 5.0v 1089.45n 5.0v 1089.55n 5.0v 1099.45n 5.0v 1099.55n 5.0v 1109.45n 5.0v 1109.55n 0.0v 1119.45n 0.0v 1119.55n 5.0v 1129.45n 5.0v 1129.55n 5.0v 1139.45n 5.0v 1139.55n 5.0v 1149.45n 5.0v 1149.55n 5.0v 1159.45n 5.0v 1159.55n 0.0v 1169.45n 0.0v 1169.55n 0.0v 1179.45n 0.0v 1179.55n 0.0v 1189.45n 0.0v 1189.55n 5.0v 1199.45n 5.0v 1199.55n 5.0v 1209.45n 5.0v 1209.55n 5.0v 1219.45n 5.0v 1219.55n 5.0v 1229.45n 5.0v 1229.55n 0.0v 1239.45n 0.0v 1239.55n 0.0v 1249.45n 0.0v 1249.55n 0.0v 1259.45n 0.0v 1259.55n 0.0v 1269.45n 0.0v 1269.55n 5.0v 1279.45n 5.0v 1279.55n 0.0v 1289.45n 0.0v 1289.55n 0.0v 1299.45n 0.0v 1299.55n 5.0v 1309.45n 5.0v 1309.55n 5.0v 1319.45n 5.0v 1319.55n 5.0v 1329.45n 5.0v 1329.55n 5.0v 1339.45n 5.0v 1339.55n 5.0v 1349.45n 5.0v 1349.55n 5.0v 1359.45n 5.0v 1359.55n 5.0v 1369.45n 5.0v 1369.55n 5.0v 1379.45n 5.0v 1379.55n 5.0v 1389.45n 5.0v 1389.55n 0.0v 1399.45n 0.0v 1399.55n 0.0v 1409.45n 0.0v 1409.55n 0.0v 1419.45n 0.0v 1419.55n 0.0v 1429.45n 0.0v 1429.55n 0.0v 1439.45n 0.0v 1439.55n 5.0v 1449.45n 5.0v 1449.55n 5.0v 1459.45n 5.0v 1459.55n 5.0v 1469.45n 5.0v 1469.55n 5.0v 1479.45n 5.0v 1479.55n 5.0v 1489.45n 5.0v 1489.55n 5.0v 1499.45n 5.0v 1499.55n 0.0v 1509.45n 0.0v 1509.55n 5.0v 1519.45n 5.0v 1519.55n 0.0v 1529.45n 0.0v 1529.55n 5.0v 1539.45n 5.0v 1539.55n 5.0v 1549.45n 5.0v 1549.55n 0.0v 1559.45n 0.0v 1559.55n 0.0v 1569.45n 0.0v 1569.55n 0.0v 1579.45n 0.0v 1579.55n 0.0v 1589.45n 0.0v 1589.55n 0.0v 1599.45n 0.0v 1599.55n 0.0v 1609.45n 0.0v 1609.55n 0.0v 1619.45n 0.0v 1619.55n 0.0v 1629.45n 0.0v 1629.55n 0.0v 1639.45n 0.0v 1639.55n 5.0v 1649.45n 5.0v 1649.55n 5.0v 1659.45n 5.0v 1659.55n 5.0v 1669.45n 5.0v 1669.55n 5.0v 1679.45n 5.0v 1679.55n 5.0v 1689.45n 5.0v 1689.55n 5.0v 1699.45n 5.0v 1699.55n 5.0v 1709.45n 5.0v 1709.55n 5.0v 1719.45n 5.0v 1719.55n 0.0v 1729.45n 0.0v 1729.55n 0.0v 1739.45n 0.0v 1739.55n 0.0v 1749.45n 0.0v 1749.55n 0.0v 1759.45n 0.0v 1759.55n 5.0v 1769.45n 5.0v 1769.55n 5.0v 1779.45n 5.0v 1779.55n 0.0v 1789.45n 0.0v 1789.55n 5.0v 1799.45n 5.0v 1799.55n 5.0v 1809.45n 5.0v 1809.55n 5.0v 1819.45n 5.0v 1819.55n 5.0v 1829.45n 5.0v 1829.55n 5.0v 1839.45n 5.0v 1839.55n 0.0v 1849.45n 0.0v 1849.55n 5.0v 1859.45n 5.0v 1859.55n 5.0v 1869.45n 5.0v 1869.55n 5.0v 1879.45n 5.0v 1879.55n 0.0v 1889.45n 0.0v 1889.55n 5.0v 1899.45n 5.0v 1899.55n 5.0v 1909.45n 5.0v 1909.55n 5.0v 1919.45n 5.0v 1919.55n 5.0v 1929.45n 5.0v 1929.55n 5.0v 1939.45n 5.0v 1939.55n 5.0v 1949.45n 5.0v 1949.55n 5.0v 1959.45n 5.0v 1959.55n 5.0v 1969.45n 5.0v 1969.55n 5.0v 1979.45n 5.0v 1979.55n 5.0v 1989.45n 5.0v 1989.55n 5.0v 1999.45n 5.0v 1999.55n 5.0v 2009.45n 5.0v 2009.55n 5.0v 2019.45n 5.0v 2019.55n 5.0v 2029.45n 5.0v 2029.55n 0.0v 2039.45n 0.0v 2039.55n 0.0v 2049.45n 0.0v 2049.55n 0.0v )
* (time, data): [(0, 0), (10, 0), (20, 1), (30, 1), (40, 1), (50, 1), (60, 0), (70, 0), (80, 1), (90, 1), (100, 1), (110, 1), (120, 1), (130, 1), (140, 1), (150, 1), (160, 0), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 0), (230, 0), (240, 0), (250, 0), (260, 0), (270, 0), (280, 1), (290, 1), (300, 1), (310, 1), (320, 1), (330, 1), (340, 1), (350, 1), (360, 1), (370, 1), (380, 1), (390, 0), (400, 0), (410, 1), (420, 0), (430, 1), (440, 1), (450, 0), (460, 0), (470, 1), (480, 0), (490, 0), (500, 0), (510, 0), (520, 0), (530, 1), (540, 0), (550, 0), (560, 0), (570, 0), (580, 0), (590, 0), (600, 0), (610, 0), (620, 0), (630, 0), (640, 1), (650, 1), (660, 0), (670, 0), (680, 1), (690, 1), (700, 1), (710, 1), (720, 1), (730, 1), (740, 0), (750, 1), (760, 0), (770, 0), (780, 0), (790, 0), (800, 0), (810, 0), (820, 1), (830, 1), (840, 1), (850, 1), (860, 1), (870, 1), (880, 1), (890, 1), (900, 1), (910, 1), (920, 1), (930, 1), (940, 1), (950, 0), (960, 0), (970, 0), (980, 0), (990, 0), (1000, 1), (1010, 1), (1020, 0), (1030, 0), (1040, 0), (1050, 0), (1060, 0), (1070, 0), (1080, 0), (1090, 1), (1100, 1), (1110, 1), (1120, 0), (1130, 0), (1140, 0), (1150, 0), (1160, 0), (1170, 0), (1180, 0), (1190, 1), (1200, 1), (1210, 1), (1220, 1), (1230, 1), (1240, 1), (1250, 1), (1260, 1), (1270, 0), (1280, 1), (1290, 1), (1300, 0), (1310, 1), (1320, 0), (1330, 1), (1340, 1), (1350, 1), (1360, 1), (1370, 1), (1380, 1), (1390, 1), (1400, 1), (1410, 1), (1420, 1), (1430, 1), (1440, 1), (1450, 1), (1460, 1), (1470, 1), (1480, 0), (1490, 0), (1500, 1), (1510, 0), (1520, 0), (1530, 1), (1540, 0), (1550, 0), (1560, 0), (1570, 0), (1580, 0), (1590, 0), (1600, 0), (1610, 0), (1620, 0), (1630, 0), (1640, 0), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 0), (1700, 0), (1710, 0), (1720, 0), (1730, 0), (1740, 0), (1750, 0), (1760, 0), (1770, 1), (1780, 0), (1790, 1), (1800, 1), (1810, 0), (1820, 0), (1830, 0), (1840, 1), (1850, 1), (1860, 1), (1870, 1), (1880, 1), (1890, 1), (1900, 1), (1910, 1), (1920, 1), (1930, 1), (1940, 1), (1950, 1), (1960, 1), (1970, 0), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 0), (2030, 0), (2040, 0), (2050, 0)]
Vdin0_4  din0_4  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 0.0v 19.45n 0.0v 19.55n 5.0v 29.45n 5.0v 29.55n 5.0v 39.45n 5.0v 39.55n 5.0v 49.45n 5.0v 49.55n 5.0v 59.45n 5.0v 59.55n 0.0v 69.45n 0.0v 69.55n 0.0v 79.45n 0.0v 79.55n 5.0v 89.45n 5.0v 89.55n 5.0v 99.45n 5.0v 99.55n 5.0v 109.45n 5.0v 109.55n 5.0v 119.45n 5.0v 119.55n 5.0v 129.45n 5.0v 129.55n 5.0v 139.45n 5.0v 139.55n 5.0v 149.45n 5.0v 149.55n 5.0v 159.45n 5.0v 159.55n 0.0v 169.45n 0.0v 169.55n 0.0v 179.45n 0.0v 179.55n 0.0v 189.45n 0.0v 189.55n 0.0v 199.45n 0.0v 199.55n 0.0v 209.45n 0.0v 209.55n 0.0v 219.45n 0.0v 219.55n 0.0v 229.45n 0.0v 229.55n 0.0v 239.45n 0.0v 239.55n 0.0v 249.45n 0.0v 249.55n 0.0v 259.45n 0.0v 259.55n 0.0v 269.45n 0.0v 269.55n 0.0v 279.45n 0.0v 279.55n 5.0v 289.45n 5.0v 289.55n 5.0v 299.45n 5.0v 299.55n 5.0v 309.45n 5.0v 309.55n 5.0v 319.45n 5.0v 319.55n 5.0v 329.45n 5.0v 329.55n 5.0v 339.45n 5.0v 339.55n 5.0v 349.45n 5.0v 349.55n 5.0v 359.45n 5.0v 359.55n 5.0v 369.45n 5.0v 369.55n 5.0v 379.45n 5.0v 379.55n 5.0v 389.45n 5.0v 389.55n 0.0v 399.45n 0.0v 399.55n 0.0v 409.45n 0.0v 409.55n 5.0v 419.45n 5.0v 419.55n 0.0v 429.45n 0.0v 429.55n 5.0v 439.45n 5.0v 439.55n 5.0v 449.45n 5.0v 449.55n 0.0v 459.45n 0.0v 459.55n 0.0v 469.45n 0.0v 469.55n 5.0v 479.45n 5.0v 479.55n 0.0v 489.45n 0.0v 489.55n 0.0v 499.45n 0.0v 499.55n 0.0v 509.45n 0.0v 509.55n 0.0v 519.45n 0.0v 519.55n 0.0v 529.45n 0.0v 529.55n 5.0v 539.45n 5.0v 539.55n 0.0v 549.45n 0.0v 549.55n 0.0v 559.45n 0.0v 559.55n 0.0v 569.45n 0.0v 569.55n 0.0v 579.45n 0.0v 579.55n 0.0v 589.45n 0.0v 589.55n 0.0v 599.45n 0.0v 599.55n 0.0v 609.45n 0.0v 609.55n 0.0v 619.45n 0.0v 619.55n 0.0v 629.45n 0.0v 629.55n 0.0v 639.45n 0.0v 639.55n 5.0v 649.45n 5.0v 649.55n 5.0v 659.45n 5.0v 659.55n 0.0v 669.45n 0.0v 669.55n 0.0v 679.45n 0.0v 679.55n 5.0v 689.45n 5.0v 689.55n 5.0v 699.45n 5.0v 699.55n 5.0v 709.45n 5.0v 709.55n 5.0v 719.45n 5.0v 719.55n 5.0v 729.45n 5.0v 729.55n 5.0v 739.45n 5.0v 739.55n 0.0v 749.45n 0.0v 749.55n 5.0v 759.45n 5.0v 759.55n 0.0v 769.45n 0.0v 769.55n 0.0v 779.45n 0.0v 779.55n 0.0v 789.45n 0.0v 789.55n 0.0v 799.45n 0.0v 799.55n 0.0v 809.45n 0.0v 809.55n 0.0v 819.45n 0.0v 819.55n 5.0v 829.45n 5.0v 829.55n 5.0v 839.45n 5.0v 839.55n 5.0v 849.45n 5.0v 849.55n 5.0v 859.45n 5.0v 859.55n 5.0v 869.45n 5.0v 869.55n 5.0v 879.45n 5.0v 879.55n 5.0v 889.45n 5.0v 889.55n 5.0v 899.45n 5.0v 899.55n 5.0v 909.45n 5.0v 909.55n 5.0v 919.45n 5.0v 919.55n 5.0v 929.45n 5.0v 929.55n 5.0v 939.45n 5.0v 939.55n 5.0v 949.45n 5.0v 949.55n 0.0v 959.45n 0.0v 959.55n 0.0v 969.45n 0.0v 969.55n 0.0v 979.45n 0.0v 979.55n 0.0v 989.45n 0.0v 989.55n 0.0v 999.45n 0.0v 999.55n 5.0v 1009.45n 5.0v 1009.55n 5.0v 1019.45n 5.0v 1019.55n 0.0v 1029.45n 0.0v 1029.55n 0.0v 1039.45n 0.0v 1039.55n 0.0v 1049.45n 0.0v 1049.55n 0.0v 1059.45n 0.0v 1059.55n 0.0v 1069.45n 0.0v 1069.55n 0.0v 1079.45n 0.0v 1079.55n 0.0v 1089.45n 0.0v 1089.55n 5.0v 1099.45n 5.0v 1099.55n 5.0v 1109.45n 5.0v 1109.55n 5.0v 1119.45n 5.0v 1119.55n 0.0v 1129.45n 0.0v 1129.55n 0.0v 1139.45n 0.0v 1139.55n 0.0v 1149.45n 0.0v 1149.55n 0.0v 1159.45n 0.0v 1159.55n 0.0v 1169.45n 0.0v 1169.55n 0.0v 1179.45n 0.0v 1179.55n 0.0v 1189.45n 0.0v 1189.55n 5.0v 1199.45n 5.0v 1199.55n 5.0v 1209.45n 5.0v 1209.55n 5.0v 1219.45n 5.0v 1219.55n 5.0v 1229.45n 5.0v 1229.55n 5.0v 1239.45n 5.0v 1239.55n 5.0v 1249.45n 5.0v 1249.55n 5.0v 1259.45n 5.0v 1259.55n 5.0v 1269.45n 5.0v 1269.55n 0.0v 1279.45n 0.0v 1279.55n 5.0v 1289.45n 5.0v 1289.55n 5.0v 1299.45n 5.0v 1299.55n 0.0v 1309.45n 0.0v 1309.55n 5.0v 1319.45n 5.0v 1319.55n 0.0v 1329.45n 0.0v 1329.55n 5.0v 1339.45n 5.0v 1339.55n 5.0v 1349.45n 5.0v 1349.55n 5.0v 1359.45n 5.0v 1359.55n 5.0v 1369.45n 5.0v 1369.55n 5.0v 1379.45n 5.0v 1379.55n 5.0v 1389.45n 5.0v 1389.55n 5.0v 1399.45n 5.0v 1399.55n 5.0v 1409.45n 5.0v 1409.55n 5.0v 1419.45n 5.0v 1419.55n 5.0v 1429.45n 5.0v 1429.55n 5.0v 1439.45n 5.0v 1439.55n 5.0v 1449.45n 5.0v 1449.55n 5.0v 1459.45n 5.0v 1459.55n 5.0v 1469.45n 5.0v 1469.55n 5.0v 1479.45n 5.0v 1479.55n 0.0v 1489.45n 0.0v 1489.55n 0.0v 1499.45n 0.0v 1499.55n 5.0v 1509.45n 5.0v 1509.55n 0.0v 1519.45n 0.0v 1519.55n 0.0v 1529.45n 0.0v 1529.55n 5.0v 1539.45n 5.0v 1539.55n 0.0v 1549.45n 0.0v 1549.55n 0.0v 1559.45n 0.0v 1559.55n 0.0v 1569.45n 0.0v 1569.55n 0.0v 1579.45n 0.0v 1579.55n 0.0v 1589.45n 0.0v 1589.55n 0.0v 1599.45n 0.0v 1599.55n 0.0v 1609.45n 0.0v 1609.55n 0.0v 1619.45n 0.0v 1619.55n 0.0v 1629.45n 0.0v 1629.55n 0.0v 1639.45n 0.0v 1639.55n 0.0v 1649.45n 0.0v 1649.55n 0.0v 1659.45n 0.0v 1659.55n 0.0v 1669.45n 0.0v 1669.55n 0.0v 1679.45n 0.0v 1679.55n 0.0v 1689.45n 0.0v 1689.55n 0.0v 1699.45n 0.0v 1699.55n 0.0v 1709.45n 0.0v 1709.55n 0.0v 1719.45n 0.0v 1719.55n 0.0v 1729.45n 0.0v 1729.55n 0.0v 1739.45n 0.0v 1739.55n 0.0v 1749.45n 0.0v 1749.55n 0.0v 1759.45n 0.0v 1759.55n 0.0v 1769.45n 0.0v 1769.55n 5.0v 1779.45n 5.0v 1779.55n 0.0v 1789.45n 0.0v 1789.55n 5.0v 1799.45n 5.0v 1799.55n 5.0v 1809.45n 5.0v 1809.55n 0.0v 1819.45n 0.0v 1819.55n 0.0v 1829.45n 0.0v 1829.55n 0.0v 1839.45n 0.0v 1839.55n 5.0v 1849.45n 5.0v 1849.55n 5.0v 1859.45n 5.0v 1859.55n 5.0v 1869.45n 5.0v 1869.55n 5.0v 1879.45n 5.0v 1879.55n 5.0v 1889.45n 5.0v 1889.55n 5.0v 1899.45n 5.0v 1899.55n 5.0v 1909.45n 5.0v 1909.55n 5.0v 1919.45n 5.0v 1919.55n 5.0v 1929.45n 5.0v 1929.55n 5.0v 1939.45n 5.0v 1939.55n 5.0v 1949.45n 5.0v 1949.55n 5.0v 1959.45n 5.0v 1959.55n 5.0v 1969.45n 5.0v 1969.55n 0.0v 1979.45n 0.0v 1979.55n 0.0v 1989.45n 0.0v 1989.55n 0.0v 1999.45n 0.0v 1999.55n 0.0v 2009.45n 0.0v 2009.55n 0.0v 2019.45n 0.0v 2019.55n 0.0v 2029.45n 0.0v 2029.55n 0.0v 2039.45n 0.0v 2039.55n 0.0v 2049.45n 0.0v 2049.55n 0.0v )
* (time, data): [(0, 0), (10, 1), (20, 1), (30, 1), (40, 1), (50, 0), (60, 0), (70, 0), (80, 1), (90, 1), (100, 1), (110, 1), (120, 1), (130, 1), (140, 1), (150, 1), (160, 0), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 1), (230, 1), (240, 1), (250, 1), (260, 1), (270, 1), (280, 0), (290, 0), (300, 0), (310, 0), (320, 0), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 0), (390, 0), (400, 1), (410, 0), (420, 1), (430, 0), (440, 0), (450, 0), (460, 0), (470, 1), (480, 1), (490, 1), (500, 1), (510, 1), (520, 1), (530, 0), (540, 1), (550, 1), (560, 1), (570, 1), (580, 1), (590, 1), (600, 1), (610, 1), (620, 1), (630, 1), (640, 1), (650, 1), (660, 1), (670, 1), (680, 0), (690, 0), (700, 0), (710, 0), (720, 0), (730, 0), (740, 0), (750, 0), (760, 0), (770, 0), (780, 0), (790, 0), (800, 0), (810, 0), (820, 1), (830, 1), (840, 1), (850, 1), (860, 1), (870, 1), (880, 1), (890, 1), (900, 1), (910, 1), (920, 1), (930, 1), (940, 1), (950, 1), (960, 1), (970, 0), (980, 0), (990, 0), (1000, 0), (1010, 0), (1020, 1), (1030, 1), (1040, 1), (1050, 1), (1060, 1), (1070, 1), (1080, 0), (1090, 0), (1100, 0), (1110, 1), (1120, 0), (1130, 0), (1140, 0), (1150, 1), (1160, 1), (1170, 1), (1180, 1), (1190, 0), (1200, 1), (1210, 1), (1220, 0), (1230, 0), (1240, 0), (1250, 0), (1260, 0), (1270, 1), (1280, 0), (1290, 0), (1300, 1), (1310, 0), (1320, 0), (1330, 1), (1340, 1), (1350, 1), (1360, 1), (1370, 1), (1380, 1), (1390, 0), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 0), (1450, 0), (1460, 0), (1470, 0), (1480, 0), (1490, 0), (1500, 1), (1510, 1), (1520, 0), (1530, 1), (1540, 0), (1550, 1), (1560, 1), (1570, 1), (1580, 1), (1590, 1), (1600, 1), (1610, 1), (1620, 1), (1630, 1), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 1), (1700, 1), (1710, 1), (1720, 0), (1730, 0), (1740, 0), (1750, 0), (1760, 0), (1770, 0), (1780, 0), (1790, 0), (1800, 0), (1810, 0), (1820, 0), (1830, 0), (1840, 1), (1850, 0), (1860, 0), (1870, 0), (1880, 1), (1890, 1), (1900, 1), (1910, 1), (1920, 1), (1930, 0), (1940, 0), (1950, 0), (1960, 0), (1970, 1), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 0), (2030, 0), (2040, 0), (2050, 0)]
Vdin0_5  din0_5  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 5.0v 19.45n 5.0v 19.55n 5.0v 29.45n 5.0v 29.55n 5.0v 39.45n 5.0v 39.55n 5.0v 49.45n 5.0v 49.55n 0.0v 59.45n 0.0v 59.55n 0.0v 69.45n 0.0v 69.55n 0.0v 79.45n 0.0v 79.55n 5.0v 89.45n 5.0v 89.55n 5.0v 99.45n 5.0v 99.55n 5.0v 109.45n 5.0v 109.55n 5.0v 119.45n 5.0v 119.55n 5.0v 129.45n 5.0v 129.55n 5.0v 139.45n 5.0v 139.55n 5.0v 149.45n 5.0v 149.55n 5.0v 159.45n 5.0v 159.55n 0.0v 169.45n 0.0v 169.55n 0.0v 179.45n 0.0v 179.55n 0.0v 189.45n 0.0v 189.55n 0.0v 199.45n 0.0v 199.55n 0.0v 209.45n 0.0v 209.55n 0.0v 219.45n 0.0v 219.55n 5.0v 229.45n 5.0v 229.55n 5.0v 239.45n 5.0v 239.55n 5.0v 249.45n 5.0v 249.55n 5.0v 259.45n 5.0v 259.55n 5.0v 269.45n 5.0v 269.55n 5.0v 279.45n 5.0v 279.55n 0.0v 289.45n 0.0v 289.55n 0.0v 299.45n 0.0v 299.55n 0.0v 309.45n 0.0v 309.55n 0.0v 319.45n 0.0v 319.55n 0.0v 329.45n 0.0v 329.55n 0.0v 339.45n 0.0v 339.55n 0.0v 349.45n 0.0v 349.55n 0.0v 359.45n 0.0v 359.55n 0.0v 369.45n 0.0v 369.55n 0.0v 379.45n 0.0v 379.55n 0.0v 389.45n 0.0v 389.55n 0.0v 399.45n 0.0v 399.55n 5.0v 409.45n 5.0v 409.55n 0.0v 419.45n 0.0v 419.55n 5.0v 429.45n 5.0v 429.55n 0.0v 439.45n 0.0v 439.55n 0.0v 449.45n 0.0v 449.55n 0.0v 459.45n 0.0v 459.55n 0.0v 469.45n 0.0v 469.55n 5.0v 479.45n 5.0v 479.55n 5.0v 489.45n 5.0v 489.55n 5.0v 499.45n 5.0v 499.55n 5.0v 509.45n 5.0v 509.55n 5.0v 519.45n 5.0v 519.55n 5.0v 529.45n 5.0v 529.55n 0.0v 539.45n 0.0v 539.55n 5.0v 549.45n 5.0v 549.55n 5.0v 559.45n 5.0v 559.55n 5.0v 569.45n 5.0v 569.55n 5.0v 579.45n 5.0v 579.55n 5.0v 589.45n 5.0v 589.55n 5.0v 599.45n 5.0v 599.55n 5.0v 609.45n 5.0v 609.55n 5.0v 619.45n 5.0v 619.55n 5.0v 629.45n 5.0v 629.55n 5.0v 639.45n 5.0v 639.55n 5.0v 649.45n 5.0v 649.55n 5.0v 659.45n 5.0v 659.55n 5.0v 669.45n 5.0v 669.55n 5.0v 679.45n 5.0v 679.55n 0.0v 689.45n 0.0v 689.55n 0.0v 699.45n 0.0v 699.55n 0.0v 709.45n 0.0v 709.55n 0.0v 719.45n 0.0v 719.55n 0.0v 729.45n 0.0v 729.55n 0.0v 739.45n 0.0v 739.55n 0.0v 749.45n 0.0v 749.55n 0.0v 759.45n 0.0v 759.55n 0.0v 769.45n 0.0v 769.55n 0.0v 779.45n 0.0v 779.55n 0.0v 789.45n 0.0v 789.55n 0.0v 799.45n 0.0v 799.55n 0.0v 809.45n 0.0v 809.55n 0.0v 819.45n 0.0v 819.55n 5.0v 829.45n 5.0v 829.55n 5.0v 839.45n 5.0v 839.55n 5.0v 849.45n 5.0v 849.55n 5.0v 859.45n 5.0v 859.55n 5.0v 869.45n 5.0v 869.55n 5.0v 879.45n 5.0v 879.55n 5.0v 889.45n 5.0v 889.55n 5.0v 899.45n 5.0v 899.55n 5.0v 909.45n 5.0v 909.55n 5.0v 919.45n 5.0v 919.55n 5.0v 929.45n 5.0v 929.55n 5.0v 939.45n 5.0v 939.55n 5.0v 949.45n 5.0v 949.55n 5.0v 959.45n 5.0v 959.55n 5.0v 969.45n 5.0v 969.55n 0.0v 979.45n 0.0v 979.55n 0.0v 989.45n 0.0v 989.55n 0.0v 999.45n 0.0v 999.55n 0.0v 1009.45n 0.0v 1009.55n 0.0v 1019.45n 0.0v 1019.55n 5.0v 1029.45n 5.0v 1029.55n 5.0v 1039.45n 5.0v 1039.55n 5.0v 1049.45n 5.0v 1049.55n 5.0v 1059.45n 5.0v 1059.55n 5.0v 1069.45n 5.0v 1069.55n 5.0v 1079.45n 5.0v 1079.55n 0.0v 1089.45n 0.0v 1089.55n 0.0v 1099.45n 0.0v 1099.55n 0.0v 1109.45n 0.0v 1109.55n 5.0v 1119.45n 5.0v 1119.55n 0.0v 1129.45n 0.0v 1129.55n 0.0v 1139.45n 0.0v 1139.55n 0.0v 1149.45n 0.0v 1149.55n 5.0v 1159.45n 5.0v 1159.55n 5.0v 1169.45n 5.0v 1169.55n 5.0v 1179.45n 5.0v 1179.55n 5.0v 1189.45n 5.0v 1189.55n 0.0v 1199.45n 0.0v 1199.55n 5.0v 1209.45n 5.0v 1209.55n 5.0v 1219.45n 5.0v 1219.55n 0.0v 1229.45n 0.0v 1229.55n 0.0v 1239.45n 0.0v 1239.55n 0.0v 1249.45n 0.0v 1249.55n 0.0v 1259.45n 0.0v 1259.55n 0.0v 1269.45n 0.0v 1269.55n 5.0v 1279.45n 5.0v 1279.55n 0.0v 1289.45n 0.0v 1289.55n 0.0v 1299.45n 0.0v 1299.55n 5.0v 1309.45n 5.0v 1309.55n 0.0v 1319.45n 0.0v 1319.55n 0.0v 1329.45n 0.0v 1329.55n 5.0v 1339.45n 5.0v 1339.55n 5.0v 1349.45n 5.0v 1349.55n 5.0v 1359.45n 5.0v 1359.55n 5.0v 1369.45n 5.0v 1369.55n 5.0v 1379.45n 5.0v 1379.55n 5.0v 1389.45n 5.0v 1389.55n 0.0v 1399.45n 0.0v 1399.55n 0.0v 1409.45n 0.0v 1409.55n 0.0v 1419.45n 0.0v 1419.55n 0.0v 1429.45n 0.0v 1429.55n 0.0v 1439.45n 0.0v 1439.55n 0.0v 1449.45n 0.0v 1449.55n 0.0v 1459.45n 0.0v 1459.55n 0.0v 1469.45n 0.0v 1469.55n 0.0v 1479.45n 0.0v 1479.55n 0.0v 1489.45n 0.0v 1489.55n 0.0v 1499.45n 0.0v 1499.55n 5.0v 1509.45n 5.0v 1509.55n 5.0v 1519.45n 5.0v 1519.55n 0.0v 1529.45n 0.0v 1529.55n 5.0v 1539.45n 5.0v 1539.55n 0.0v 1549.45n 0.0v 1549.55n 5.0v 1559.45n 5.0v 1559.55n 5.0v 1569.45n 5.0v 1569.55n 5.0v 1579.45n 5.0v 1579.55n 5.0v 1589.45n 5.0v 1589.55n 5.0v 1599.45n 5.0v 1599.55n 5.0v 1609.45n 5.0v 1609.55n 5.0v 1619.45n 5.0v 1619.55n 5.0v 1629.45n 5.0v 1629.55n 5.0v 1639.45n 5.0v 1639.55n 5.0v 1649.45n 5.0v 1649.55n 5.0v 1659.45n 5.0v 1659.55n 5.0v 1669.45n 5.0v 1669.55n 5.0v 1679.45n 5.0v 1679.55n 5.0v 1689.45n 5.0v 1689.55n 5.0v 1699.45n 5.0v 1699.55n 5.0v 1709.45n 5.0v 1709.55n 5.0v 1719.45n 5.0v 1719.55n 0.0v 1729.45n 0.0v 1729.55n 0.0v 1739.45n 0.0v 1739.55n 0.0v 1749.45n 0.0v 1749.55n 0.0v 1759.45n 0.0v 1759.55n 0.0v 1769.45n 0.0v 1769.55n 0.0v 1779.45n 0.0v 1779.55n 0.0v 1789.45n 0.0v 1789.55n 0.0v 1799.45n 0.0v 1799.55n 0.0v 1809.45n 0.0v 1809.55n 0.0v 1819.45n 0.0v 1819.55n 0.0v 1829.45n 0.0v 1829.55n 0.0v 1839.45n 0.0v 1839.55n 5.0v 1849.45n 5.0v 1849.55n 0.0v 1859.45n 0.0v 1859.55n 0.0v 1869.45n 0.0v 1869.55n 0.0v 1879.45n 0.0v 1879.55n 5.0v 1889.45n 5.0v 1889.55n 5.0v 1899.45n 5.0v 1899.55n 5.0v 1909.45n 5.0v 1909.55n 5.0v 1919.45n 5.0v 1919.55n 5.0v 1929.45n 5.0v 1929.55n 0.0v 1939.45n 0.0v 1939.55n 0.0v 1949.45n 0.0v 1949.55n 0.0v 1959.45n 0.0v 1959.55n 0.0v 1969.45n 0.0v 1969.55n 5.0v 1979.45n 5.0v 1979.55n 0.0v 1989.45n 0.0v 1989.55n 0.0v 1999.45n 0.0v 1999.55n 0.0v 2009.45n 0.0v 2009.55n 0.0v 2019.45n 0.0v 2019.55n 0.0v 2029.45n 0.0v 2029.55n 0.0v 2039.45n 0.0v 2039.55n 0.0v 2049.45n 0.0v 2049.55n 0.0v )
* (time, data): [(0, 0), (10, 1), (20, 0), (30, 0), (40, 0), (50, 1), (60, 1), (70, 0), (80, 1), (90, 1), (100, 1), (110, 1), (120, 1), (130, 1), (140, 1), (150, 0), (160, 0), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 1), (230, 1), (240, 1), (250, 0), (260, 0), (270, 0), (280, 1), (290, 1), (300, 0), (310, 0), (320, 0), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 0), (390, 0), (400, 0), (410, 1), (420, 1), (430, 1), (440, 1), (450, 0), (460, 0), (470, 0), (480, 0), (490, 0), (500, 0), (510, 1), (520, 1), (530, 1), (540, 0), (550, 0), (560, 0), (570, 0), (580, 0), (590, 1), (600, 1), (610, 0), (620, 0), (630, 0), (640, 0), (650, 0), (660, 0), (670, 0), (680, 1), (690, 1), (700, 1), (710, 1), (720, 0), (730, 0), (740, 0), (750, 1), (760, 0), (770, 0), (780, 1), (790, 1), (800, 1), (810, 1), (820, 1), (830, 1), (840, 1), (850, 1), (860, 1), (870, 1), (880, 1), (890, 1), (900, 1), (910, 1), (920, 1), (930, 1), (940, 1), (950, 0), (960, 0), (970, 0), (980, 0), (990, 0), (1000, 1), (1010, 1), (1020, 0), (1030, 0), (1040, 0), (1050, 0), (1060, 0), (1070, 0), (1080, 0), (1090, 0), (1100, 0), (1110, 0), (1120, 0), (1130, 0), (1140, 0), (1150, 1), (1160, 1), (1170, 1), (1180, 1), (1190, 0), (1200, 1), (1210, 1), (1220, 1), (1230, 0), (1240, 0), (1250, 0), (1260, 0), (1270, 0), (1280, 1), (1290, 1), (1300, 1), (1310, 1), (1320, 1), (1330, 1), (1340, 1), (1350, 1), (1360, 1), (1370, 1), (1380, 1), (1390, 0), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 0), (1450, 0), (1460, 0), (1470, 0), (1480, 0), (1490, 0), (1500, 1), (1510, 0), (1520, 0), (1530, 1), (1540, 1), (1550, 0), (1560, 1), (1570, 1), (1580, 1), (1590, 1), (1600, 1), (1610, 1), (1620, 1), (1630, 1), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 1), (1700, 1), (1710, 1), (1720, 1), (1730, 1), (1740, 1), (1750, 1), (1760, 0), (1770, 0), (1780, 0), (1790, 1), (1800, 1), (1810, 0), (1820, 0), (1830, 0), (1840, 1), (1850, 1), (1860, 0), (1870, 0), (1880, 1), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 1), (1940, 1), (1950, 1), (1960, 1), (1970, 0), (1980, 1), (1990, 1), (2000, 1), (2010, 1), (2020, 1), (2030, 0), (2040, 0), (2050, 0)]
Vdin0_6  din0_6  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 5.0v 19.45n 5.0v 19.55n 0.0v 29.45n 0.0v 29.55n 0.0v 39.45n 0.0v 39.55n 0.0v 49.45n 0.0v 49.55n 5.0v 59.45n 5.0v 59.55n 5.0v 69.45n 5.0v 69.55n 0.0v 79.45n 0.0v 79.55n 5.0v 89.45n 5.0v 89.55n 5.0v 99.45n 5.0v 99.55n 5.0v 109.45n 5.0v 109.55n 5.0v 119.45n 5.0v 119.55n 5.0v 129.45n 5.0v 129.55n 5.0v 139.45n 5.0v 139.55n 5.0v 149.45n 5.0v 149.55n 0.0v 159.45n 0.0v 159.55n 0.0v 169.45n 0.0v 169.55n 0.0v 179.45n 0.0v 179.55n 0.0v 189.45n 0.0v 189.55n 0.0v 199.45n 0.0v 199.55n 0.0v 209.45n 0.0v 209.55n 0.0v 219.45n 0.0v 219.55n 5.0v 229.45n 5.0v 229.55n 5.0v 239.45n 5.0v 239.55n 5.0v 249.45n 5.0v 249.55n 0.0v 259.45n 0.0v 259.55n 0.0v 269.45n 0.0v 269.55n 0.0v 279.45n 0.0v 279.55n 5.0v 289.45n 5.0v 289.55n 5.0v 299.45n 5.0v 299.55n 0.0v 309.45n 0.0v 309.55n 0.0v 319.45n 0.0v 319.55n 0.0v 329.45n 0.0v 329.55n 0.0v 339.45n 0.0v 339.55n 0.0v 349.45n 0.0v 349.55n 0.0v 359.45n 0.0v 359.55n 0.0v 369.45n 0.0v 369.55n 0.0v 379.45n 0.0v 379.55n 0.0v 389.45n 0.0v 389.55n 0.0v 399.45n 0.0v 399.55n 0.0v 409.45n 0.0v 409.55n 5.0v 419.45n 5.0v 419.55n 5.0v 429.45n 5.0v 429.55n 5.0v 439.45n 5.0v 439.55n 5.0v 449.45n 5.0v 449.55n 0.0v 459.45n 0.0v 459.55n 0.0v 469.45n 0.0v 469.55n 0.0v 479.45n 0.0v 479.55n 0.0v 489.45n 0.0v 489.55n 0.0v 499.45n 0.0v 499.55n 0.0v 509.45n 0.0v 509.55n 5.0v 519.45n 5.0v 519.55n 5.0v 529.45n 5.0v 529.55n 5.0v 539.45n 5.0v 539.55n 0.0v 549.45n 0.0v 549.55n 0.0v 559.45n 0.0v 559.55n 0.0v 569.45n 0.0v 569.55n 0.0v 579.45n 0.0v 579.55n 0.0v 589.45n 0.0v 589.55n 5.0v 599.45n 5.0v 599.55n 5.0v 609.45n 5.0v 609.55n 0.0v 619.45n 0.0v 619.55n 0.0v 629.45n 0.0v 629.55n 0.0v 639.45n 0.0v 639.55n 0.0v 649.45n 0.0v 649.55n 0.0v 659.45n 0.0v 659.55n 0.0v 669.45n 0.0v 669.55n 0.0v 679.45n 0.0v 679.55n 5.0v 689.45n 5.0v 689.55n 5.0v 699.45n 5.0v 699.55n 5.0v 709.45n 5.0v 709.55n 5.0v 719.45n 5.0v 719.55n 0.0v 729.45n 0.0v 729.55n 0.0v 739.45n 0.0v 739.55n 0.0v 749.45n 0.0v 749.55n 5.0v 759.45n 5.0v 759.55n 0.0v 769.45n 0.0v 769.55n 0.0v 779.45n 0.0v 779.55n 5.0v 789.45n 5.0v 789.55n 5.0v 799.45n 5.0v 799.55n 5.0v 809.45n 5.0v 809.55n 5.0v 819.45n 5.0v 819.55n 5.0v 829.45n 5.0v 829.55n 5.0v 839.45n 5.0v 839.55n 5.0v 849.45n 5.0v 849.55n 5.0v 859.45n 5.0v 859.55n 5.0v 869.45n 5.0v 869.55n 5.0v 879.45n 5.0v 879.55n 5.0v 889.45n 5.0v 889.55n 5.0v 899.45n 5.0v 899.55n 5.0v 909.45n 5.0v 909.55n 5.0v 919.45n 5.0v 919.55n 5.0v 929.45n 5.0v 929.55n 5.0v 939.45n 5.0v 939.55n 5.0v 949.45n 5.0v 949.55n 0.0v 959.45n 0.0v 959.55n 0.0v 969.45n 0.0v 969.55n 0.0v 979.45n 0.0v 979.55n 0.0v 989.45n 0.0v 989.55n 0.0v 999.45n 0.0v 999.55n 5.0v 1009.45n 5.0v 1009.55n 5.0v 1019.45n 5.0v 1019.55n 0.0v 1029.45n 0.0v 1029.55n 0.0v 1039.45n 0.0v 1039.55n 0.0v 1049.45n 0.0v 1049.55n 0.0v 1059.45n 0.0v 1059.55n 0.0v 1069.45n 0.0v 1069.55n 0.0v 1079.45n 0.0v 1079.55n 0.0v 1089.45n 0.0v 1089.55n 0.0v 1099.45n 0.0v 1099.55n 0.0v 1109.45n 0.0v 1109.55n 0.0v 1119.45n 0.0v 1119.55n 0.0v 1129.45n 0.0v 1129.55n 0.0v 1139.45n 0.0v 1139.55n 0.0v 1149.45n 0.0v 1149.55n 5.0v 1159.45n 5.0v 1159.55n 5.0v 1169.45n 5.0v 1169.55n 5.0v 1179.45n 5.0v 1179.55n 5.0v 1189.45n 5.0v 1189.55n 0.0v 1199.45n 0.0v 1199.55n 5.0v 1209.45n 5.0v 1209.55n 5.0v 1219.45n 5.0v 1219.55n 5.0v 1229.45n 5.0v 1229.55n 0.0v 1239.45n 0.0v 1239.55n 0.0v 1249.45n 0.0v 1249.55n 0.0v 1259.45n 0.0v 1259.55n 0.0v 1269.45n 0.0v 1269.55n 0.0v 1279.45n 0.0v 1279.55n 5.0v 1289.45n 5.0v 1289.55n 5.0v 1299.45n 5.0v 1299.55n 5.0v 1309.45n 5.0v 1309.55n 5.0v 1319.45n 5.0v 1319.55n 5.0v 1329.45n 5.0v 1329.55n 5.0v 1339.45n 5.0v 1339.55n 5.0v 1349.45n 5.0v 1349.55n 5.0v 1359.45n 5.0v 1359.55n 5.0v 1369.45n 5.0v 1369.55n 5.0v 1379.45n 5.0v 1379.55n 5.0v 1389.45n 5.0v 1389.55n 0.0v 1399.45n 0.0v 1399.55n 0.0v 1409.45n 0.0v 1409.55n 0.0v 1419.45n 0.0v 1419.55n 0.0v 1429.45n 0.0v 1429.55n 0.0v 1439.45n 0.0v 1439.55n 0.0v 1449.45n 0.0v 1449.55n 0.0v 1459.45n 0.0v 1459.55n 0.0v 1469.45n 0.0v 1469.55n 0.0v 1479.45n 0.0v 1479.55n 0.0v 1489.45n 0.0v 1489.55n 0.0v 1499.45n 0.0v 1499.55n 5.0v 1509.45n 5.0v 1509.55n 0.0v 1519.45n 0.0v 1519.55n 0.0v 1529.45n 0.0v 1529.55n 5.0v 1539.45n 5.0v 1539.55n 5.0v 1549.45n 5.0v 1549.55n 0.0v 1559.45n 0.0v 1559.55n 5.0v 1569.45n 5.0v 1569.55n 5.0v 1579.45n 5.0v 1579.55n 5.0v 1589.45n 5.0v 1589.55n 5.0v 1599.45n 5.0v 1599.55n 5.0v 1609.45n 5.0v 1609.55n 5.0v 1619.45n 5.0v 1619.55n 5.0v 1629.45n 5.0v 1629.55n 5.0v 1639.45n 5.0v 1639.55n 5.0v 1649.45n 5.0v 1649.55n 5.0v 1659.45n 5.0v 1659.55n 5.0v 1669.45n 5.0v 1669.55n 5.0v 1679.45n 5.0v 1679.55n 5.0v 1689.45n 5.0v 1689.55n 5.0v 1699.45n 5.0v 1699.55n 5.0v 1709.45n 5.0v 1709.55n 5.0v 1719.45n 5.0v 1719.55n 5.0v 1729.45n 5.0v 1729.55n 5.0v 1739.45n 5.0v 1739.55n 5.0v 1749.45n 5.0v 1749.55n 5.0v 1759.45n 5.0v 1759.55n 0.0v 1769.45n 0.0v 1769.55n 0.0v 1779.45n 0.0v 1779.55n 0.0v 1789.45n 0.0v 1789.55n 5.0v 1799.45n 5.0v 1799.55n 5.0v 1809.45n 5.0v 1809.55n 0.0v 1819.45n 0.0v 1819.55n 0.0v 1829.45n 0.0v 1829.55n 0.0v 1839.45n 0.0v 1839.55n 5.0v 1849.45n 5.0v 1849.55n 5.0v 1859.45n 5.0v 1859.55n 0.0v 1869.45n 0.0v 1869.55n 0.0v 1879.45n 0.0v 1879.55n 5.0v 1889.45n 5.0v 1889.55n 0.0v 1899.45n 0.0v 1899.55n 0.0v 1909.45n 0.0v 1909.55n 0.0v 1919.45n 0.0v 1919.55n 0.0v 1929.45n 0.0v 1929.55n 5.0v 1939.45n 5.0v 1939.55n 5.0v 1949.45n 5.0v 1949.55n 5.0v 1959.45n 5.0v 1959.55n 5.0v 1969.45n 5.0v 1969.55n 0.0v 1979.45n 0.0v 1979.55n 5.0v 1989.45n 5.0v 1989.55n 5.0v 1999.45n 5.0v 1999.55n 5.0v 2009.45n 5.0v 2009.55n 5.0v 2019.45n 5.0v 2019.55n 5.0v 2029.45n 5.0v 2029.55n 0.0v 2039.45n 0.0v 2039.55n 0.0v 2049.45n 0.0v 2049.55n 0.0v )
* (time, data): [(0, 0), (10, 0), (20, 0), (30, 0), (40, 0), (50, 0), (60, 0), (70, 1), (80, 0), (90, 0), (100, 0), (110, 0), (120, 0), (130, 1), (140, 1), (150, 1), (160, 0), (170, 1), (180, 1), (190, 1), (200, 1), (210, 1), (220, 0), (230, 0), (240, 0), (250, 1), (260, 1), (270, 1), (280, 1), (290, 1), (300, 1), (310, 1), (320, 1), (330, 1), (340, 1), (350, 1), (360, 1), (370, 1), (380, 1), (390, 0), (400, 0), (410, 1), (420, 0), (430, 0), (440, 0), (450, 1), (460, 1), (470, 0), (480, 1), (490, 0), (500, 0), (510, 1), (520, 1), (530, 0), (540, 1), (550, 1), (560, 1), (570, 1), (580, 1), (590, 0), (600, 0), (610, 1), (620, 1), (630, 1), (640, 0), (650, 0), (660, 0), (670, 0), (680, 1), (690, 1), (700, 1), (710, 1), (720, 1), (730, 1), (740, 0), (750, 0), (760, 0), (770, 0), (780, 1), (790, 1), (800, 1), (810, 1), (820, 0), (830, 0), (840, 0), (850, 1), (860, 1), (870, 1), (880, 1), (890, 1), (900, 1), (910, 1), (920, 1), (930, 1), (940, 1), (950, 1), (960, 1), (970, 0), (980, 0), (990, 0), (1000, 1), (1010, 1), (1020, 0), (1030, 0), (1040, 0), (1050, 0), (1060, 0), (1070, 0), (1080, 0), (1090, 0), (1100, 0), (1110, 1), (1120, 1), (1130, 1), (1140, 1), (1150, 1), (1160, 1), (1170, 1), (1180, 1), (1190, 1), (1200, 0), (1210, 0), (1220, 1), (1230, 0), (1240, 0), (1250, 0), (1260, 0), (1270, 1), (1280, 0), (1290, 0), (1300, 1), (1310, 1), (1320, 1), (1330, 0), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 1), (1390, 1), (1400, 1), (1410, 1), (1420, 1), (1430, 1), (1440, 0), (1450, 0), (1460, 0), (1470, 0), (1480, 1), (1490, 1), (1500, 0), (1510, 0), (1520, 1), (1530, 0), (1540, 1), (1550, 0), (1560, 1), (1570, 1), (1580, 1), (1590, 0), (1600, 0), (1610, 0), (1620, 0), (1630, 0), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 1), (1700, 1), (1710, 1), (1720, 0), (1730, 0), (1740, 0), (1750, 0), (1760, 1), (1770, 1), (1780, 0), (1790, 0), (1800, 0), (1810, 1), (1820, 1), (1830, 1), (1840, 1), (1850, 1), (1860, 0), (1870, 0), (1880, 1), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 1), (1940, 1), (1950, 1), (1960, 1), (1970, 0), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 0), (2030, 0), (2040, 0), (2050, 0)]
Vdin0_7  din0_7  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 0.0v 19.45n 0.0v 19.55n 0.0v 29.45n 0.0v 29.55n 0.0v 39.45n 0.0v 39.55n 0.0v 49.45n 0.0v 49.55n 0.0v 59.45n 0.0v 59.55n 0.0v 69.45n 0.0v 69.55n 5.0v 79.45n 5.0v 79.55n 0.0v 89.45n 0.0v 89.55n 0.0v 99.45n 0.0v 99.55n 0.0v 109.45n 0.0v 109.55n 0.0v 119.45n 0.0v 119.55n 0.0v 129.45n 0.0v 129.55n 5.0v 139.45n 5.0v 139.55n 5.0v 149.45n 5.0v 149.55n 5.0v 159.45n 5.0v 159.55n 0.0v 169.45n 0.0v 169.55n 5.0v 179.45n 5.0v 179.55n 5.0v 189.45n 5.0v 189.55n 5.0v 199.45n 5.0v 199.55n 5.0v 209.45n 5.0v 209.55n 5.0v 219.45n 5.0v 219.55n 0.0v 229.45n 0.0v 229.55n 0.0v 239.45n 0.0v 239.55n 0.0v 249.45n 0.0v 249.55n 5.0v 259.45n 5.0v 259.55n 5.0v 269.45n 5.0v 269.55n 5.0v 279.45n 5.0v 279.55n 5.0v 289.45n 5.0v 289.55n 5.0v 299.45n 5.0v 299.55n 5.0v 309.45n 5.0v 309.55n 5.0v 319.45n 5.0v 319.55n 5.0v 329.45n 5.0v 329.55n 5.0v 339.45n 5.0v 339.55n 5.0v 349.45n 5.0v 349.55n 5.0v 359.45n 5.0v 359.55n 5.0v 369.45n 5.0v 369.55n 5.0v 379.45n 5.0v 379.55n 5.0v 389.45n 5.0v 389.55n 0.0v 399.45n 0.0v 399.55n 0.0v 409.45n 0.0v 409.55n 5.0v 419.45n 5.0v 419.55n 0.0v 429.45n 0.0v 429.55n 0.0v 439.45n 0.0v 439.55n 0.0v 449.45n 0.0v 449.55n 5.0v 459.45n 5.0v 459.55n 5.0v 469.45n 5.0v 469.55n 0.0v 479.45n 0.0v 479.55n 5.0v 489.45n 5.0v 489.55n 0.0v 499.45n 0.0v 499.55n 0.0v 509.45n 0.0v 509.55n 5.0v 519.45n 5.0v 519.55n 5.0v 529.45n 5.0v 529.55n 0.0v 539.45n 0.0v 539.55n 5.0v 549.45n 5.0v 549.55n 5.0v 559.45n 5.0v 559.55n 5.0v 569.45n 5.0v 569.55n 5.0v 579.45n 5.0v 579.55n 5.0v 589.45n 5.0v 589.55n 0.0v 599.45n 0.0v 599.55n 0.0v 609.45n 0.0v 609.55n 5.0v 619.45n 5.0v 619.55n 5.0v 629.45n 5.0v 629.55n 5.0v 639.45n 5.0v 639.55n 0.0v 649.45n 0.0v 649.55n 0.0v 659.45n 0.0v 659.55n 0.0v 669.45n 0.0v 669.55n 0.0v 679.45n 0.0v 679.55n 5.0v 689.45n 5.0v 689.55n 5.0v 699.45n 5.0v 699.55n 5.0v 709.45n 5.0v 709.55n 5.0v 719.45n 5.0v 719.55n 5.0v 729.45n 5.0v 729.55n 5.0v 739.45n 5.0v 739.55n 0.0v 749.45n 0.0v 749.55n 0.0v 759.45n 0.0v 759.55n 0.0v 769.45n 0.0v 769.55n 0.0v 779.45n 0.0v 779.55n 5.0v 789.45n 5.0v 789.55n 5.0v 799.45n 5.0v 799.55n 5.0v 809.45n 5.0v 809.55n 5.0v 819.45n 5.0v 819.55n 0.0v 829.45n 0.0v 829.55n 0.0v 839.45n 0.0v 839.55n 0.0v 849.45n 0.0v 849.55n 5.0v 859.45n 5.0v 859.55n 5.0v 869.45n 5.0v 869.55n 5.0v 879.45n 5.0v 879.55n 5.0v 889.45n 5.0v 889.55n 5.0v 899.45n 5.0v 899.55n 5.0v 909.45n 5.0v 909.55n 5.0v 919.45n 5.0v 919.55n 5.0v 929.45n 5.0v 929.55n 5.0v 939.45n 5.0v 939.55n 5.0v 949.45n 5.0v 949.55n 5.0v 959.45n 5.0v 959.55n 5.0v 969.45n 5.0v 969.55n 0.0v 979.45n 0.0v 979.55n 0.0v 989.45n 0.0v 989.55n 0.0v 999.45n 0.0v 999.55n 5.0v 1009.45n 5.0v 1009.55n 5.0v 1019.45n 5.0v 1019.55n 0.0v 1029.45n 0.0v 1029.55n 0.0v 1039.45n 0.0v 1039.55n 0.0v 1049.45n 0.0v 1049.55n 0.0v 1059.45n 0.0v 1059.55n 0.0v 1069.45n 0.0v 1069.55n 0.0v 1079.45n 0.0v 1079.55n 0.0v 1089.45n 0.0v 1089.55n 0.0v 1099.45n 0.0v 1099.55n 0.0v 1109.45n 0.0v 1109.55n 5.0v 1119.45n 5.0v 1119.55n 5.0v 1129.45n 5.0v 1129.55n 5.0v 1139.45n 5.0v 1139.55n 5.0v 1149.45n 5.0v 1149.55n 5.0v 1159.45n 5.0v 1159.55n 5.0v 1169.45n 5.0v 1169.55n 5.0v 1179.45n 5.0v 1179.55n 5.0v 1189.45n 5.0v 1189.55n 5.0v 1199.45n 5.0v 1199.55n 0.0v 1209.45n 0.0v 1209.55n 0.0v 1219.45n 0.0v 1219.55n 5.0v 1229.45n 5.0v 1229.55n 0.0v 1239.45n 0.0v 1239.55n 0.0v 1249.45n 0.0v 1249.55n 0.0v 1259.45n 0.0v 1259.55n 0.0v 1269.45n 0.0v 1269.55n 5.0v 1279.45n 5.0v 1279.55n 0.0v 1289.45n 0.0v 1289.55n 0.0v 1299.45n 0.0v 1299.55n 5.0v 1309.45n 5.0v 1309.55n 5.0v 1319.45n 5.0v 1319.55n 5.0v 1329.45n 5.0v 1329.55n 0.0v 1339.45n 0.0v 1339.55n 0.0v 1349.45n 0.0v 1349.55n 0.0v 1359.45n 0.0v 1359.55n 0.0v 1369.45n 0.0v 1369.55n 0.0v 1379.45n 0.0v 1379.55n 5.0v 1389.45n 5.0v 1389.55n 5.0v 1399.45n 5.0v 1399.55n 5.0v 1409.45n 5.0v 1409.55n 5.0v 1419.45n 5.0v 1419.55n 5.0v 1429.45n 5.0v 1429.55n 5.0v 1439.45n 5.0v 1439.55n 0.0v 1449.45n 0.0v 1449.55n 0.0v 1459.45n 0.0v 1459.55n 0.0v 1469.45n 0.0v 1469.55n 0.0v 1479.45n 0.0v 1479.55n 5.0v 1489.45n 5.0v 1489.55n 5.0v 1499.45n 5.0v 1499.55n 0.0v 1509.45n 0.0v 1509.55n 0.0v 1519.45n 0.0v 1519.55n 5.0v 1529.45n 5.0v 1529.55n 0.0v 1539.45n 0.0v 1539.55n 5.0v 1549.45n 5.0v 1549.55n 0.0v 1559.45n 0.0v 1559.55n 5.0v 1569.45n 5.0v 1569.55n 5.0v 1579.45n 5.0v 1579.55n 5.0v 1589.45n 5.0v 1589.55n 0.0v 1599.45n 0.0v 1599.55n 0.0v 1609.45n 0.0v 1609.55n 0.0v 1619.45n 0.0v 1619.55n 0.0v 1629.45n 0.0v 1629.55n 0.0v 1639.45n 0.0v 1639.55n 5.0v 1649.45n 5.0v 1649.55n 5.0v 1659.45n 5.0v 1659.55n 5.0v 1669.45n 5.0v 1669.55n 5.0v 1679.45n 5.0v 1679.55n 5.0v 1689.45n 5.0v 1689.55n 5.0v 1699.45n 5.0v 1699.55n 5.0v 1709.45n 5.0v 1709.55n 5.0v 1719.45n 5.0v 1719.55n 0.0v 1729.45n 0.0v 1729.55n 0.0v 1739.45n 0.0v 1739.55n 0.0v 1749.45n 0.0v 1749.55n 0.0v 1759.45n 0.0v 1759.55n 5.0v 1769.45n 5.0v 1769.55n 5.0v 1779.45n 5.0v 1779.55n 0.0v 1789.45n 0.0v 1789.55n 0.0v 1799.45n 0.0v 1799.55n 0.0v 1809.45n 0.0v 1809.55n 5.0v 1819.45n 5.0v 1819.55n 5.0v 1829.45n 5.0v 1829.55n 5.0v 1839.45n 5.0v 1839.55n 5.0v 1849.45n 5.0v 1849.55n 5.0v 1859.45n 5.0v 1859.55n 0.0v 1869.45n 0.0v 1869.55n 0.0v 1879.45n 0.0v 1879.55n 5.0v 1889.45n 5.0v 1889.55n 0.0v 1899.45n 0.0v 1899.55n 0.0v 1909.45n 0.0v 1909.55n 0.0v 1919.45n 0.0v 1919.55n 0.0v 1929.45n 0.0v 1929.55n 5.0v 1939.45n 5.0v 1939.55n 5.0v 1949.45n 5.0v 1949.55n 5.0v 1959.45n 5.0v 1959.55n 5.0v 1969.45n 5.0v 1969.55n 0.0v 1979.45n 0.0v 1979.55n 0.0v 1989.45n 0.0v 1989.55n 0.0v 1999.45n 0.0v 1999.55n 0.0v 2009.45n 0.0v 2009.55n 0.0v 2019.45n 0.0v 2019.55n 0.0v 2029.45n 0.0v 2029.55n 0.0v 2039.45n 0.0v 2039.55n 0.0v 2049.45n 0.0v 2049.55n 0.0v )
* (time, data): [(0, 0), (10, 0), (20, 0), (30, 0), (40, 0), (50, 0), (60, 1), (70, 0), (80, 0), (90, 0), (100, 0), (110, 0), (120, 0), (130, 1), (140, 1), (150, 1), (160, 1), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 0), (230, 0), (240, 0), (250, 0), (260, 0), (270, 0), (280, 0), (290, 0), (300, 1), (310, 1), (320, 1), (330, 1), (340, 1), (350, 1), (360, 1), (370, 1), (380, 1), (390, 0), (400, 1), (410, 0), (420, 1), (430, 0), (440, 0), (450, 0), (460, 0), (470, 0), (480, 0), (490, 0), (500, 0), (510, 0), (520, 0), (530, 0), (540, 1), (550, 1), (560, 1), (570, 1), (580, 1), (590, 0), (600, 1), (610, 0), (620, 0), (630, 0), (640, 0), (650, 0), (660, 0), (670, 1), (680, 1), (690, 1), (700, 1), (710, 1), (720, 0), (730, 0), (740, 0), (750, 0), (760, 1), (770, 1), (780, 0), (790, 0), (800, 0), (810, 0), (820, 0), (830, 0), (840, 0), (850, 0), (860, 0), (870, 0), (880, 0), (890, 0), (900, 0), (910, 0), (920, 0), (930, 0), (940, 0), (950, 0), (960, 0), (970, 1), (980, 1), (990, 1), (1000, 1), (1010, 1), (1020, 0), (1030, 0), (1040, 0), (1050, 0), (1060, 0), (1070, 1), (1080, 0), (1090, 1), (1100, 1), (1110, 1), (1120, 0), (1130, 0), (1140, 0), (1150, 1), (1160, 1), (1170, 1), (1180, 1), (1190, 1), (1200, 1), (1210, 1), (1220, 0), (1230, 0), (1240, 0), (1250, 0), (1260, 0), (1270, 1), (1280, 1), (1290, 1), (1300, 1), (1310, 1), (1320, 1), (1330, 0), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 0), (1390, 1), (1400, 1), (1410, 1), (1420, 1), (1430, 1), (1440, 0), (1450, 0), (1460, 0), (1470, 0), (1480, 0), (1490, 0), (1500, 1), (1510, 0), (1520, 1), (1530, 0), (1540, 0), (1550, 0), (1560, 0), (1570, 0), (1580, 0), (1590, 1), (1600, 1), (1610, 1), (1620, 1), (1630, 1), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 1), (1700, 1), (1710, 1), (1720, 0), (1730, 1), (1740, 1), (1750, 1), (1760, 1), (1770, 1), (1780, 1), (1790, 1), (1800, 1), (1810, 0), (1820, 0), (1830, 0), (1840, 0), (1850, 1), (1860, 0), (1870, 0), (1880, 0), (1890, 1), (1900, 1), (1910, 1), (1920, 1), (1930, 1), (1940, 1), (1950, 1), (1960, 1), (1970, 1), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 0), (2030, 0), (2040, 0), (2050, 0)]
Vdin0_8  din0_8  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 0.0v 19.45n 0.0v 19.55n 0.0v 29.45n 0.0v 29.55n 0.0v 39.45n 0.0v 39.55n 0.0v 49.45n 0.0v 49.55n 0.0v 59.45n 0.0v 59.55n 5.0v 69.45n 5.0v 69.55n 0.0v 79.45n 0.0v 79.55n 0.0v 89.45n 0.0v 89.55n 0.0v 99.45n 0.0v 99.55n 0.0v 109.45n 0.0v 109.55n 0.0v 119.45n 0.0v 119.55n 0.0v 129.45n 0.0v 129.55n 5.0v 139.45n 5.0v 139.55n 5.0v 149.45n 5.0v 149.55n 5.0v 159.45n 5.0v 159.55n 5.0v 169.45n 5.0v 169.55n 0.0v 179.45n 0.0v 179.55n 0.0v 189.45n 0.0v 189.55n 0.0v 199.45n 0.0v 199.55n 0.0v 209.45n 0.0v 209.55n 0.0v 219.45n 0.0v 219.55n 0.0v 229.45n 0.0v 229.55n 0.0v 239.45n 0.0v 239.55n 0.0v 249.45n 0.0v 249.55n 0.0v 259.45n 0.0v 259.55n 0.0v 269.45n 0.0v 269.55n 0.0v 279.45n 0.0v 279.55n 0.0v 289.45n 0.0v 289.55n 0.0v 299.45n 0.0v 299.55n 5.0v 309.45n 5.0v 309.55n 5.0v 319.45n 5.0v 319.55n 5.0v 329.45n 5.0v 329.55n 5.0v 339.45n 5.0v 339.55n 5.0v 349.45n 5.0v 349.55n 5.0v 359.45n 5.0v 359.55n 5.0v 369.45n 5.0v 369.55n 5.0v 379.45n 5.0v 379.55n 5.0v 389.45n 5.0v 389.55n 0.0v 399.45n 0.0v 399.55n 5.0v 409.45n 5.0v 409.55n 0.0v 419.45n 0.0v 419.55n 5.0v 429.45n 5.0v 429.55n 0.0v 439.45n 0.0v 439.55n 0.0v 449.45n 0.0v 449.55n 0.0v 459.45n 0.0v 459.55n 0.0v 469.45n 0.0v 469.55n 0.0v 479.45n 0.0v 479.55n 0.0v 489.45n 0.0v 489.55n 0.0v 499.45n 0.0v 499.55n 0.0v 509.45n 0.0v 509.55n 0.0v 519.45n 0.0v 519.55n 0.0v 529.45n 0.0v 529.55n 0.0v 539.45n 0.0v 539.55n 5.0v 549.45n 5.0v 549.55n 5.0v 559.45n 5.0v 559.55n 5.0v 569.45n 5.0v 569.55n 5.0v 579.45n 5.0v 579.55n 5.0v 589.45n 5.0v 589.55n 0.0v 599.45n 0.0v 599.55n 5.0v 609.45n 5.0v 609.55n 0.0v 619.45n 0.0v 619.55n 0.0v 629.45n 0.0v 629.55n 0.0v 639.45n 0.0v 639.55n 0.0v 649.45n 0.0v 649.55n 0.0v 659.45n 0.0v 659.55n 0.0v 669.45n 0.0v 669.55n 5.0v 679.45n 5.0v 679.55n 5.0v 689.45n 5.0v 689.55n 5.0v 699.45n 5.0v 699.55n 5.0v 709.45n 5.0v 709.55n 5.0v 719.45n 5.0v 719.55n 0.0v 729.45n 0.0v 729.55n 0.0v 739.45n 0.0v 739.55n 0.0v 749.45n 0.0v 749.55n 0.0v 759.45n 0.0v 759.55n 5.0v 769.45n 5.0v 769.55n 5.0v 779.45n 5.0v 779.55n 0.0v 789.45n 0.0v 789.55n 0.0v 799.45n 0.0v 799.55n 0.0v 809.45n 0.0v 809.55n 0.0v 819.45n 0.0v 819.55n 0.0v 829.45n 0.0v 829.55n 0.0v 839.45n 0.0v 839.55n 0.0v 849.45n 0.0v 849.55n 0.0v 859.45n 0.0v 859.55n 0.0v 869.45n 0.0v 869.55n 0.0v 879.45n 0.0v 879.55n 0.0v 889.45n 0.0v 889.55n 0.0v 899.45n 0.0v 899.55n 0.0v 909.45n 0.0v 909.55n 0.0v 919.45n 0.0v 919.55n 0.0v 929.45n 0.0v 929.55n 0.0v 939.45n 0.0v 939.55n 0.0v 949.45n 0.0v 949.55n 0.0v 959.45n 0.0v 959.55n 0.0v 969.45n 0.0v 969.55n 5.0v 979.45n 5.0v 979.55n 5.0v 989.45n 5.0v 989.55n 5.0v 999.45n 5.0v 999.55n 5.0v 1009.45n 5.0v 1009.55n 5.0v 1019.45n 5.0v 1019.55n 0.0v 1029.45n 0.0v 1029.55n 0.0v 1039.45n 0.0v 1039.55n 0.0v 1049.45n 0.0v 1049.55n 0.0v 1059.45n 0.0v 1059.55n 0.0v 1069.45n 0.0v 1069.55n 5.0v 1079.45n 5.0v 1079.55n 0.0v 1089.45n 0.0v 1089.55n 5.0v 1099.45n 5.0v 1099.55n 5.0v 1109.45n 5.0v 1109.55n 5.0v 1119.45n 5.0v 1119.55n 0.0v 1129.45n 0.0v 1129.55n 0.0v 1139.45n 0.0v 1139.55n 0.0v 1149.45n 0.0v 1149.55n 5.0v 1159.45n 5.0v 1159.55n 5.0v 1169.45n 5.0v 1169.55n 5.0v 1179.45n 5.0v 1179.55n 5.0v 1189.45n 5.0v 1189.55n 5.0v 1199.45n 5.0v 1199.55n 5.0v 1209.45n 5.0v 1209.55n 5.0v 1219.45n 5.0v 1219.55n 0.0v 1229.45n 0.0v 1229.55n 0.0v 1239.45n 0.0v 1239.55n 0.0v 1249.45n 0.0v 1249.55n 0.0v 1259.45n 0.0v 1259.55n 0.0v 1269.45n 0.0v 1269.55n 5.0v 1279.45n 5.0v 1279.55n 5.0v 1289.45n 5.0v 1289.55n 5.0v 1299.45n 5.0v 1299.55n 5.0v 1309.45n 5.0v 1309.55n 5.0v 1319.45n 5.0v 1319.55n 5.0v 1329.45n 5.0v 1329.55n 0.0v 1339.45n 0.0v 1339.55n 0.0v 1349.45n 0.0v 1349.55n 0.0v 1359.45n 0.0v 1359.55n 0.0v 1369.45n 0.0v 1369.55n 0.0v 1379.45n 0.0v 1379.55n 0.0v 1389.45n 0.0v 1389.55n 5.0v 1399.45n 5.0v 1399.55n 5.0v 1409.45n 5.0v 1409.55n 5.0v 1419.45n 5.0v 1419.55n 5.0v 1429.45n 5.0v 1429.55n 5.0v 1439.45n 5.0v 1439.55n 0.0v 1449.45n 0.0v 1449.55n 0.0v 1459.45n 0.0v 1459.55n 0.0v 1469.45n 0.0v 1469.55n 0.0v 1479.45n 0.0v 1479.55n 0.0v 1489.45n 0.0v 1489.55n 0.0v 1499.45n 0.0v 1499.55n 5.0v 1509.45n 5.0v 1509.55n 0.0v 1519.45n 0.0v 1519.55n 5.0v 1529.45n 5.0v 1529.55n 0.0v 1539.45n 0.0v 1539.55n 0.0v 1549.45n 0.0v 1549.55n 0.0v 1559.45n 0.0v 1559.55n 0.0v 1569.45n 0.0v 1569.55n 0.0v 1579.45n 0.0v 1579.55n 0.0v 1589.45n 0.0v 1589.55n 5.0v 1599.45n 5.0v 1599.55n 5.0v 1609.45n 5.0v 1609.55n 5.0v 1619.45n 5.0v 1619.55n 5.0v 1629.45n 5.0v 1629.55n 5.0v 1639.45n 5.0v 1639.55n 5.0v 1649.45n 5.0v 1649.55n 5.0v 1659.45n 5.0v 1659.55n 5.0v 1669.45n 5.0v 1669.55n 5.0v 1679.45n 5.0v 1679.55n 5.0v 1689.45n 5.0v 1689.55n 5.0v 1699.45n 5.0v 1699.55n 5.0v 1709.45n 5.0v 1709.55n 5.0v 1719.45n 5.0v 1719.55n 0.0v 1729.45n 0.0v 1729.55n 5.0v 1739.45n 5.0v 1739.55n 5.0v 1749.45n 5.0v 1749.55n 5.0v 1759.45n 5.0v 1759.55n 5.0v 1769.45n 5.0v 1769.55n 5.0v 1779.45n 5.0v 1779.55n 5.0v 1789.45n 5.0v 1789.55n 5.0v 1799.45n 5.0v 1799.55n 5.0v 1809.45n 5.0v 1809.55n 0.0v 1819.45n 0.0v 1819.55n 0.0v 1829.45n 0.0v 1829.55n 0.0v 1839.45n 0.0v 1839.55n 0.0v 1849.45n 0.0v 1849.55n 5.0v 1859.45n 5.0v 1859.55n 0.0v 1869.45n 0.0v 1869.55n 0.0v 1879.45n 0.0v 1879.55n 0.0v 1889.45n 0.0v 1889.55n 5.0v 1899.45n 5.0v 1899.55n 5.0v 1909.45n 5.0v 1909.55n 5.0v 1919.45n 5.0v 1919.55n 5.0v 1929.45n 5.0v 1929.55n 5.0v 1939.45n 5.0v 1939.55n 5.0v 1949.45n 5.0v 1949.55n 5.0v 1959.45n 5.0v 1959.55n 5.0v 1969.45n 5.0v 1969.55n 5.0v 1979.45n 5.0v 1979.55n 0.0v 1989.45n 0.0v 1989.55n 0.0v 1999.45n 0.0v 1999.55n 0.0v 2009.45n 0.0v 2009.55n 0.0v 2019.45n 0.0v 2019.55n 0.0v 2029.45n 0.0v 2029.55n 0.0v 2039.45n 0.0v 2039.55n 0.0v 2049.45n 0.0v 2049.55n 0.0v )
* (time, data): [(0, 0), (10, 1), (20, 0), (30, 0), (40, 0), (50, 0), (60, 1), (70, 0), (80, 1), (90, 1), (100, 1), (110, 1), (120, 1), (130, 1), (140, 1), (150, 0), (160, 0), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 1), (230, 1), (240, 1), (250, 0), (260, 0), (270, 0), (280, 0), (290, 0), (300, 0), (310, 0), (320, 0), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 0), (390, 1), (400, 0), (410, 1), (420, 0), (430, 1), (440, 1), (450, 1), (460, 1), (470, 0), (480, 0), (490, 0), (500, 0), (510, 0), (520, 0), (530, 0), (540, 1), (550, 1), (560, 1), (570, 1), (580, 1), (590, 0), (600, 1), (610, 0), (620, 0), (630, 0), (640, 1), (650, 1), (660, 1), (670, 1), (680, 1), (690, 1), (700, 1), (710, 1), (720, 0), (730, 0), (740, 1), (750, 0), (760, 0), (770, 0), (780, 1), (790, 1), (800, 1), (810, 1), (820, 0), (830, 0), (840, 0), (850, 0), (860, 0), (870, 0), (880, 0), (890, 0), (900, 0), (910, 0), (920, 0), (930, 0), (940, 0), (950, 1), (960, 1), (970, 0), (980, 0), (990, 0), (1000, 1), (1010, 1), (1020, 1), (1030, 1), (1040, 1), (1050, 1), (1060, 1), (1070, 0), (1080, 0), (1090, 0), (1100, 0), (1110, 1), (1120, 1), (1130, 1), (1140, 1), (1150, 0), (1160, 1), (1170, 1), (1180, 1), (1190, 0), (1200, 0), (1210, 0), (1220, 0), (1230, 1), (1240, 1), (1250, 1), (1260, 1), (1270, 1), (1280, 1), (1290, 1), (1300, 0), (1310, 1), (1320, 1), (1330, 0), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 1), (1390, 0), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 1), (1450, 1), (1460, 1), (1470, 1), (1480, 0), (1490, 0), (1500, 1), (1510, 0), (1520, 0), (1530, 0), (1540, 1), (1550, 1), (1560, 1), (1570, 1), (1580, 1), (1590, 0), (1600, 0), (1610, 0), (1620, 0), (1630, 0), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 1), (1700, 1), (1710, 1), (1720, 1), (1730, 1), (1740, 1), (1750, 1), (1760, 1), (1770, 0), (1780, 1), (1790, 1), (1800, 1), (1810, 1), (1820, 1), (1830, 1), (1840, 0), (1850, 1), (1860, 0), (1870, 0), (1880, 1), (1890, 1), (1900, 1), (1910, 1), (1920, 1), (1930, 1), (1940, 1), (1950, 1), (1960, 1), (1970, 0), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 0), (2030, 0), (2040, 0), (2050, 0)]
Vdin0_9  din0_9  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 5.0v 19.45n 5.0v 19.55n 0.0v 29.45n 0.0v 29.55n 0.0v 39.45n 0.0v 39.55n 0.0v 49.45n 0.0v 49.55n 0.0v 59.45n 0.0v 59.55n 5.0v 69.45n 5.0v 69.55n 0.0v 79.45n 0.0v 79.55n 5.0v 89.45n 5.0v 89.55n 5.0v 99.45n 5.0v 99.55n 5.0v 109.45n 5.0v 109.55n 5.0v 119.45n 5.0v 119.55n 5.0v 129.45n 5.0v 129.55n 5.0v 139.45n 5.0v 139.55n 5.0v 149.45n 5.0v 149.55n 0.0v 159.45n 0.0v 159.55n 0.0v 169.45n 0.0v 169.55n 0.0v 179.45n 0.0v 179.55n 0.0v 189.45n 0.0v 189.55n 0.0v 199.45n 0.0v 199.55n 0.0v 209.45n 0.0v 209.55n 0.0v 219.45n 0.0v 219.55n 5.0v 229.45n 5.0v 229.55n 5.0v 239.45n 5.0v 239.55n 5.0v 249.45n 5.0v 249.55n 0.0v 259.45n 0.0v 259.55n 0.0v 269.45n 0.0v 269.55n 0.0v 279.45n 0.0v 279.55n 0.0v 289.45n 0.0v 289.55n 0.0v 299.45n 0.0v 299.55n 0.0v 309.45n 0.0v 309.55n 0.0v 319.45n 0.0v 319.55n 0.0v 329.45n 0.0v 329.55n 0.0v 339.45n 0.0v 339.55n 0.0v 349.45n 0.0v 349.55n 0.0v 359.45n 0.0v 359.55n 0.0v 369.45n 0.0v 369.55n 0.0v 379.45n 0.0v 379.55n 0.0v 389.45n 0.0v 389.55n 5.0v 399.45n 5.0v 399.55n 0.0v 409.45n 0.0v 409.55n 5.0v 419.45n 5.0v 419.55n 0.0v 429.45n 0.0v 429.55n 5.0v 439.45n 5.0v 439.55n 5.0v 449.45n 5.0v 449.55n 5.0v 459.45n 5.0v 459.55n 5.0v 469.45n 5.0v 469.55n 0.0v 479.45n 0.0v 479.55n 0.0v 489.45n 0.0v 489.55n 0.0v 499.45n 0.0v 499.55n 0.0v 509.45n 0.0v 509.55n 0.0v 519.45n 0.0v 519.55n 0.0v 529.45n 0.0v 529.55n 0.0v 539.45n 0.0v 539.55n 5.0v 549.45n 5.0v 549.55n 5.0v 559.45n 5.0v 559.55n 5.0v 569.45n 5.0v 569.55n 5.0v 579.45n 5.0v 579.55n 5.0v 589.45n 5.0v 589.55n 0.0v 599.45n 0.0v 599.55n 5.0v 609.45n 5.0v 609.55n 0.0v 619.45n 0.0v 619.55n 0.0v 629.45n 0.0v 629.55n 0.0v 639.45n 0.0v 639.55n 5.0v 649.45n 5.0v 649.55n 5.0v 659.45n 5.0v 659.55n 5.0v 669.45n 5.0v 669.55n 5.0v 679.45n 5.0v 679.55n 5.0v 689.45n 5.0v 689.55n 5.0v 699.45n 5.0v 699.55n 5.0v 709.45n 5.0v 709.55n 5.0v 719.45n 5.0v 719.55n 0.0v 729.45n 0.0v 729.55n 0.0v 739.45n 0.0v 739.55n 5.0v 749.45n 5.0v 749.55n 0.0v 759.45n 0.0v 759.55n 0.0v 769.45n 0.0v 769.55n 0.0v 779.45n 0.0v 779.55n 5.0v 789.45n 5.0v 789.55n 5.0v 799.45n 5.0v 799.55n 5.0v 809.45n 5.0v 809.55n 5.0v 819.45n 5.0v 819.55n 0.0v 829.45n 0.0v 829.55n 0.0v 839.45n 0.0v 839.55n 0.0v 849.45n 0.0v 849.55n 0.0v 859.45n 0.0v 859.55n 0.0v 869.45n 0.0v 869.55n 0.0v 879.45n 0.0v 879.55n 0.0v 889.45n 0.0v 889.55n 0.0v 899.45n 0.0v 899.55n 0.0v 909.45n 0.0v 909.55n 0.0v 919.45n 0.0v 919.55n 0.0v 929.45n 0.0v 929.55n 0.0v 939.45n 0.0v 939.55n 0.0v 949.45n 0.0v 949.55n 5.0v 959.45n 5.0v 959.55n 5.0v 969.45n 5.0v 969.55n 0.0v 979.45n 0.0v 979.55n 0.0v 989.45n 0.0v 989.55n 0.0v 999.45n 0.0v 999.55n 5.0v 1009.45n 5.0v 1009.55n 5.0v 1019.45n 5.0v 1019.55n 5.0v 1029.45n 5.0v 1029.55n 5.0v 1039.45n 5.0v 1039.55n 5.0v 1049.45n 5.0v 1049.55n 5.0v 1059.45n 5.0v 1059.55n 5.0v 1069.45n 5.0v 1069.55n 0.0v 1079.45n 0.0v 1079.55n 0.0v 1089.45n 0.0v 1089.55n 0.0v 1099.45n 0.0v 1099.55n 0.0v 1109.45n 0.0v 1109.55n 5.0v 1119.45n 5.0v 1119.55n 5.0v 1129.45n 5.0v 1129.55n 5.0v 1139.45n 5.0v 1139.55n 5.0v 1149.45n 5.0v 1149.55n 0.0v 1159.45n 0.0v 1159.55n 5.0v 1169.45n 5.0v 1169.55n 5.0v 1179.45n 5.0v 1179.55n 5.0v 1189.45n 5.0v 1189.55n 0.0v 1199.45n 0.0v 1199.55n 0.0v 1209.45n 0.0v 1209.55n 0.0v 1219.45n 0.0v 1219.55n 0.0v 1229.45n 0.0v 1229.55n 5.0v 1239.45n 5.0v 1239.55n 5.0v 1249.45n 5.0v 1249.55n 5.0v 1259.45n 5.0v 1259.55n 5.0v 1269.45n 5.0v 1269.55n 5.0v 1279.45n 5.0v 1279.55n 5.0v 1289.45n 5.0v 1289.55n 5.0v 1299.45n 5.0v 1299.55n 0.0v 1309.45n 0.0v 1309.55n 5.0v 1319.45n 5.0v 1319.55n 5.0v 1329.45n 5.0v 1329.55n 0.0v 1339.45n 0.0v 1339.55n 0.0v 1349.45n 0.0v 1349.55n 0.0v 1359.45n 0.0v 1359.55n 0.0v 1369.45n 0.0v 1369.55n 0.0v 1379.45n 0.0v 1379.55n 5.0v 1389.45n 5.0v 1389.55n 0.0v 1399.45n 0.0v 1399.55n 0.0v 1409.45n 0.0v 1409.55n 0.0v 1419.45n 0.0v 1419.55n 0.0v 1429.45n 0.0v 1429.55n 0.0v 1439.45n 0.0v 1439.55n 5.0v 1449.45n 5.0v 1449.55n 5.0v 1459.45n 5.0v 1459.55n 5.0v 1469.45n 5.0v 1469.55n 5.0v 1479.45n 5.0v 1479.55n 0.0v 1489.45n 0.0v 1489.55n 0.0v 1499.45n 0.0v 1499.55n 5.0v 1509.45n 5.0v 1509.55n 0.0v 1519.45n 0.0v 1519.55n 0.0v 1529.45n 0.0v 1529.55n 0.0v 1539.45n 0.0v 1539.55n 5.0v 1549.45n 5.0v 1549.55n 5.0v 1559.45n 5.0v 1559.55n 5.0v 1569.45n 5.0v 1569.55n 5.0v 1579.45n 5.0v 1579.55n 5.0v 1589.45n 5.0v 1589.55n 0.0v 1599.45n 0.0v 1599.55n 0.0v 1609.45n 0.0v 1609.55n 0.0v 1619.45n 0.0v 1619.55n 0.0v 1629.45n 0.0v 1629.55n 0.0v 1639.45n 0.0v 1639.55n 5.0v 1649.45n 5.0v 1649.55n 5.0v 1659.45n 5.0v 1659.55n 5.0v 1669.45n 5.0v 1669.55n 5.0v 1679.45n 5.0v 1679.55n 5.0v 1689.45n 5.0v 1689.55n 5.0v 1699.45n 5.0v 1699.55n 5.0v 1709.45n 5.0v 1709.55n 5.0v 1719.45n 5.0v 1719.55n 5.0v 1729.45n 5.0v 1729.55n 5.0v 1739.45n 5.0v 1739.55n 5.0v 1749.45n 5.0v 1749.55n 5.0v 1759.45n 5.0v 1759.55n 5.0v 1769.45n 5.0v 1769.55n 0.0v 1779.45n 0.0v 1779.55n 5.0v 1789.45n 5.0v 1789.55n 5.0v 1799.45n 5.0v 1799.55n 5.0v 1809.45n 5.0v 1809.55n 5.0v 1819.45n 5.0v 1819.55n 5.0v 1829.45n 5.0v 1829.55n 5.0v 1839.45n 5.0v 1839.55n 0.0v 1849.45n 0.0v 1849.55n 5.0v 1859.45n 5.0v 1859.55n 0.0v 1869.45n 0.0v 1869.55n 0.0v 1879.45n 0.0v 1879.55n 5.0v 1889.45n 5.0v 1889.55n 5.0v 1899.45n 5.0v 1899.55n 5.0v 1909.45n 5.0v 1909.55n 5.0v 1919.45n 5.0v 1919.55n 5.0v 1929.45n 5.0v 1929.55n 5.0v 1939.45n 5.0v 1939.55n 5.0v 1949.45n 5.0v 1949.55n 5.0v 1959.45n 5.0v 1959.55n 5.0v 1969.45n 5.0v 1969.55n 0.0v 1979.45n 0.0v 1979.55n 0.0v 1989.45n 0.0v 1989.55n 0.0v 1999.45n 0.0v 1999.55n 0.0v 2009.45n 0.0v 2009.55n 0.0v 2019.45n 0.0v 2019.55n 0.0v 2029.45n 0.0v 2029.55n 0.0v 2039.45n 0.0v 2039.55n 0.0v 2049.45n 0.0v 2049.55n 0.0v )
* (time, data): [(0, 0), (10, 1), (20, 1), (30, 0), (40, 0), (50, 0), (60, 1), (70, 1), (80, 0), (90, 0), (100, 0), (110, 0), (120, 0), (130, 0), (140, 0), (150, 1), (160, 1), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 1), (230, 1), (240, 1), (250, 1), (260, 1), (270, 1), (280, 0), (290, 0), (300, 1), (310, 1), (320, 1), (330, 1), (340, 1), (350, 1), (360, 1), (370, 1), (380, 1), (390, 0), (400, 1), (410, 1), (420, 0), (430, 1), (440, 1), (450, 1), (460, 1), (470, 1), (480, 0), (490, 1), (500, 1), (510, 0), (520, 0), (530, 0), (540, 1), (550, 1), (560, 1), (570, 1), (580, 1), (590, 0), (600, 1), (610, 1), (620, 1), (630, 1), (640, 0), (650, 0), (660, 0), (670, 0), (680, 0), (690, 0), (700, 0), (710, 0), (720, 1), (730, 1), (740, 0), (750, 0), (760, 1), (770, 1), (780, 0), (790, 0), (800, 0), (810, 0), (820, 0), (830, 0), (840, 0), (850, 1), (860, 1), (870, 1), (880, 1), (890, 1), (900, 1), (910, 1), (920, 1), (930, 1), (940, 1), (950, 1), (960, 1), (970, 0), (980, 0), (990, 0), (1000, 1), (1010, 1), (1020, 0), (1030, 0), (1040, 0), (1050, 0), (1060, 0), (1070, 1), (1080, 0), (1090, 1), (1100, 1), (1110, 1), (1120, 0), (1130, 0), (1140, 0), (1150, 1), (1160, 0), (1170, 0), (1180, 0), (1190, 1), (1200, 1), (1210, 1), (1220, 1), (1230, 0), (1240, 0), (1250, 0), (1260, 0), (1270, 1), (1280, 1), (1290, 1), (1300, 0), (1310, 1), (1320, 1), (1330, 1), (1340, 1), (1350, 1), (1360, 1), (1370, 1), (1380, 0), (1390, 1), (1400, 1), (1410, 1), (1420, 1), (1430, 1), (1440, 0), (1450, 0), (1460, 0), (1470, 0), (1480, 1), (1490, 1), (1500, 0), (1510, 0), (1520, 1), (1530, 0), (1540, 0), (1550, 1), (1560, 0), (1570, 0), (1580, 0), (1590, 1), (1600, 1), (1610, 1), (1620, 1), (1630, 1), (1640, 0), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 0), (1700, 0), (1710, 0), (1720, 0), (1730, 1), (1740, 1), (1750, 1), (1760, 0), (1770, 1), (1780, 0), (1790, 1), (1800, 1), (1810, 1), (1820, 1), (1830, 1), (1840, 1), (1850, 1), (1860, 1), (1870, 1), (1880, 0), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 0), (1940, 0), (1950, 0), (1960, 0), (1970, 1), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 0), (2030, 1), (2040, 1), (2050, 1)]
Vdin0_10  din0_10  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 5.0v 19.45n 5.0v 19.55n 5.0v 29.45n 5.0v 29.55n 0.0v 39.45n 0.0v 39.55n 0.0v 49.45n 0.0v 49.55n 0.0v 59.45n 0.0v 59.55n 5.0v 69.45n 5.0v 69.55n 5.0v 79.45n 5.0v 79.55n 0.0v 89.45n 0.0v 89.55n 0.0v 99.45n 0.0v 99.55n 0.0v 109.45n 0.0v 109.55n 0.0v 119.45n 0.0v 119.55n 0.0v 129.45n 0.0v 129.55n 0.0v 139.45n 0.0v 139.55n 0.0v 149.45n 0.0v 149.55n 5.0v 159.45n 5.0v 159.55n 5.0v 169.45n 5.0v 169.55n 0.0v 179.45n 0.0v 179.55n 0.0v 189.45n 0.0v 189.55n 0.0v 199.45n 0.0v 199.55n 0.0v 209.45n 0.0v 209.55n 0.0v 219.45n 0.0v 219.55n 5.0v 229.45n 5.0v 229.55n 5.0v 239.45n 5.0v 239.55n 5.0v 249.45n 5.0v 249.55n 5.0v 259.45n 5.0v 259.55n 5.0v 269.45n 5.0v 269.55n 5.0v 279.45n 5.0v 279.55n 0.0v 289.45n 0.0v 289.55n 0.0v 299.45n 0.0v 299.55n 5.0v 309.45n 5.0v 309.55n 5.0v 319.45n 5.0v 319.55n 5.0v 329.45n 5.0v 329.55n 5.0v 339.45n 5.0v 339.55n 5.0v 349.45n 5.0v 349.55n 5.0v 359.45n 5.0v 359.55n 5.0v 369.45n 5.0v 369.55n 5.0v 379.45n 5.0v 379.55n 5.0v 389.45n 5.0v 389.55n 0.0v 399.45n 0.0v 399.55n 5.0v 409.45n 5.0v 409.55n 5.0v 419.45n 5.0v 419.55n 0.0v 429.45n 0.0v 429.55n 5.0v 439.45n 5.0v 439.55n 5.0v 449.45n 5.0v 449.55n 5.0v 459.45n 5.0v 459.55n 5.0v 469.45n 5.0v 469.55n 5.0v 479.45n 5.0v 479.55n 0.0v 489.45n 0.0v 489.55n 5.0v 499.45n 5.0v 499.55n 5.0v 509.45n 5.0v 509.55n 0.0v 519.45n 0.0v 519.55n 0.0v 529.45n 0.0v 529.55n 0.0v 539.45n 0.0v 539.55n 5.0v 549.45n 5.0v 549.55n 5.0v 559.45n 5.0v 559.55n 5.0v 569.45n 5.0v 569.55n 5.0v 579.45n 5.0v 579.55n 5.0v 589.45n 5.0v 589.55n 0.0v 599.45n 0.0v 599.55n 5.0v 609.45n 5.0v 609.55n 5.0v 619.45n 5.0v 619.55n 5.0v 629.45n 5.0v 629.55n 5.0v 639.45n 5.0v 639.55n 0.0v 649.45n 0.0v 649.55n 0.0v 659.45n 0.0v 659.55n 0.0v 669.45n 0.0v 669.55n 0.0v 679.45n 0.0v 679.55n 0.0v 689.45n 0.0v 689.55n 0.0v 699.45n 0.0v 699.55n 0.0v 709.45n 0.0v 709.55n 0.0v 719.45n 0.0v 719.55n 5.0v 729.45n 5.0v 729.55n 5.0v 739.45n 5.0v 739.55n 0.0v 749.45n 0.0v 749.55n 0.0v 759.45n 0.0v 759.55n 5.0v 769.45n 5.0v 769.55n 5.0v 779.45n 5.0v 779.55n 0.0v 789.45n 0.0v 789.55n 0.0v 799.45n 0.0v 799.55n 0.0v 809.45n 0.0v 809.55n 0.0v 819.45n 0.0v 819.55n 0.0v 829.45n 0.0v 829.55n 0.0v 839.45n 0.0v 839.55n 0.0v 849.45n 0.0v 849.55n 5.0v 859.45n 5.0v 859.55n 5.0v 869.45n 5.0v 869.55n 5.0v 879.45n 5.0v 879.55n 5.0v 889.45n 5.0v 889.55n 5.0v 899.45n 5.0v 899.55n 5.0v 909.45n 5.0v 909.55n 5.0v 919.45n 5.0v 919.55n 5.0v 929.45n 5.0v 929.55n 5.0v 939.45n 5.0v 939.55n 5.0v 949.45n 5.0v 949.55n 5.0v 959.45n 5.0v 959.55n 5.0v 969.45n 5.0v 969.55n 0.0v 979.45n 0.0v 979.55n 0.0v 989.45n 0.0v 989.55n 0.0v 999.45n 0.0v 999.55n 5.0v 1009.45n 5.0v 1009.55n 5.0v 1019.45n 5.0v 1019.55n 0.0v 1029.45n 0.0v 1029.55n 0.0v 1039.45n 0.0v 1039.55n 0.0v 1049.45n 0.0v 1049.55n 0.0v 1059.45n 0.0v 1059.55n 0.0v 1069.45n 0.0v 1069.55n 5.0v 1079.45n 5.0v 1079.55n 0.0v 1089.45n 0.0v 1089.55n 5.0v 1099.45n 5.0v 1099.55n 5.0v 1109.45n 5.0v 1109.55n 5.0v 1119.45n 5.0v 1119.55n 0.0v 1129.45n 0.0v 1129.55n 0.0v 1139.45n 0.0v 1139.55n 0.0v 1149.45n 0.0v 1149.55n 5.0v 1159.45n 5.0v 1159.55n 0.0v 1169.45n 0.0v 1169.55n 0.0v 1179.45n 0.0v 1179.55n 0.0v 1189.45n 0.0v 1189.55n 5.0v 1199.45n 5.0v 1199.55n 5.0v 1209.45n 5.0v 1209.55n 5.0v 1219.45n 5.0v 1219.55n 5.0v 1229.45n 5.0v 1229.55n 0.0v 1239.45n 0.0v 1239.55n 0.0v 1249.45n 0.0v 1249.55n 0.0v 1259.45n 0.0v 1259.55n 0.0v 1269.45n 0.0v 1269.55n 5.0v 1279.45n 5.0v 1279.55n 5.0v 1289.45n 5.0v 1289.55n 5.0v 1299.45n 5.0v 1299.55n 0.0v 1309.45n 0.0v 1309.55n 5.0v 1319.45n 5.0v 1319.55n 5.0v 1329.45n 5.0v 1329.55n 5.0v 1339.45n 5.0v 1339.55n 5.0v 1349.45n 5.0v 1349.55n 5.0v 1359.45n 5.0v 1359.55n 5.0v 1369.45n 5.0v 1369.55n 5.0v 1379.45n 5.0v 1379.55n 0.0v 1389.45n 0.0v 1389.55n 5.0v 1399.45n 5.0v 1399.55n 5.0v 1409.45n 5.0v 1409.55n 5.0v 1419.45n 5.0v 1419.55n 5.0v 1429.45n 5.0v 1429.55n 5.0v 1439.45n 5.0v 1439.55n 0.0v 1449.45n 0.0v 1449.55n 0.0v 1459.45n 0.0v 1459.55n 0.0v 1469.45n 0.0v 1469.55n 0.0v 1479.45n 0.0v 1479.55n 5.0v 1489.45n 5.0v 1489.55n 5.0v 1499.45n 5.0v 1499.55n 0.0v 1509.45n 0.0v 1509.55n 0.0v 1519.45n 0.0v 1519.55n 5.0v 1529.45n 5.0v 1529.55n 0.0v 1539.45n 0.0v 1539.55n 0.0v 1549.45n 0.0v 1549.55n 5.0v 1559.45n 5.0v 1559.55n 0.0v 1569.45n 0.0v 1569.55n 0.0v 1579.45n 0.0v 1579.55n 0.0v 1589.45n 0.0v 1589.55n 5.0v 1599.45n 5.0v 1599.55n 5.0v 1609.45n 5.0v 1609.55n 5.0v 1619.45n 5.0v 1619.55n 5.0v 1629.45n 5.0v 1629.55n 5.0v 1639.45n 5.0v 1639.55n 0.0v 1649.45n 0.0v 1649.55n 0.0v 1659.45n 0.0v 1659.55n 0.0v 1669.45n 0.0v 1669.55n 0.0v 1679.45n 0.0v 1679.55n 0.0v 1689.45n 0.0v 1689.55n 0.0v 1699.45n 0.0v 1699.55n 0.0v 1709.45n 0.0v 1709.55n 0.0v 1719.45n 0.0v 1719.55n 0.0v 1729.45n 0.0v 1729.55n 5.0v 1739.45n 5.0v 1739.55n 5.0v 1749.45n 5.0v 1749.55n 5.0v 1759.45n 5.0v 1759.55n 0.0v 1769.45n 0.0v 1769.55n 5.0v 1779.45n 5.0v 1779.55n 0.0v 1789.45n 0.0v 1789.55n 5.0v 1799.45n 5.0v 1799.55n 5.0v 1809.45n 5.0v 1809.55n 5.0v 1819.45n 5.0v 1819.55n 5.0v 1829.45n 5.0v 1829.55n 5.0v 1839.45n 5.0v 1839.55n 5.0v 1849.45n 5.0v 1849.55n 5.0v 1859.45n 5.0v 1859.55n 5.0v 1869.45n 5.0v 1869.55n 5.0v 1879.45n 5.0v 1879.55n 0.0v 1889.45n 0.0v 1889.55n 0.0v 1899.45n 0.0v 1899.55n 0.0v 1909.45n 0.0v 1909.55n 0.0v 1919.45n 0.0v 1919.55n 0.0v 1929.45n 0.0v 1929.55n 0.0v 1939.45n 0.0v 1939.55n 0.0v 1949.45n 0.0v 1949.55n 0.0v 1959.45n 0.0v 1959.55n 0.0v 1969.45n 0.0v 1969.55n 5.0v 1979.45n 5.0v 1979.55n 0.0v 1989.45n 0.0v 1989.55n 0.0v 1999.45n 0.0v 1999.55n 0.0v 2009.45n 0.0v 2009.55n 0.0v 2019.45n 0.0v 2019.55n 0.0v 2029.45n 0.0v 2029.55n 5.0v 2039.45n 5.0v 2039.55n 5.0v 2049.45n 5.0v 2049.55n 5.0v )
* (time, data): [(0, 0), (10, 1), (20, 1), (30, 0), (40, 0), (50, 1), (60, 1), (70, 0), (80, 0), (90, 0), (100, 0), (110, 0), (120, 0), (130, 0), (140, 0), (150, 1), (160, 0), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 0), (230, 0), (240, 0), (250, 0), (260, 0), (270, 0), (280, 0), (290, 0), (300, 1), (310, 1), (320, 1), (330, 1), (340, 1), (350, 1), (360, 1), (370, 1), (380, 1), (390, 0), (400, 1), (410, 1), (420, 0), (430, 1), (440, 1), (450, 0), (460, 0), (470, 0), (480, 1), (490, 1), (500, 1), (510, 1), (520, 1), (530, 0), (540, 1), (550, 1), (560, 1), (570, 1), (580, 1), (590, 1), (600, 1), (610, 0), (620, 0), (630, 0), (640, 0), (650, 0), (660, 1), (670, 0), (680, 0), (690, 0), (700, 0), (710, 0), (720, 0), (730, 0), (740, 0), (750, 0), (760, 1), (770, 1), (780, 1), (790, 1), (800, 1), (810, 1), (820, 0), (830, 0), (840, 0), (850, 1), (860, 1), (870, 1), (880, 1), (890, 1), (900, 1), (910, 1), (920, 1), (930, 1), (940, 1), (950, 1), (960, 1), (970, 0), (980, 0), (990, 0), (1000, 0), (1010, 0), (1020, 1), (1030, 1), (1040, 1), (1050, 1), (1060, 1), (1070, 1), (1080, 0), (1090, 1), (1100, 1), (1110, 0), (1120, 1), (1130, 1), (1140, 1), (1150, 1), (1160, 0), (1170, 0), (1180, 0), (1190, 0), (1200, 0), (1210, 0), (1220, 0), (1230, 0), (1240, 0), (1250, 0), (1260, 0), (1270, 0), (1280, 1), (1290, 1), (1300, 1), (1310, 0), (1320, 1), (1330, 1), (1340, 1), (1350, 1), (1360, 1), (1370, 1), (1380, 1), (1390, 1), (1400, 1), (1410, 1), (1420, 1), (1430, 1), (1440, 1), (1450, 1), (1460, 1), (1470, 1), (1480, 1), (1490, 1), (1500, 0), (1510, 0), (1520, 1), (1530, 1), (1540, 1), (1550, 0), (1560, 1), (1570, 1), (1580, 1), (1590, 1), (1600, 1), (1610, 1), (1620, 1), (1630, 1), (1640, 0), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 0), (1700, 0), (1710, 0), (1720, 1), (1730, 1), (1740, 1), (1750, 1), (1760, 1), (1770, 1), (1780, 1), (1790, 1), (1800, 1), (1810, 0), (1820, 0), (1830, 0), (1840, 1), (1850, 1), (1860, 0), (1870, 0), (1880, 1), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 1), (1940, 1), (1950, 1), (1960, 1), (1970, 1), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 0), (2030, 0), (2040, 0), (2050, 0)]
Vdin0_11  din0_11  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 5.0v 19.45n 5.0v 19.55n 5.0v 29.45n 5.0v 29.55n 0.0v 39.45n 0.0v 39.55n 0.0v 49.45n 0.0v 49.55n 5.0v 59.45n 5.0v 59.55n 5.0v 69.45n 5.0v 69.55n 0.0v 79.45n 0.0v 79.55n 0.0v 89.45n 0.0v 89.55n 0.0v 99.45n 0.0v 99.55n 0.0v 109.45n 0.0v 109.55n 0.0v 119.45n 0.0v 119.55n 0.0v 129.45n 0.0v 129.55n 0.0v 139.45n 0.0v 139.55n 0.0v 149.45n 0.0v 149.55n 5.0v 159.45n 5.0v 159.55n 0.0v 169.45n 0.0v 169.55n 0.0v 179.45n 0.0v 179.55n 0.0v 189.45n 0.0v 189.55n 0.0v 199.45n 0.0v 199.55n 0.0v 209.45n 0.0v 209.55n 0.0v 219.45n 0.0v 219.55n 0.0v 229.45n 0.0v 229.55n 0.0v 239.45n 0.0v 239.55n 0.0v 249.45n 0.0v 249.55n 0.0v 259.45n 0.0v 259.55n 0.0v 269.45n 0.0v 269.55n 0.0v 279.45n 0.0v 279.55n 0.0v 289.45n 0.0v 289.55n 0.0v 299.45n 0.0v 299.55n 5.0v 309.45n 5.0v 309.55n 5.0v 319.45n 5.0v 319.55n 5.0v 329.45n 5.0v 329.55n 5.0v 339.45n 5.0v 339.55n 5.0v 349.45n 5.0v 349.55n 5.0v 359.45n 5.0v 359.55n 5.0v 369.45n 5.0v 369.55n 5.0v 379.45n 5.0v 379.55n 5.0v 389.45n 5.0v 389.55n 0.0v 399.45n 0.0v 399.55n 5.0v 409.45n 5.0v 409.55n 5.0v 419.45n 5.0v 419.55n 0.0v 429.45n 0.0v 429.55n 5.0v 439.45n 5.0v 439.55n 5.0v 449.45n 5.0v 449.55n 0.0v 459.45n 0.0v 459.55n 0.0v 469.45n 0.0v 469.55n 0.0v 479.45n 0.0v 479.55n 5.0v 489.45n 5.0v 489.55n 5.0v 499.45n 5.0v 499.55n 5.0v 509.45n 5.0v 509.55n 5.0v 519.45n 5.0v 519.55n 5.0v 529.45n 5.0v 529.55n 0.0v 539.45n 0.0v 539.55n 5.0v 549.45n 5.0v 549.55n 5.0v 559.45n 5.0v 559.55n 5.0v 569.45n 5.0v 569.55n 5.0v 579.45n 5.0v 579.55n 5.0v 589.45n 5.0v 589.55n 5.0v 599.45n 5.0v 599.55n 5.0v 609.45n 5.0v 609.55n 0.0v 619.45n 0.0v 619.55n 0.0v 629.45n 0.0v 629.55n 0.0v 639.45n 0.0v 639.55n 0.0v 649.45n 0.0v 649.55n 0.0v 659.45n 0.0v 659.55n 5.0v 669.45n 5.0v 669.55n 0.0v 679.45n 0.0v 679.55n 0.0v 689.45n 0.0v 689.55n 0.0v 699.45n 0.0v 699.55n 0.0v 709.45n 0.0v 709.55n 0.0v 719.45n 0.0v 719.55n 0.0v 729.45n 0.0v 729.55n 0.0v 739.45n 0.0v 739.55n 0.0v 749.45n 0.0v 749.55n 0.0v 759.45n 0.0v 759.55n 5.0v 769.45n 5.0v 769.55n 5.0v 779.45n 5.0v 779.55n 5.0v 789.45n 5.0v 789.55n 5.0v 799.45n 5.0v 799.55n 5.0v 809.45n 5.0v 809.55n 5.0v 819.45n 5.0v 819.55n 0.0v 829.45n 0.0v 829.55n 0.0v 839.45n 0.0v 839.55n 0.0v 849.45n 0.0v 849.55n 5.0v 859.45n 5.0v 859.55n 5.0v 869.45n 5.0v 869.55n 5.0v 879.45n 5.0v 879.55n 5.0v 889.45n 5.0v 889.55n 5.0v 899.45n 5.0v 899.55n 5.0v 909.45n 5.0v 909.55n 5.0v 919.45n 5.0v 919.55n 5.0v 929.45n 5.0v 929.55n 5.0v 939.45n 5.0v 939.55n 5.0v 949.45n 5.0v 949.55n 5.0v 959.45n 5.0v 959.55n 5.0v 969.45n 5.0v 969.55n 0.0v 979.45n 0.0v 979.55n 0.0v 989.45n 0.0v 989.55n 0.0v 999.45n 0.0v 999.55n 0.0v 1009.45n 0.0v 1009.55n 0.0v 1019.45n 0.0v 1019.55n 5.0v 1029.45n 5.0v 1029.55n 5.0v 1039.45n 5.0v 1039.55n 5.0v 1049.45n 5.0v 1049.55n 5.0v 1059.45n 5.0v 1059.55n 5.0v 1069.45n 5.0v 1069.55n 5.0v 1079.45n 5.0v 1079.55n 0.0v 1089.45n 0.0v 1089.55n 5.0v 1099.45n 5.0v 1099.55n 5.0v 1109.45n 5.0v 1109.55n 0.0v 1119.45n 0.0v 1119.55n 5.0v 1129.45n 5.0v 1129.55n 5.0v 1139.45n 5.0v 1139.55n 5.0v 1149.45n 5.0v 1149.55n 5.0v 1159.45n 5.0v 1159.55n 0.0v 1169.45n 0.0v 1169.55n 0.0v 1179.45n 0.0v 1179.55n 0.0v 1189.45n 0.0v 1189.55n 0.0v 1199.45n 0.0v 1199.55n 0.0v 1209.45n 0.0v 1209.55n 0.0v 1219.45n 0.0v 1219.55n 0.0v 1229.45n 0.0v 1229.55n 0.0v 1239.45n 0.0v 1239.55n 0.0v 1249.45n 0.0v 1249.55n 0.0v 1259.45n 0.0v 1259.55n 0.0v 1269.45n 0.0v 1269.55n 0.0v 1279.45n 0.0v 1279.55n 5.0v 1289.45n 5.0v 1289.55n 5.0v 1299.45n 5.0v 1299.55n 5.0v 1309.45n 5.0v 1309.55n 0.0v 1319.45n 0.0v 1319.55n 5.0v 1329.45n 5.0v 1329.55n 5.0v 1339.45n 5.0v 1339.55n 5.0v 1349.45n 5.0v 1349.55n 5.0v 1359.45n 5.0v 1359.55n 5.0v 1369.45n 5.0v 1369.55n 5.0v 1379.45n 5.0v 1379.55n 5.0v 1389.45n 5.0v 1389.55n 5.0v 1399.45n 5.0v 1399.55n 5.0v 1409.45n 5.0v 1409.55n 5.0v 1419.45n 5.0v 1419.55n 5.0v 1429.45n 5.0v 1429.55n 5.0v 1439.45n 5.0v 1439.55n 5.0v 1449.45n 5.0v 1449.55n 5.0v 1459.45n 5.0v 1459.55n 5.0v 1469.45n 5.0v 1469.55n 5.0v 1479.45n 5.0v 1479.55n 5.0v 1489.45n 5.0v 1489.55n 5.0v 1499.45n 5.0v 1499.55n 0.0v 1509.45n 0.0v 1509.55n 0.0v 1519.45n 0.0v 1519.55n 5.0v 1529.45n 5.0v 1529.55n 5.0v 1539.45n 5.0v 1539.55n 5.0v 1549.45n 5.0v 1549.55n 0.0v 1559.45n 0.0v 1559.55n 5.0v 1569.45n 5.0v 1569.55n 5.0v 1579.45n 5.0v 1579.55n 5.0v 1589.45n 5.0v 1589.55n 5.0v 1599.45n 5.0v 1599.55n 5.0v 1609.45n 5.0v 1609.55n 5.0v 1619.45n 5.0v 1619.55n 5.0v 1629.45n 5.0v 1629.55n 5.0v 1639.45n 5.0v 1639.55n 0.0v 1649.45n 0.0v 1649.55n 0.0v 1659.45n 0.0v 1659.55n 0.0v 1669.45n 0.0v 1669.55n 0.0v 1679.45n 0.0v 1679.55n 0.0v 1689.45n 0.0v 1689.55n 0.0v 1699.45n 0.0v 1699.55n 0.0v 1709.45n 0.0v 1709.55n 0.0v 1719.45n 0.0v 1719.55n 5.0v 1729.45n 5.0v 1729.55n 5.0v 1739.45n 5.0v 1739.55n 5.0v 1749.45n 5.0v 1749.55n 5.0v 1759.45n 5.0v 1759.55n 5.0v 1769.45n 5.0v 1769.55n 5.0v 1779.45n 5.0v 1779.55n 5.0v 1789.45n 5.0v 1789.55n 5.0v 1799.45n 5.0v 1799.55n 5.0v 1809.45n 5.0v 1809.55n 0.0v 1819.45n 0.0v 1819.55n 0.0v 1829.45n 0.0v 1829.55n 0.0v 1839.45n 0.0v 1839.55n 5.0v 1849.45n 5.0v 1849.55n 5.0v 1859.45n 5.0v 1859.55n 0.0v 1869.45n 0.0v 1869.55n 0.0v 1879.45n 0.0v 1879.55n 5.0v 1889.45n 5.0v 1889.55n 0.0v 1899.45n 0.0v 1899.55n 0.0v 1909.45n 0.0v 1909.55n 0.0v 1919.45n 0.0v 1919.55n 0.0v 1929.45n 0.0v 1929.55n 5.0v 1939.45n 5.0v 1939.55n 5.0v 1949.45n 5.0v 1949.55n 5.0v 1959.45n 5.0v 1959.55n 5.0v 1969.45n 5.0v 1969.55n 5.0v 1979.45n 5.0v 1979.55n 0.0v 1989.45n 0.0v 1989.55n 0.0v 1999.45n 0.0v 1999.55n 0.0v 2009.45n 0.0v 2009.55n 0.0v 2019.45n 0.0v 2019.55n 0.0v 2029.45n 0.0v 2029.55n 0.0v 2039.45n 0.0v 2039.55n 0.0v 2049.45n 0.0v 2049.55n 0.0v )
* (time, data): [(0, 0), (10, 1), (20, 1), (30, 0), (40, 0), (50, 1), (60, 1), (70, 1), (80, 1), (90, 1), (100, 1), (110, 1), (120, 1), (130, 1), (140, 1), (150, 0), (160, 0), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 1), (230, 1), (240, 1), (250, 1), (260, 1), (270, 1), (280, 1), (290, 1), (300, 0), (310, 0), (320, 0), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 0), (390, 1), (400, 1), (410, 0), (420, 1), (430, 1), (440, 1), (450, 1), (460, 1), (470, 1), (480, 0), (490, 0), (500, 0), (510, 1), (520, 1), (530, 0), (540, 1), (550, 1), (560, 1), (570, 1), (580, 1), (590, 1), (600, 0), (610, 0), (620, 0), (630, 0), (640, 0), (650, 0), (660, 0), (670, 1), (680, 0), (690, 0), (700, 0), (710, 0), (720, 1), (730, 1), (740, 0), (750, 1), (760, 0), (770, 0), (780, 1), (790, 1), (800, 1), (810, 1), (820, 1), (830, 1), (840, 1), (850, 1), (860, 1), (870, 1), (880, 1), (890, 1), (900, 1), (910, 1), (920, 1), (930, 1), (940, 1), (950, 1), (960, 1), (970, 0), (980, 0), (990, 0), (1000, 1), (1010, 1), (1020, 1), (1030, 1), (1040, 1), (1050, 1), (1060, 1), (1070, 1), (1080, 1), (1090, 0), (1100, 0), (1110, 1), (1120, 0), (1130, 0), (1140, 0), (1150, 1), (1160, 0), (1170, 0), (1180, 0), (1190, 1), (1200, 0), (1210, 0), (1220, 0), (1230, 0), (1240, 0), (1250, 0), (1260, 0), (1270, 0), (1280, 1), (1290, 1), (1300, 0), (1310, 0), (1320, 0), (1330, 1), (1340, 1), (1350, 1), (1360, 1), (1370, 1), (1380, 0), (1390, 0), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 0), (1450, 0), (1460, 0), (1470, 0), (1480, 1), (1490, 1), (1500, 1), (1510, 1), (1520, 1), (1530, 1), (1540, 0), (1550, 1), (1560, 0), (1570, 0), (1580, 0), (1590, 0), (1600, 0), (1610, 0), (1620, 0), (1630, 0), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 1), (1700, 1), (1710, 1), (1720, 0), (1730, 1), (1740, 1), (1750, 1), (1760, 1), (1770, 1), (1780, 0), (1790, 0), (1800, 0), (1810, 1), (1820, 1), (1830, 1), (1840, 0), (1850, 0), (1860, 1), (1870, 1), (1880, 1), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 1), (1940, 1), (1950, 1), (1960, 1), (1970, 1), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 0), (2030, 1), (2040, 1), (2050, 1)]
Vdin0_12  din0_12  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 5.0v 19.45n 5.0v 19.55n 5.0v 29.45n 5.0v 29.55n 0.0v 39.45n 0.0v 39.55n 0.0v 49.45n 0.0v 49.55n 5.0v 59.45n 5.0v 59.55n 5.0v 69.45n 5.0v 69.55n 5.0v 79.45n 5.0v 79.55n 5.0v 89.45n 5.0v 89.55n 5.0v 99.45n 5.0v 99.55n 5.0v 109.45n 5.0v 109.55n 5.0v 119.45n 5.0v 119.55n 5.0v 129.45n 5.0v 129.55n 5.0v 139.45n 5.0v 139.55n 5.0v 149.45n 5.0v 149.55n 0.0v 159.45n 0.0v 159.55n 0.0v 169.45n 0.0v 169.55n 0.0v 179.45n 0.0v 179.55n 0.0v 189.45n 0.0v 189.55n 0.0v 199.45n 0.0v 199.55n 0.0v 209.45n 0.0v 209.55n 0.0v 219.45n 0.0v 219.55n 5.0v 229.45n 5.0v 229.55n 5.0v 239.45n 5.0v 239.55n 5.0v 249.45n 5.0v 249.55n 5.0v 259.45n 5.0v 259.55n 5.0v 269.45n 5.0v 269.55n 5.0v 279.45n 5.0v 279.55n 5.0v 289.45n 5.0v 289.55n 5.0v 299.45n 5.0v 299.55n 0.0v 309.45n 0.0v 309.55n 0.0v 319.45n 0.0v 319.55n 0.0v 329.45n 0.0v 329.55n 0.0v 339.45n 0.0v 339.55n 0.0v 349.45n 0.0v 349.55n 0.0v 359.45n 0.0v 359.55n 0.0v 369.45n 0.0v 369.55n 0.0v 379.45n 0.0v 379.55n 0.0v 389.45n 0.0v 389.55n 5.0v 399.45n 5.0v 399.55n 5.0v 409.45n 5.0v 409.55n 0.0v 419.45n 0.0v 419.55n 5.0v 429.45n 5.0v 429.55n 5.0v 439.45n 5.0v 439.55n 5.0v 449.45n 5.0v 449.55n 5.0v 459.45n 5.0v 459.55n 5.0v 469.45n 5.0v 469.55n 5.0v 479.45n 5.0v 479.55n 0.0v 489.45n 0.0v 489.55n 0.0v 499.45n 0.0v 499.55n 0.0v 509.45n 0.0v 509.55n 5.0v 519.45n 5.0v 519.55n 5.0v 529.45n 5.0v 529.55n 0.0v 539.45n 0.0v 539.55n 5.0v 549.45n 5.0v 549.55n 5.0v 559.45n 5.0v 559.55n 5.0v 569.45n 5.0v 569.55n 5.0v 579.45n 5.0v 579.55n 5.0v 589.45n 5.0v 589.55n 5.0v 599.45n 5.0v 599.55n 0.0v 609.45n 0.0v 609.55n 0.0v 619.45n 0.0v 619.55n 0.0v 629.45n 0.0v 629.55n 0.0v 639.45n 0.0v 639.55n 0.0v 649.45n 0.0v 649.55n 0.0v 659.45n 0.0v 659.55n 0.0v 669.45n 0.0v 669.55n 5.0v 679.45n 5.0v 679.55n 0.0v 689.45n 0.0v 689.55n 0.0v 699.45n 0.0v 699.55n 0.0v 709.45n 0.0v 709.55n 0.0v 719.45n 0.0v 719.55n 5.0v 729.45n 5.0v 729.55n 5.0v 739.45n 5.0v 739.55n 0.0v 749.45n 0.0v 749.55n 5.0v 759.45n 5.0v 759.55n 0.0v 769.45n 0.0v 769.55n 0.0v 779.45n 0.0v 779.55n 5.0v 789.45n 5.0v 789.55n 5.0v 799.45n 5.0v 799.55n 5.0v 809.45n 5.0v 809.55n 5.0v 819.45n 5.0v 819.55n 5.0v 829.45n 5.0v 829.55n 5.0v 839.45n 5.0v 839.55n 5.0v 849.45n 5.0v 849.55n 5.0v 859.45n 5.0v 859.55n 5.0v 869.45n 5.0v 869.55n 5.0v 879.45n 5.0v 879.55n 5.0v 889.45n 5.0v 889.55n 5.0v 899.45n 5.0v 899.55n 5.0v 909.45n 5.0v 909.55n 5.0v 919.45n 5.0v 919.55n 5.0v 929.45n 5.0v 929.55n 5.0v 939.45n 5.0v 939.55n 5.0v 949.45n 5.0v 949.55n 5.0v 959.45n 5.0v 959.55n 5.0v 969.45n 5.0v 969.55n 0.0v 979.45n 0.0v 979.55n 0.0v 989.45n 0.0v 989.55n 0.0v 999.45n 0.0v 999.55n 5.0v 1009.45n 5.0v 1009.55n 5.0v 1019.45n 5.0v 1019.55n 5.0v 1029.45n 5.0v 1029.55n 5.0v 1039.45n 5.0v 1039.55n 5.0v 1049.45n 5.0v 1049.55n 5.0v 1059.45n 5.0v 1059.55n 5.0v 1069.45n 5.0v 1069.55n 5.0v 1079.45n 5.0v 1079.55n 5.0v 1089.45n 5.0v 1089.55n 0.0v 1099.45n 0.0v 1099.55n 0.0v 1109.45n 0.0v 1109.55n 5.0v 1119.45n 5.0v 1119.55n 0.0v 1129.45n 0.0v 1129.55n 0.0v 1139.45n 0.0v 1139.55n 0.0v 1149.45n 0.0v 1149.55n 5.0v 1159.45n 5.0v 1159.55n 0.0v 1169.45n 0.0v 1169.55n 0.0v 1179.45n 0.0v 1179.55n 0.0v 1189.45n 0.0v 1189.55n 5.0v 1199.45n 5.0v 1199.55n 0.0v 1209.45n 0.0v 1209.55n 0.0v 1219.45n 0.0v 1219.55n 0.0v 1229.45n 0.0v 1229.55n 0.0v 1239.45n 0.0v 1239.55n 0.0v 1249.45n 0.0v 1249.55n 0.0v 1259.45n 0.0v 1259.55n 0.0v 1269.45n 0.0v 1269.55n 0.0v 1279.45n 0.0v 1279.55n 5.0v 1289.45n 5.0v 1289.55n 5.0v 1299.45n 5.0v 1299.55n 0.0v 1309.45n 0.0v 1309.55n 0.0v 1319.45n 0.0v 1319.55n 0.0v 1329.45n 0.0v 1329.55n 5.0v 1339.45n 5.0v 1339.55n 5.0v 1349.45n 5.0v 1349.55n 5.0v 1359.45n 5.0v 1359.55n 5.0v 1369.45n 5.0v 1369.55n 5.0v 1379.45n 5.0v 1379.55n 0.0v 1389.45n 0.0v 1389.55n 0.0v 1399.45n 0.0v 1399.55n 0.0v 1409.45n 0.0v 1409.55n 0.0v 1419.45n 0.0v 1419.55n 0.0v 1429.45n 0.0v 1429.55n 0.0v 1439.45n 0.0v 1439.55n 0.0v 1449.45n 0.0v 1449.55n 0.0v 1459.45n 0.0v 1459.55n 0.0v 1469.45n 0.0v 1469.55n 0.0v 1479.45n 0.0v 1479.55n 5.0v 1489.45n 5.0v 1489.55n 5.0v 1499.45n 5.0v 1499.55n 5.0v 1509.45n 5.0v 1509.55n 5.0v 1519.45n 5.0v 1519.55n 5.0v 1529.45n 5.0v 1529.55n 5.0v 1539.45n 5.0v 1539.55n 0.0v 1549.45n 0.0v 1549.55n 5.0v 1559.45n 5.0v 1559.55n 0.0v 1569.45n 0.0v 1569.55n 0.0v 1579.45n 0.0v 1579.55n 0.0v 1589.45n 0.0v 1589.55n 0.0v 1599.45n 0.0v 1599.55n 0.0v 1609.45n 0.0v 1609.55n 0.0v 1619.45n 0.0v 1619.55n 0.0v 1629.45n 0.0v 1629.55n 0.0v 1639.45n 0.0v 1639.55n 5.0v 1649.45n 5.0v 1649.55n 5.0v 1659.45n 5.0v 1659.55n 5.0v 1669.45n 5.0v 1669.55n 5.0v 1679.45n 5.0v 1679.55n 5.0v 1689.45n 5.0v 1689.55n 5.0v 1699.45n 5.0v 1699.55n 5.0v 1709.45n 5.0v 1709.55n 5.0v 1719.45n 5.0v 1719.55n 0.0v 1729.45n 0.0v 1729.55n 5.0v 1739.45n 5.0v 1739.55n 5.0v 1749.45n 5.0v 1749.55n 5.0v 1759.45n 5.0v 1759.55n 5.0v 1769.45n 5.0v 1769.55n 5.0v 1779.45n 5.0v 1779.55n 0.0v 1789.45n 0.0v 1789.55n 0.0v 1799.45n 0.0v 1799.55n 0.0v 1809.45n 0.0v 1809.55n 5.0v 1819.45n 5.0v 1819.55n 5.0v 1829.45n 5.0v 1829.55n 5.0v 1839.45n 5.0v 1839.55n 0.0v 1849.45n 0.0v 1849.55n 0.0v 1859.45n 0.0v 1859.55n 5.0v 1869.45n 5.0v 1869.55n 5.0v 1879.45n 5.0v 1879.55n 5.0v 1889.45n 5.0v 1889.55n 0.0v 1899.45n 0.0v 1899.55n 0.0v 1909.45n 0.0v 1909.55n 0.0v 1919.45n 0.0v 1919.55n 0.0v 1929.45n 0.0v 1929.55n 5.0v 1939.45n 5.0v 1939.55n 5.0v 1949.45n 5.0v 1949.55n 5.0v 1959.45n 5.0v 1959.55n 5.0v 1969.45n 5.0v 1969.55n 5.0v 1979.45n 5.0v 1979.55n 0.0v 1989.45n 0.0v 1989.55n 0.0v 1999.45n 0.0v 1999.55n 0.0v 2009.45n 0.0v 2009.55n 0.0v 2019.45n 0.0v 2019.55n 0.0v 2029.45n 0.0v 2029.55n 5.0v 2039.45n 5.0v 2039.55n 5.0v 2049.45n 5.0v 2049.55n 5.0v )
* (time, data): [(0, 0), (10, 0), (20, 1), (30, 0), (40, 0), (50, 0), (60, 1), (70, 0), (80, 1), (90, 1), (100, 1), (110, 1), (120, 1), (130, 0), (140, 0), (150, 1), (160, 0), (170, 1), (180, 1), (190, 1), (200, 1), (210, 1), (220, 1), (230, 1), (240, 1), (250, 0), (260, 0), (270, 0), (280, 1), (290, 1), (300, 1), (310, 1), (320, 1), (330, 1), (340, 1), (350, 1), (360, 1), (370, 1), (380, 1), (390, 1), (400, 1), (410, 1), (420, 0), (430, 0), (440, 0), (450, 0), (460, 0), (470, 1), (480, 0), (490, 0), (500, 0), (510, 0), (520, 0), (530, 1), (540, 0), (550, 0), (560, 0), (570, 0), (580, 0), (590, 1), (600, 0), (610, 1), (620, 1), (630, 1), (640, 1), (650, 1), (660, 1), (670, 1), (680, 0), (690, 0), (700, 0), (710, 0), (720, 1), (730, 1), (740, 1), (750, 0), (760, 1), (770, 1), (780, 0), (790, 0), (800, 0), (810, 0), (820, 0), (830, 0), (840, 0), (850, 1), (860, 1), (870, 1), (880, 1), (890, 1), (900, 1), (910, 0), (920, 0), (930, 0), (940, 0), (950, 0), (960, 0), (970, 1), (980, 1), (990, 1), (1000, 1), (1010, 1), (1020, 0), (1030, 0), (1040, 0), (1050, 0), (1060, 0), (1070, 1), (1080, 1), (1090, 1), (1100, 1), (1110, 1), (1120, 0), (1130, 0), (1140, 0), (1150, 0), (1160, 0), (1170, 0), (1180, 0), (1190, 1), (1200, 1), (1210, 1), (1220, 1), (1230, 1), (1240, 1), (1250, 1), (1260, 1), (1270, 1), (1280, 1), (1290, 1), (1300, 1), (1310, 1), (1320, 1), (1330, 0), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 0), (1390, 1), (1400, 1), (1410, 1), (1420, 1), (1430, 1), (1440, 1), (1450, 1), (1460, 1), (1470, 1), (1480, 0), (1490, 0), (1500, 1), (1510, 1), (1520, 1), (1530, 0), (1540, 1), (1550, 0), (1560, 0), (1570, 0), (1580, 0), (1590, 0), (1600, 0), (1610, 0), (1620, 0), (1630, 0), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 1), (1700, 1), (1710, 1), (1720, 1), (1730, 1), (1740, 1), (1750, 1), (1760, 0), (1770, 1), (1780, 1), (1790, 0), (1800, 0), (1810, 0), (1820, 0), (1830, 0), (1840, 0), (1850, 0), (1860, 0), (1870, 0), (1880, 1), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 0), (1940, 0), (1950, 0), (1960, 0), (1970, 1), (1980, 1), (1990, 1), (2000, 1), (2010, 1), (2020, 1), (2030, 1), (2040, 1), (2050, 1)]
Vdin0_13  din0_13  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 0.0v 19.45n 0.0v 19.55n 5.0v 29.45n 5.0v 29.55n 0.0v 39.45n 0.0v 39.55n 0.0v 49.45n 0.0v 49.55n 0.0v 59.45n 0.0v 59.55n 5.0v 69.45n 5.0v 69.55n 0.0v 79.45n 0.0v 79.55n 5.0v 89.45n 5.0v 89.55n 5.0v 99.45n 5.0v 99.55n 5.0v 109.45n 5.0v 109.55n 5.0v 119.45n 5.0v 119.55n 5.0v 129.45n 5.0v 129.55n 0.0v 139.45n 0.0v 139.55n 0.0v 149.45n 0.0v 149.55n 5.0v 159.45n 5.0v 159.55n 0.0v 169.45n 0.0v 169.55n 5.0v 179.45n 5.0v 179.55n 5.0v 189.45n 5.0v 189.55n 5.0v 199.45n 5.0v 199.55n 5.0v 209.45n 5.0v 209.55n 5.0v 219.45n 5.0v 219.55n 5.0v 229.45n 5.0v 229.55n 5.0v 239.45n 5.0v 239.55n 5.0v 249.45n 5.0v 249.55n 0.0v 259.45n 0.0v 259.55n 0.0v 269.45n 0.0v 269.55n 0.0v 279.45n 0.0v 279.55n 5.0v 289.45n 5.0v 289.55n 5.0v 299.45n 5.0v 299.55n 5.0v 309.45n 5.0v 309.55n 5.0v 319.45n 5.0v 319.55n 5.0v 329.45n 5.0v 329.55n 5.0v 339.45n 5.0v 339.55n 5.0v 349.45n 5.0v 349.55n 5.0v 359.45n 5.0v 359.55n 5.0v 369.45n 5.0v 369.55n 5.0v 379.45n 5.0v 379.55n 5.0v 389.45n 5.0v 389.55n 5.0v 399.45n 5.0v 399.55n 5.0v 409.45n 5.0v 409.55n 5.0v 419.45n 5.0v 419.55n 0.0v 429.45n 0.0v 429.55n 0.0v 439.45n 0.0v 439.55n 0.0v 449.45n 0.0v 449.55n 0.0v 459.45n 0.0v 459.55n 0.0v 469.45n 0.0v 469.55n 5.0v 479.45n 5.0v 479.55n 0.0v 489.45n 0.0v 489.55n 0.0v 499.45n 0.0v 499.55n 0.0v 509.45n 0.0v 509.55n 0.0v 519.45n 0.0v 519.55n 0.0v 529.45n 0.0v 529.55n 5.0v 539.45n 5.0v 539.55n 0.0v 549.45n 0.0v 549.55n 0.0v 559.45n 0.0v 559.55n 0.0v 569.45n 0.0v 569.55n 0.0v 579.45n 0.0v 579.55n 0.0v 589.45n 0.0v 589.55n 5.0v 599.45n 5.0v 599.55n 0.0v 609.45n 0.0v 609.55n 5.0v 619.45n 5.0v 619.55n 5.0v 629.45n 5.0v 629.55n 5.0v 639.45n 5.0v 639.55n 5.0v 649.45n 5.0v 649.55n 5.0v 659.45n 5.0v 659.55n 5.0v 669.45n 5.0v 669.55n 5.0v 679.45n 5.0v 679.55n 0.0v 689.45n 0.0v 689.55n 0.0v 699.45n 0.0v 699.55n 0.0v 709.45n 0.0v 709.55n 0.0v 719.45n 0.0v 719.55n 5.0v 729.45n 5.0v 729.55n 5.0v 739.45n 5.0v 739.55n 5.0v 749.45n 5.0v 749.55n 0.0v 759.45n 0.0v 759.55n 5.0v 769.45n 5.0v 769.55n 5.0v 779.45n 5.0v 779.55n 0.0v 789.45n 0.0v 789.55n 0.0v 799.45n 0.0v 799.55n 0.0v 809.45n 0.0v 809.55n 0.0v 819.45n 0.0v 819.55n 0.0v 829.45n 0.0v 829.55n 0.0v 839.45n 0.0v 839.55n 0.0v 849.45n 0.0v 849.55n 5.0v 859.45n 5.0v 859.55n 5.0v 869.45n 5.0v 869.55n 5.0v 879.45n 5.0v 879.55n 5.0v 889.45n 5.0v 889.55n 5.0v 899.45n 5.0v 899.55n 5.0v 909.45n 5.0v 909.55n 0.0v 919.45n 0.0v 919.55n 0.0v 929.45n 0.0v 929.55n 0.0v 939.45n 0.0v 939.55n 0.0v 949.45n 0.0v 949.55n 0.0v 959.45n 0.0v 959.55n 0.0v 969.45n 0.0v 969.55n 5.0v 979.45n 5.0v 979.55n 5.0v 989.45n 5.0v 989.55n 5.0v 999.45n 5.0v 999.55n 5.0v 1009.45n 5.0v 1009.55n 5.0v 1019.45n 5.0v 1019.55n 0.0v 1029.45n 0.0v 1029.55n 0.0v 1039.45n 0.0v 1039.55n 0.0v 1049.45n 0.0v 1049.55n 0.0v 1059.45n 0.0v 1059.55n 0.0v 1069.45n 0.0v 1069.55n 5.0v 1079.45n 5.0v 1079.55n 5.0v 1089.45n 5.0v 1089.55n 5.0v 1099.45n 5.0v 1099.55n 5.0v 1109.45n 5.0v 1109.55n 5.0v 1119.45n 5.0v 1119.55n 0.0v 1129.45n 0.0v 1129.55n 0.0v 1139.45n 0.0v 1139.55n 0.0v 1149.45n 0.0v 1149.55n 0.0v 1159.45n 0.0v 1159.55n 0.0v 1169.45n 0.0v 1169.55n 0.0v 1179.45n 0.0v 1179.55n 0.0v 1189.45n 0.0v 1189.55n 5.0v 1199.45n 5.0v 1199.55n 5.0v 1209.45n 5.0v 1209.55n 5.0v 1219.45n 5.0v 1219.55n 5.0v 1229.45n 5.0v 1229.55n 5.0v 1239.45n 5.0v 1239.55n 5.0v 1249.45n 5.0v 1249.55n 5.0v 1259.45n 5.0v 1259.55n 5.0v 1269.45n 5.0v 1269.55n 5.0v 1279.45n 5.0v 1279.55n 5.0v 1289.45n 5.0v 1289.55n 5.0v 1299.45n 5.0v 1299.55n 5.0v 1309.45n 5.0v 1309.55n 5.0v 1319.45n 5.0v 1319.55n 5.0v 1329.45n 5.0v 1329.55n 0.0v 1339.45n 0.0v 1339.55n 0.0v 1349.45n 0.0v 1349.55n 0.0v 1359.45n 0.0v 1359.55n 0.0v 1369.45n 0.0v 1369.55n 0.0v 1379.45n 0.0v 1379.55n 0.0v 1389.45n 0.0v 1389.55n 5.0v 1399.45n 5.0v 1399.55n 5.0v 1409.45n 5.0v 1409.55n 5.0v 1419.45n 5.0v 1419.55n 5.0v 1429.45n 5.0v 1429.55n 5.0v 1439.45n 5.0v 1439.55n 5.0v 1449.45n 5.0v 1449.55n 5.0v 1459.45n 5.0v 1459.55n 5.0v 1469.45n 5.0v 1469.55n 5.0v 1479.45n 5.0v 1479.55n 0.0v 1489.45n 0.0v 1489.55n 0.0v 1499.45n 0.0v 1499.55n 5.0v 1509.45n 5.0v 1509.55n 5.0v 1519.45n 5.0v 1519.55n 5.0v 1529.45n 5.0v 1529.55n 0.0v 1539.45n 0.0v 1539.55n 5.0v 1549.45n 5.0v 1549.55n 0.0v 1559.45n 0.0v 1559.55n 0.0v 1569.45n 0.0v 1569.55n 0.0v 1579.45n 0.0v 1579.55n 0.0v 1589.45n 0.0v 1589.55n 0.0v 1599.45n 0.0v 1599.55n 0.0v 1609.45n 0.0v 1609.55n 0.0v 1619.45n 0.0v 1619.55n 0.0v 1629.45n 0.0v 1629.55n 0.0v 1639.45n 0.0v 1639.55n 5.0v 1649.45n 5.0v 1649.55n 5.0v 1659.45n 5.0v 1659.55n 5.0v 1669.45n 5.0v 1669.55n 5.0v 1679.45n 5.0v 1679.55n 5.0v 1689.45n 5.0v 1689.55n 5.0v 1699.45n 5.0v 1699.55n 5.0v 1709.45n 5.0v 1709.55n 5.0v 1719.45n 5.0v 1719.55n 5.0v 1729.45n 5.0v 1729.55n 5.0v 1739.45n 5.0v 1739.55n 5.0v 1749.45n 5.0v 1749.55n 5.0v 1759.45n 5.0v 1759.55n 0.0v 1769.45n 0.0v 1769.55n 5.0v 1779.45n 5.0v 1779.55n 5.0v 1789.45n 5.0v 1789.55n 0.0v 1799.45n 0.0v 1799.55n 0.0v 1809.45n 0.0v 1809.55n 0.0v 1819.45n 0.0v 1819.55n 0.0v 1829.45n 0.0v 1829.55n 0.0v 1839.45n 0.0v 1839.55n 0.0v 1849.45n 0.0v 1849.55n 0.0v 1859.45n 0.0v 1859.55n 0.0v 1869.45n 0.0v 1869.55n 0.0v 1879.45n 0.0v 1879.55n 5.0v 1889.45n 5.0v 1889.55n 0.0v 1899.45n 0.0v 1899.55n 0.0v 1909.45n 0.0v 1909.55n 0.0v 1919.45n 0.0v 1919.55n 0.0v 1929.45n 0.0v 1929.55n 0.0v 1939.45n 0.0v 1939.55n 0.0v 1949.45n 0.0v 1949.55n 0.0v 1959.45n 0.0v 1959.55n 0.0v 1969.45n 0.0v 1969.55n 5.0v 1979.45n 5.0v 1979.55n 5.0v 1989.45n 5.0v 1989.55n 5.0v 1999.45n 5.0v 1999.55n 5.0v 2009.45n 5.0v 2009.55n 5.0v 2019.45n 5.0v 2019.55n 5.0v 2029.45n 5.0v 2029.55n 5.0v 2039.45n 5.0v 2039.55n 5.0v 2049.45n 5.0v 2049.55n 5.0v )
* (time, data): [(0, 0), (10, 0), (20, 1), (30, 1), (40, 1), (50, 0), (60, 0), (70, 1), (80, 0), (90, 0), (100, 0), (110, 0), (120, 0), (130, 0), (140, 0), (150, 0), (160, 1), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 0), (230, 0), (240, 0), (250, 0), (260, 0), (270, 0), (280, 0), (290, 0), (300, 1), (310, 1), (320, 1), (330, 1), (340, 1), (350, 1), (360, 1), (370, 1), (380, 1), (390, 1), (400, 1), (410, 0), (420, 0), (430, 0), (440, 0), (450, 1), (460, 1), (470, 0), (480, 0), (490, 1), (500, 1), (510, 1), (520, 1), (530, 0), (540, 0), (550, 0), (560, 0), (570, 0), (580, 0), (590, 0), (600, 1), (610, 0), (620, 0), (630, 0), (640, 1), (650, 1), (660, 1), (670, 1), (680, 0), (690, 0), (700, 0), (710, 0), (720, 1), (730, 1), (740, 1), (750, 0), (760, 1), (770, 1), (780, 1), (790, 1), (800, 1), (810, 1), (820, 1), (830, 1), (840, 1), (850, 0), (860, 0), (870, 0), (880, 0), (890, 0), (900, 0), (910, 1), (920, 1), (930, 1), (940, 1), (950, 0), (960, 0), (970, 0), (980, 0), (990, 0), (1000, 0), (1010, 0), (1020, 0), (1030, 0), (1040, 0), (1050, 0), (1060, 0), (1070, 0), (1080, 1), (1090, 1), (1100, 1), (1110, 1), (1120, 1), (1130, 1), (1140, 1), (1150, 0), (1160, 1), (1170, 1), (1180, 1), (1190, 1), (1200, 0), (1210, 0), (1220, 0), (1230, 1), (1240, 1), (1250, 1), (1260, 1), (1270, 1), (1280, 1), (1290, 1), (1300, 0), (1310, 0), (1320, 0), (1330, 1), (1340, 1), (1350, 1), (1360, 1), (1370, 1), (1380, 0), (1390, 0), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 0), (1450, 0), (1460, 0), (1470, 0), (1480, 0), (1490, 0), (1500, 1), (1510, 0), (1520, 1), (1530, 1), (1540, 1), (1550, 0), (1560, 0), (1570, 0), (1580, 0), (1590, 1), (1600, 1), (1610, 1), (1620, 1), (1630, 1), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 1), (1700, 1), (1710, 1), (1720, 1), (1730, 1), (1740, 1), (1750, 1), (1760, 1), (1770, 1), (1780, 0), (1790, 0), (1800, 0), (1810, 1), (1820, 1), (1830, 1), (1840, 0), (1850, 1), (1860, 1), (1870, 1), (1880, 1), (1890, 1), (1900, 1), (1910, 1), (1920, 1), (1930, 1), (1940, 1), (1950, 1), (1960, 1), (1970, 0), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 0), (2030, 0), (2040, 0), (2050, 0)]
Vdin0_14  din0_14  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 0.0v 19.45n 0.0v 19.55n 5.0v 29.45n 5.0v 29.55n 5.0v 39.45n 5.0v 39.55n 5.0v 49.45n 5.0v 49.55n 0.0v 59.45n 0.0v 59.55n 0.0v 69.45n 0.0v 69.55n 5.0v 79.45n 5.0v 79.55n 0.0v 89.45n 0.0v 89.55n 0.0v 99.45n 0.0v 99.55n 0.0v 109.45n 0.0v 109.55n 0.0v 119.45n 0.0v 119.55n 0.0v 129.45n 0.0v 129.55n 0.0v 139.45n 0.0v 139.55n 0.0v 149.45n 0.0v 149.55n 0.0v 159.45n 0.0v 159.55n 5.0v 169.45n 5.0v 169.55n 0.0v 179.45n 0.0v 179.55n 0.0v 189.45n 0.0v 189.55n 0.0v 199.45n 0.0v 199.55n 0.0v 209.45n 0.0v 209.55n 0.0v 219.45n 0.0v 219.55n 0.0v 229.45n 0.0v 229.55n 0.0v 239.45n 0.0v 239.55n 0.0v 249.45n 0.0v 249.55n 0.0v 259.45n 0.0v 259.55n 0.0v 269.45n 0.0v 269.55n 0.0v 279.45n 0.0v 279.55n 0.0v 289.45n 0.0v 289.55n 0.0v 299.45n 0.0v 299.55n 5.0v 309.45n 5.0v 309.55n 5.0v 319.45n 5.0v 319.55n 5.0v 329.45n 5.0v 329.55n 5.0v 339.45n 5.0v 339.55n 5.0v 349.45n 5.0v 349.55n 5.0v 359.45n 5.0v 359.55n 5.0v 369.45n 5.0v 369.55n 5.0v 379.45n 5.0v 379.55n 5.0v 389.45n 5.0v 389.55n 5.0v 399.45n 5.0v 399.55n 5.0v 409.45n 5.0v 409.55n 0.0v 419.45n 0.0v 419.55n 0.0v 429.45n 0.0v 429.55n 0.0v 439.45n 0.0v 439.55n 0.0v 449.45n 0.0v 449.55n 5.0v 459.45n 5.0v 459.55n 5.0v 469.45n 5.0v 469.55n 0.0v 479.45n 0.0v 479.55n 0.0v 489.45n 0.0v 489.55n 5.0v 499.45n 5.0v 499.55n 5.0v 509.45n 5.0v 509.55n 5.0v 519.45n 5.0v 519.55n 5.0v 529.45n 5.0v 529.55n 0.0v 539.45n 0.0v 539.55n 0.0v 549.45n 0.0v 549.55n 0.0v 559.45n 0.0v 559.55n 0.0v 569.45n 0.0v 569.55n 0.0v 579.45n 0.0v 579.55n 0.0v 589.45n 0.0v 589.55n 0.0v 599.45n 0.0v 599.55n 5.0v 609.45n 5.0v 609.55n 0.0v 619.45n 0.0v 619.55n 0.0v 629.45n 0.0v 629.55n 0.0v 639.45n 0.0v 639.55n 5.0v 649.45n 5.0v 649.55n 5.0v 659.45n 5.0v 659.55n 5.0v 669.45n 5.0v 669.55n 5.0v 679.45n 5.0v 679.55n 0.0v 689.45n 0.0v 689.55n 0.0v 699.45n 0.0v 699.55n 0.0v 709.45n 0.0v 709.55n 0.0v 719.45n 0.0v 719.55n 5.0v 729.45n 5.0v 729.55n 5.0v 739.45n 5.0v 739.55n 5.0v 749.45n 5.0v 749.55n 0.0v 759.45n 0.0v 759.55n 5.0v 769.45n 5.0v 769.55n 5.0v 779.45n 5.0v 779.55n 5.0v 789.45n 5.0v 789.55n 5.0v 799.45n 5.0v 799.55n 5.0v 809.45n 5.0v 809.55n 5.0v 819.45n 5.0v 819.55n 5.0v 829.45n 5.0v 829.55n 5.0v 839.45n 5.0v 839.55n 5.0v 849.45n 5.0v 849.55n 0.0v 859.45n 0.0v 859.55n 0.0v 869.45n 0.0v 869.55n 0.0v 879.45n 0.0v 879.55n 0.0v 889.45n 0.0v 889.55n 0.0v 899.45n 0.0v 899.55n 0.0v 909.45n 0.0v 909.55n 5.0v 919.45n 5.0v 919.55n 5.0v 929.45n 5.0v 929.55n 5.0v 939.45n 5.0v 939.55n 5.0v 949.45n 5.0v 949.55n 0.0v 959.45n 0.0v 959.55n 0.0v 969.45n 0.0v 969.55n 0.0v 979.45n 0.0v 979.55n 0.0v 989.45n 0.0v 989.55n 0.0v 999.45n 0.0v 999.55n 0.0v 1009.45n 0.0v 1009.55n 0.0v 1019.45n 0.0v 1019.55n 0.0v 1029.45n 0.0v 1029.55n 0.0v 1039.45n 0.0v 1039.55n 0.0v 1049.45n 0.0v 1049.55n 0.0v 1059.45n 0.0v 1059.55n 0.0v 1069.45n 0.0v 1069.55n 0.0v 1079.45n 0.0v 1079.55n 5.0v 1089.45n 5.0v 1089.55n 5.0v 1099.45n 5.0v 1099.55n 5.0v 1109.45n 5.0v 1109.55n 5.0v 1119.45n 5.0v 1119.55n 5.0v 1129.45n 5.0v 1129.55n 5.0v 1139.45n 5.0v 1139.55n 5.0v 1149.45n 5.0v 1149.55n 0.0v 1159.45n 0.0v 1159.55n 5.0v 1169.45n 5.0v 1169.55n 5.0v 1179.45n 5.0v 1179.55n 5.0v 1189.45n 5.0v 1189.55n 5.0v 1199.45n 5.0v 1199.55n 0.0v 1209.45n 0.0v 1209.55n 0.0v 1219.45n 0.0v 1219.55n 0.0v 1229.45n 0.0v 1229.55n 5.0v 1239.45n 5.0v 1239.55n 5.0v 1249.45n 5.0v 1249.55n 5.0v 1259.45n 5.0v 1259.55n 5.0v 1269.45n 5.0v 1269.55n 5.0v 1279.45n 5.0v 1279.55n 5.0v 1289.45n 5.0v 1289.55n 5.0v 1299.45n 5.0v 1299.55n 0.0v 1309.45n 0.0v 1309.55n 0.0v 1319.45n 0.0v 1319.55n 0.0v 1329.45n 0.0v 1329.55n 5.0v 1339.45n 5.0v 1339.55n 5.0v 1349.45n 5.0v 1349.55n 5.0v 1359.45n 5.0v 1359.55n 5.0v 1369.45n 5.0v 1369.55n 5.0v 1379.45n 5.0v 1379.55n 0.0v 1389.45n 0.0v 1389.55n 0.0v 1399.45n 0.0v 1399.55n 0.0v 1409.45n 0.0v 1409.55n 0.0v 1419.45n 0.0v 1419.55n 0.0v 1429.45n 0.0v 1429.55n 0.0v 1439.45n 0.0v 1439.55n 0.0v 1449.45n 0.0v 1449.55n 0.0v 1459.45n 0.0v 1459.55n 0.0v 1469.45n 0.0v 1469.55n 0.0v 1479.45n 0.0v 1479.55n 0.0v 1489.45n 0.0v 1489.55n 0.0v 1499.45n 0.0v 1499.55n 5.0v 1509.45n 5.0v 1509.55n 0.0v 1519.45n 0.0v 1519.55n 5.0v 1529.45n 5.0v 1529.55n 5.0v 1539.45n 5.0v 1539.55n 5.0v 1549.45n 5.0v 1549.55n 0.0v 1559.45n 0.0v 1559.55n 0.0v 1569.45n 0.0v 1569.55n 0.0v 1579.45n 0.0v 1579.55n 0.0v 1589.45n 0.0v 1589.55n 5.0v 1599.45n 5.0v 1599.55n 5.0v 1609.45n 5.0v 1609.55n 5.0v 1619.45n 5.0v 1619.55n 5.0v 1629.45n 5.0v 1629.55n 5.0v 1639.45n 5.0v 1639.55n 5.0v 1649.45n 5.0v 1649.55n 5.0v 1659.45n 5.0v 1659.55n 5.0v 1669.45n 5.0v 1669.55n 5.0v 1679.45n 5.0v 1679.55n 5.0v 1689.45n 5.0v 1689.55n 5.0v 1699.45n 5.0v 1699.55n 5.0v 1709.45n 5.0v 1709.55n 5.0v 1719.45n 5.0v 1719.55n 5.0v 1729.45n 5.0v 1729.55n 5.0v 1739.45n 5.0v 1739.55n 5.0v 1749.45n 5.0v 1749.55n 5.0v 1759.45n 5.0v 1759.55n 5.0v 1769.45n 5.0v 1769.55n 5.0v 1779.45n 5.0v 1779.55n 0.0v 1789.45n 0.0v 1789.55n 0.0v 1799.45n 0.0v 1799.55n 0.0v 1809.45n 0.0v 1809.55n 5.0v 1819.45n 5.0v 1819.55n 5.0v 1829.45n 5.0v 1829.55n 5.0v 1839.45n 5.0v 1839.55n 0.0v 1849.45n 0.0v 1849.55n 5.0v 1859.45n 5.0v 1859.55n 5.0v 1869.45n 5.0v 1869.55n 5.0v 1879.45n 5.0v 1879.55n 5.0v 1889.45n 5.0v 1889.55n 5.0v 1899.45n 5.0v 1899.55n 5.0v 1909.45n 5.0v 1909.55n 5.0v 1919.45n 5.0v 1919.55n 5.0v 1929.45n 5.0v 1929.55n 5.0v 1939.45n 5.0v 1939.55n 5.0v 1949.45n 5.0v 1949.55n 5.0v 1959.45n 5.0v 1959.55n 5.0v 1969.45n 5.0v 1969.55n 0.0v 1979.45n 0.0v 1979.55n 0.0v 1989.45n 0.0v 1989.55n 0.0v 1999.45n 0.0v 1999.55n 0.0v 2009.45n 0.0v 2009.55n 0.0v 2019.45n 0.0v 2019.55n 0.0v 2029.45n 0.0v 2029.55n 0.0v 2039.45n 0.0v 2039.55n 0.0v 2049.45n 0.0v 2049.55n 0.0v )
* (time, data): [(0, 0), (10, 1), (20, 1), (30, 1), (40, 1), (50, 0), (60, 1), (70, 1), (80, 1), (90, 1), (100, 1), (110, 1), (120, 1), (130, 1), (140, 1), (150, 1), (160, 1), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 1), (230, 1), (240, 1), (250, 1), (260, 1), (270, 1), (280, 0), (290, 0), (300, 1), (310, 1), (320, 1), (330, 1), (340, 1), (350, 1), (360, 1), (370, 1), (380, 1), (390, 1), (400, 1), (410, 1), (420, 1), (430, 1), (440, 1), (450, 0), (460, 0), (470, 0), (480, 1), (490, 0), (500, 0), (510, 1), (520, 1), (530, 0), (540, 1), (550, 1), (560, 1), (570, 1), (580, 1), (590, 1), (600, 1), (610, 0), (620, 0), (630, 0), (640, 0), (650, 0), (660, 0), (670, 0), (680, 1), (690, 1), (700, 1), (710, 1), (720, 1), (730, 1), (740, 0), (750, 1), (760, 0), (770, 0), (780, 1), (790, 1), (800, 1), (810, 1), (820, 1), (830, 1), (840, 1), (850, 1), (860, 1), (870, 1), (880, 1), (890, 1), (900, 1), (910, 0), (920, 0), (930, 0), (940, 0), (950, 1), (960, 1), (970, 0), (980, 0), (990, 0), (1000, 1), (1010, 1), (1020, 1), (1030, 1), (1040, 1), (1050, 1), (1060, 1), (1070, 1), (1080, 1), (1090, 0), (1100, 0), (1110, 0), (1120, 1), (1130, 1), (1140, 1), (1150, 0), (1160, 1), (1170, 1), (1180, 1), (1190, 1), (1200, 0), (1210, 0), (1220, 0), (1230, 0), (1240, 0), (1250, 0), (1260, 0), (1270, 0), (1280, 1), (1290, 1), (1300, 1), (1310, 1), (1320, 1), (1330, 1), (1340, 1), (1350, 1), (1360, 1), (1370, 1), (1380, 0), (1390, 1), (1400, 1), (1410, 1), (1420, 1), (1430, 1), (1440, 0), (1450, 0), (1460, 0), (1470, 0), (1480, 1), (1490, 1), (1500, 1), (1510, 1), (1520, 1), (1530, 1), (1540, 1), (1550, 0), (1560, 0), (1570, 0), (1580, 0), (1590, 0), (1600, 0), (1610, 0), (1620, 0), (1630, 0), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 1), (1700, 1), (1710, 1), (1720, 1), (1730, 1), (1740, 1), (1750, 1), (1760, 1), (1770, 1), (1780, 1), (1790, 1), (1800, 1), (1810, 0), (1820, 0), (1830, 0), (1840, 1), (1850, 1), (1860, 0), (1870, 0), (1880, 1), (1890, 1), (1900, 1), (1910, 1), (1920, 1), (1930, 0), (1940, 0), (1950, 0), (1960, 0), (1970, 0), (1980, 1), (1990, 1), (2000, 1), (2010, 1), (2020, 1), (2030, 0), (2040, 0), (2050, 0)]
Vdin0_15  din0_15  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 5.0v 19.45n 5.0v 19.55n 5.0v 29.45n 5.0v 29.55n 5.0v 39.45n 5.0v 39.55n 5.0v 49.45n 5.0v 49.55n 0.0v 59.45n 0.0v 59.55n 5.0v 69.45n 5.0v 69.55n 5.0v 79.45n 5.0v 79.55n 5.0v 89.45n 5.0v 89.55n 5.0v 99.45n 5.0v 99.55n 5.0v 109.45n 5.0v 109.55n 5.0v 119.45n 5.0v 119.55n 5.0v 129.45n 5.0v 129.55n 5.0v 139.45n 5.0v 139.55n 5.0v 149.45n 5.0v 149.55n 5.0v 159.45n 5.0v 159.55n 5.0v 169.45n 5.0v 169.55n 0.0v 179.45n 0.0v 179.55n 0.0v 189.45n 0.0v 189.55n 0.0v 199.45n 0.0v 199.55n 0.0v 209.45n 0.0v 209.55n 0.0v 219.45n 0.0v 219.55n 5.0v 229.45n 5.0v 229.55n 5.0v 239.45n 5.0v 239.55n 5.0v 249.45n 5.0v 249.55n 5.0v 259.45n 5.0v 259.55n 5.0v 269.45n 5.0v 269.55n 5.0v 279.45n 5.0v 279.55n 0.0v 289.45n 0.0v 289.55n 0.0v 299.45n 0.0v 299.55n 5.0v 309.45n 5.0v 309.55n 5.0v 319.45n 5.0v 319.55n 5.0v 329.45n 5.0v 329.55n 5.0v 339.45n 5.0v 339.55n 5.0v 349.45n 5.0v 349.55n 5.0v 359.45n 5.0v 359.55n 5.0v 369.45n 5.0v 369.55n 5.0v 379.45n 5.0v 379.55n 5.0v 389.45n 5.0v 389.55n 5.0v 399.45n 5.0v 399.55n 5.0v 409.45n 5.0v 409.55n 5.0v 419.45n 5.0v 419.55n 5.0v 429.45n 5.0v 429.55n 5.0v 439.45n 5.0v 439.55n 5.0v 449.45n 5.0v 449.55n 0.0v 459.45n 0.0v 459.55n 0.0v 469.45n 0.0v 469.55n 0.0v 479.45n 0.0v 479.55n 5.0v 489.45n 5.0v 489.55n 0.0v 499.45n 0.0v 499.55n 0.0v 509.45n 0.0v 509.55n 5.0v 519.45n 5.0v 519.55n 5.0v 529.45n 5.0v 529.55n 0.0v 539.45n 0.0v 539.55n 5.0v 549.45n 5.0v 549.55n 5.0v 559.45n 5.0v 559.55n 5.0v 569.45n 5.0v 569.55n 5.0v 579.45n 5.0v 579.55n 5.0v 589.45n 5.0v 589.55n 5.0v 599.45n 5.0v 599.55n 5.0v 609.45n 5.0v 609.55n 0.0v 619.45n 0.0v 619.55n 0.0v 629.45n 0.0v 629.55n 0.0v 639.45n 0.0v 639.55n 0.0v 649.45n 0.0v 649.55n 0.0v 659.45n 0.0v 659.55n 0.0v 669.45n 0.0v 669.55n 0.0v 679.45n 0.0v 679.55n 5.0v 689.45n 5.0v 689.55n 5.0v 699.45n 5.0v 699.55n 5.0v 709.45n 5.0v 709.55n 5.0v 719.45n 5.0v 719.55n 5.0v 729.45n 5.0v 729.55n 5.0v 739.45n 5.0v 739.55n 0.0v 749.45n 0.0v 749.55n 5.0v 759.45n 5.0v 759.55n 0.0v 769.45n 0.0v 769.55n 0.0v 779.45n 0.0v 779.55n 5.0v 789.45n 5.0v 789.55n 5.0v 799.45n 5.0v 799.55n 5.0v 809.45n 5.0v 809.55n 5.0v 819.45n 5.0v 819.55n 5.0v 829.45n 5.0v 829.55n 5.0v 839.45n 5.0v 839.55n 5.0v 849.45n 5.0v 849.55n 5.0v 859.45n 5.0v 859.55n 5.0v 869.45n 5.0v 869.55n 5.0v 879.45n 5.0v 879.55n 5.0v 889.45n 5.0v 889.55n 5.0v 899.45n 5.0v 899.55n 5.0v 909.45n 5.0v 909.55n 0.0v 919.45n 0.0v 919.55n 0.0v 929.45n 0.0v 929.55n 0.0v 939.45n 0.0v 939.55n 0.0v 949.45n 0.0v 949.55n 5.0v 959.45n 5.0v 959.55n 5.0v 969.45n 5.0v 969.55n 0.0v 979.45n 0.0v 979.55n 0.0v 989.45n 0.0v 989.55n 0.0v 999.45n 0.0v 999.55n 5.0v 1009.45n 5.0v 1009.55n 5.0v 1019.45n 5.0v 1019.55n 5.0v 1029.45n 5.0v 1029.55n 5.0v 1039.45n 5.0v 1039.55n 5.0v 1049.45n 5.0v 1049.55n 5.0v 1059.45n 5.0v 1059.55n 5.0v 1069.45n 5.0v 1069.55n 5.0v 1079.45n 5.0v 1079.55n 5.0v 1089.45n 5.0v 1089.55n 0.0v 1099.45n 0.0v 1099.55n 0.0v 1109.45n 0.0v 1109.55n 0.0v 1119.45n 0.0v 1119.55n 5.0v 1129.45n 5.0v 1129.55n 5.0v 1139.45n 5.0v 1139.55n 5.0v 1149.45n 5.0v 1149.55n 0.0v 1159.45n 0.0v 1159.55n 5.0v 1169.45n 5.0v 1169.55n 5.0v 1179.45n 5.0v 1179.55n 5.0v 1189.45n 5.0v 1189.55n 5.0v 1199.45n 5.0v 1199.55n 0.0v 1209.45n 0.0v 1209.55n 0.0v 1219.45n 0.0v 1219.55n 0.0v 1229.45n 0.0v 1229.55n 0.0v 1239.45n 0.0v 1239.55n 0.0v 1249.45n 0.0v 1249.55n 0.0v 1259.45n 0.0v 1259.55n 0.0v 1269.45n 0.0v 1269.55n 0.0v 1279.45n 0.0v 1279.55n 5.0v 1289.45n 5.0v 1289.55n 5.0v 1299.45n 5.0v 1299.55n 5.0v 1309.45n 5.0v 1309.55n 5.0v 1319.45n 5.0v 1319.55n 5.0v 1329.45n 5.0v 1329.55n 5.0v 1339.45n 5.0v 1339.55n 5.0v 1349.45n 5.0v 1349.55n 5.0v 1359.45n 5.0v 1359.55n 5.0v 1369.45n 5.0v 1369.55n 5.0v 1379.45n 5.0v 1379.55n 0.0v 1389.45n 0.0v 1389.55n 5.0v 1399.45n 5.0v 1399.55n 5.0v 1409.45n 5.0v 1409.55n 5.0v 1419.45n 5.0v 1419.55n 5.0v 1429.45n 5.0v 1429.55n 5.0v 1439.45n 5.0v 1439.55n 0.0v 1449.45n 0.0v 1449.55n 0.0v 1459.45n 0.0v 1459.55n 0.0v 1469.45n 0.0v 1469.55n 0.0v 1479.45n 0.0v 1479.55n 5.0v 1489.45n 5.0v 1489.55n 5.0v 1499.45n 5.0v 1499.55n 5.0v 1509.45n 5.0v 1509.55n 5.0v 1519.45n 5.0v 1519.55n 5.0v 1529.45n 5.0v 1529.55n 5.0v 1539.45n 5.0v 1539.55n 5.0v 1549.45n 5.0v 1549.55n 0.0v 1559.45n 0.0v 1559.55n 0.0v 1569.45n 0.0v 1569.55n 0.0v 1579.45n 0.0v 1579.55n 0.0v 1589.45n 0.0v 1589.55n 0.0v 1599.45n 0.0v 1599.55n 0.0v 1609.45n 0.0v 1609.55n 0.0v 1619.45n 0.0v 1619.55n 0.0v 1629.45n 0.0v 1629.55n 0.0v 1639.45n 0.0v 1639.55n 5.0v 1649.45n 5.0v 1649.55n 5.0v 1659.45n 5.0v 1659.55n 5.0v 1669.45n 5.0v 1669.55n 5.0v 1679.45n 5.0v 1679.55n 5.0v 1689.45n 5.0v 1689.55n 5.0v 1699.45n 5.0v 1699.55n 5.0v 1709.45n 5.0v 1709.55n 5.0v 1719.45n 5.0v 1719.55n 5.0v 1729.45n 5.0v 1729.55n 5.0v 1739.45n 5.0v 1739.55n 5.0v 1749.45n 5.0v 1749.55n 5.0v 1759.45n 5.0v 1759.55n 5.0v 1769.45n 5.0v 1769.55n 5.0v 1779.45n 5.0v 1779.55n 5.0v 1789.45n 5.0v 1789.55n 5.0v 1799.45n 5.0v 1799.55n 5.0v 1809.45n 5.0v 1809.55n 0.0v 1819.45n 0.0v 1819.55n 0.0v 1829.45n 0.0v 1829.55n 0.0v 1839.45n 0.0v 1839.55n 5.0v 1849.45n 5.0v 1849.55n 5.0v 1859.45n 5.0v 1859.55n 0.0v 1869.45n 0.0v 1869.55n 0.0v 1879.45n 0.0v 1879.55n 5.0v 1889.45n 5.0v 1889.55n 5.0v 1899.45n 5.0v 1899.55n 5.0v 1909.45n 5.0v 1909.55n 5.0v 1919.45n 5.0v 1919.55n 5.0v 1929.45n 5.0v 1929.55n 0.0v 1939.45n 0.0v 1939.55n 0.0v 1949.45n 0.0v 1949.55n 0.0v 1959.45n 0.0v 1959.55n 0.0v 1969.45n 0.0v 1969.55n 0.0v 1979.45n 0.0v 1979.55n 5.0v 1989.45n 5.0v 1989.55n 5.0v 1999.45n 5.0v 1999.55n 5.0v 2009.45n 5.0v 2009.55n 5.0v 2019.45n 5.0v 2019.55n 5.0v 2029.45n 5.0v 2029.55n 0.0v 2039.45n 0.0v 2039.55n 0.0v 2049.45n 0.0v 2049.55n 0.0v )
* (time, data): [(0, 0), (10, 1), (20, 0), (30, 0), (40, 0), (50, 1), (60, 0), (70, 1), (80, 1), (90, 1), (100, 1), (110, 1), (120, 1), (130, 0), (140, 0), (150, 1), (160, 0), (170, 1), (180, 1), (190, 1), (200, 1), (210, 1), (220, 0), (230, 0), (240, 0), (250, 0), (260, 0), (270, 0), (280, 1), (290, 1), (300, 1), (310, 1), (320, 1), (330, 1), (340, 1), (350, 1), (360, 1), (370, 1), (380, 1), (390, 1), (400, 0), (410, 1), (420, 1), (430, 1), (440, 1), (450, 1), (460, 1), (470, 0), (480, 0), (490, 0), (500, 0), (510, 0), (520, 0), (530, 1), (540, 0), (550, 0), (560, 0), (570, 0), (580, 0), (590, 1), (600, 1), (610, 0), (620, 0), (630, 0), (640, 0), (650, 0), (660, 1), (670, 0), (680, 1), (690, 1), (700, 1), (710, 1), (720, 1), (730, 1), (740, 1), (750, 1), (760, 1), (770, 1), (780, 1), (790, 1), (800, 1), (810, 1), (820, 1), (830, 1), (840, 1), (850, 1), (860, 1), (870, 1), (880, 1), (890, 1), (900, 1), (910, 1), (920, 1), (930, 1), (940, 1), (950, 0), (960, 0), (970, 0), (980, 0), (990, 0), (1000, 1), (1010, 1), (1020, 1), (1030, 1), (1040, 1), (1050, 1), (1060, 1), (1070, 0), (1080, 1), (1090, 1), (1100, 1), (1110, 1), (1120, 1), (1130, 1), (1140, 1), (1150, 0), (1160, 0), (1170, 0), (1180, 0), (1190, 1), (1200, 0), (1210, 0), (1220, 0), (1230, 1), (1240, 1), (1250, 1), (1260, 1), (1270, 1), (1280, 1), (1290, 1), (1300, 1), (1310, 1), (1320, 0), (1330, 1), (1340, 1), (1350, 1), (1360, 1), (1370, 1), (1380, 0), (1390, 1), (1400, 1), (1410, 1), (1420, 1), (1430, 1), (1440, 0), (1450, 0), (1460, 0), (1470, 0), (1480, 0), (1490, 0), (1500, 0), (1510, 1), (1520, 0), (1530, 1), (1540, 0), (1550, 1), (1560, 1), (1570, 1), (1580, 1), (1590, 1), (1600, 1), (1610, 1), (1620, 1), (1630, 1), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 1), (1700, 1), (1710, 1), (1720, 1), (1730, 1), (1740, 1), (1750, 1), (1760, 0), (1770, 0), (1780, 1), (1790, 0), (1800, 0), (1810, 0), (1820, 0), (1830, 0), (1840, 1), (1850, 1), (1860, 1), (1870, 1), (1880, 1), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 1), (1940, 1), (1950, 1), (1960, 1), (1970, 0), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 0), (2030, 1), (2040, 1), (2050, 1)]
Vdin0_16  din0_16  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 5.0v 19.45n 5.0v 19.55n 0.0v 29.45n 0.0v 29.55n 0.0v 39.45n 0.0v 39.55n 0.0v 49.45n 0.0v 49.55n 5.0v 59.45n 5.0v 59.55n 0.0v 69.45n 0.0v 69.55n 5.0v 79.45n 5.0v 79.55n 5.0v 89.45n 5.0v 89.55n 5.0v 99.45n 5.0v 99.55n 5.0v 109.45n 5.0v 109.55n 5.0v 119.45n 5.0v 119.55n 5.0v 129.45n 5.0v 129.55n 0.0v 139.45n 0.0v 139.55n 0.0v 149.45n 0.0v 149.55n 5.0v 159.45n 5.0v 159.55n 0.0v 169.45n 0.0v 169.55n 5.0v 179.45n 5.0v 179.55n 5.0v 189.45n 5.0v 189.55n 5.0v 199.45n 5.0v 199.55n 5.0v 209.45n 5.0v 209.55n 5.0v 219.45n 5.0v 219.55n 0.0v 229.45n 0.0v 229.55n 0.0v 239.45n 0.0v 239.55n 0.0v 249.45n 0.0v 249.55n 0.0v 259.45n 0.0v 259.55n 0.0v 269.45n 0.0v 269.55n 0.0v 279.45n 0.0v 279.55n 5.0v 289.45n 5.0v 289.55n 5.0v 299.45n 5.0v 299.55n 5.0v 309.45n 5.0v 309.55n 5.0v 319.45n 5.0v 319.55n 5.0v 329.45n 5.0v 329.55n 5.0v 339.45n 5.0v 339.55n 5.0v 349.45n 5.0v 349.55n 5.0v 359.45n 5.0v 359.55n 5.0v 369.45n 5.0v 369.55n 5.0v 379.45n 5.0v 379.55n 5.0v 389.45n 5.0v 389.55n 5.0v 399.45n 5.0v 399.55n 0.0v 409.45n 0.0v 409.55n 5.0v 419.45n 5.0v 419.55n 5.0v 429.45n 5.0v 429.55n 5.0v 439.45n 5.0v 439.55n 5.0v 449.45n 5.0v 449.55n 5.0v 459.45n 5.0v 459.55n 5.0v 469.45n 5.0v 469.55n 0.0v 479.45n 0.0v 479.55n 0.0v 489.45n 0.0v 489.55n 0.0v 499.45n 0.0v 499.55n 0.0v 509.45n 0.0v 509.55n 0.0v 519.45n 0.0v 519.55n 0.0v 529.45n 0.0v 529.55n 5.0v 539.45n 5.0v 539.55n 0.0v 549.45n 0.0v 549.55n 0.0v 559.45n 0.0v 559.55n 0.0v 569.45n 0.0v 569.55n 0.0v 579.45n 0.0v 579.55n 0.0v 589.45n 0.0v 589.55n 5.0v 599.45n 5.0v 599.55n 5.0v 609.45n 5.0v 609.55n 0.0v 619.45n 0.0v 619.55n 0.0v 629.45n 0.0v 629.55n 0.0v 639.45n 0.0v 639.55n 0.0v 649.45n 0.0v 649.55n 0.0v 659.45n 0.0v 659.55n 5.0v 669.45n 5.0v 669.55n 0.0v 679.45n 0.0v 679.55n 5.0v 689.45n 5.0v 689.55n 5.0v 699.45n 5.0v 699.55n 5.0v 709.45n 5.0v 709.55n 5.0v 719.45n 5.0v 719.55n 5.0v 729.45n 5.0v 729.55n 5.0v 739.45n 5.0v 739.55n 5.0v 749.45n 5.0v 749.55n 5.0v 759.45n 5.0v 759.55n 5.0v 769.45n 5.0v 769.55n 5.0v 779.45n 5.0v 779.55n 5.0v 789.45n 5.0v 789.55n 5.0v 799.45n 5.0v 799.55n 5.0v 809.45n 5.0v 809.55n 5.0v 819.45n 5.0v 819.55n 5.0v 829.45n 5.0v 829.55n 5.0v 839.45n 5.0v 839.55n 5.0v 849.45n 5.0v 849.55n 5.0v 859.45n 5.0v 859.55n 5.0v 869.45n 5.0v 869.55n 5.0v 879.45n 5.0v 879.55n 5.0v 889.45n 5.0v 889.55n 5.0v 899.45n 5.0v 899.55n 5.0v 909.45n 5.0v 909.55n 5.0v 919.45n 5.0v 919.55n 5.0v 929.45n 5.0v 929.55n 5.0v 939.45n 5.0v 939.55n 5.0v 949.45n 5.0v 949.55n 0.0v 959.45n 0.0v 959.55n 0.0v 969.45n 0.0v 969.55n 0.0v 979.45n 0.0v 979.55n 0.0v 989.45n 0.0v 989.55n 0.0v 999.45n 0.0v 999.55n 5.0v 1009.45n 5.0v 1009.55n 5.0v 1019.45n 5.0v 1019.55n 5.0v 1029.45n 5.0v 1029.55n 5.0v 1039.45n 5.0v 1039.55n 5.0v 1049.45n 5.0v 1049.55n 5.0v 1059.45n 5.0v 1059.55n 5.0v 1069.45n 5.0v 1069.55n 0.0v 1079.45n 0.0v 1079.55n 5.0v 1089.45n 5.0v 1089.55n 5.0v 1099.45n 5.0v 1099.55n 5.0v 1109.45n 5.0v 1109.55n 5.0v 1119.45n 5.0v 1119.55n 5.0v 1129.45n 5.0v 1129.55n 5.0v 1139.45n 5.0v 1139.55n 5.0v 1149.45n 5.0v 1149.55n 0.0v 1159.45n 0.0v 1159.55n 0.0v 1169.45n 0.0v 1169.55n 0.0v 1179.45n 0.0v 1179.55n 0.0v 1189.45n 0.0v 1189.55n 5.0v 1199.45n 5.0v 1199.55n 0.0v 1209.45n 0.0v 1209.55n 0.0v 1219.45n 0.0v 1219.55n 0.0v 1229.45n 0.0v 1229.55n 5.0v 1239.45n 5.0v 1239.55n 5.0v 1249.45n 5.0v 1249.55n 5.0v 1259.45n 5.0v 1259.55n 5.0v 1269.45n 5.0v 1269.55n 5.0v 1279.45n 5.0v 1279.55n 5.0v 1289.45n 5.0v 1289.55n 5.0v 1299.45n 5.0v 1299.55n 5.0v 1309.45n 5.0v 1309.55n 5.0v 1319.45n 5.0v 1319.55n 0.0v 1329.45n 0.0v 1329.55n 5.0v 1339.45n 5.0v 1339.55n 5.0v 1349.45n 5.0v 1349.55n 5.0v 1359.45n 5.0v 1359.55n 5.0v 1369.45n 5.0v 1369.55n 5.0v 1379.45n 5.0v 1379.55n 0.0v 1389.45n 0.0v 1389.55n 5.0v 1399.45n 5.0v 1399.55n 5.0v 1409.45n 5.0v 1409.55n 5.0v 1419.45n 5.0v 1419.55n 5.0v 1429.45n 5.0v 1429.55n 5.0v 1439.45n 5.0v 1439.55n 0.0v 1449.45n 0.0v 1449.55n 0.0v 1459.45n 0.0v 1459.55n 0.0v 1469.45n 0.0v 1469.55n 0.0v 1479.45n 0.0v 1479.55n 0.0v 1489.45n 0.0v 1489.55n 0.0v 1499.45n 0.0v 1499.55n 0.0v 1509.45n 0.0v 1509.55n 5.0v 1519.45n 5.0v 1519.55n 0.0v 1529.45n 0.0v 1529.55n 5.0v 1539.45n 5.0v 1539.55n 0.0v 1549.45n 0.0v 1549.55n 5.0v 1559.45n 5.0v 1559.55n 5.0v 1569.45n 5.0v 1569.55n 5.0v 1579.45n 5.0v 1579.55n 5.0v 1589.45n 5.0v 1589.55n 5.0v 1599.45n 5.0v 1599.55n 5.0v 1609.45n 5.0v 1609.55n 5.0v 1619.45n 5.0v 1619.55n 5.0v 1629.45n 5.0v 1629.55n 5.0v 1639.45n 5.0v 1639.55n 5.0v 1649.45n 5.0v 1649.55n 5.0v 1659.45n 5.0v 1659.55n 5.0v 1669.45n 5.0v 1669.55n 5.0v 1679.45n 5.0v 1679.55n 5.0v 1689.45n 5.0v 1689.55n 5.0v 1699.45n 5.0v 1699.55n 5.0v 1709.45n 5.0v 1709.55n 5.0v 1719.45n 5.0v 1719.55n 5.0v 1729.45n 5.0v 1729.55n 5.0v 1739.45n 5.0v 1739.55n 5.0v 1749.45n 5.0v 1749.55n 5.0v 1759.45n 5.0v 1759.55n 0.0v 1769.45n 0.0v 1769.55n 0.0v 1779.45n 0.0v 1779.55n 5.0v 1789.45n 5.0v 1789.55n 0.0v 1799.45n 0.0v 1799.55n 0.0v 1809.45n 0.0v 1809.55n 0.0v 1819.45n 0.0v 1819.55n 0.0v 1829.45n 0.0v 1829.55n 0.0v 1839.45n 0.0v 1839.55n 5.0v 1849.45n 5.0v 1849.55n 5.0v 1859.45n 5.0v 1859.55n 5.0v 1869.45n 5.0v 1869.55n 5.0v 1879.45n 5.0v 1879.55n 5.0v 1889.45n 5.0v 1889.55n 0.0v 1899.45n 0.0v 1899.55n 0.0v 1909.45n 0.0v 1909.55n 0.0v 1919.45n 0.0v 1919.55n 0.0v 1929.45n 0.0v 1929.55n 5.0v 1939.45n 5.0v 1939.55n 5.0v 1949.45n 5.0v 1949.55n 5.0v 1959.45n 5.0v 1959.55n 5.0v 1969.45n 5.0v 1969.55n 0.0v 1979.45n 0.0v 1979.55n 0.0v 1989.45n 0.0v 1989.55n 0.0v 1999.45n 0.0v 1999.55n 0.0v 2009.45n 0.0v 2009.55n 0.0v 2019.45n 0.0v 2019.55n 0.0v 2029.45n 0.0v 2029.55n 5.0v 2039.45n 5.0v 2039.55n 5.0v 2049.45n 5.0v 2049.55n 5.0v )
* (time, data): [(0, 0), (10, 1), (20, 1), (30, 0), (40, 0), (50, 1), (60, 0), (70, 1), (80, 0), (90, 0), (100, 0), (110, 0), (120, 0), (130, 0), (140, 0), (150, 0), (160, 1), (170, 1), (180, 1), (190, 1), (200, 1), (210, 1), (220, 1), (230, 1), (240, 1), (250, 1), (260, 1), (270, 1), (280, 1), (290, 1), (300, 0), (310, 0), (320, 0), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 0), (390, 1), (400, 1), (410, 0), (420, 0), (430, 1), (440, 1), (450, 0), (460, 0), (470, 0), (480, 1), (490, 0), (500, 0), (510, 0), (520, 0), (530, 1), (540, 1), (550, 1), (560, 1), (570, 1), (580, 1), (590, 0), (600, 1), (610, 1), (620, 1), (630, 1), (640, 0), (650, 0), (660, 0), (670, 0), (680, 0), (690, 0), (700, 0), (710, 0), (720, 0), (730, 0), (740, 1), (750, 1), (760, 1), (770, 1), (780, 1), (790, 1), (800, 1), (810, 1), (820, 1), (830, 1), (840, 1), (850, 1), (860, 1), (870, 1), (880, 1), (890, 1), (900, 1), (910, 1), (920, 1), (930, 1), (940, 1), (950, 1), (960, 1), (970, 1), (980, 1), (990, 1), (1000, 1), (1010, 1), (1020, 0), (1030, 0), (1040, 0), (1050, 0), (1060, 0), (1070, 0), (1080, 1), (1090, 0), (1100, 0), (1110, 0), (1120, 1), (1130, 1), (1140, 1), (1150, 0), (1160, 1), (1170, 1), (1180, 1), (1190, 0), (1200, 1), (1210, 1), (1220, 1), (1230, 0), (1240, 0), (1250, 0), (1260, 0), (1270, 0), (1280, 1), (1290, 1), (1300, 0), (1310, 1), (1320, 1), (1330, 1), (1340, 1), (1350, 1), (1360, 1), (1370, 1), (1380, 0), (1390, 1), (1400, 1), (1410, 1), (1420, 1), (1430, 1), (1440, 1), (1450, 1), (1460, 1), (1470, 1), (1480, 0), (1490, 0), (1500, 1), (1510, 0), (1520, 1), (1530, 0), (1540, 1), (1550, 0), (1560, 1), (1570, 1), (1580, 1), (1590, 0), (1600, 0), (1610, 0), (1620, 0), (1630, 0), (1640, 0), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 0), (1700, 0), (1710, 0), (1720, 0), (1730, 0), (1740, 0), (1750, 0), (1760, 0), (1770, 1), (1780, 0), (1790, 0), (1800, 0), (1810, 0), (1820, 0), (1830, 0), (1840, 1), (1850, 0), (1860, 1), (1870, 1), (1880, 0), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 1), (1940, 1), (1950, 1), (1960, 1), (1970, 1), (1980, 1), (1990, 1), (2000, 1), (2010, 1), (2020, 1), (2030, 0), (2040, 0), (2050, 0)]
Vdin0_17  din0_17  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 5.0v 19.45n 5.0v 19.55n 5.0v 29.45n 5.0v 29.55n 0.0v 39.45n 0.0v 39.55n 0.0v 49.45n 0.0v 49.55n 5.0v 59.45n 5.0v 59.55n 0.0v 69.45n 0.0v 69.55n 5.0v 79.45n 5.0v 79.55n 0.0v 89.45n 0.0v 89.55n 0.0v 99.45n 0.0v 99.55n 0.0v 109.45n 0.0v 109.55n 0.0v 119.45n 0.0v 119.55n 0.0v 129.45n 0.0v 129.55n 0.0v 139.45n 0.0v 139.55n 0.0v 149.45n 0.0v 149.55n 0.0v 159.45n 0.0v 159.55n 5.0v 169.45n 5.0v 169.55n 5.0v 179.45n 5.0v 179.55n 5.0v 189.45n 5.0v 189.55n 5.0v 199.45n 5.0v 199.55n 5.0v 209.45n 5.0v 209.55n 5.0v 219.45n 5.0v 219.55n 5.0v 229.45n 5.0v 229.55n 5.0v 239.45n 5.0v 239.55n 5.0v 249.45n 5.0v 249.55n 5.0v 259.45n 5.0v 259.55n 5.0v 269.45n 5.0v 269.55n 5.0v 279.45n 5.0v 279.55n 5.0v 289.45n 5.0v 289.55n 5.0v 299.45n 5.0v 299.55n 0.0v 309.45n 0.0v 309.55n 0.0v 319.45n 0.0v 319.55n 0.0v 329.45n 0.0v 329.55n 0.0v 339.45n 0.0v 339.55n 0.0v 349.45n 0.0v 349.55n 0.0v 359.45n 0.0v 359.55n 0.0v 369.45n 0.0v 369.55n 0.0v 379.45n 0.0v 379.55n 0.0v 389.45n 0.0v 389.55n 5.0v 399.45n 5.0v 399.55n 5.0v 409.45n 5.0v 409.55n 0.0v 419.45n 0.0v 419.55n 0.0v 429.45n 0.0v 429.55n 5.0v 439.45n 5.0v 439.55n 5.0v 449.45n 5.0v 449.55n 0.0v 459.45n 0.0v 459.55n 0.0v 469.45n 0.0v 469.55n 0.0v 479.45n 0.0v 479.55n 5.0v 489.45n 5.0v 489.55n 0.0v 499.45n 0.0v 499.55n 0.0v 509.45n 0.0v 509.55n 0.0v 519.45n 0.0v 519.55n 0.0v 529.45n 0.0v 529.55n 5.0v 539.45n 5.0v 539.55n 5.0v 549.45n 5.0v 549.55n 5.0v 559.45n 5.0v 559.55n 5.0v 569.45n 5.0v 569.55n 5.0v 579.45n 5.0v 579.55n 5.0v 589.45n 5.0v 589.55n 0.0v 599.45n 0.0v 599.55n 5.0v 609.45n 5.0v 609.55n 5.0v 619.45n 5.0v 619.55n 5.0v 629.45n 5.0v 629.55n 5.0v 639.45n 5.0v 639.55n 0.0v 649.45n 0.0v 649.55n 0.0v 659.45n 0.0v 659.55n 0.0v 669.45n 0.0v 669.55n 0.0v 679.45n 0.0v 679.55n 0.0v 689.45n 0.0v 689.55n 0.0v 699.45n 0.0v 699.55n 0.0v 709.45n 0.0v 709.55n 0.0v 719.45n 0.0v 719.55n 0.0v 729.45n 0.0v 729.55n 0.0v 739.45n 0.0v 739.55n 5.0v 749.45n 5.0v 749.55n 5.0v 759.45n 5.0v 759.55n 5.0v 769.45n 5.0v 769.55n 5.0v 779.45n 5.0v 779.55n 5.0v 789.45n 5.0v 789.55n 5.0v 799.45n 5.0v 799.55n 5.0v 809.45n 5.0v 809.55n 5.0v 819.45n 5.0v 819.55n 5.0v 829.45n 5.0v 829.55n 5.0v 839.45n 5.0v 839.55n 5.0v 849.45n 5.0v 849.55n 5.0v 859.45n 5.0v 859.55n 5.0v 869.45n 5.0v 869.55n 5.0v 879.45n 5.0v 879.55n 5.0v 889.45n 5.0v 889.55n 5.0v 899.45n 5.0v 899.55n 5.0v 909.45n 5.0v 909.55n 5.0v 919.45n 5.0v 919.55n 5.0v 929.45n 5.0v 929.55n 5.0v 939.45n 5.0v 939.55n 5.0v 949.45n 5.0v 949.55n 5.0v 959.45n 5.0v 959.55n 5.0v 969.45n 5.0v 969.55n 5.0v 979.45n 5.0v 979.55n 5.0v 989.45n 5.0v 989.55n 5.0v 999.45n 5.0v 999.55n 5.0v 1009.45n 5.0v 1009.55n 5.0v 1019.45n 5.0v 1019.55n 0.0v 1029.45n 0.0v 1029.55n 0.0v 1039.45n 0.0v 1039.55n 0.0v 1049.45n 0.0v 1049.55n 0.0v 1059.45n 0.0v 1059.55n 0.0v 1069.45n 0.0v 1069.55n 0.0v 1079.45n 0.0v 1079.55n 5.0v 1089.45n 5.0v 1089.55n 0.0v 1099.45n 0.0v 1099.55n 0.0v 1109.45n 0.0v 1109.55n 0.0v 1119.45n 0.0v 1119.55n 5.0v 1129.45n 5.0v 1129.55n 5.0v 1139.45n 5.0v 1139.55n 5.0v 1149.45n 5.0v 1149.55n 0.0v 1159.45n 0.0v 1159.55n 5.0v 1169.45n 5.0v 1169.55n 5.0v 1179.45n 5.0v 1179.55n 5.0v 1189.45n 5.0v 1189.55n 0.0v 1199.45n 0.0v 1199.55n 5.0v 1209.45n 5.0v 1209.55n 5.0v 1219.45n 5.0v 1219.55n 5.0v 1229.45n 5.0v 1229.55n 0.0v 1239.45n 0.0v 1239.55n 0.0v 1249.45n 0.0v 1249.55n 0.0v 1259.45n 0.0v 1259.55n 0.0v 1269.45n 0.0v 1269.55n 0.0v 1279.45n 0.0v 1279.55n 5.0v 1289.45n 5.0v 1289.55n 5.0v 1299.45n 5.0v 1299.55n 0.0v 1309.45n 0.0v 1309.55n 5.0v 1319.45n 5.0v 1319.55n 5.0v 1329.45n 5.0v 1329.55n 5.0v 1339.45n 5.0v 1339.55n 5.0v 1349.45n 5.0v 1349.55n 5.0v 1359.45n 5.0v 1359.55n 5.0v 1369.45n 5.0v 1369.55n 5.0v 1379.45n 5.0v 1379.55n 0.0v 1389.45n 0.0v 1389.55n 5.0v 1399.45n 5.0v 1399.55n 5.0v 1409.45n 5.0v 1409.55n 5.0v 1419.45n 5.0v 1419.55n 5.0v 1429.45n 5.0v 1429.55n 5.0v 1439.45n 5.0v 1439.55n 5.0v 1449.45n 5.0v 1449.55n 5.0v 1459.45n 5.0v 1459.55n 5.0v 1469.45n 5.0v 1469.55n 5.0v 1479.45n 5.0v 1479.55n 0.0v 1489.45n 0.0v 1489.55n 0.0v 1499.45n 0.0v 1499.55n 5.0v 1509.45n 5.0v 1509.55n 0.0v 1519.45n 0.0v 1519.55n 5.0v 1529.45n 5.0v 1529.55n 0.0v 1539.45n 0.0v 1539.55n 5.0v 1549.45n 5.0v 1549.55n 0.0v 1559.45n 0.0v 1559.55n 5.0v 1569.45n 5.0v 1569.55n 5.0v 1579.45n 5.0v 1579.55n 5.0v 1589.45n 5.0v 1589.55n 0.0v 1599.45n 0.0v 1599.55n 0.0v 1609.45n 0.0v 1609.55n 0.0v 1619.45n 0.0v 1619.55n 0.0v 1629.45n 0.0v 1629.55n 0.0v 1639.45n 0.0v 1639.55n 0.0v 1649.45n 0.0v 1649.55n 0.0v 1659.45n 0.0v 1659.55n 0.0v 1669.45n 0.0v 1669.55n 0.0v 1679.45n 0.0v 1679.55n 0.0v 1689.45n 0.0v 1689.55n 0.0v 1699.45n 0.0v 1699.55n 0.0v 1709.45n 0.0v 1709.55n 0.0v 1719.45n 0.0v 1719.55n 0.0v 1729.45n 0.0v 1729.55n 0.0v 1739.45n 0.0v 1739.55n 0.0v 1749.45n 0.0v 1749.55n 0.0v 1759.45n 0.0v 1759.55n 0.0v 1769.45n 0.0v 1769.55n 5.0v 1779.45n 5.0v 1779.55n 0.0v 1789.45n 0.0v 1789.55n 0.0v 1799.45n 0.0v 1799.55n 0.0v 1809.45n 0.0v 1809.55n 0.0v 1819.45n 0.0v 1819.55n 0.0v 1829.45n 0.0v 1829.55n 0.0v 1839.45n 0.0v 1839.55n 5.0v 1849.45n 5.0v 1849.55n 0.0v 1859.45n 0.0v 1859.55n 5.0v 1869.45n 5.0v 1869.55n 5.0v 1879.45n 5.0v 1879.55n 0.0v 1889.45n 0.0v 1889.55n 0.0v 1899.45n 0.0v 1899.55n 0.0v 1909.45n 0.0v 1909.55n 0.0v 1919.45n 0.0v 1919.55n 0.0v 1929.45n 0.0v 1929.55n 5.0v 1939.45n 5.0v 1939.55n 5.0v 1949.45n 5.0v 1949.55n 5.0v 1959.45n 5.0v 1959.55n 5.0v 1969.45n 5.0v 1969.55n 5.0v 1979.45n 5.0v 1979.55n 5.0v 1989.45n 5.0v 1989.55n 5.0v 1999.45n 5.0v 1999.55n 5.0v 2009.45n 5.0v 2009.55n 5.0v 2019.45n 5.0v 2019.55n 5.0v 2029.45n 5.0v 2029.55n 0.0v 2039.45n 0.0v 2039.55n 0.0v 2049.45n 0.0v 2049.55n 0.0v )
* (time, data): [(0, 0), (10, 1), (20, 0), (30, 0), (40, 0), (50, 0), (60, 0), (70, 0), (80, 1), (90, 1), (100, 1), (110, 1), (120, 1), (130, 0), (140, 0), (150, 0), (160, 1), (170, 1), (180, 1), (190, 1), (200, 1), (210, 1), (220, 0), (230, 0), (240, 0), (250, 1), (260, 1), (270, 1), (280, 1), (290, 1), (300, 1), (310, 1), (320, 1), (330, 1), (340, 1), (350, 1), (360, 1), (370, 1), (380, 1), (390, 1), (400, 0), (410, 1), (420, 0), (430, 0), (440, 0), (450, 1), (460, 1), (470, 0), (480, 0), (490, 0), (500, 0), (510, 1), (520, 1), (530, 1), (540, 0), (550, 0), (560, 0), (570, 0), (580, 0), (590, 0), (600, 0), (610, 0), (620, 0), (630, 0), (640, 0), (650, 0), (660, 1), (670, 0), (680, 1), (690, 1), (700, 1), (710, 1), (720, 1), (730, 1), (740, 0), (750, 1), (760, 0), (770, 0), (780, 1), (790, 1), (800, 1), (810, 1), (820, 0), (830, 0), (840, 0), (850, 1), (860, 1), (870, 1), (880, 1), (890, 1), (900, 1), (910, 0), (920, 0), (930, 0), (940, 0), (950, 1), (960, 1), (970, 1), (980, 1), (990, 1), (1000, 0), (1010, 0), (1020, 0), (1030, 0), (1040, 0), (1050, 0), (1060, 0), (1070, 1), (1080, 1), (1090, 1), (1100, 1), (1110, 0), (1120, 1), (1130, 1), (1140, 1), (1150, 1), (1160, 1), (1170, 1), (1180, 1), (1190, 1), (1200, 0), (1210, 0), (1220, 0), (1230, 1), (1240, 1), (1250, 1), (1260, 1), (1270, 1), (1280, 1), (1290, 1), (1300, 1), (1310, 0), (1320, 1), (1330, 0), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 0), (1390, 0), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 0), (1450, 0), (1460, 0), (1470, 0), (1480, 0), (1490, 0), (1500, 0), (1510, 1), (1520, 0), (1530, 1), (1540, 1), (1550, 1), (1560, 0), (1570, 0), (1580, 0), (1590, 0), (1600, 0), (1610, 0), (1620, 0), (1630, 0), (1640, 0), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 0), (1700, 0), (1710, 0), (1720, 1), (1730, 1), (1740, 1), (1750, 1), (1760, 0), (1770, 0), (1780, 0), (1790, 0), (1800, 0), (1810, 0), (1820, 0), (1830, 0), (1840, 0), (1850, 0), (1860, 0), (1870, 0), (1880, 1), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 1), (1940, 1), (1950, 1), (1960, 1), (1970, 0), (1980, 1), (1990, 1), (2000, 1), (2010, 1), (2020, 1), (2030, 0), (2040, 0), (2050, 0)]
Vdin0_18  din0_18  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 5.0v 19.45n 5.0v 19.55n 0.0v 29.45n 0.0v 29.55n 0.0v 39.45n 0.0v 39.55n 0.0v 49.45n 0.0v 49.55n 0.0v 59.45n 0.0v 59.55n 0.0v 69.45n 0.0v 69.55n 0.0v 79.45n 0.0v 79.55n 5.0v 89.45n 5.0v 89.55n 5.0v 99.45n 5.0v 99.55n 5.0v 109.45n 5.0v 109.55n 5.0v 119.45n 5.0v 119.55n 5.0v 129.45n 5.0v 129.55n 0.0v 139.45n 0.0v 139.55n 0.0v 149.45n 0.0v 149.55n 0.0v 159.45n 0.0v 159.55n 5.0v 169.45n 5.0v 169.55n 5.0v 179.45n 5.0v 179.55n 5.0v 189.45n 5.0v 189.55n 5.0v 199.45n 5.0v 199.55n 5.0v 209.45n 5.0v 209.55n 5.0v 219.45n 5.0v 219.55n 0.0v 229.45n 0.0v 229.55n 0.0v 239.45n 0.0v 239.55n 0.0v 249.45n 0.0v 249.55n 5.0v 259.45n 5.0v 259.55n 5.0v 269.45n 5.0v 269.55n 5.0v 279.45n 5.0v 279.55n 5.0v 289.45n 5.0v 289.55n 5.0v 299.45n 5.0v 299.55n 5.0v 309.45n 5.0v 309.55n 5.0v 319.45n 5.0v 319.55n 5.0v 329.45n 5.0v 329.55n 5.0v 339.45n 5.0v 339.55n 5.0v 349.45n 5.0v 349.55n 5.0v 359.45n 5.0v 359.55n 5.0v 369.45n 5.0v 369.55n 5.0v 379.45n 5.0v 379.55n 5.0v 389.45n 5.0v 389.55n 5.0v 399.45n 5.0v 399.55n 0.0v 409.45n 0.0v 409.55n 5.0v 419.45n 5.0v 419.55n 0.0v 429.45n 0.0v 429.55n 0.0v 439.45n 0.0v 439.55n 0.0v 449.45n 0.0v 449.55n 5.0v 459.45n 5.0v 459.55n 5.0v 469.45n 5.0v 469.55n 0.0v 479.45n 0.0v 479.55n 0.0v 489.45n 0.0v 489.55n 0.0v 499.45n 0.0v 499.55n 0.0v 509.45n 0.0v 509.55n 5.0v 519.45n 5.0v 519.55n 5.0v 529.45n 5.0v 529.55n 5.0v 539.45n 5.0v 539.55n 0.0v 549.45n 0.0v 549.55n 0.0v 559.45n 0.0v 559.55n 0.0v 569.45n 0.0v 569.55n 0.0v 579.45n 0.0v 579.55n 0.0v 589.45n 0.0v 589.55n 0.0v 599.45n 0.0v 599.55n 0.0v 609.45n 0.0v 609.55n 0.0v 619.45n 0.0v 619.55n 0.0v 629.45n 0.0v 629.55n 0.0v 639.45n 0.0v 639.55n 0.0v 649.45n 0.0v 649.55n 0.0v 659.45n 0.0v 659.55n 5.0v 669.45n 5.0v 669.55n 0.0v 679.45n 0.0v 679.55n 5.0v 689.45n 5.0v 689.55n 5.0v 699.45n 5.0v 699.55n 5.0v 709.45n 5.0v 709.55n 5.0v 719.45n 5.0v 719.55n 5.0v 729.45n 5.0v 729.55n 5.0v 739.45n 5.0v 739.55n 0.0v 749.45n 0.0v 749.55n 5.0v 759.45n 5.0v 759.55n 0.0v 769.45n 0.0v 769.55n 0.0v 779.45n 0.0v 779.55n 5.0v 789.45n 5.0v 789.55n 5.0v 799.45n 5.0v 799.55n 5.0v 809.45n 5.0v 809.55n 5.0v 819.45n 5.0v 819.55n 0.0v 829.45n 0.0v 829.55n 0.0v 839.45n 0.0v 839.55n 0.0v 849.45n 0.0v 849.55n 5.0v 859.45n 5.0v 859.55n 5.0v 869.45n 5.0v 869.55n 5.0v 879.45n 5.0v 879.55n 5.0v 889.45n 5.0v 889.55n 5.0v 899.45n 5.0v 899.55n 5.0v 909.45n 5.0v 909.55n 0.0v 919.45n 0.0v 919.55n 0.0v 929.45n 0.0v 929.55n 0.0v 939.45n 0.0v 939.55n 0.0v 949.45n 0.0v 949.55n 5.0v 959.45n 5.0v 959.55n 5.0v 969.45n 5.0v 969.55n 5.0v 979.45n 5.0v 979.55n 5.0v 989.45n 5.0v 989.55n 5.0v 999.45n 5.0v 999.55n 0.0v 1009.45n 0.0v 1009.55n 0.0v 1019.45n 0.0v 1019.55n 0.0v 1029.45n 0.0v 1029.55n 0.0v 1039.45n 0.0v 1039.55n 0.0v 1049.45n 0.0v 1049.55n 0.0v 1059.45n 0.0v 1059.55n 0.0v 1069.45n 0.0v 1069.55n 5.0v 1079.45n 5.0v 1079.55n 5.0v 1089.45n 5.0v 1089.55n 5.0v 1099.45n 5.0v 1099.55n 5.0v 1109.45n 5.0v 1109.55n 0.0v 1119.45n 0.0v 1119.55n 5.0v 1129.45n 5.0v 1129.55n 5.0v 1139.45n 5.0v 1139.55n 5.0v 1149.45n 5.0v 1149.55n 5.0v 1159.45n 5.0v 1159.55n 5.0v 1169.45n 5.0v 1169.55n 5.0v 1179.45n 5.0v 1179.55n 5.0v 1189.45n 5.0v 1189.55n 5.0v 1199.45n 5.0v 1199.55n 0.0v 1209.45n 0.0v 1209.55n 0.0v 1219.45n 0.0v 1219.55n 0.0v 1229.45n 0.0v 1229.55n 5.0v 1239.45n 5.0v 1239.55n 5.0v 1249.45n 5.0v 1249.55n 5.0v 1259.45n 5.0v 1259.55n 5.0v 1269.45n 5.0v 1269.55n 5.0v 1279.45n 5.0v 1279.55n 5.0v 1289.45n 5.0v 1289.55n 5.0v 1299.45n 5.0v 1299.55n 5.0v 1309.45n 5.0v 1309.55n 0.0v 1319.45n 0.0v 1319.55n 5.0v 1329.45n 5.0v 1329.55n 0.0v 1339.45n 0.0v 1339.55n 0.0v 1349.45n 0.0v 1349.55n 0.0v 1359.45n 0.0v 1359.55n 0.0v 1369.45n 0.0v 1369.55n 0.0v 1379.45n 0.0v 1379.55n 0.0v 1389.45n 0.0v 1389.55n 0.0v 1399.45n 0.0v 1399.55n 0.0v 1409.45n 0.0v 1409.55n 0.0v 1419.45n 0.0v 1419.55n 0.0v 1429.45n 0.0v 1429.55n 0.0v 1439.45n 0.0v 1439.55n 0.0v 1449.45n 0.0v 1449.55n 0.0v 1459.45n 0.0v 1459.55n 0.0v 1469.45n 0.0v 1469.55n 0.0v 1479.45n 0.0v 1479.55n 0.0v 1489.45n 0.0v 1489.55n 0.0v 1499.45n 0.0v 1499.55n 0.0v 1509.45n 0.0v 1509.55n 5.0v 1519.45n 5.0v 1519.55n 0.0v 1529.45n 0.0v 1529.55n 5.0v 1539.45n 5.0v 1539.55n 5.0v 1549.45n 5.0v 1549.55n 5.0v 1559.45n 5.0v 1559.55n 0.0v 1569.45n 0.0v 1569.55n 0.0v 1579.45n 0.0v 1579.55n 0.0v 1589.45n 0.0v 1589.55n 0.0v 1599.45n 0.0v 1599.55n 0.0v 1609.45n 0.0v 1609.55n 0.0v 1619.45n 0.0v 1619.55n 0.0v 1629.45n 0.0v 1629.55n 0.0v 1639.45n 0.0v 1639.55n 0.0v 1649.45n 0.0v 1649.55n 0.0v 1659.45n 0.0v 1659.55n 0.0v 1669.45n 0.0v 1669.55n 0.0v 1679.45n 0.0v 1679.55n 0.0v 1689.45n 0.0v 1689.55n 0.0v 1699.45n 0.0v 1699.55n 0.0v 1709.45n 0.0v 1709.55n 0.0v 1719.45n 0.0v 1719.55n 5.0v 1729.45n 5.0v 1729.55n 5.0v 1739.45n 5.0v 1739.55n 5.0v 1749.45n 5.0v 1749.55n 5.0v 1759.45n 5.0v 1759.55n 0.0v 1769.45n 0.0v 1769.55n 0.0v 1779.45n 0.0v 1779.55n 0.0v 1789.45n 0.0v 1789.55n 0.0v 1799.45n 0.0v 1799.55n 0.0v 1809.45n 0.0v 1809.55n 0.0v 1819.45n 0.0v 1819.55n 0.0v 1829.45n 0.0v 1829.55n 0.0v 1839.45n 0.0v 1839.55n 0.0v 1849.45n 0.0v 1849.55n 0.0v 1859.45n 0.0v 1859.55n 0.0v 1869.45n 0.0v 1869.55n 0.0v 1879.45n 0.0v 1879.55n 5.0v 1889.45n 5.0v 1889.55n 0.0v 1899.45n 0.0v 1899.55n 0.0v 1909.45n 0.0v 1909.55n 0.0v 1919.45n 0.0v 1919.55n 0.0v 1929.45n 0.0v 1929.55n 5.0v 1939.45n 5.0v 1939.55n 5.0v 1949.45n 5.0v 1949.55n 5.0v 1959.45n 5.0v 1959.55n 5.0v 1969.45n 5.0v 1969.55n 0.0v 1979.45n 0.0v 1979.55n 5.0v 1989.45n 5.0v 1989.55n 5.0v 1999.45n 5.0v 1999.55n 5.0v 2009.45n 5.0v 2009.55n 5.0v 2019.45n 5.0v 2019.55n 5.0v 2029.45n 5.0v 2029.55n 0.0v 2039.45n 0.0v 2039.55n 0.0v 2049.45n 0.0v 2049.55n 0.0v )
* (time, data): [(0, 0), (10, 1), (20, 0), (30, 1), (40, 1), (50, 0), (60, 0), (70, 1), (80, 1), (90, 1), (100, 1), (110, 1), (120, 1), (130, 1), (140, 1), (150, 0), (160, 0), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 1), (230, 1), (240, 1), (250, 0), (260, 0), (270, 0), (280, 0), (290, 0), (300, 0), (310, 0), (320, 0), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 0), (390, 1), (400, 1), (410, 1), (420, 1), (430, 1), (440, 1), (450, 0), (460, 0), (470, 0), (480, 0), (490, 1), (500, 1), (510, 1), (520, 1), (530, 0), (540, 0), (550, 0), (560, 0), (570, 0), (580, 0), (590, 1), (600, 0), (610, 0), (620, 0), (630, 0), (640, 1), (650, 1), (660, 1), (670, 0), (680, 0), (690, 0), (700, 0), (710, 0), (720, 0), (730, 0), (740, 0), (750, 1), (760, 1), (770, 1), (780, 1), (790, 1), (800, 1), (810, 1), (820, 0), (830, 0), (840, 0), (850, 1), (860, 1), (870, 1), (880, 1), (890, 1), (900, 1), (910, 0), (920, 0), (930, 0), (940, 0), (950, 1), (960, 1), (970, 0), (980, 0), (990, 0), (1000, 1), (1010, 1), (1020, 0), (1030, 0), (1040, 0), (1050, 0), (1060, 0), (1070, 1), (1080, 1), (1090, 0), (1100, 0), (1110, 0), (1120, 1), (1130, 1), (1140, 1), (1150, 0), (1160, 1), (1170, 1), (1180, 1), (1190, 1), (1200, 0), (1210, 0), (1220, 1), (1230, 1), (1240, 1), (1250, 1), (1260, 1), (1270, 1), (1280, 0), (1290, 0), (1300, 0), (1310, 0), (1320, 1), (1330, 0), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 1), (1390, 1), (1400, 1), (1410, 1), (1420, 1), (1430, 1), (1440, 1), (1450, 1), (1460, 1), (1470, 1), (1480, 0), (1490, 0), (1500, 0), (1510, 1), (1520, 1), (1530, 1), (1540, 0), (1550, 0), (1560, 0), (1570, 0), (1580, 0), (1590, 1), (1600, 1), (1610, 1), (1620, 1), (1630, 1), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 1), (1700, 1), (1710, 1), (1720, 0), (1730, 1), (1740, 1), (1750, 1), (1760, 1), (1770, 1), (1780, 1), (1790, 1), (1800, 1), (1810, 0), (1820, 0), (1830, 0), (1840, 0), (1850, 1), (1860, 0), (1870, 0), (1880, 0), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 0), (1940, 0), (1950, 0), (1960, 0), (1970, 0), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 0), (2030, 0), (2040, 0), (2050, 0)]
Vdin0_19  din0_19  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 5.0v 19.45n 5.0v 19.55n 0.0v 29.45n 0.0v 29.55n 5.0v 39.45n 5.0v 39.55n 5.0v 49.45n 5.0v 49.55n 0.0v 59.45n 0.0v 59.55n 0.0v 69.45n 0.0v 69.55n 5.0v 79.45n 5.0v 79.55n 5.0v 89.45n 5.0v 89.55n 5.0v 99.45n 5.0v 99.55n 5.0v 109.45n 5.0v 109.55n 5.0v 119.45n 5.0v 119.55n 5.0v 129.45n 5.0v 129.55n 5.0v 139.45n 5.0v 139.55n 5.0v 149.45n 5.0v 149.55n 0.0v 159.45n 0.0v 159.55n 0.0v 169.45n 0.0v 169.55n 0.0v 179.45n 0.0v 179.55n 0.0v 189.45n 0.0v 189.55n 0.0v 199.45n 0.0v 199.55n 0.0v 209.45n 0.0v 209.55n 0.0v 219.45n 0.0v 219.55n 5.0v 229.45n 5.0v 229.55n 5.0v 239.45n 5.0v 239.55n 5.0v 249.45n 5.0v 249.55n 0.0v 259.45n 0.0v 259.55n 0.0v 269.45n 0.0v 269.55n 0.0v 279.45n 0.0v 279.55n 0.0v 289.45n 0.0v 289.55n 0.0v 299.45n 0.0v 299.55n 0.0v 309.45n 0.0v 309.55n 0.0v 319.45n 0.0v 319.55n 0.0v 329.45n 0.0v 329.55n 0.0v 339.45n 0.0v 339.55n 0.0v 349.45n 0.0v 349.55n 0.0v 359.45n 0.0v 359.55n 0.0v 369.45n 0.0v 369.55n 0.0v 379.45n 0.0v 379.55n 0.0v 389.45n 0.0v 389.55n 5.0v 399.45n 5.0v 399.55n 5.0v 409.45n 5.0v 409.55n 5.0v 419.45n 5.0v 419.55n 5.0v 429.45n 5.0v 429.55n 5.0v 439.45n 5.0v 439.55n 5.0v 449.45n 5.0v 449.55n 0.0v 459.45n 0.0v 459.55n 0.0v 469.45n 0.0v 469.55n 0.0v 479.45n 0.0v 479.55n 0.0v 489.45n 0.0v 489.55n 5.0v 499.45n 5.0v 499.55n 5.0v 509.45n 5.0v 509.55n 5.0v 519.45n 5.0v 519.55n 5.0v 529.45n 5.0v 529.55n 0.0v 539.45n 0.0v 539.55n 0.0v 549.45n 0.0v 549.55n 0.0v 559.45n 0.0v 559.55n 0.0v 569.45n 0.0v 569.55n 0.0v 579.45n 0.0v 579.55n 0.0v 589.45n 0.0v 589.55n 5.0v 599.45n 5.0v 599.55n 0.0v 609.45n 0.0v 609.55n 0.0v 619.45n 0.0v 619.55n 0.0v 629.45n 0.0v 629.55n 0.0v 639.45n 0.0v 639.55n 5.0v 649.45n 5.0v 649.55n 5.0v 659.45n 5.0v 659.55n 5.0v 669.45n 5.0v 669.55n 0.0v 679.45n 0.0v 679.55n 0.0v 689.45n 0.0v 689.55n 0.0v 699.45n 0.0v 699.55n 0.0v 709.45n 0.0v 709.55n 0.0v 719.45n 0.0v 719.55n 0.0v 729.45n 0.0v 729.55n 0.0v 739.45n 0.0v 739.55n 0.0v 749.45n 0.0v 749.55n 5.0v 759.45n 5.0v 759.55n 5.0v 769.45n 5.0v 769.55n 5.0v 779.45n 5.0v 779.55n 5.0v 789.45n 5.0v 789.55n 5.0v 799.45n 5.0v 799.55n 5.0v 809.45n 5.0v 809.55n 5.0v 819.45n 5.0v 819.55n 0.0v 829.45n 0.0v 829.55n 0.0v 839.45n 0.0v 839.55n 0.0v 849.45n 0.0v 849.55n 5.0v 859.45n 5.0v 859.55n 5.0v 869.45n 5.0v 869.55n 5.0v 879.45n 5.0v 879.55n 5.0v 889.45n 5.0v 889.55n 5.0v 899.45n 5.0v 899.55n 5.0v 909.45n 5.0v 909.55n 0.0v 919.45n 0.0v 919.55n 0.0v 929.45n 0.0v 929.55n 0.0v 939.45n 0.0v 939.55n 0.0v 949.45n 0.0v 949.55n 5.0v 959.45n 5.0v 959.55n 5.0v 969.45n 5.0v 969.55n 0.0v 979.45n 0.0v 979.55n 0.0v 989.45n 0.0v 989.55n 0.0v 999.45n 0.0v 999.55n 5.0v 1009.45n 5.0v 1009.55n 5.0v 1019.45n 5.0v 1019.55n 0.0v 1029.45n 0.0v 1029.55n 0.0v 1039.45n 0.0v 1039.55n 0.0v 1049.45n 0.0v 1049.55n 0.0v 1059.45n 0.0v 1059.55n 0.0v 1069.45n 0.0v 1069.55n 5.0v 1079.45n 5.0v 1079.55n 5.0v 1089.45n 5.0v 1089.55n 0.0v 1099.45n 0.0v 1099.55n 0.0v 1109.45n 0.0v 1109.55n 0.0v 1119.45n 0.0v 1119.55n 5.0v 1129.45n 5.0v 1129.55n 5.0v 1139.45n 5.0v 1139.55n 5.0v 1149.45n 5.0v 1149.55n 0.0v 1159.45n 0.0v 1159.55n 5.0v 1169.45n 5.0v 1169.55n 5.0v 1179.45n 5.0v 1179.55n 5.0v 1189.45n 5.0v 1189.55n 5.0v 1199.45n 5.0v 1199.55n 0.0v 1209.45n 0.0v 1209.55n 0.0v 1219.45n 0.0v 1219.55n 5.0v 1229.45n 5.0v 1229.55n 5.0v 1239.45n 5.0v 1239.55n 5.0v 1249.45n 5.0v 1249.55n 5.0v 1259.45n 5.0v 1259.55n 5.0v 1269.45n 5.0v 1269.55n 5.0v 1279.45n 5.0v 1279.55n 0.0v 1289.45n 0.0v 1289.55n 0.0v 1299.45n 0.0v 1299.55n 0.0v 1309.45n 0.0v 1309.55n 0.0v 1319.45n 0.0v 1319.55n 5.0v 1329.45n 5.0v 1329.55n 0.0v 1339.45n 0.0v 1339.55n 0.0v 1349.45n 0.0v 1349.55n 0.0v 1359.45n 0.0v 1359.55n 0.0v 1369.45n 0.0v 1369.55n 0.0v 1379.45n 0.0v 1379.55n 5.0v 1389.45n 5.0v 1389.55n 5.0v 1399.45n 5.0v 1399.55n 5.0v 1409.45n 5.0v 1409.55n 5.0v 1419.45n 5.0v 1419.55n 5.0v 1429.45n 5.0v 1429.55n 5.0v 1439.45n 5.0v 1439.55n 5.0v 1449.45n 5.0v 1449.55n 5.0v 1459.45n 5.0v 1459.55n 5.0v 1469.45n 5.0v 1469.55n 5.0v 1479.45n 5.0v 1479.55n 0.0v 1489.45n 0.0v 1489.55n 0.0v 1499.45n 0.0v 1499.55n 0.0v 1509.45n 0.0v 1509.55n 5.0v 1519.45n 5.0v 1519.55n 5.0v 1529.45n 5.0v 1529.55n 5.0v 1539.45n 5.0v 1539.55n 0.0v 1549.45n 0.0v 1549.55n 0.0v 1559.45n 0.0v 1559.55n 0.0v 1569.45n 0.0v 1569.55n 0.0v 1579.45n 0.0v 1579.55n 0.0v 1589.45n 0.0v 1589.55n 5.0v 1599.45n 5.0v 1599.55n 5.0v 1609.45n 5.0v 1609.55n 5.0v 1619.45n 5.0v 1619.55n 5.0v 1629.45n 5.0v 1629.55n 5.0v 1639.45n 5.0v 1639.55n 5.0v 1649.45n 5.0v 1649.55n 5.0v 1659.45n 5.0v 1659.55n 5.0v 1669.45n 5.0v 1669.55n 5.0v 1679.45n 5.0v 1679.55n 5.0v 1689.45n 5.0v 1689.55n 5.0v 1699.45n 5.0v 1699.55n 5.0v 1709.45n 5.0v 1709.55n 5.0v 1719.45n 5.0v 1719.55n 0.0v 1729.45n 0.0v 1729.55n 5.0v 1739.45n 5.0v 1739.55n 5.0v 1749.45n 5.0v 1749.55n 5.0v 1759.45n 5.0v 1759.55n 5.0v 1769.45n 5.0v 1769.55n 5.0v 1779.45n 5.0v 1779.55n 5.0v 1789.45n 5.0v 1789.55n 5.0v 1799.45n 5.0v 1799.55n 5.0v 1809.45n 5.0v 1809.55n 0.0v 1819.45n 0.0v 1819.55n 0.0v 1829.45n 0.0v 1829.55n 0.0v 1839.45n 0.0v 1839.55n 0.0v 1849.45n 0.0v 1849.55n 5.0v 1859.45n 5.0v 1859.55n 0.0v 1869.45n 0.0v 1869.55n 0.0v 1879.45n 0.0v 1879.55n 0.0v 1889.45n 0.0v 1889.55n 0.0v 1899.45n 0.0v 1899.55n 0.0v 1909.45n 0.0v 1909.55n 0.0v 1919.45n 0.0v 1919.55n 0.0v 1929.45n 0.0v 1929.55n 0.0v 1939.45n 0.0v 1939.55n 0.0v 1949.45n 0.0v 1949.55n 0.0v 1959.45n 0.0v 1959.55n 0.0v 1969.45n 0.0v 1969.55n 0.0v 1979.45n 0.0v 1979.55n 0.0v 1989.45n 0.0v 1989.55n 0.0v 1999.45n 0.0v 1999.55n 0.0v 2009.45n 0.0v 2009.55n 0.0v 2019.45n 0.0v 2019.55n 0.0v 2029.45n 0.0v 2029.55n 0.0v 2039.45n 0.0v 2039.55n 0.0v 2049.45n 0.0v 2049.55n 0.0v )
* (time, data): [(0, 0), (10, 1), (20, 0), (30, 1), (40, 1), (50, 1), (60, 1), (70, 1), (80, 0), (90, 0), (100, 0), (110, 0), (120, 0), (130, 1), (140, 1), (150, 0), (160, 0), (170, 1), (180, 1), (190, 1), (200, 1), (210, 1), (220, 1), (230, 1), (240, 1), (250, 1), (260, 1), (270, 1), (280, 0), (290, 0), (300, 0), (310, 0), (320, 0), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 0), (390, 0), (400, 1), (410, 1), (420, 0), (430, 1), (440, 1), (450, 0), (460, 0), (470, 1), (480, 0), (490, 1), (500, 1), (510, 1), (520, 1), (530, 0), (540, 1), (550, 1), (560, 1), (570, 1), (580, 1), (590, 1), (600, 0), (610, 1), (620, 1), (630, 1), (640, 1), (650, 1), (660, 0), (670, 1), (680, 1), (690, 1), (700, 1), (710, 1), (720, 0), (730, 0), (740, 0), (750, 1), (760, 0), (770, 0), (780, 0), (790, 0), (800, 0), (810, 0), (820, 0), (830, 0), (840, 0), (850, 0), (860, 0), (870, 0), (880, 0), (890, 0), (900, 0), (910, 0), (920, 0), (930, 0), (940, 0), (950, 1), (960, 1), (970, 0), (980, 0), (990, 0), (1000, 1), (1010, 1), (1020, 1), (1030, 1), (1040, 1), (1050, 1), (1060, 1), (1070, 0), (1080, 0), (1090, 1), (1100, 1), (1110, 0), (1120, 1), (1130, 1), (1140, 1), (1150, 1), (1160, 0), (1170, 0), (1180, 0), (1190, 1), (1200, 0), (1210, 0), (1220, 0), (1230, 1), (1240, 1), (1250, 1), (1260, 1), (1270, 1), (1280, 0), (1290, 0), (1300, 0), (1310, 0), (1320, 0), (1330, 0), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 1), (1390, 0), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 0), (1450, 0), (1460, 0), (1470, 0), (1480, 1), (1490, 1), (1500, 1), (1510, 1), (1520, 1), (1530, 1), (1540, 1), (1550, 0), (1560, 0), (1570, 0), (1580, 0), (1590, 0), (1600, 0), (1610, 0), (1620, 0), (1630, 0), (1640, 0), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 0), (1700, 0), (1710, 0), (1720, 0), (1730, 1), (1740, 1), (1750, 1), (1760, 0), (1770, 0), (1780, 1), (1790, 1), (1800, 1), (1810, 1), (1820, 1), (1830, 1), (1840, 0), (1850, 1), (1860, 1), (1870, 1), (1880, 0), (1890, 1), (1900, 1), (1910, 1), (1920, 1), (1930, 0), (1940, 0), (1950, 0), (1960, 0), (1970, 0), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 0), (2030, 1), (2040, 1), (2050, 1)]
Vdin0_20  din0_20  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 5.0v 19.45n 5.0v 19.55n 0.0v 29.45n 0.0v 29.55n 5.0v 39.45n 5.0v 39.55n 5.0v 49.45n 5.0v 49.55n 5.0v 59.45n 5.0v 59.55n 5.0v 69.45n 5.0v 69.55n 5.0v 79.45n 5.0v 79.55n 0.0v 89.45n 0.0v 89.55n 0.0v 99.45n 0.0v 99.55n 0.0v 109.45n 0.0v 109.55n 0.0v 119.45n 0.0v 119.55n 0.0v 129.45n 0.0v 129.55n 5.0v 139.45n 5.0v 139.55n 5.0v 149.45n 5.0v 149.55n 0.0v 159.45n 0.0v 159.55n 0.0v 169.45n 0.0v 169.55n 5.0v 179.45n 5.0v 179.55n 5.0v 189.45n 5.0v 189.55n 5.0v 199.45n 5.0v 199.55n 5.0v 209.45n 5.0v 209.55n 5.0v 219.45n 5.0v 219.55n 5.0v 229.45n 5.0v 229.55n 5.0v 239.45n 5.0v 239.55n 5.0v 249.45n 5.0v 249.55n 5.0v 259.45n 5.0v 259.55n 5.0v 269.45n 5.0v 269.55n 5.0v 279.45n 5.0v 279.55n 0.0v 289.45n 0.0v 289.55n 0.0v 299.45n 0.0v 299.55n 0.0v 309.45n 0.0v 309.55n 0.0v 319.45n 0.0v 319.55n 0.0v 329.45n 0.0v 329.55n 0.0v 339.45n 0.0v 339.55n 0.0v 349.45n 0.0v 349.55n 0.0v 359.45n 0.0v 359.55n 0.0v 369.45n 0.0v 369.55n 0.0v 379.45n 0.0v 379.55n 0.0v 389.45n 0.0v 389.55n 0.0v 399.45n 0.0v 399.55n 5.0v 409.45n 5.0v 409.55n 5.0v 419.45n 5.0v 419.55n 0.0v 429.45n 0.0v 429.55n 5.0v 439.45n 5.0v 439.55n 5.0v 449.45n 5.0v 449.55n 0.0v 459.45n 0.0v 459.55n 0.0v 469.45n 0.0v 469.55n 5.0v 479.45n 5.0v 479.55n 0.0v 489.45n 0.0v 489.55n 5.0v 499.45n 5.0v 499.55n 5.0v 509.45n 5.0v 509.55n 5.0v 519.45n 5.0v 519.55n 5.0v 529.45n 5.0v 529.55n 0.0v 539.45n 0.0v 539.55n 5.0v 549.45n 5.0v 549.55n 5.0v 559.45n 5.0v 559.55n 5.0v 569.45n 5.0v 569.55n 5.0v 579.45n 5.0v 579.55n 5.0v 589.45n 5.0v 589.55n 5.0v 599.45n 5.0v 599.55n 0.0v 609.45n 0.0v 609.55n 5.0v 619.45n 5.0v 619.55n 5.0v 629.45n 5.0v 629.55n 5.0v 639.45n 5.0v 639.55n 5.0v 649.45n 5.0v 649.55n 5.0v 659.45n 5.0v 659.55n 0.0v 669.45n 0.0v 669.55n 5.0v 679.45n 5.0v 679.55n 5.0v 689.45n 5.0v 689.55n 5.0v 699.45n 5.0v 699.55n 5.0v 709.45n 5.0v 709.55n 5.0v 719.45n 5.0v 719.55n 0.0v 729.45n 0.0v 729.55n 0.0v 739.45n 0.0v 739.55n 0.0v 749.45n 0.0v 749.55n 5.0v 759.45n 5.0v 759.55n 0.0v 769.45n 0.0v 769.55n 0.0v 779.45n 0.0v 779.55n 0.0v 789.45n 0.0v 789.55n 0.0v 799.45n 0.0v 799.55n 0.0v 809.45n 0.0v 809.55n 0.0v 819.45n 0.0v 819.55n 0.0v 829.45n 0.0v 829.55n 0.0v 839.45n 0.0v 839.55n 0.0v 849.45n 0.0v 849.55n 0.0v 859.45n 0.0v 859.55n 0.0v 869.45n 0.0v 869.55n 0.0v 879.45n 0.0v 879.55n 0.0v 889.45n 0.0v 889.55n 0.0v 899.45n 0.0v 899.55n 0.0v 909.45n 0.0v 909.55n 0.0v 919.45n 0.0v 919.55n 0.0v 929.45n 0.0v 929.55n 0.0v 939.45n 0.0v 939.55n 0.0v 949.45n 0.0v 949.55n 5.0v 959.45n 5.0v 959.55n 5.0v 969.45n 5.0v 969.55n 0.0v 979.45n 0.0v 979.55n 0.0v 989.45n 0.0v 989.55n 0.0v 999.45n 0.0v 999.55n 5.0v 1009.45n 5.0v 1009.55n 5.0v 1019.45n 5.0v 1019.55n 5.0v 1029.45n 5.0v 1029.55n 5.0v 1039.45n 5.0v 1039.55n 5.0v 1049.45n 5.0v 1049.55n 5.0v 1059.45n 5.0v 1059.55n 5.0v 1069.45n 5.0v 1069.55n 0.0v 1079.45n 0.0v 1079.55n 0.0v 1089.45n 0.0v 1089.55n 5.0v 1099.45n 5.0v 1099.55n 5.0v 1109.45n 5.0v 1109.55n 0.0v 1119.45n 0.0v 1119.55n 5.0v 1129.45n 5.0v 1129.55n 5.0v 1139.45n 5.0v 1139.55n 5.0v 1149.45n 5.0v 1149.55n 5.0v 1159.45n 5.0v 1159.55n 0.0v 1169.45n 0.0v 1169.55n 0.0v 1179.45n 0.0v 1179.55n 0.0v 1189.45n 0.0v 1189.55n 5.0v 1199.45n 5.0v 1199.55n 0.0v 1209.45n 0.0v 1209.55n 0.0v 1219.45n 0.0v 1219.55n 0.0v 1229.45n 0.0v 1229.55n 5.0v 1239.45n 5.0v 1239.55n 5.0v 1249.45n 5.0v 1249.55n 5.0v 1259.45n 5.0v 1259.55n 5.0v 1269.45n 5.0v 1269.55n 5.0v 1279.45n 5.0v 1279.55n 0.0v 1289.45n 0.0v 1289.55n 0.0v 1299.45n 0.0v 1299.55n 0.0v 1309.45n 0.0v 1309.55n 0.0v 1319.45n 0.0v 1319.55n 0.0v 1329.45n 0.0v 1329.55n 0.0v 1339.45n 0.0v 1339.55n 0.0v 1349.45n 0.0v 1349.55n 0.0v 1359.45n 0.0v 1359.55n 0.0v 1369.45n 0.0v 1369.55n 0.0v 1379.45n 0.0v 1379.55n 5.0v 1389.45n 5.0v 1389.55n 0.0v 1399.45n 0.0v 1399.55n 0.0v 1409.45n 0.0v 1409.55n 0.0v 1419.45n 0.0v 1419.55n 0.0v 1429.45n 0.0v 1429.55n 0.0v 1439.45n 0.0v 1439.55n 0.0v 1449.45n 0.0v 1449.55n 0.0v 1459.45n 0.0v 1459.55n 0.0v 1469.45n 0.0v 1469.55n 0.0v 1479.45n 0.0v 1479.55n 5.0v 1489.45n 5.0v 1489.55n 5.0v 1499.45n 5.0v 1499.55n 5.0v 1509.45n 5.0v 1509.55n 5.0v 1519.45n 5.0v 1519.55n 5.0v 1529.45n 5.0v 1529.55n 5.0v 1539.45n 5.0v 1539.55n 5.0v 1549.45n 5.0v 1549.55n 0.0v 1559.45n 0.0v 1559.55n 0.0v 1569.45n 0.0v 1569.55n 0.0v 1579.45n 0.0v 1579.55n 0.0v 1589.45n 0.0v 1589.55n 0.0v 1599.45n 0.0v 1599.55n 0.0v 1609.45n 0.0v 1609.55n 0.0v 1619.45n 0.0v 1619.55n 0.0v 1629.45n 0.0v 1629.55n 0.0v 1639.45n 0.0v 1639.55n 0.0v 1649.45n 0.0v 1649.55n 0.0v 1659.45n 0.0v 1659.55n 0.0v 1669.45n 0.0v 1669.55n 0.0v 1679.45n 0.0v 1679.55n 0.0v 1689.45n 0.0v 1689.55n 0.0v 1699.45n 0.0v 1699.55n 0.0v 1709.45n 0.0v 1709.55n 0.0v 1719.45n 0.0v 1719.55n 0.0v 1729.45n 0.0v 1729.55n 5.0v 1739.45n 5.0v 1739.55n 5.0v 1749.45n 5.0v 1749.55n 5.0v 1759.45n 5.0v 1759.55n 0.0v 1769.45n 0.0v 1769.55n 0.0v 1779.45n 0.0v 1779.55n 5.0v 1789.45n 5.0v 1789.55n 5.0v 1799.45n 5.0v 1799.55n 5.0v 1809.45n 5.0v 1809.55n 5.0v 1819.45n 5.0v 1819.55n 5.0v 1829.45n 5.0v 1829.55n 5.0v 1839.45n 5.0v 1839.55n 0.0v 1849.45n 0.0v 1849.55n 5.0v 1859.45n 5.0v 1859.55n 5.0v 1869.45n 5.0v 1869.55n 5.0v 1879.45n 5.0v 1879.55n 0.0v 1889.45n 0.0v 1889.55n 5.0v 1899.45n 5.0v 1899.55n 5.0v 1909.45n 5.0v 1909.55n 5.0v 1919.45n 5.0v 1919.55n 5.0v 1929.45n 5.0v 1929.55n 0.0v 1939.45n 0.0v 1939.55n 0.0v 1949.45n 0.0v 1949.55n 0.0v 1959.45n 0.0v 1959.55n 0.0v 1969.45n 0.0v 1969.55n 0.0v 1979.45n 0.0v 1979.55n 0.0v 1989.45n 0.0v 1989.55n 0.0v 1999.45n 0.0v 1999.55n 0.0v 2009.45n 0.0v 2009.55n 0.0v 2019.45n 0.0v 2019.55n 0.0v 2029.45n 0.0v 2029.55n 5.0v 2039.45n 5.0v 2039.55n 5.0v 2049.45n 5.0v 2049.55n 5.0v )
* (time, data): [(0, 0), (10, 1), (20, 1), (30, 0), (40, 0), (50, 1), (60, 1), (70, 0), (80, 1), (90, 1), (100, 1), (110, 1), (120, 1), (130, 0), (140, 0), (150, 1), (160, 1), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 0), (230, 0), (240, 0), (250, 1), (260, 1), (270, 1), (280, 1), (290, 1), (300, 0), (310, 0), (320, 0), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 0), (390, 1), (400, 1), (410, 0), (420, 0), (430, 1), (440, 1), (450, 1), (460, 1), (470, 1), (480, 0), (490, 1), (500, 1), (510, 1), (520, 1), (530, 0), (540, 1), (550, 1), (560, 1), (570, 1), (580, 1), (590, 1), (600, 1), (610, 1), (620, 1), (630, 1), (640, 1), (650, 1), (660, 0), (670, 1), (680, 0), (690, 0), (700, 0), (710, 0), (720, 1), (730, 1), (740, 1), (750, 1), (760, 0), (770, 0), (780, 0), (790, 0), (800, 0), (810, 0), (820, 0), (830, 0), (840, 0), (850, 1), (860, 1), (870, 1), (880, 1), (890, 1), (900, 1), (910, 0), (920, 0), (930, 0), (940, 0), (950, 0), (960, 0), (970, 0), (980, 0), (990, 0), (1000, 0), (1010, 0), (1020, 1), (1030, 1), (1040, 1), (1050, 1), (1060, 1), (1070, 1), (1080, 1), (1090, 0), (1100, 0), (1110, 0), (1120, 0), (1130, 0), (1140, 0), (1150, 1), (1160, 1), (1170, 1), (1180, 1), (1190, 1), (1200, 1), (1210, 1), (1220, 0), (1230, 0), (1240, 0), (1250, 0), (1260, 0), (1270, 0), (1280, 1), (1290, 1), (1300, 1), (1310, 0), (1320, 0), (1330, 1), (1340, 1), (1350, 1), (1360, 1), (1370, 1), (1380, 0), (1390, 1), (1400, 1), (1410, 1), (1420, 1), (1430, 1), (1440, 0), (1450, 0), (1460, 0), (1470, 0), (1480, 0), (1490, 0), (1500, 0), (1510, 1), (1520, 1), (1530, 1), (1540, 0), (1550, 0), (1560, 1), (1570, 1), (1580, 1), (1590, 1), (1600, 1), (1610, 1), (1620, 1), (1630, 1), (1640, 0), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 0), (1700, 0), (1710, 0), (1720, 0), (1730, 1), (1740, 1), (1750, 1), (1760, 1), (1770, 1), (1780, 1), (1790, 0), (1800, 0), (1810, 1), (1820, 1), (1830, 1), (1840, 0), (1850, 0), (1860, 0), (1870, 0), (1880, 1), (1890, 1), (1900, 1), (1910, 1), (1920, 1), (1930, 0), (1940, 0), (1950, 0), (1960, 0), (1970, 1), (1980, 1), (1990, 1), (2000, 1), (2010, 1), (2020, 1), (2030, 1), (2040, 1), (2050, 1)]
Vdin0_21  din0_21  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 5.0v 19.45n 5.0v 19.55n 5.0v 29.45n 5.0v 29.55n 0.0v 39.45n 0.0v 39.55n 0.0v 49.45n 0.0v 49.55n 5.0v 59.45n 5.0v 59.55n 5.0v 69.45n 5.0v 69.55n 0.0v 79.45n 0.0v 79.55n 5.0v 89.45n 5.0v 89.55n 5.0v 99.45n 5.0v 99.55n 5.0v 109.45n 5.0v 109.55n 5.0v 119.45n 5.0v 119.55n 5.0v 129.45n 5.0v 129.55n 0.0v 139.45n 0.0v 139.55n 0.0v 149.45n 0.0v 149.55n 5.0v 159.45n 5.0v 159.55n 5.0v 169.45n 5.0v 169.55n 0.0v 179.45n 0.0v 179.55n 0.0v 189.45n 0.0v 189.55n 0.0v 199.45n 0.0v 199.55n 0.0v 209.45n 0.0v 209.55n 0.0v 219.45n 0.0v 219.55n 0.0v 229.45n 0.0v 229.55n 0.0v 239.45n 0.0v 239.55n 0.0v 249.45n 0.0v 249.55n 5.0v 259.45n 5.0v 259.55n 5.0v 269.45n 5.0v 269.55n 5.0v 279.45n 5.0v 279.55n 5.0v 289.45n 5.0v 289.55n 5.0v 299.45n 5.0v 299.55n 0.0v 309.45n 0.0v 309.55n 0.0v 319.45n 0.0v 319.55n 0.0v 329.45n 0.0v 329.55n 0.0v 339.45n 0.0v 339.55n 0.0v 349.45n 0.0v 349.55n 0.0v 359.45n 0.0v 359.55n 0.0v 369.45n 0.0v 369.55n 0.0v 379.45n 0.0v 379.55n 0.0v 389.45n 0.0v 389.55n 5.0v 399.45n 5.0v 399.55n 5.0v 409.45n 5.0v 409.55n 0.0v 419.45n 0.0v 419.55n 0.0v 429.45n 0.0v 429.55n 5.0v 439.45n 5.0v 439.55n 5.0v 449.45n 5.0v 449.55n 5.0v 459.45n 5.0v 459.55n 5.0v 469.45n 5.0v 469.55n 5.0v 479.45n 5.0v 479.55n 0.0v 489.45n 0.0v 489.55n 5.0v 499.45n 5.0v 499.55n 5.0v 509.45n 5.0v 509.55n 5.0v 519.45n 5.0v 519.55n 5.0v 529.45n 5.0v 529.55n 0.0v 539.45n 0.0v 539.55n 5.0v 549.45n 5.0v 549.55n 5.0v 559.45n 5.0v 559.55n 5.0v 569.45n 5.0v 569.55n 5.0v 579.45n 5.0v 579.55n 5.0v 589.45n 5.0v 589.55n 5.0v 599.45n 5.0v 599.55n 5.0v 609.45n 5.0v 609.55n 5.0v 619.45n 5.0v 619.55n 5.0v 629.45n 5.0v 629.55n 5.0v 639.45n 5.0v 639.55n 5.0v 649.45n 5.0v 649.55n 5.0v 659.45n 5.0v 659.55n 0.0v 669.45n 0.0v 669.55n 5.0v 679.45n 5.0v 679.55n 0.0v 689.45n 0.0v 689.55n 0.0v 699.45n 0.0v 699.55n 0.0v 709.45n 0.0v 709.55n 0.0v 719.45n 0.0v 719.55n 5.0v 729.45n 5.0v 729.55n 5.0v 739.45n 5.0v 739.55n 5.0v 749.45n 5.0v 749.55n 5.0v 759.45n 5.0v 759.55n 0.0v 769.45n 0.0v 769.55n 0.0v 779.45n 0.0v 779.55n 0.0v 789.45n 0.0v 789.55n 0.0v 799.45n 0.0v 799.55n 0.0v 809.45n 0.0v 809.55n 0.0v 819.45n 0.0v 819.55n 0.0v 829.45n 0.0v 829.55n 0.0v 839.45n 0.0v 839.55n 0.0v 849.45n 0.0v 849.55n 5.0v 859.45n 5.0v 859.55n 5.0v 869.45n 5.0v 869.55n 5.0v 879.45n 5.0v 879.55n 5.0v 889.45n 5.0v 889.55n 5.0v 899.45n 5.0v 899.55n 5.0v 909.45n 5.0v 909.55n 0.0v 919.45n 0.0v 919.55n 0.0v 929.45n 0.0v 929.55n 0.0v 939.45n 0.0v 939.55n 0.0v 949.45n 0.0v 949.55n 0.0v 959.45n 0.0v 959.55n 0.0v 969.45n 0.0v 969.55n 0.0v 979.45n 0.0v 979.55n 0.0v 989.45n 0.0v 989.55n 0.0v 999.45n 0.0v 999.55n 0.0v 1009.45n 0.0v 1009.55n 0.0v 1019.45n 0.0v 1019.55n 5.0v 1029.45n 5.0v 1029.55n 5.0v 1039.45n 5.0v 1039.55n 5.0v 1049.45n 5.0v 1049.55n 5.0v 1059.45n 5.0v 1059.55n 5.0v 1069.45n 5.0v 1069.55n 5.0v 1079.45n 5.0v 1079.55n 5.0v 1089.45n 5.0v 1089.55n 0.0v 1099.45n 0.0v 1099.55n 0.0v 1109.45n 0.0v 1109.55n 0.0v 1119.45n 0.0v 1119.55n 0.0v 1129.45n 0.0v 1129.55n 0.0v 1139.45n 0.0v 1139.55n 0.0v 1149.45n 0.0v 1149.55n 5.0v 1159.45n 5.0v 1159.55n 5.0v 1169.45n 5.0v 1169.55n 5.0v 1179.45n 5.0v 1179.55n 5.0v 1189.45n 5.0v 1189.55n 5.0v 1199.45n 5.0v 1199.55n 5.0v 1209.45n 5.0v 1209.55n 5.0v 1219.45n 5.0v 1219.55n 0.0v 1229.45n 0.0v 1229.55n 0.0v 1239.45n 0.0v 1239.55n 0.0v 1249.45n 0.0v 1249.55n 0.0v 1259.45n 0.0v 1259.55n 0.0v 1269.45n 0.0v 1269.55n 0.0v 1279.45n 0.0v 1279.55n 5.0v 1289.45n 5.0v 1289.55n 5.0v 1299.45n 5.0v 1299.55n 5.0v 1309.45n 5.0v 1309.55n 0.0v 1319.45n 0.0v 1319.55n 0.0v 1329.45n 0.0v 1329.55n 5.0v 1339.45n 5.0v 1339.55n 5.0v 1349.45n 5.0v 1349.55n 5.0v 1359.45n 5.0v 1359.55n 5.0v 1369.45n 5.0v 1369.55n 5.0v 1379.45n 5.0v 1379.55n 0.0v 1389.45n 0.0v 1389.55n 5.0v 1399.45n 5.0v 1399.55n 5.0v 1409.45n 5.0v 1409.55n 5.0v 1419.45n 5.0v 1419.55n 5.0v 1429.45n 5.0v 1429.55n 5.0v 1439.45n 5.0v 1439.55n 0.0v 1449.45n 0.0v 1449.55n 0.0v 1459.45n 0.0v 1459.55n 0.0v 1469.45n 0.0v 1469.55n 0.0v 1479.45n 0.0v 1479.55n 0.0v 1489.45n 0.0v 1489.55n 0.0v 1499.45n 0.0v 1499.55n 0.0v 1509.45n 0.0v 1509.55n 5.0v 1519.45n 5.0v 1519.55n 5.0v 1529.45n 5.0v 1529.55n 5.0v 1539.45n 5.0v 1539.55n 0.0v 1549.45n 0.0v 1549.55n 0.0v 1559.45n 0.0v 1559.55n 5.0v 1569.45n 5.0v 1569.55n 5.0v 1579.45n 5.0v 1579.55n 5.0v 1589.45n 5.0v 1589.55n 5.0v 1599.45n 5.0v 1599.55n 5.0v 1609.45n 5.0v 1609.55n 5.0v 1619.45n 5.0v 1619.55n 5.0v 1629.45n 5.0v 1629.55n 5.0v 1639.45n 5.0v 1639.55n 0.0v 1649.45n 0.0v 1649.55n 0.0v 1659.45n 0.0v 1659.55n 0.0v 1669.45n 0.0v 1669.55n 0.0v 1679.45n 0.0v 1679.55n 0.0v 1689.45n 0.0v 1689.55n 0.0v 1699.45n 0.0v 1699.55n 0.0v 1709.45n 0.0v 1709.55n 0.0v 1719.45n 0.0v 1719.55n 0.0v 1729.45n 0.0v 1729.55n 5.0v 1739.45n 5.0v 1739.55n 5.0v 1749.45n 5.0v 1749.55n 5.0v 1759.45n 5.0v 1759.55n 5.0v 1769.45n 5.0v 1769.55n 5.0v 1779.45n 5.0v 1779.55n 5.0v 1789.45n 5.0v 1789.55n 0.0v 1799.45n 0.0v 1799.55n 0.0v 1809.45n 0.0v 1809.55n 5.0v 1819.45n 5.0v 1819.55n 5.0v 1829.45n 5.0v 1829.55n 5.0v 1839.45n 5.0v 1839.55n 0.0v 1849.45n 0.0v 1849.55n 0.0v 1859.45n 0.0v 1859.55n 0.0v 1869.45n 0.0v 1869.55n 0.0v 1879.45n 0.0v 1879.55n 5.0v 1889.45n 5.0v 1889.55n 5.0v 1899.45n 5.0v 1899.55n 5.0v 1909.45n 5.0v 1909.55n 5.0v 1919.45n 5.0v 1919.55n 5.0v 1929.45n 5.0v 1929.55n 0.0v 1939.45n 0.0v 1939.55n 0.0v 1949.45n 0.0v 1949.55n 0.0v 1959.45n 0.0v 1959.55n 0.0v 1969.45n 0.0v 1969.55n 5.0v 1979.45n 5.0v 1979.55n 5.0v 1989.45n 5.0v 1989.55n 5.0v 1999.45n 5.0v 1999.55n 5.0v 2009.45n 5.0v 2009.55n 5.0v 2019.45n 5.0v 2019.55n 5.0v 2029.45n 5.0v 2029.55n 5.0v 2039.45n 5.0v 2039.55n 5.0v 2049.45n 5.0v 2049.55n 5.0v )
* (time, data): [(0, 0), (10, 0), (20, 0), (30, 1), (40, 1), (50, 0), (60, 1), (70, 1), (80, 1), (90, 1), (100, 1), (110, 1), (120, 1), (130, 0), (140, 0), (150, 0), (160, 1), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 1), (230, 1), (240, 1), (250, 1), (260, 1), (270, 1), (280, 0), (290, 0), (300, 1), (310, 1), (320, 1), (330, 1), (340, 1), (350, 1), (360, 1), (370, 1), (380, 1), (390, 1), (400, 1), (410, 1), (420, 1), (430, 0), (440, 0), (450, 1), (460, 1), (470, 1), (480, 1), (490, 0), (500, 0), (510, 0), (520, 0), (530, 0), (540, 0), (550, 0), (560, 0), (570, 0), (580, 0), (590, 1), (600, 1), (610, 1), (620, 1), (630, 1), (640, 0), (650, 0), (660, 0), (670, 0), (680, 1), (690, 1), (700, 1), (710, 1), (720, 1), (730, 1), (740, 0), (750, 0), (760, 1), (770, 1), (780, 0), (790, 0), (800, 0), (810, 0), (820, 0), (830, 0), (840, 0), (850, 0), (860, 0), (870, 0), (880, 0), (890, 0), (900, 0), (910, 1), (920, 1), (930, 1), (940, 1), (950, 0), (960, 0), (970, 0), (980, 0), (990, 0), (1000, 0), (1010, 0), (1020, 0), (1030, 0), (1040, 0), (1050, 0), (1060, 0), (1070, 0), (1080, 0), (1090, 0), (1100, 0), (1110, 1), (1120, 0), (1130, 0), (1140, 0), (1150, 1), (1160, 0), (1170, 0), (1180, 0), (1190, 0), (1200, 0), (1210, 0), (1220, 1), (1230, 1), (1240, 1), (1250, 1), (1260, 1), (1270, 1), (1280, 0), (1290, 0), (1300, 1), (1310, 0), (1320, 1), (1330, 1), (1340, 1), (1350, 1), (1360, 1), (1370, 1), (1380, 1), (1390, 0), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 1), (1450, 1), (1460, 1), (1470, 1), (1480, 1), (1490, 1), (1500, 0), (1510, 0), (1520, 0), (1530, 1), (1540, 1), (1550, 1), (1560, 0), (1570, 0), (1580, 0), (1590, 0), (1600, 0), (1610, 0), (1620, 0), (1630, 0), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 1), (1700, 1), (1710, 1), (1720, 0), (1730, 0), (1740, 0), (1750, 0), (1760, 0), (1770, 1), (1780, 1), (1790, 0), (1800, 0), (1810, 0), (1820, 0), (1830, 0), (1840, 0), (1850, 1), (1860, 1), (1870, 1), (1880, 0), (1890, 1), (1900, 1), (1910, 1), (1920, 1), (1930, 1), (1940, 1), (1950, 1), (1960, 1), (1970, 0), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 0), (2030, 1), (2040, 1), (2050, 1)]
Vdin0_22  din0_22  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 0.0v 19.45n 0.0v 19.55n 0.0v 29.45n 0.0v 29.55n 5.0v 39.45n 5.0v 39.55n 5.0v 49.45n 5.0v 49.55n 0.0v 59.45n 0.0v 59.55n 5.0v 69.45n 5.0v 69.55n 5.0v 79.45n 5.0v 79.55n 5.0v 89.45n 5.0v 89.55n 5.0v 99.45n 5.0v 99.55n 5.0v 109.45n 5.0v 109.55n 5.0v 119.45n 5.0v 119.55n 5.0v 129.45n 5.0v 129.55n 0.0v 139.45n 0.0v 139.55n 0.0v 149.45n 0.0v 149.55n 0.0v 159.45n 0.0v 159.55n 5.0v 169.45n 5.0v 169.55n 0.0v 179.45n 0.0v 179.55n 0.0v 189.45n 0.0v 189.55n 0.0v 199.45n 0.0v 199.55n 0.0v 209.45n 0.0v 209.55n 0.0v 219.45n 0.0v 219.55n 5.0v 229.45n 5.0v 229.55n 5.0v 239.45n 5.0v 239.55n 5.0v 249.45n 5.0v 249.55n 5.0v 259.45n 5.0v 259.55n 5.0v 269.45n 5.0v 269.55n 5.0v 279.45n 5.0v 279.55n 0.0v 289.45n 0.0v 289.55n 0.0v 299.45n 0.0v 299.55n 5.0v 309.45n 5.0v 309.55n 5.0v 319.45n 5.0v 319.55n 5.0v 329.45n 5.0v 329.55n 5.0v 339.45n 5.0v 339.55n 5.0v 349.45n 5.0v 349.55n 5.0v 359.45n 5.0v 359.55n 5.0v 369.45n 5.0v 369.55n 5.0v 379.45n 5.0v 379.55n 5.0v 389.45n 5.0v 389.55n 5.0v 399.45n 5.0v 399.55n 5.0v 409.45n 5.0v 409.55n 5.0v 419.45n 5.0v 419.55n 5.0v 429.45n 5.0v 429.55n 0.0v 439.45n 0.0v 439.55n 0.0v 449.45n 0.0v 449.55n 5.0v 459.45n 5.0v 459.55n 5.0v 469.45n 5.0v 469.55n 5.0v 479.45n 5.0v 479.55n 5.0v 489.45n 5.0v 489.55n 0.0v 499.45n 0.0v 499.55n 0.0v 509.45n 0.0v 509.55n 0.0v 519.45n 0.0v 519.55n 0.0v 529.45n 0.0v 529.55n 0.0v 539.45n 0.0v 539.55n 0.0v 549.45n 0.0v 549.55n 0.0v 559.45n 0.0v 559.55n 0.0v 569.45n 0.0v 569.55n 0.0v 579.45n 0.0v 579.55n 0.0v 589.45n 0.0v 589.55n 5.0v 599.45n 5.0v 599.55n 5.0v 609.45n 5.0v 609.55n 5.0v 619.45n 5.0v 619.55n 5.0v 629.45n 5.0v 629.55n 5.0v 639.45n 5.0v 639.55n 0.0v 649.45n 0.0v 649.55n 0.0v 659.45n 0.0v 659.55n 0.0v 669.45n 0.0v 669.55n 0.0v 679.45n 0.0v 679.55n 5.0v 689.45n 5.0v 689.55n 5.0v 699.45n 5.0v 699.55n 5.0v 709.45n 5.0v 709.55n 5.0v 719.45n 5.0v 719.55n 5.0v 729.45n 5.0v 729.55n 5.0v 739.45n 5.0v 739.55n 0.0v 749.45n 0.0v 749.55n 0.0v 759.45n 0.0v 759.55n 5.0v 769.45n 5.0v 769.55n 5.0v 779.45n 5.0v 779.55n 0.0v 789.45n 0.0v 789.55n 0.0v 799.45n 0.0v 799.55n 0.0v 809.45n 0.0v 809.55n 0.0v 819.45n 0.0v 819.55n 0.0v 829.45n 0.0v 829.55n 0.0v 839.45n 0.0v 839.55n 0.0v 849.45n 0.0v 849.55n 0.0v 859.45n 0.0v 859.55n 0.0v 869.45n 0.0v 869.55n 0.0v 879.45n 0.0v 879.55n 0.0v 889.45n 0.0v 889.55n 0.0v 899.45n 0.0v 899.55n 0.0v 909.45n 0.0v 909.55n 5.0v 919.45n 5.0v 919.55n 5.0v 929.45n 5.0v 929.55n 5.0v 939.45n 5.0v 939.55n 5.0v 949.45n 5.0v 949.55n 0.0v 959.45n 0.0v 959.55n 0.0v 969.45n 0.0v 969.55n 0.0v 979.45n 0.0v 979.55n 0.0v 989.45n 0.0v 989.55n 0.0v 999.45n 0.0v 999.55n 0.0v 1009.45n 0.0v 1009.55n 0.0v 1019.45n 0.0v 1019.55n 0.0v 1029.45n 0.0v 1029.55n 0.0v 1039.45n 0.0v 1039.55n 0.0v 1049.45n 0.0v 1049.55n 0.0v 1059.45n 0.0v 1059.55n 0.0v 1069.45n 0.0v 1069.55n 0.0v 1079.45n 0.0v 1079.55n 0.0v 1089.45n 0.0v 1089.55n 0.0v 1099.45n 0.0v 1099.55n 0.0v 1109.45n 0.0v 1109.55n 5.0v 1119.45n 5.0v 1119.55n 0.0v 1129.45n 0.0v 1129.55n 0.0v 1139.45n 0.0v 1139.55n 0.0v 1149.45n 0.0v 1149.55n 5.0v 1159.45n 5.0v 1159.55n 0.0v 1169.45n 0.0v 1169.55n 0.0v 1179.45n 0.0v 1179.55n 0.0v 1189.45n 0.0v 1189.55n 0.0v 1199.45n 0.0v 1199.55n 0.0v 1209.45n 0.0v 1209.55n 0.0v 1219.45n 0.0v 1219.55n 5.0v 1229.45n 5.0v 1229.55n 5.0v 1239.45n 5.0v 1239.55n 5.0v 1249.45n 5.0v 1249.55n 5.0v 1259.45n 5.0v 1259.55n 5.0v 1269.45n 5.0v 1269.55n 5.0v 1279.45n 5.0v 1279.55n 0.0v 1289.45n 0.0v 1289.55n 0.0v 1299.45n 0.0v 1299.55n 5.0v 1309.45n 5.0v 1309.55n 0.0v 1319.45n 0.0v 1319.55n 5.0v 1329.45n 5.0v 1329.55n 5.0v 1339.45n 5.0v 1339.55n 5.0v 1349.45n 5.0v 1349.55n 5.0v 1359.45n 5.0v 1359.55n 5.0v 1369.45n 5.0v 1369.55n 5.0v 1379.45n 5.0v 1379.55n 5.0v 1389.45n 5.0v 1389.55n 0.0v 1399.45n 0.0v 1399.55n 0.0v 1409.45n 0.0v 1409.55n 0.0v 1419.45n 0.0v 1419.55n 0.0v 1429.45n 0.0v 1429.55n 0.0v 1439.45n 0.0v 1439.55n 5.0v 1449.45n 5.0v 1449.55n 5.0v 1459.45n 5.0v 1459.55n 5.0v 1469.45n 5.0v 1469.55n 5.0v 1479.45n 5.0v 1479.55n 5.0v 1489.45n 5.0v 1489.55n 5.0v 1499.45n 5.0v 1499.55n 0.0v 1509.45n 0.0v 1509.55n 0.0v 1519.45n 0.0v 1519.55n 0.0v 1529.45n 0.0v 1529.55n 5.0v 1539.45n 5.0v 1539.55n 5.0v 1549.45n 5.0v 1549.55n 5.0v 1559.45n 5.0v 1559.55n 0.0v 1569.45n 0.0v 1569.55n 0.0v 1579.45n 0.0v 1579.55n 0.0v 1589.45n 0.0v 1589.55n 0.0v 1599.45n 0.0v 1599.55n 0.0v 1609.45n 0.0v 1609.55n 0.0v 1619.45n 0.0v 1619.55n 0.0v 1629.45n 0.0v 1629.55n 0.0v 1639.45n 0.0v 1639.55n 5.0v 1649.45n 5.0v 1649.55n 5.0v 1659.45n 5.0v 1659.55n 5.0v 1669.45n 5.0v 1669.55n 5.0v 1679.45n 5.0v 1679.55n 5.0v 1689.45n 5.0v 1689.55n 5.0v 1699.45n 5.0v 1699.55n 5.0v 1709.45n 5.0v 1709.55n 5.0v 1719.45n 5.0v 1719.55n 0.0v 1729.45n 0.0v 1729.55n 0.0v 1739.45n 0.0v 1739.55n 0.0v 1749.45n 0.0v 1749.55n 0.0v 1759.45n 0.0v 1759.55n 0.0v 1769.45n 0.0v 1769.55n 5.0v 1779.45n 5.0v 1779.55n 5.0v 1789.45n 5.0v 1789.55n 0.0v 1799.45n 0.0v 1799.55n 0.0v 1809.45n 0.0v 1809.55n 0.0v 1819.45n 0.0v 1819.55n 0.0v 1829.45n 0.0v 1829.55n 0.0v 1839.45n 0.0v 1839.55n 0.0v 1849.45n 0.0v 1849.55n 5.0v 1859.45n 5.0v 1859.55n 5.0v 1869.45n 5.0v 1869.55n 5.0v 1879.45n 5.0v 1879.55n 0.0v 1889.45n 0.0v 1889.55n 5.0v 1899.45n 5.0v 1899.55n 5.0v 1909.45n 5.0v 1909.55n 5.0v 1919.45n 5.0v 1919.55n 5.0v 1929.45n 5.0v 1929.55n 5.0v 1939.45n 5.0v 1939.55n 5.0v 1949.45n 5.0v 1949.55n 5.0v 1959.45n 5.0v 1959.55n 5.0v 1969.45n 5.0v 1969.55n 0.0v 1979.45n 0.0v 1979.55n 0.0v 1989.45n 0.0v 1989.55n 0.0v 1999.45n 0.0v 1999.55n 0.0v 2009.45n 0.0v 2009.55n 0.0v 2019.45n 0.0v 2019.55n 0.0v 2029.45n 0.0v 2029.55n 5.0v 2039.45n 5.0v 2039.55n 5.0v 2049.45n 5.0v 2049.55n 5.0v )
* (time, data): [(0, 0), (10, 0), (20, 0), (30, 1), (40, 1), (50, 0), (60, 0), (70, 1), (80, 0), (90, 0), (100, 0), (110, 0), (120, 0), (130, 1), (140, 1), (150, 1), (160, 1), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 0), (230, 0), (240, 0), (250, 0), (260, 0), (270, 0), (280, 0), (290, 0), (300, 1), (310, 1), (320, 1), (330, 1), (340, 1), (350, 1), (360, 1), (370, 1), (380, 1), (390, 0), (400, 1), (410, 1), (420, 1), (430, 0), (440, 0), (450, 1), (460, 1), (470, 0), (480, 1), (490, 1), (500, 1), (510, 0), (520, 0), (530, 0), (540, 1), (550, 1), (560, 1), (570, 1), (580, 1), (590, 0), (600, 1), (610, 0), (620, 0), (630, 0), (640, 0), (650, 0), (660, 1), (670, 0), (680, 0), (690, 0), (700, 0), (710, 0), (720, 0), (730, 0), (740, 0), (750, 0), (760, 0), (770, 0), (780, 0), (790, 0), (800, 0), (810, 0), (820, 0), (830, 0), (840, 0), (850, 1), (860, 1), (870, 1), (880, 1), (890, 1), (900, 1), (910, 1), (920, 1), (930, 1), (940, 1), (950, 1), (960, 1), (970, 1), (980, 1), (990, 1), (1000, 0), (1010, 0), (1020, 0), (1030, 0), (1040, 0), (1050, 0), (1060, 0), (1070, 0), (1080, 1), (1090, 1), (1100, 1), (1110, 0), (1120, 0), (1130, 0), (1140, 0), (1150, 1), (1160, 1), (1170, 1), (1180, 1), (1190, 0), (1200, 0), (1210, 0), (1220, 1), (1230, 1), (1240, 1), (1250, 1), (1260, 1), (1270, 0), (1280, 1), (1290, 1), (1300, 1), (1310, 0), (1320, 0), (1330, 0), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 1), (1390, 1), (1400, 1), (1410, 1), (1420, 1), (1430, 1), (1440, 1), (1450, 1), (1460, 1), (1470, 1), (1480, 1), (1490, 1), (1500, 0), (1510, 1), (1520, 0), (1530, 1), (1540, 0), (1550, 1), (1560, 1), (1570, 1), (1580, 1), (1590, 1), (1600, 1), (1610, 1), (1620, 1), (1630, 1), (1640, 0), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 0), (1700, 0), (1710, 0), (1720, 1), (1730, 1), (1740, 1), (1750, 1), (1760, 0), (1770, 1), (1780, 1), (1790, 0), (1800, 0), (1810, 1), (1820, 1), (1830, 1), (1840, 1), (1850, 1), (1860, 0), (1870, 0), (1880, 1), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 0), (1940, 0), (1950, 0), (1960, 0), (1970, 0), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 0), (2030, 1), (2040, 1), (2050, 1)]
Vdin0_23  din0_23  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 0.0v 19.45n 0.0v 19.55n 0.0v 29.45n 0.0v 29.55n 5.0v 39.45n 5.0v 39.55n 5.0v 49.45n 5.0v 49.55n 0.0v 59.45n 0.0v 59.55n 0.0v 69.45n 0.0v 69.55n 5.0v 79.45n 5.0v 79.55n 0.0v 89.45n 0.0v 89.55n 0.0v 99.45n 0.0v 99.55n 0.0v 109.45n 0.0v 109.55n 0.0v 119.45n 0.0v 119.55n 0.0v 129.45n 0.0v 129.55n 5.0v 139.45n 5.0v 139.55n 5.0v 149.45n 5.0v 149.55n 5.0v 159.45n 5.0v 159.55n 5.0v 169.45n 5.0v 169.55n 0.0v 179.45n 0.0v 179.55n 0.0v 189.45n 0.0v 189.55n 0.0v 199.45n 0.0v 199.55n 0.0v 209.45n 0.0v 209.55n 0.0v 219.45n 0.0v 219.55n 0.0v 229.45n 0.0v 229.55n 0.0v 239.45n 0.0v 239.55n 0.0v 249.45n 0.0v 249.55n 0.0v 259.45n 0.0v 259.55n 0.0v 269.45n 0.0v 269.55n 0.0v 279.45n 0.0v 279.55n 0.0v 289.45n 0.0v 289.55n 0.0v 299.45n 0.0v 299.55n 5.0v 309.45n 5.0v 309.55n 5.0v 319.45n 5.0v 319.55n 5.0v 329.45n 5.0v 329.55n 5.0v 339.45n 5.0v 339.55n 5.0v 349.45n 5.0v 349.55n 5.0v 359.45n 5.0v 359.55n 5.0v 369.45n 5.0v 369.55n 5.0v 379.45n 5.0v 379.55n 5.0v 389.45n 5.0v 389.55n 0.0v 399.45n 0.0v 399.55n 5.0v 409.45n 5.0v 409.55n 5.0v 419.45n 5.0v 419.55n 5.0v 429.45n 5.0v 429.55n 0.0v 439.45n 0.0v 439.55n 0.0v 449.45n 0.0v 449.55n 5.0v 459.45n 5.0v 459.55n 5.0v 469.45n 5.0v 469.55n 0.0v 479.45n 0.0v 479.55n 5.0v 489.45n 5.0v 489.55n 5.0v 499.45n 5.0v 499.55n 5.0v 509.45n 5.0v 509.55n 0.0v 519.45n 0.0v 519.55n 0.0v 529.45n 0.0v 529.55n 0.0v 539.45n 0.0v 539.55n 5.0v 549.45n 5.0v 549.55n 5.0v 559.45n 5.0v 559.55n 5.0v 569.45n 5.0v 569.55n 5.0v 579.45n 5.0v 579.55n 5.0v 589.45n 5.0v 589.55n 0.0v 599.45n 0.0v 599.55n 5.0v 609.45n 5.0v 609.55n 0.0v 619.45n 0.0v 619.55n 0.0v 629.45n 0.0v 629.55n 0.0v 639.45n 0.0v 639.55n 0.0v 649.45n 0.0v 649.55n 0.0v 659.45n 0.0v 659.55n 5.0v 669.45n 5.0v 669.55n 0.0v 679.45n 0.0v 679.55n 0.0v 689.45n 0.0v 689.55n 0.0v 699.45n 0.0v 699.55n 0.0v 709.45n 0.0v 709.55n 0.0v 719.45n 0.0v 719.55n 0.0v 729.45n 0.0v 729.55n 0.0v 739.45n 0.0v 739.55n 0.0v 749.45n 0.0v 749.55n 0.0v 759.45n 0.0v 759.55n 0.0v 769.45n 0.0v 769.55n 0.0v 779.45n 0.0v 779.55n 0.0v 789.45n 0.0v 789.55n 0.0v 799.45n 0.0v 799.55n 0.0v 809.45n 0.0v 809.55n 0.0v 819.45n 0.0v 819.55n 0.0v 829.45n 0.0v 829.55n 0.0v 839.45n 0.0v 839.55n 0.0v 849.45n 0.0v 849.55n 5.0v 859.45n 5.0v 859.55n 5.0v 869.45n 5.0v 869.55n 5.0v 879.45n 5.0v 879.55n 5.0v 889.45n 5.0v 889.55n 5.0v 899.45n 5.0v 899.55n 5.0v 909.45n 5.0v 909.55n 5.0v 919.45n 5.0v 919.55n 5.0v 929.45n 5.0v 929.55n 5.0v 939.45n 5.0v 939.55n 5.0v 949.45n 5.0v 949.55n 5.0v 959.45n 5.0v 959.55n 5.0v 969.45n 5.0v 969.55n 5.0v 979.45n 5.0v 979.55n 5.0v 989.45n 5.0v 989.55n 5.0v 999.45n 5.0v 999.55n 0.0v 1009.45n 0.0v 1009.55n 0.0v 1019.45n 0.0v 1019.55n 0.0v 1029.45n 0.0v 1029.55n 0.0v 1039.45n 0.0v 1039.55n 0.0v 1049.45n 0.0v 1049.55n 0.0v 1059.45n 0.0v 1059.55n 0.0v 1069.45n 0.0v 1069.55n 0.0v 1079.45n 0.0v 1079.55n 5.0v 1089.45n 5.0v 1089.55n 5.0v 1099.45n 5.0v 1099.55n 5.0v 1109.45n 5.0v 1109.55n 0.0v 1119.45n 0.0v 1119.55n 0.0v 1129.45n 0.0v 1129.55n 0.0v 1139.45n 0.0v 1139.55n 0.0v 1149.45n 0.0v 1149.55n 5.0v 1159.45n 5.0v 1159.55n 5.0v 1169.45n 5.0v 1169.55n 5.0v 1179.45n 5.0v 1179.55n 5.0v 1189.45n 5.0v 1189.55n 0.0v 1199.45n 0.0v 1199.55n 0.0v 1209.45n 0.0v 1209.55n 0.0v 1219.45n 0.0v 1219.55n 5.0v 1229.45n 5.0v 1229.55n 5.0v 1239.45n 5.0v 1239.55n 5.0v 1249.45n 5.0v 1249.55n 5.0v 1259.45n 5.0v 1259.55n 5.0v 1269.45n 5.0v 1269.55n 0.0v 1279.45n 0.0v 1279.55n 5.0v 1289.45n 5.0v 1289.55n 5.0v 1299.45n 5.0v 1299.55n 5.0v 1309.45n 5.0v 1309.55n 0.0v 1319.45n 0.0v 1319.55n 0.0v 1329.45n 0.0v 1329.55n 0.0v 1339.45n 0.0v 1339.55n 0.0v 1349.45n 0.0v 1349.55n 0.0v 1359.45n 0.0v 1359.55n 0.0v 1369.45n 0.0v 1369.55n 0.0v 1379.45n 0.0v 1379.55n 5.0v 1389.45n 5.0v 1389.55n 5.0v 1399.45n 5.0v 1399.55n 5.0v 1409.45n 5.0v 1409.55n 5.0v 1419.45n 5.0v 1419.55n 5.0v 1429.45n 5.0v 1429.55n 5.0v 1439.45n 5.0v 1439.55n 5.0v 1449.45n 5.0v 1449.55n 5.0v 1459.45n 5.0v 1459.55n 5.0v 1469.45n 5.0v 1469.55n 5.0v 1479.45n 5.0v 1479.55n 5.0v 1489.45n 5.0v 1489.55n 5.0v 1499.45n 5.0v 1499.55n 0.0v 1509.45n 0.0v 1509.55n 5.0v 1519.45n 5.0v 1519.55n 0.0v 1529.45n 0.0v 1529.55n 5.0v 1539.45n 5.0v 1539.55n 0.0v 1549.45n 0.0v 1549.55n 5.0v 1559.45n 5.0v 1559.55n 5.0v 1569.45n 5.0v 1569.55n 5.0v 1579.45n 5.0v 1579.55n 5.0v 1589.45n 5.0v 1589.55n 5.0v 1599.45n 5.0v 1599.55n 5.0v 1609.45n 5.0v 1609.55n 5.0v 1619.45n 5.0v 1619.55n 5.0v 1629.45n 5.0v 1629.55n 5.0v 1639.45n 5.0v 1639.55n 0.0v 1649.45n 0.0v 1649.55n 0.0v 1659.45n 0.0v 1659.55n 0.0v 1669.45n 0.0v 1669.55n 0.0v 1679.45n 0.0v 1679.55n 0.0v 1689.45n 0.0v 1689.55n 0.0v 1699.45n 0.0v 1699.55n 0.0v 1709.45n 0.0v 1709.55n 0.0v 1719.45n 0.0v 1719.55n 5.0v 1729.45n 5.0v 1729.55n 5.0v 1739.45n 5.0v 1739.55n 5.0v 1749.45n 5.0v 1749.55n 5.0v 1759.45n 5.0v 1759.55n 0.0v 1769.45n 0.0v 1769.55n 5.0v 1779.45n 5.0v 1779.55n 5.0v 1789.45n 5.0v 1789.55n 0.0v 1799.45n 0.0v 1799.55n 0.0v 1809.45n 0.0v 1809.55n 5.0v 1819.45n 5.0v 1819.55n 5.0v 1829.45n 5.0v 1829.55n 5.0v 1839.45n 5.0v 1839.55n 5.0v 1849.45n 5.0v 1849.55n 5.0v 1859.45n 5.0v 1859.55n 0.0v 1869.45n 0.0v 1869.55n 0.0v 1879.45n 0.0v 1879.55n 5.0v 1889.45n 5.0v 1889.55n 0.0v 1899.45n 0.0v 1899.55n 0.0v 1909.45n 0.0v 1909.55n 0.0v 1919.45n 0.0v 1919.55n 0.0v 1929.45n 0.0v 1929.55n 0.0v 1939.45n 0.0v 1939.55n 0.0v 1949.45n 0.0v 1949.55n 0.0v 1959.45n 0.0v 1959.55n 0.0v 1969.45n 0.0v 1969.55n 0.0v 1979.45n 0.0v 1979.55n 0.0v 1989.45n 0.0v 1989.55n 0.0v 1999.45n 0.0v 1999.55n 0.0v 2009.45n 0.0v 2009.55n 0.0v 2019.45n 0.0v 2019.55n 0.0v 2029.45n 0.0v 2029.55n 5.0v 2039.45n 5.0v 2039.55n 5.0v 2049.45n 5.0v 2049.55n 5.0v )
* (time, data): [(0, 0), (10, 0), (20, 1), (30, 0), (40, 0), (50, 0), (60, 1), (70, 0), (80, 1), (90, 1), (100, 1), (110, 1), (120, 1), (130, 1), (140, 1), (150, 1), (160, 0), (170, 1), (180, 1), (190, 1), (200, 1), (210, 1), (220, 1), (230, 1), (240, 1), (250, 1), (260, 1), (270, 1), (280, 0), (290, 0), (300, 0), (310, 0), (320, 0), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 0), (390, 1), (400, 1), (410, 1), (420, 1), (430, 1), (440, 1), (450, 0), (460, 0), (470, 1), (480, 0), (490, 1), (500, 1), (510, 0), (520, 0), (530, 0), (540, 1), (550, 1), (560, 1), (570, 1), (580, 1), (590, 1), (600, 1), (610, 0), (620, 0), (630, 0), (640, 0), (650, 0), (660, 1), (670, 1), (680, 0), (690, 0), (700, 0), (710, 0), (720, 0), (730, 0), (740, 0), (750, 1), (760, 1), (770, 1), (780, 1), (790, 1), (800, 1), (810, 1), (820, 1), (830, 1), (840, 1), (850, 0), (860, 0), (870, 0), (880, 0), (890, 0), (900, 0), (910, 0), (920, 0), (930, 0), (940, 0), (950, 1), (960, 1), (970, 0), (980, 0), (990, 0), (1000, 0), (1010, 0), (1020, 0), (1030, 0), (1040, 0), (1050, 0), (1060, 0), (1070, 0), (1080, 0), (1090, 0), (1100, 0), (1110, 0), (1120, 0), (1130, 0), (1140, 0), (1150, 1), (1160, 0), (1170, 0), (1180, 0), (1190, 0), (1200, 0), (1210, 0), (1220, 0), (1230, 1), (1240, 1), (1250, 1), (1260, 1), (1270, 1), (1280, 1), (1290, 1), (1300, 0), (1310, 1), (1320, 1), (1330, 1), (1340, 1), (1350, 1), (1360, 1), (1370, 1), (1380, 1), (1390, 1), (1400, 1), (1410, 1), (1420, 1), (1430, 1), (1440, 1), (1450, 1), (1460, 1), (1470, 1), (1480, 0), (1490, 0), (1500, 1), (1510, 0), (1520, 1), (1530, 0), (1540, 1), (1550, 0), (1560, 0), (1570, 0), (1580, 0), (1590, 0), (1600, 0), (1610, 0), (1620, 0), (1630, 0), (1640, 0), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 0), (1700, 0), (1710, 0), (1720, 0), (1730, 0), (1740, 0), (1750, 0), (1760, 0), (1770, 1), (1780, 1), (1790, 1), (1800, 1), (1810, 0), (1820, 0), (1830, 0), (1840, 0), (1850, 1), (1860, 0), (1870, 0), (1880, 0), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 1), (1940, 1), (1950, 1), (1960, 1), (1970, 1), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 0), (2030, 1), (2040, 1), (2050, 1)]
Vdin0_24  din0_24  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 0.0v 19.45n 0.0v 19.55n 5.0v 29.45n 5.0v 29.55n 0.0v 39.45n 0.0v 39.55n 0.0v 49.45n 0.0v 49.55n 0.0v 59.45n 0.0v 59.55n 5.0v 69.45n 5.0v 69.55n 0.0v 79.45n 0.0v 79.55n 5.0v 89.45n 5.0v 89.55n 5.0v 99.45n 5.0v 99.55n 5.0v 109.45n 5.0v 109.55n 5.0v 119.45n 5.0v 119.55n 5.0v 129.45n 5.0v 129.55n 5.0v 139.45n 5.0v 139.55n 5.0v 149.45n 5.0v 149.55n 5.0v 159.45n 5.0v 159.55n 0.0v 169.45n 0.0v 169.55n 5.0v 179.45n 5.0v 179.55n 5.0v 189.45n 5.0v 189.55n 5.0v 199.45n 5.0v 199.55n 5.0v 209.45n 5.0v 209.55n 5.0v 219.45n 5.0v 219.55n 5.0v 229.45n 5.0v 229.55n 5.0v 239.45n 5.0v 239.55n 5.0v 249.45n 5.0v 249.55n 5.0v 259.45n 5.0v 259.55n 5.0v 269.45n 5.0v 269.55n 5.0v 279.45n 5.0v 279.55n 0.0v 289.45n 0.0v 289.55n 0.0v 299.45n 0.0v 299.55n 0.0v 309.45n 0.0v 309.55n 0.0v 319.45n 0.0v 319.55n 0.0v 329.45n 0.0v 329.55n 0.0v 339.45n 0.0v 339.55n 0.0v 349.45n 0.0v 349.55n 0.0v 359.45n 0.0v 359.55n 0.0v 369.45n 0.0v 369.55n 0.0v 379.45n 0.0v 379.55n 0.0v 389.45n 0.0v 389.55n 5.0v 399.45n 5.0v 399.55n 5.0v 409.45n 5.0v 409.55n 5.0v 419.45n 5.0v 419.55n 5.0v 429.45n 5.0v 429.55n 5.0v 439.45n 5.0v 439.55n 5.0v 449.45n 5.0v 449.55n 0.0v 459.45n 0.0v 459.55n 0.0v 469.45n 0.0v 469.55n 5.0v 479.45n 5.0v 479.55n 0.0v 489.45n 0.0v 489.55n 5.0v 499.45n 5.0v 499.55n 5.0v 509.45n 5.0v 509.55n 0.0v 519.45n 0.0v 519.55n 0.0v 529.45n 0.0v 529.55n 0.0v 539.45n 0.0v 539.55n 5.0v 549.45n 5.0v 549.55n 5.0v 559.45n 5.0v 559.55n 5.0v 569.45n 5.0v 569.55n 5.0v 579.45n 5.0v 579.55n 5.0v 589.45n 5.0v 589.55n 5.0v 599.45n 5.0v 599.55n 5.0v 609.45n 5.0v 609.55n 0.0v 619.45n 0.0v 619.55n 0.0v 629.45n 0.0v 629.55n 0.0v 639.45n 0.0v 639.55n 0.0v 649.45n 0.0v 649.55n 0.0v 659.45n 0.0v 659.55n 5.0v 669.45n 5.0v 669.55n 5.0v 679.45n 5.0v 679.55n 0.0v 689.45n 0.0v 689.55n 0.0v 699.45n 0.0v 699.55n 0.0v 709.45n 0.0v 709.55n 0.0v 719.45n 0.0v 719.55n 0.0v 729.45n 0.0v 729.55n 0.0v 739.45n 0.0v 739.55n 0.0v 749.45n 0.0v 749.55n 5.0v 759.45n 5.0v 759.55n 5.0v 769.45n 5.0v 769.55n 5.0v 779.45n 5.0v 779.55n 5.0v 789.45n 5.0v 789.55n 5.0v 799.45n 5.0v 799.55n 5.0v 809.45n 5.0v 809.55n 5.0v 819.45n 5.0v 819.55n 5.0v 829.45n 5.0v 829.55n 5.0v 839.45n 5.0v 839.55n 5.0v 849.45n 5.0v 849.55n 0.0v 859.45n 0.0v 859.55n 0.0v 869.45n 0.0v 869.55n 0.0v 879.45n 0.0v 879.55n 0.0v 889.45n 0.0v 889.55n 0.0v 899.45n 0.0v 899.55n 0.0v 909.45n 0.0v 909.55n 0.0v 919.45n 0.0v 919.55n 0.0v 929.45n 0.0v 929.55n 0.0v 939.45n 0.0v 939.55n 0.0v 949.45n 0.0v 949.55n 5.0v 959.45n 5.0v 959.55n 5.0v 969.45n 5.0v 969.55n 0.0v 979.45n 0.0v 979.55n 0.0v 989.45n 0.0v 989.55n 0.0v 999.45n 0.0v 999.55n 0.0v 1009.45n 0.0v 1009.55n 0.0v 1019.45n 0.0v 1019.55n 0.0v 1029.45n 0.0v 1029.55n 0.0v 1039.45n 0.0v 1039.55n 0.0v 1049.45n 0.0v 1049.55n 0.0v 1059.45n 0.0v 1059.55n 0.0v 1069.45n 0.0v 1069.55n 0.0v 1079.45n 0.0v 1079.55n 0.0v 1089.45n 0.0v 1089.55n 0.0v 1099.45n 0.0v 1099.55n 0.0v 1109.45n 0.0v 1109.55n 0.0v 1119.45n 0.0v 1119.55n 0.0v 1129.45n 0.0v 1129.55n 0.0v 1139.45n 0.0v 1139.55n 0.0v 1149.45n 0.0v 1149.55n 5.0v 1159.45n 5.0v 1159.55n 0.0v 1169.45n 0.0v 1169.55n 0.0v 1179.45n 0.0v 1179.55n 0.0v 1189.45n 0.0v 1189.55n 0.0v 1199.45n 0.0v 1199.55n 0.0v 1209.45n 0.0v 1209.55n 0.0v 1219.45n 0.0v 1219.55n 0.0v 1229.45n 0.0v 1229.55n 5.0v 1239.45n 5.0v 1239.55n 5.0v 1249.45n 5.0v 1249.55n 5.0v 1259.45n 5.0v 1259.55n 5.0v 1269.45n 5.0v 1269.55n 5.0v 1279.45n 5.0v 1279.55n 5.0v 1289.45n 5.0v 1289.55n 5.0v 1299.45n 5.0v 1299.55n 0.0v 1309.45n 0.0v 1309.55n 5.0v 1319.45n 5.0v 1319.55n 5.0v 1329.45n 5.0v 1329.55n 5.0v 1339.45n 5.0v 1339.55n 5.0v 1349.45n 5.0v 1349.55n 5.0v 1359.45n 5.0v 1359.55n 5.0v 1369.45n 5.0v 1369.55n 5.0v 1379.45n 5.0v 1379.55n 5.0v 1389.45n 5.0v 1389.55n 5.0v 1399.45n 5.0v 1399.55n 5.0v 1409.45n 5.0v 1409.55n 5.0v 1419.45n 5.0v 1419.55n 5.0v 1429.45n 5.0v 1429.55n 5.0v 1439.45n 5.0v 1439.55n 5.0v 1449.45n 5.0v 1449.55n 5.0v 1459.45n 5.0v 1459.55n 5.0v 1469.45n 5.0v 1469.55n 5.0v 1479.45n 5.0v 1479.55n 0.0v 1489.45n 0.0v 1489.55n 0.0v 1499.45n 0.0v 1499.55n 5.0v 1509.45n 5.0v 1509.55n 0.0v 1519.45n 0.0v 1519.55n 5.0v 1529.45n 5.0v 1529.55n 0.0v 1539.45n 0.0v 1539.55n 5.0v 1549.45n 5.0v 1549.55n 0.0v 1559.45n 0.0v 1559.55n 0.0v 1569.45n 0.0v 1569.55n 0.0v 1579.45n 0.0v 1579.55n 0.0v 1589.45n 0.0v 1589.55n 0.0v 1599.45n 0.0v 1599.55n 0.0v 1609.45n 0.0v 1609.55n 0.0v 1619.45n 0.0v 1619.55n 0.0v 1629.45n 0.0v 1629.55n 0.0v 1639.45n 0.0v 1639.55n 0.0v 1649.45n 0.0v 1649.55n 0.0v 1659.45n 0.0v 1659.55n 0.0v 1669.45n 0.0v 1669.55n 0.0v 1679.45n 0.0v 1679.55n 0.0v 1689.45n 0.0v 1689.55n 0.0v 1699.45n 0.0v 1699.55n 0.0v 1709.45n 0.0v 1709.55n 0.0v 1719.45n 0.0v 1719.55n 0.0v 1729.45n 0.0v 1729.55n 0.0v 1739.45n 0.0v 1739.55n 0.0v 1749.45n 0.0v 1749.55n 0.0v 1759.45n 0.0v 1759.55n 0.0v 1769.45n 0.0v 1769.55n 5.0v 1779.45n 5.0v 1779.55n 5.0v 1789.45n 5.0v 1789.55n 5.0v 1799.45n 5.0v 1799.55n 5.0v 1809.45n 5.0v 1809.55n 0.0v 1819.45n 0.0v 1819.55n 0.0v 1829.45n 0.0v 1829.55n 0.0v 1839.45n 0.0v 1839.55n 0.0v 1849.45n 0.0v 1849.55n 5.0v 1859.45n 5.0v 1859.55n 0.0v 1869.45n 0.0v 1869.55n 0.0v 1879.45n 0.0v 1879.55n 0.0v 1889.45n 0.0v 1889.55n 0.0v 1899.45n 0.0v 1899.55n 0.0v 1909.45n 0.0v 1909.55n 0.0v 1919.45n 0.0v 1919.55n 0.0v 1929.45n 0.0v 1929.55n 5.0v 1939.45n 5.0v 1939.55n 5.0v 1949.45n 5.0v 1949.55n 5.0v 1959.45n 5.0v 1959.55n 5.0v 1969.45n 5.0v 1969.55n 5.0v 1979.45n 5.0v 1979.55n 0.0v 1989.45n 0.0v 1989.55n 0.0v 1999.45n 0.0v 1999.55n 0.0v 2009.45n 0.0v 2009.55n 0.0v 2019.45n 0.0v 2019.55n 0.0v 2029.45n 0.0v 2029.55n 5.0v 2039.45n 5.0v 2039.55n 5.0v 2049.45n 5.0v 2049.55n 5.0v )
* (time, data): [(0, 0), (10, 1), (20, 1), (30, 0), (40, 0), (50, 0), (60, 1), (70, 1), (80, 1), (90, 1), (100, 1), (110, 1), (120, 1), (130, 0), (140, 0), (150, 1), (160, 0), (170, 1), (180, 1), (190, 1), (200, 1), (210, 1), (220, 1), (230, 1), (240, 1), (250, 1), (260, 1), (270, 1), (280, 0), (290, 0), (300, 1), (310, 1), (320, 1), (330, 1), (340, 1), (350, 1), (360, 1), (370, 1), (380, 1), (390, 0), (400, 1), (410, 1), (420, 1), (430, 0), (440, 0), (450, 1), (460, 1), (470, 1), (480, 1), (490, 1), (500, 1), (510, 0), (520, 0), (530, 1), (540, 1), (550, 1), (560, 1), (570, 1), (580, 1), (590, 0), (600, 0), (610, 1), (620, 1), (630, 1), (640, 1), (650, 1), (660, 1), (670, 1), (680, 1), (690, 1), (700, 1), (710, 1), (720, 0), (730, 0), (740, 1), (750, 1), (760, 0), (770, 0), (780, 1), (790, 1), (800, 1), (810, 1), (820, 0), (830, 0), (840, 0), (850, 0), (860, 0), (870, 0), (880, 0), (890, 0), (900, 0), (910, 0), (920, 0), (930, 0), (940, 0), (950, 1), (960, 1), (970, 0), (980, 0), (990, 0), (1000, 1), (1010, 1), (1020, 1), (1030, 1), (1040, 1), (1050, 1), (1060, 1), (1070, 1), (1080, 0), (1090, 1), (1100, 1), (1110, 0), (1120, 1), (1130, 1), (1140, 1), (1150, 0), (1160, 1), (1170, 1), (1180, 1), (1190, 1), (1200, 1), (1210, 1), (1220, 0), (1230, 0), (1240, 0), (1250, 0), (1260, 0), (1270, 1), (1280, 0), (1290, 0), (1300, 1), (1310, 1), (1320, 1), (1330, 0), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 0), (1390, 0), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 0), (1450, 0), (1460, 0), (1470, 0), (1480, 0), (1490, 0), (1500, 1), (1510, 0), (1520, 1), (1530, 1), (1540, 0), (1550, 0), (1560, 0), (1570, 0), (1580, 0), (1590, 0), (1600, 0), (1610, 0), (1620, 0), (1630, 0), (1640, 0), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 0), (1700, 0), (1710, 0), (1720, 1), (1730, 0), (1740, 0), (1750, 0), (1760, 1), (1770, 1), (1780, 1), (1790, 0), (1800, 0), (1810, 1), (1820, 1), (1830, 1), (1840, 1), (1850, 1), (1860, 1), (1870, 1), (1880, 1), (1890, 1), (1900, 1), (1910, 1), (1920, 1), (1930, 0), (1940, 0), (1950, 0), (1960, 0), (1970, 1), (1980, 1), (1990, 1), (2000, 1), (2010, 1), (2020, 1), (2030, 1), (2040, 1), (2050, 1)]
Vdin0_25  din0_25  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 5.0v 19.45n 5.0v 19.55n 5.0v 29.45n 5.0v 29.55n 0.0v 39.45n 0.0v 39.55n 0.0v 49.45n 0.0v 49.55n 0.0v 59.45n 0.0v 59.55n 5.0v 69.45n 5.0v 69.55n 5.0v 79.45n 5.0v 79.55n 5.0v 89.45n 5.0v 89.55n 5.0v 99.45n 5.0v 99.55n 5.0v 109.45n 5.0v 109.55n 5.0v 119.45n 5.0v 119.55n 5.0v 129.45n 5.0v 129.55n 0.0v 139.45n 0.0v 139.55n 0.0v 149.45n 0.0v 149.55n 5.0v 159.45n 5.0v 159.55n 0.0v 169.45n 0.0v 169.55n 5.0v 179.45n 5.0v 179.55n 5.0v 189.45n 5.0v 189.55n 5.0v 199.45n 5.0v 199.55n 5.0v 209.45n 5.0v 209.55n 5.0v 219.45n 5.0v 219.55n 5.0v 229.45n 5.0v 229.55n 5.0v 239.45n 5.0v 239.55n 5.0v 249.45n 5.0v 249.55n 5.0v 259.45n 5.0v 259.55n 5.0v 269.45n 5.0v 269.55n 5.0v 279.45n 5.0v 279.55n 0.0v 289.45n 0.0v 289.55n 0.0v 299.45n 0.0v 299.55n 5.0v 309.45n 5.0v 309.55n 5.0v 319.45n 5.0v 319.55n 5.0v 329.45n 5.0v 329.55n 5.0v 339.45n 5.0v 339.55n 5.0v 349.45n 5.0v 349.55n 5.0v 359.45n 5.0v 359.55n 5.0v 369.45n 5.0v 369.55n 5.0v 379.45n 5.0v 379.55n 5.0v 389.45n 5.0v 389.55n 0.0v 399.45n 0.0v 399.55n 5.0v 409.45n 5.0v 409.55n 5.0v 419.45n 5.0v 419.55n 5.0v 429.45n 5.0v 429.55n 0.0v 439.45n 0.0v 439.55n 0.0v 449.45n 0.0v 449.55n 5.0v 459.45n 5.0v 459.55n 5.0v 469.45n 5.0v 469.55n 5.0v 479.45n 5.0v 479.55n 5.0v 489.45n 5.0v 489.55n 5.0v 499.45n 5.0v 499.55n 5.0v 509.45n 5.0v 509.55n 0.0v 519.45n 0.0v 519.55n 0.0v 529.45n 0.0v 529.55n 5.0v 539.45n 5.0v 539.55n 5.0v 549.45n 5.0v 549.55n 5.0v 559.45n 5.0v 559.55n 5.0v 569.45n 5.0v 569.55n 5.0v 579.45n 5.0v 579.55n 5.0v 589.45n 5.0v 589.55n 0.0v 599.45n 0.0v 599.55n 0.0v 609.45n 0.0v 609.55n 5.0v 619.45n 5.0v 619.55n 5.0v 629.45n 5.0v 629.55n 5.0v 639.45n 5.0v 639.55n 5.0v 649.45n 5.0v 649.55n 5.0v 659.45n 5.0v 659.55n 5.0v 669.45n 5.0v 669.55n 5.0v 679.45n 5.0v 679.55n 5.0v 689.45n 5.0v 689.55n 5.0v 699.45n 5.0v 699.55n 5.0v 709.45n 5.0v 709.55n 5.0v 719.45n 5.0v 719.55n 0.0v 729.45n 0.0v 729.55n 0.0v 739.45n 0.0v 739.55n 5.0v 749.45n 5.0v 749.55n 5.0v 759.45n 5.0v 759.55n 0.0v 769.45n 0.0v 769.55n 0.0v 779.45n 0.0v 779.55n 5.0v 789.45n 5.0v 789.55n 5.0v 799.45n 5.0v 799.55n 5.0v 809.45n 5.0v 809.55n 5.0v 819.45n 5.0v 819.55n 0.0v 829.45n 0.0v 829.55n 0.0v 839.45n 0.0v 839.55n 0.0v 849.45n 0.0v 849.55n 0.0v 859.45n 0.0v 859.55n 0.0v 869.45n 0.0v 869.55n 0.0v 879.45n 0.0v 879.55n 0.0v 889.45n 0.0v 889.55n 0.0v 899.45n 0.0v 899.55n 0.0v 909.45n 0.0v 909.55n 0.0v 919.45n 0.0v 919.55n 0.0v 929.45n 0.0v 929.55n 0.0v 939.45n 0.0v 939.55n 0.0v 949.45n 0.0v 949.55n 5.0v 959.45n 5.0v 959.55n 5.0v 969.45n 5.0v 969.55n 0.0v 979.45n 0.0v 979.55n 0.0v 989.45n 0.0v 989.55n 0.0v 999.45n 0.0v 999.55n 5.0v 1009.45n 5.0v 1009.55n 5.0v 1019.45n 5.0v 1019.55n 5.0v 1029.45n 5.0v 1029.55n 5.0v 1039.45n 5.0v 1039.55n 5.0v 1049.45n 5.0v 1049.55n 5.0v 1059.45n 5.0v 1059.55n 5.0v 1069.45n 5.0v 1069.55n 5.0v 1079.45n 5.0v 1079.55n 0.0v 1089.45n 0.0v 1089.55n 5.0v 1099.45n 5.0v 1099.55n 5.0v 1109.45n 5.0v 1109.55n 0.0v 1119.45n 0.0v 1119.55n 5.0v 1129.45n 5.0v 1129.55n 5.0v 1139.45n 5.0v 1139.55n 5.0v 1149.45n 5.0v 1149.55n 0.0v 1159.45n 0.0v 1159.55n 5.0v 1169.45n 5.0v 1169.55n 5.0v 1179.45n 5.0v 1179.55n 5.0v 1189.45n 5.0v 1189.55n 5.0v 1199.45n 5.0v 1199.55n 5.0v 1209.45n 5.0v 1209.55n 5.0v 1219.45n 5.0v 1219.55n 0.0v 1229.45n 0.0v 1229.55n 0.0v 1239.45n 0.0v 1239.55n 0.0v 1249.45n 0.0v 1249.55n 0.0v 1259.45n 0.0v 1259.55n 0.0v 1269.45n 0.0v 1269.55n 5.0v 1279.45n 5.0v 1279.55n 0.0v 1289.45n 0.0v 1289.55n 0.0v 1299.45n 0.0v 1299.55n 5.0v 1309.45n 5.0v 1309.55n 5.0v 1319.45n 5.0v 1319.55n 5.0v 1329.45n 5.0v 1329.55n 0.0v 1339.45n 0.0v 1339.55n 0.0v 1349.45n 0.0v 1349.55n 0.0v 1359.45n 0.0v 1359.55n 0.0v 1369.45n 0.0v 1369.55n 0.0v 1379.45n 0.0v 1379.55n 0.0v 1389.45n 0.0v 1389.55n 0.0v 1399.45n 0.0v 1399.55n 0.0v 1409.45n 0.0v 1409.55n 0.0v 1419.45n 0.0v 1419.55n 0.0v 1429.45n 0.0v 1429.55n 0.0v 1439.45n 0.0v 1439.55n 0.0v 1449.45n 0.0v 1449.55n 0.0v 1459.45n 0.0v 1459.55n 0.0v 1469.45n 0.0v 1469.55n 0.0v 1479.45n 0.0v 1479.55n 0.0v 1489.45n 0.0v 1489.55n 0.0v 1499.45n 0.0v 1499.55n 5.0v 1509.45n 5.0v 1509.55n 0.0v 1519.45n 0.0v 1519.55n 5.0v 1529.45n 5.0v 1529.55n 5.0v 1539.45n 5.0v 1539.55n 0.0v 1549.45n 0.0v 1549.55n 0.0v 1559.45n 0.0v 1559.55n 0.0v 1569.45n 0.0v 1569.55n 0.0v 1579.45n 0.0v 1579.55n 0.0v 1589.45n 0.0v 1589.55n 0.0v 1599.45n 0.0v 1599.55n 0.0v 1609.45n 0.0v 1609.55n 0.0v 1619.45n 0.0v 1619.55n 0.0v 1629.45n 0.0v 1629.55n 0.0v 1639.45n 0.0v 1639.55n 0.0v 1649.45n 0.0v 1649.55n 0.0v 1659.45n 0.0v 1659.55n 0.0v 1669.45n 0.0v 1669.55n 0.0v 1679.45n 0.0v 1679.55n 0.0v 1689.45n 0.0v 1689.55n 0.0v 1699.45n 0.0v 1699.55n 0.0v 1709.45n 0.0v 1709.55n 0.0v 1719.45n 0.0v 1719.55n 5.0v 1729.45n 5.0v 1729.55n 0.0v 1739.45n 0.0v 1739.55n 0.0v 1749.45n 0.0v 1749.55n 0.0v 1759.45n 0.0v 1759.55n 5.0v 1769.45n 5.0v 1769.55n 5.0v 1779.45n 5.0v 1779.55n 5.0v 1789.45n 5.0v 1789.55n 0.0v 1799.45n 0.0v 1799.55n 0.0v 1809.45n 0.0v 1809.55n 5.0v 1819.45n 5.0v 1819.55n 5.0v 1829.45n 5.0v 1829.55n 5.0v 1839.45n 5.0v 1839.55n 5.0v 1849.45n 5.0v 1849.55n 5.0v 1859.45n 5.0v 1859.55n 5.0v 1869.45n 5.0v 1869.55n 5.0v 1879.45n 5.0v 1879.55n 5.0v 1889.45n 5.0v 1889.55n 5.0v 1899.45n 5.0v 1899.55n 5.0v 1909.45n 5.0v 1909.55n 5.0v 1919.45n 5.0v 1919.55n 5.0v 1929.45n 5.0v 1929.55n 0.0v 1939.45n 0.0v 1939.55n 0.0v 1949.45n 0.0v 1949.55n 0.0v 1959.45n 0.0v 1959.55n 0.0v 1969.45n 0.0v 1969.55n 5.0v 1979.45n 5.0v 1979.55n 5.0v 1989.45n 5.0v 1989.55n 5.0v 1999.45n 5.0v 1999.55n 5.0v 2009.45n 5.0v 2009.55n 5.0v 2019.45n 5.0v 2019.55n 5.0v 2029.45n 5.0v 2029.55n 5.0v 2039.45n 5.0v 2039.55n 5.0v 2049.45n 5.0v 2049.55n 5.0v )
* (time, data): [(0, 0), (10, 0), (20, 0), (30, 0), (40, 0), (50, 1), (60, 1), (70, 0), (80, 0), (90, 0), (100, 0), (110, 0), (120, 0), (130, 1), (140, 1), (150, 1), (160, 1), (170, 1), (180, 1), (190, 1), (200, 1), (210, 1), (220, 0), (230, 0), (240, 0), (250, 1), (260, 1), (270, 1), (280, 0), (290, 0), (300, 0), (310, 0), (320, 0), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 0), (390, 0), (400, 1), (410, 1), (420, 1), (430, 1), (440, 1), (450, 0), (460, 0), (470, 1), (480, 0), (490, 1), (500, 1), (510, 0), (520, 0), (530, 0), (540, 0), (550, 0), (560, 0), (570, 0), (580, 0), (590, 1), (600, 0), (610, 0), (620, 0), (630, 0), (640, 0), (650, 0), (660, 0), (670, 1), (680, 1), (690, 1), (700, 1), (710, 1), (720, 1), (730, 1), (740, 0), (750, 0), (760, 0), (770, 0), (780, 0), (790, 0), (800, 0), (810, 0), (820, 0), (830, 0), (840, 0), (850, 0), (860, 0), (870, 0), (880, 0), (890, 0), (900, 0), (910, 1), (920, 1), (930, 1), (940, 1), (950, 0), (960, 0), (970, 1), (980, 1), (990, 1), (1000, 1), (1010, 1), (1020, 0), (1030, 0), (1040, 0), (1050, 0), (1060, 0), (1070, 0), (1080, 1), (1090, 0), (1100, 0), (1110, 0), (1120, 1), (1130, 1), (1140, 1), (1150, 0), (1160, 1), (1170, 1), (1180, 1), (1190, 0), (1200, 1), (1210, 1), (1220, 1), (1230, 0), (1240, 0), (1250, 0), (1260, 0), (1270, 1), (1280, 1), (1290, 1), (1300, 0), (1310, 1), (1320, 0), (1330, 0), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 0), (1390, 0), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 0), (1450, 0), (1460, 0), (1470, 0), (1480, 1), (1490, 1), (1500, 1), (1510, 0), (1520, 0), (1530, 0), (1540, 0), (1550, 1), (1560, 0), (1570, 0), (1580, 0), (1590, 1), (1600, 1), (1610, 1), (1620, 1), (1630, 1), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 1), (1700, 1), (1710, 1), (1720, 1), (1730, 1), (1740, 1), (1750, 1), (1760, 1), (1770, 0), (1780, 0), (1790, 0), (1800, 0), (1810, 1), (1820, 1), (1830, 1), (1840, 0), (1850, 0), (1860, 1), (1870, 1), (1880, 0), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 0), (1940, 0), (1950, 0), (1960, 0), (1970, 1), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 0), (2030, 0), (2040, 0), (2050, 0)]
Vdin0_26  din0_26  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 0.0v 19.45n 0.0v 19.55n 0.0v 29.45n 0.0v 29.55n 0.0v 39.45n 0.0v 39.55n 0.0v 49.45n 0.0v 49.55n 5.0v 59.45n 5.0v 59.55n 5.0v 69.45n 5.0v 69.55n 0.0v 79.45n 0.0v 79.55n 0.0v 89.45n 0.0v 89.55n 0.0v 99.45n 0.0v 99.55n 0.0v 109.45n 0.0v 109.55n 0.0v 119.45n 0.0v 119.55n 0.0v 129.45n 0.0v 129.55n 5.0v 139.45n 5.0v 139.55n 5.0v 149.45n 5.0v 149.55n 5.0v 159.45n 5.0v 159.55n 5.0v 169.45n 5.0v 169.55n 5.0v 179.45n 5.0v 179.55n 5.0v 189.45n 5.0v 189.55n 5.0v 199.45n 5.0v 199.55n 5.0v 209.45n 5.0v 209.55n 5.0v 219.45n 5.0v 219.55n 0.0v 229.45n 0.0v 229.55n 0.0v 239.45n 0.0v 239.55n 0.0v 249.45n 0.0v 249.55n 5.0v 259.45n 5.0v 259.55n 5.0v 269.45n 5.0v 269.55n 5.0v 279.45n 5.0v 279.55n 0.0v 289.45n 0.0v 289.55n 0.0v 299.45n 0.0v 299.55n 0.0v 309.45n 0.0v 309.55n 0.0v 319.45n 0.0v 319.55n 0.0v 329.45n 0.0v 329.55n 0.0v 339.45n 0.0v 339.55n 0.0v 349.45n 0.0v 349.55n 0.0v 359.45n 0.0v 359.55n 0.0v 369.45n 0.0v 369.55n 0.0v 379.45n 0.0v 379.55n 0.0v 389.45n 0.0v 389.55n 0.0v 399.45n 0.0v 399.55n 5.0v 409.45n 5.0v 409.55n 5.0v 419.45n 5.0v 419.55n 5.0v 429.45n 5.0v 429.55n 5.0v 439.45n 5.0v 439.55n 5.0v 449.45n 5.0v 449.55n 0.0v 459.45n 0.0v 459.55n 0.0v 469.45n 0.0v 469.55n 5.0v 479.45n 5.0v 479.55n 0.0v 489.45n 0.0v 489.55n 5.0v 499.45n 5.0v 499.55n 5.0v 509.45n 5.0v 509.55n 0.0v 519.45n 0.0v 519.55n 0.0v 529.45n 0.0v 529.55n 0.0v 539.45n 0.0v 539.55n 0.0v 549.45n 0.0v 549.55n 0.0v 559.45n 0.0v 559.55n 0.0v 569.45n 0.0v 569.55n 0.0v 579.45n 0.0v 579.55n 0.0v 589.45n 0.0v 589.55n 5.0v 599.45n 5.0v 599.55n 0.0v 609.45n 0.0v 609.55n 0.0v 619.45n 0.0v 619.55n 0.0v 629.45n 0.0v 629.55n 0.0v 639.45n 0.0v 639.55n 0.0v 649.45n 0.0v 649.55n 0.0v 659.45n 0.0v 659.55n 0.0v 669.45n 0.0v 669.55n 5.0v 679.45n 5.0v 679.55n 5.0v 689.45n 5.0v 689.55n 5.0v 699.45n 5.0v 699.55n 5.0v 709.45n 5.0v 709.55n 5.0v 719.45n 5.0v 719.55n 5.0v 729.45n 5.0v 729.55n 5.0v 739.45n 5.0v 739.55n 0.0v 749.45n 0.0v 749.55n 0.0v 759.45n 0.0v 759.55n 0.0v 769.45n 0.0v 769.55n 0.0v 779.45n 0.0v 779.55n 0.0v 789.45n 0.0v 789.55n 0.0v 799.45n 0.0v 799.55n 0.0v 809.45n 0.0v 809.55n 0.0v 819.45n 0.0v 819.55n 0.0v 829.45n 0.0v 829.55n 0.0v 839.45n 0.0v 839.55n 0.0v 849.45n 0.0v 849.55n 0.0v 859.45n 0.0v 859.55n 0.0v 869.45n 0.0v 869.55n 0.0v 879.45n 0.0v 879.55n 0.0v 889.45n 0.0v 889.55n 0.0v 899.45n 0.0v 899.55n 0.0v 909.45n 0.0v 909.55n 5.0v 919.45n 5.0v 919.55n 5.0v 929.45n 5.0v 929.55n 5.0v 939.45n 5.0v 939.55n 5.0v 949.45n 5.0v 949.55n 0.0v 959.45n 0.0v 959.55n 0.0v 969.45n 0.0v 969.55n 5.0v 979.45n 5.0v 979.55n 5.0v 989.45n 5.0v 989.55n 5.0v 999.45n 5.0v 999.55n 5.0v 1009.45n 5.0v 1009.55n 5.0v 1019.45n 5.0v 1019.55n 0.0v 1029.45n 0.0v 1029.55n 0.0v 1039.45n 0.0v 1039.55n 0.0v 1049.45n 0.0v 1049.55n 0.0v 1059.45n 0.0v 1059.55n 0.0v 1069.45n 0.0v 1069.55n 0.0v 1079.45n 0.0v 1079.55n 5.0v 1089.45n 5.0v 1089.55n 0.0v 1099.45n 0.0v 1099.55n 0.0v 1109.45n 0.0v 1109.55n 0.0v 1119.45n 0.0v 1119.55n 5.0v 1129.45n 5.0v 1129.55n 5.0v 1139.45n 5.0v 1139.55n 5.0v 1149.45n 5.0v 1149.55n 0.0v 1159.45n 0.0v 1159.55n 5.0v 1169.45n 5.0v 1169.55n 5.0v 1179.45n 5.0v 1179.55n 5.0v 1189.45n 5.0v 1189.55n 0.0v 1199.45n 0.0v 1199.55n 5.0v 1209.45n 5.0v 1209.55n 5.0v 1219.45n 5.0v 1219.55n 5.0v 1229.45n 5.0v 1229.55n 0.0v 1239.45n 0.0v 1239.55n 0.0v 1249.45n 0.0v 1249.55n 0.0v 1259.45n 0.0v 1259.55n 0.0v 1269.45n 0.0v 1269.55n 5.0v 1279.45n 5.0v 1279.55n 5.0v 1289.45n 5.0v 1289.55n 5.0v 1299.45n 5.0v 1299.55n 0.0v 1309.45n 0.0v 1309.55n 5.0v 1319.45n 5.0v 1319.55n 0.0v 1329.45n 0.0v 1329.55n 0.0v 1339.45n 0.0v 1339.55n 0.0v 1349.45n 0.0v 1349.55n 0.0v 1359.45n 0.0v 1359.55n 0.0v 1369.45n 0.0v 1369.55n 0.0v 1379.45n 0.0v 1379.55n 0.0v 1389.45n 0.0v 1389.55n 0.0v 1399.45n 0.0v 1399.55n 0.0v 1409.45n 0.0v 1409.55n 0.0v 1419.45n 0.0v 1419.55n 0.0v 1429.45n 0.0v 1429.55n 0.0v 1439.45n 0.0v 1439.55n 0.0v 1449.45n 0.0v 1449.55n 0.0v 1459.45n 0.0v 1459.55n 0.0v 1469.45n 0.0v 1469.55n 0.0v 1479.45n 0.0v 1479.55n 5.0v 1489.45n 5.0v 1489.55n 5.0v 1499.45n 5.0v 1499.55n 5.0v 1509.45n 5.0v 1509.55n 0.0v 1519.45n 0.0v 1519.55n 0.0v 1529.45n 0.0v 1529.55n 0.0v 1539.45n 0.0v 1539.55n 0.0v 1549.45n 0.0v 1549.55n 5.0v 1559.45n 5.0v 1559.55n 0.0v 1569.45n 0.0v 1569.55n 0.0v 1579.45n 0.0v 1579.55n 0.0v 1589.45n 0.0v 1589.55n 5.0v 1599.45n 5.0v 1599.55n 5.0v 1609.45n 5.0v 1609.55n 5.0v 1619.45n 5.0v 1619.55n 5.0v 1629.45n 5.0v 1629.55n 5.0v 1639.45n 5.0v 1639.55n 5.0v 1649.45n 5.0v 1649.55n 5.0v 1659.45n 5.0v 1659.55n 5.0v 1669.45n 5.0v 1669.55n 5.0v 1679.45n 5.0v 1679.55n 5.0v 1689.45n 5.0v 1689.55n 5.0v 1699.45n 5.0v 1699.55n 5.0v 1709.45n 5.0v 1709.55n 5.0v 1719.45n 5.0v 1719.55n 5.0v 1729.45n 5.0v 1729.55n 5.0v 1739.45n 5.0v 1739.55n 5.0v 1749.45n 5.0v 1749.55n 5.0v 1759.45n 5.0v 1759.55n 5.0v 1769.45n 5.0v 1769.55n 0.0v 1779.45n 0.0v 1779.55n 0.0v 1789.45n 0.0v 1789.55n 0.0v 1799.45n 0.0v 1799.55n 0.0v 1809.45n 0.0v 1809.55n 5.0v 1819.45n 5.0v 1819.55n 5.0v 1829.45n 5.0v 1829.55n 5.0v 1839.45n 5.0v 1839.55n 0.0v 1849.45n 0.0v 1849.55n 0.0v 1859.45n 0.0v 1859.55n 5.0v 1869.45n 5.0v 1869.55n 5.0v 1879.45n 5.0v 1879.55n 0.0v 1889.45n 0.0v 1889.55n 0.0v 1899.45n 0.0v 1899.55n 0.0v 1909.45n 0.0v 1909.55n 0.0v 1919.45n 0.0v 1919.55n 0.0v 1929.45n 0.0v 1929.55n 0.0v 1939.45n 0.0v 1939.55n 0.0v 1949.45n 0.0v 1949.55n 0.0v 1959.45n 0.0v 1959.55n 0.0v 1969.45n 0.0v 1969.55n 5.0v 1979.45n 5.0v 1979.55n 0.0v 1989.45n 0.0v 1989.55n 0.0v 1999.45n 0.0v 1999.55n 0.0v 2009.45n 0.0v 2009.55n 0.0v 2019.45n 0.0v 2019.55n 0.0v 2029.45n 0.0v 2029.55n 0.0v 2039.45n 0.0v 2039.55n 0.0v 2049.45n 0.0v 2049.55n 0.0v )
* (time, data): [(0, 0), (10, 1), (20, 0), (30, 1), (40, 1), (50, 0), (60, 1), (70, 0), (80, 0), (90, 0), (100, 0), (110, 0), (120, 0), (130, 0), (140, 0), (150, 0), (160, 1), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 0), (230, 0), (240, 0), (250, 0), (260, 0), (270, 0), (280, 0), (290, 0), (300, 1), (310, 1), (320, 1), (330, 1), (340, 1), (350, 1), (360, 1), (370, 1), (380, 1), (390, 0), (400, 1), (410, 1), (420, 1), (430, 0), (440, 0), (450, 1), (460, 1), (470, 0), (480, 0), (490, 1), (500, 1), (510, 1), (520, 1), (530, 0), (540, 0), (550, 0), (560, 0), (570, 0), (580, 0), (590, 0), (600, 0), (610, 1), (620, 1), (630, 1), (640, 1), (650, 1), (660, 1), (670, 1), (680, 0), (690, 0), (700, 0), (710, 0), (720, 0), (730, 0), (740, 1), (750, 1), (760, 0), (770, 0), (780, 0), (790, 0), (800, 0), (810, 0), (820, 1), (830, 1), (840, 1), (850, 0), (860, 0), (870, 0), (880, 0), (890, 0), (900, 0), (910, 0), (920, 0), (930, 0), (940, 0), (950, 0), (960, 0), (970, 0), (980, 0), (990, 0), (1000, 1), (1010, 1), (1020, 1), (1030, 1), (1040, 1), (1050, 1), (1060, 1), (1070, 0), (1080, 0), (1090, 0), (1100, 0), (1110, 1), (1120, 1), (1130, 1), (1140, 1), (1150, 0), (1160, 0), (1170, 0), (1180, 0), (1190, 0), (1200, 1), (1210, 1), (1220, 0), (1230, 0), (1240, 0), (1250, 0), (1260, 0), (1270, 0), (1280, 1), (1290, 1), (1300, 1), (1310, 1), (1320, 0), (1330, 1), (1340, 1), (1350, 1), (1360, 1), (1370, 1), (1380, 0), (1390, 0), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 1), (1450, 1), (1460, 1), (1470, 1), (1480, 0), (1490, 0), (1500, 0), (1510, 1), (1520, 1), (1530, 1), (1540, 0), (1550, 1), (1560, 1), (1570, 1), (1580, 1), (1590, 1), (1600, 1), (1610, 1), (1620, 1), (1630, 1), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 1), (1700, 1), (1710, 1), (1720, 0), (1730, 1), (1740, 1), (1750, 1), (1760, 0), (1770, 1), (1780, 1), (1790, 1), (1800, 1), (1810, 0), (1820, 0), (1830, 0), (1840, 0), (1850, 0), (1860, 0), (1870, 0), (1880, 0), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 1), (1940, 1), (1950, 1), (1960, 1), (1970, 0), (1980, 1), (1990, 1), (2000, 1), (2010, 1), (2020, 1), (2030, 1), (2040, 1), (2050, 1)]
Vdin0_27  din0_27  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 5.0v 19.45n 5.0v 19.55n 0.0v 29.45n 0.0v 29.55n 5.0v 39.45n 5.0v 39.55n 5.0v 49.45n 5.0v 49.55n 0.0v 59.45n 0.0v 59.55n 5.0v 69.45n 5.0v 69.55n 0.0v 79.45n 0.0v 79.55n 0.0v 89.45n 0.0v 89.55n 0.0v 99.45n 0.0v 99.55n 0.0v 109.45n 0.0v 109.55n 0.0v 119.45n 0.0v 119.55n 0.0v 129.45n 0.0v 129.55n 0.0v 139.45n 0.0v 139.55n 0.0v 149.45n 0.0v 149.55n 0.0v 159.45n 0.0v 159.55n 5.0v 169.45n 5.0v 169.55n 0.0v 179.45n 0.0v 179.55n 0.0v 189.45n 0.0v 189.55n 0.0v 199.45n 0.0v 199.55n 0.0v 209.45n 0.0v 209.55n 0.0v 219.45n 0.0v 219.55n 0.0v 229.45n 0.0v 229.55n 0.0v 239.45n 0.0v 239.55n 0.0v 249.45n 0.0v 249.55n 0.0v 259.45n 0.0v 259.55n 0.0v 269.45n 0.0v 269.55n 0.0v 279.45n 0.0v 279.55n 0.0v 289.45n 0.0v 289.55n 0.0v 299.45n 0.0v 299.55n 5.0v 309.45n 5.0v 309.55n 5.0v 319.45n 5.0v 319.55n 5.0v 329.45n 5.0v 329.55n 5.0v 339.45n 5.0v 339.55n 5.0v 349.45n 5.0v 349.55n 5.0v 359.45n 5.0v 359.55n 5.0v 369.45n 5.0v 369.55n 5.0v 379.45n 5.0v 379.55n 5.0v 389.45n 5.0v 389.55n 0.0v 399.45n 0.0v 399.55n 5.0v 409.45n 5.0v 409.55n 5.0v 419.45n 5.0v 419.55n 5.0v 429.45n 5.0v 429.55n 0.0v 439.45n 0.0v 439.55n 0.0v 449.45n 0.0v 449.55n 5.0v 459.45n 5.0v 459.55n 5.0v 469.45n 5.0v 469.55n 0.0v 479.45n 0.0v 479.55n 0.0v 489.45n 0.0v 489.55n 5.0v 499.45n 5.0v 499.55n 5.0v 509.45n 5.0v 509.55n 5.0v 519.45n 5.0v 519.55n 5.0v 529.45n 5.0v 529.55n 0.0v 539.45n 0.0v 539.55n 0.0v 549.45n 0.0v 549.55n 0.0v 559.45n 0.0v 559.55n 0.0v 569.45n 0.0v 569.55n 0.0v 579.45n 0.0v 579.55n 0.0v 589.45n 0.0v 589.55n 0.0v 599.45n 0.0v 599.55n 0.0v 609.45n 0.0v 609.55n 5.0v 619.45n 5.0v 619.55n 5.0v 629.45n 5.0v 629.55n 5.0v 639.45n 5.0v 639.55n 5.0v 649.45n 5.0v 649.55n 5.0v 659.45n 5.0v 659.55n 5.0v 669.45n 5.0v 669.55n 5.0v 679.45n 5.0v 679.55n 0.0v 689.45n 0.0v 689.55n 0.0v 699.45n 0.0v 699.55n 0.0v 709.45n 0.0v 709.55n 0.0v 719.45n 0.0v 719.55n 0.0v 729.45n 0.0v 729.55n 0.0v 739.45n 0.0v 739.55n 5.0v 749.45n 5.0v 749.55n 5.0v 759.45n 5.0v 759.55n 0.0v 769.45n 0.0v 769.55n 0.0v 779.45n 0.0v 779.55n 0.0v 789.45n 0.0v 789.55n 0.0v 799.45n 0.0v 799.55n 0.0v 809.45n 0.0v 809.55n 0.0v 819.45n 0.0v 819.55n 5.0v 829.45n 5.0v 829.55n 5.0v 839.45n 5.0v 839.55n 5.0v 849.45n 5.0v 849.55n 0.0v 859.45n 0.0v 859.55n 0.0v 869.45n 0.0v 869.55n 0.0v 879.45n 0.0v 879.55n 0.0v 889.45n 0.0v 889.55n 0.0v 899.45n 0.0v 899.55n 0.0v 909.45n 0.0v 909.55n 0.0v 919.45n 0.0v 919.55n 0.0v 929.45n 0.0v 929.55n 0.0v 939.45n 0.0v 939.55n 0.0v 949.45n 0.0v 949.55n 0.0v 959.45n 0.0v 959.55n 0.0v 969.45n 0.0v 969.55n 0.0v 979.45n 0.0v 979.55n 0.0v 989.45n 0.0v 989.55n 0.0v 999.45n 0.0v 999.55n 5.0v 1009.45n 5.0v 1009.55n 5.0v 1019.45n 5.0v 1019.55n 5.0v 1029.45n 5.0v 1029.55n 5.0v 1039.45n 5.0v 1039.55n 5.0v 1049.45n 5.0v 1049.55n 5.0v 1059.45n 5.0v 1059.55n 5.0v 1069.45n 5.0v 1069.55n 0.0v 1079.45n 0.0v 1079.55n 0.0v 1089.45n 0.0v 1089.55n 0.0v 1099.45n 0.0v 1099.55n 0.0v 1109.45n 0.0v 1109.55n 5.0v 1119.45n 5.0v 1119.55n 5.0v 1129.45n 5.0v 1129.55n 5.0v 1139.45n 5.0v 1139.55n 5.0v 1149.45n 5.0v 1149.55n 0.0v 1159.45n 0.0v 1159.55n 0.0v 1169.45n 0.0v 1169.55n 0.0v 1179.45n 0.0v 1179.55n 0.0v 1189.45n 0.0v 1189.55n 0.0v 1199.45n 0.0v 1199.55n 5.0v 1209.45n 5.0v 1209.55n 5.0v 1219.45n 5.0v 1219.55n 0.0v 1229.45n 0.0v 1229.55n 0.0v 1239.45n 0.0v 1239.55n 0.0v 1249.45n 0.0v 1249.55n 0.0v 1259.45n 0.0v 1259.55n 0.0v 1269.45n 0.0v 1269.55n 0.0v 1279.45n 0.0v 1279.55n 5.0v 1289.45n 5.0v 1289.55n 5.0v 1299.45n 5.0v 1299.55n 5.0v 1309.45n 5.0v 1309.55n 5.0v 1319.45n 5.0v 1319.55n 0.0v 1329.45n 0.0v 1329.55n 5.0v 1339.45n 5.0v 1339.55n 5.0v 1349.45n 5.0v 1349.55n 5.0v 1359.45n 5.0v 1359.55n 5.0v 1369.45n 5.0v 1369.55n 5.0v 1379.45n 5.0v 1379.55n 0.0v 1389.45n 0.0v 1389.55n 0.0v 1399.45n 0.0v 1399.55n 0.0v 1409.45n 0.0v 1409.55n 0.0v 1419.45n 0.0v 1419.55n 0.0v 1429.45n 0.0v 1429.55n 0.0v 1439.45n 0.0v 1439.55n 5.0v 1449.45n 5.0v 1449.55n 5.0v 1459.45n 5.0v 1459.55n 5.0v 1469.45n 5.0v 1469.55n 5.0v 1479.45n 5.0v 1479.55n 0.0v 1489.45n 0.0v 1489.55n 0.0v 1499.45n 0.0v 1499.55n 0.0v 1509.45n 0.0v 1509.55n 5.0v 1519.45n 5.0v 1519.55n 5.0v 1529.45n 5.0v 1529.55n 5.0v 1539.45n 5.0v 1539.55n 0.0v 1549.45n 0.0v 1549.55n 5.0v 1559.45n 5.0v 1559.55n 5.0v 1569.45n 5.0v 1569.55n 5.0v 1579.45n 5.0v 1579.55n 5.0v 1589.45n 5.0v 1589.55n 5.0v 1599.45n 5.0v 1599.55n 5.0v 1609.45n 5.0v 1609.55n 5.0v 1619.45n 5.0v 1619.55n 5.0v 1629.45n 5.0v 1629.55n 5.0v 1639.45n 5.0v 1639.55n 5.0v 1649.45n 5.0v 1649.55n 5.0v 1659.45n 5.0v 1659.55n 5.0v 1669.45n 5.0v 1669.55n 5.0v 1679.45n 5.0v 1679.55n 5.0v 1689.45n 5.0v 1689.55n 5.0v 1699.45n 5.0v 1699.55n 5.0v 1709.45n 5.0v 1709.55n 5.0v 1719.45n 5.0v 1719.55n 0.0v 1729.45n 0.0v 1729.55n 5.0v 1739.45n 5.0v 1739.55n 5.0v 1749.45n 5.0v 1749.55n 5.0v 1759.45n 5.0v 1759.55n 0.0v 1769.45n 0.0v 1769.55n 5.0v 1779.45n 5.0v 1779.55n 5.0v 1789.45n 5.0v 1789.55n 5.0v 1799.45n 5.0v 1799.55n 5.0v 1809.45n 5.0v 1809.55n 0.0v 1819.45n 0.0v 1819.55n 0.0v 1829.45n 0.0v 1829.55n 0.0v 1839.45n 0.0v 1839.55n 0.0v 1849.45n 0.0v 1849.55n 0.0v 1859.45n 0.0v 1859.55n 0.0v 1869.45n 0.0v 1869.55n 0.0v 1879.45n 0.0v 1879.55n 0.0v 1889.45n 0.0v 1889.55n 0.0v 1899.45n 0.0v 1899.55n 0.0v 1909.45n 0.0v 1909.55n 0.0v 1919.45n 0.0v 1919.55n 0.0v 1929.45n 0.0v 1929.55n 5.0v 1939.45n 5.0v 1939.55n 5.0v 1949.45n 5.0v 1949.55n 5.0v 1959.45n 5.0v 1959.55n 5.0v 1969.45n 5.0v 1969.55n 0.0v 1979.45n 0.0v 1979.55n 5.0v 1989.45n 5.0v 1989.55n 5.0v 1999.45n 5.0v 1999.55n 5.0v 2009.45n 5.0v 2009.55n 5.0v 2019.45n 5.0v 2019.55n 5.0v 2029.45n 5.0v 2029.55n 5.0v 2039.45n 5.0v 2039.55n 5.0v 2049.45n 5.0v 2049.55n 5.0v )
* (time, data): [(0, 0), (10, 0), (20, 1), (30, 1), (40, 1), (50, 0), (60, 1), (70, 0), (80, 1), (90, 1), (100, 1), (110, 1), (120, 1), (130, 1), (140, 1), (150, 0), (160, 1), (170, 1), (180, 1), (190, 1), (200, 1), (210, 1), (220, 1), (230, 1), (240, 1), (250, 0), (260, 0), (270, 0), (280, 1), (290, 1), (300, 1), (310, 1), (320, 1), (330, 1), (340, 1), (350, 1), (360, 1), (370, 1), (380, 1), (390, 1), (400, 0), (410, 1), (420, 1), (430, 0), (440, 0), (450, 1), (460, 1), (470, 0), (480, 1), (490, 1), (500, 1), (510, 1), (520, 1), (530, 1), (540, 1), (550, 1), (560, 1), (570, 1), (580, 1), (590, 0), (600, 1), (610, 0), (620, 0), (630, 0), (640, 1), (650, 1), (660, 1), (670, 0), (680, 0), (690, 0), (700, 0), (710, 0), (720, 0), (730, 0), (740, 0), (750, 1), (760, 1), (770, 1), (780, 0), (790, 0), (800, 0), (810, 0), (820, 1), (830, 1), (840, 1), (850, 0), (860, 0), (870, 0), (880, 0), (890, 0), (900, 0), (910, 0), (920, 0), (930, 0), (940, 0), (950, 0), (960, 0), (970, 1), (980, 1), (990, 1), (1000, 1), (1010, 1), (1020, 0), (1030, 0), (1040, 0), (1050, 0), (1060, 0), (1070, 1), (1080, 0), (1090, 0), (1100, 0), (1110, 0), (1120, 1), (1130, 1), (1140, 1), (1150, 0), (1160, 0), (1170, 0), (1180, 0), (1190, 1), (1200, 1), (1210, 1), (1220, 0), (1230, 1), (1240, 1), (1250, 1), (1260, 1), (1270, 1), (1280, 0), (1290, 0), (1300, 0), (1310, 0), (1320, 0), (1330, 0), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 1), (1390, 1), (1400, 1), (1410, 1), (1420, 1), (1430, 1), (1440, 0), (1450, 0), (1460, 0), (1470, 0), (1480, 0), (1490, 0), (1500, 0), (1510, 0), (1520, 1), (1530, 0), (1540, 0), (1550, 0), (1560, 0), (1570, 0), (1580, 0), (1590, 0), (1600, 0), (1610, 0), (1620, 0), (1630, 0), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 1), (1700, 1), (1710, 1), (1720, 0), (1730, 1), (1740, 1), (1750, 1), (1760, 0), (1770, 1), (1780, 1), (1790, 1), (1800, 1), (1810, 1), (1820, 1), (1830, 1), (1840, 0), (1850, 0), (1860, 0), (1870, 0), (1880, 0), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 1), (1940, 1), (1950, 1), (1960, 1), (1970, 1), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 0), (2030, 1), (2040, 1), (2050, 1)]
Vdin0_28  din0_28  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 0.0v 19.45n 0.0v 19.55n 5.0v 29.45n 5.0v 29.55n 5.0v 39.45n 5.0v 39.55n 5.0v 49.45n 5.0v 49.55n 0.0v 59.45n 0.0v 59.55n 5.0v 69.45n 5.0v 69.55n 0.0v 79.45n 0.0v 79.55n 5.0v 89.45n 5.0v 89.55n 5.0v 99.45n 5.0v 99.55n 5.0v 109.45n 5.0v 109.55n 5.0v 119.45n 5.0v 119.55n 5.0v 129.45n 5.0v 129.55n 5.0v 139.45n 5.0v 139.55n 5.0v 149.45n 5.0v 149.55n 0.0v 159.45n 0.0v 159.55n 5.0v 169.45n 5.0v 169.55n 5.0v 179.45n 5.0v 179.55n 5.0v 189.45n 5.0v 189.55n 5.0v 199.45n 5.0v 199.55n 5.0v 209.45n 5.0v 209.55n 5.0v 219.45n 5.0v 219.55n 5.0v 229.45n 5.0v 229.55n 5.0v 239.45n 5.0v 239.55n 5.0v 249.45n 5.0v 249.55n 0.0v 259.45n 0.0v 259.55n 0.0v 269.45n 0.0v 269.55n 0.0v 279.45n 0.0v 279.55n 5.0v 289.45n 5.0v 289.55n 5.0v 299.45n 5.0v 299.55n 5.0v 309.45n 5.0v 309.55n 5.0v 319.45n 5.0v 319.55n 5.0v 329.45n 5.0v 329.55n 5.0v 339.45n 5.0v 339.55n 5.0v 349.45n 5.0v 349.55n 5.0v 359.45n 5.0v 359.55n 5.0v 369.45n 5.0v 369.55n 5.0v 379.45n 5.0v 379.55n 5.0v 389.45n 5.0v 389.55n 5.0v 399.45n 5.0v 399.55n 0.0v 409.45n 0.0v 409.55n 5.0v 419.45n 5.0v 419.55n 5.0v 429.45n 5.0v 429.55n 0.0v 439.45n 0.0v 439.55n 0.0v 449.45n 0.0v 449.55n 5.0v 459.45n 5.0v 459.55n 5.0v 469.45n 5.0v 469.55n 0.0v 479.45n 0.0v 479.55n 5.0v 489.45n 5.0v 489.55n 5.0v 499.45n 5.0v 499.55n 5.0v 509.45n 5.0v 509.55n 5.0v 519.45n 5.0v 519.55n 5.0v 529.45n 5.0v 529.55n 5.0v 539.45n 5.0v 539.55n 5.0v 549.45n 5.0v 549.55n 5.0v 559.45n 5.0v 559.55n 5.0v 569.45n 5.0v 569.55n 5.0v 579.45n 5.0v 579.55n 5.0v 589.45n 5.0v 589.55n 0.0v 599.45n 0.0v 599.55n 5.0v 609.45n 5.0v 609.55n 0.0v 619.45n 0.0v 619.55n 0.0v 629.45n 0.0v 629.55n 0.0v 639.45n 0.0v 639.55n 5.0v 649.45n 5.0v 649.55n 5.0v 659.45n 5.0v 659.55n 5.0v 669.45n 5.0v 669.55n 0.0v 679.45n 0.0v 679.55n 0.0v 689.45n 0.0v 689.55n 0.0v 699.45n 0.0v 699.55n 0.0v 709.45n 0.0v 709.55n 0.0v 719.45n 0.0v 719.55n 0.0v 729.45n 0.0v 729.55n 0.0v 739.45n 0.0v 739.55n 0.0v 749.45n 0.0v 749.55n 5.0v 759.45n 5.0v 759.55n 5.0v 769.45n 5.0v 769.55n 5.0v 779.45n 5.0v 779.55n 0.0v 789.45n 0.0v 789.55n 0.0v 799.45n 0.0v 799.55n 0.0v 809.45n 0.0v 809.55n 0.0v 819.45n 0.0v 819.55n 5.0v 829.45n 5.0v 829.55n 5.0v 839.45n 5.0v 839.55n 5.0v 849.45n 5.0v 849.55n 0.0v 859.45n 0.0v 859.55n 0.0v 869.45n 0.0v 869.55n 0.0v 879.45n 0.0v 879.55n 0.0v 889.45n 0.0v 889.55n 0.0v 899.45n 0.0v 899.55n 0.0v 909.45n 0.0v 909.55n 0.0v 919.45n 0.0v 919.55n 0.0v 929.45n 0.0v 929.55n 0.0v 939.45n 0.0v 939.55n 0.0v 949.45n 0.0v 949.55n 0.0v 959.45n 0.0v 959.55n 0.0v 969.45n 0.0v 969.55n 5.0v 979.45n 5.0v 979.55n 5.0v 989.45n 5.0v 989.55n 5.0v 999.45n 5.0v 999.55n 5.0v 1009.45n 5.0v 1009.55n 5.0v 1019.45n 5.0v 1019.55n 0.0v 1029.45n 0.0v 1029.55n 0.0v 1039.45n 0.0v 1039.55n 0.0v 1049.45n 0.0v 1049.55n 0.0v 1059.45n 0.0v 1059.55n 0.0v 1069.45n 0.0v 1069.55n 5.0v 1079.45n 5.0v 1079.55n 0.0v 1089.45n 0.0v 1089.55n 0.0v 1099.45n 0.0v 1099.55n 0.0v 1109.45n 0.0v 1109.55n 0.0v 1119.45n 0.0v 1119.55n 5.0v 1129.45n 5.0v 1129.55n 5.0v 1139.45n 5.0v 1139.55n 5.0v 1149.45n 5.0v 1149.55n 0.0v 1159.45n 0.0v 1159.55n 0.0v 1169.45n 0.0v 1169.55n 0.0v 1179.45n 0.0v 1179.55n 0.0v 1189.45n 0.0v 1189.55n 5.0v 1199.45n 5.0v 1199.55n 5.0v 1209.45n 5.0v 1209.55n 5.0v 1219.45n 5.0v 1219.55n 0.0v 1229.45n 0.0v 1229.55n 5.0v 1239.45n 5.0v 1239.55n 5.0v 1249.45n 5.0v 1249.55n 5.0v 1259.45n 5.0v 1259.55n 5.0v 1269.45n 5.0v 1269.55n 5.0v 1279.45n 5.0v 1279.55n 0.0v 1289.45n 0.0v 1289.55n 0.0v 1299.45n 0.0v 1299.55n 0.0v 1309.45n 0.0v 1309.55n 0.0v 1319.45n 0.0v 1319.55n 0.0v 1329.45n 0.0v 1329.55n 0.0v 1339.45n 0.0v 1339.55n 0.0v 1349.45n 0.0v 1349.55n 0.0v 1359.45n 0.0v 1359.55n 0.0v 1369.45n 0.0v 1369.55n 0.0v 1379.45n 0.0v 1379.55n 5.0v 1389.45n 5.0v 1389.55n 5.0v 1399.45n 5.0v 1399.55n 5.0v 1409.45n 5.0v 1409.55n 5.0v 1419.45n 5.0v 1419.55n 5.0v 1429.45n 5.0v 1429.55n 5.0v 1439.45n 5.0v 1439.55n 0.0v 1449.45n 0.0v 1449.55n 0.0v 1459.45n 0.0v 1459.55n 0.0v 1469.45n 0.0v 1469.55n 0.0v 1479.45n 0.0v 1479.55n 0.0v 1489.45n 0.0v 1489.55n 0.0v 1499.45n 0.0v 1499.55n 0.0v 1509.45n 0.0v 1509.55n 0.0v 1519.45n 0.0v 1519.55n 5.0v 1529.45n 5.0v 1529.55n 0.0v 1539.45n 0.0v 1539.55n 0.0v 1549.45n 0.0v 1549.55n 0.0v 1559.45n 0.0v 1559.55n 0.0v 1569.45n 0.0v 1569.55n 0.0v 1579.45n 0.0v 1579.55n 0.0v 1589.45n 0.0v 1589.55n 0.0v 1599.45n 0.0v 1599.55n 0.0v 1609.45n 0.0v 1609.55n 0.0v 1619.45n 0.0v 1619.55n 0.0v 1629.45n 0.0v 1629.55n 0.0v 1639.45n 0.0v 1639.55n 5.0v 1649.45n 5.0v 1649.55n 5.0v 1659.45n 5.0v 1659.55n 5.0v 1669.45n 5.0v 1669.55n 5.0v 1679.45n 5.0v 1679.55n 5.0v 1689.45n 5.0v 1689.55n 5.0v 1699.45n 5.0v 1699.55n 5.0v 1709.45n 5.0v 1709.55n 5.0v 1719.45n 5.0v 1719.55n 0.0v 1729.45n 0.0v 1729.55n 5.0v 1739.45n 5.0v 1739.55n 5.0v 1749.45n 5.0v 1749.55n 5.0v 1759.45n 5.0v 1759.55n 0.0v 1769.45n 0.0v 1769.55n 5.0v 1779.45n 5.0v 1779.55n 5.0v 1789.45n 5.0v 1789.55n 5.0v 1799.45n 5.0v 1799.55n 5.0v 1809.45n 5.0v 1809.55n 5.0v 1819.45n 5.0v 1819.55n 5.0v 1829.45n 5.0v 1829.55n 5.0v 1839.45n 5.0v 1839.55n 0.0v 1849.45n 0.0v 1849.55n 0.0v 1859.45n 0.0v 1859.55n 0.0v 1869.45n 0.0v 1869.55n 0.0v 1879.45n 0.0v 1879.55n 0.0v 1889.45n 0.0v 1889.55n 0.0v 1899.45n 0.0v 1899.55n 0.0v 1909.45n 0.0v 1909.55n 0.0v 1919.45n 0.0v 1919.55n 0.0v 1929.45n 0.0v 1929.55n 5.0v 1939.45n 5.0v 1939.55n 5.0v 1949.45n 5.0v 1949.55n 5.0v 1959.45n 5.0v 1959.55n 5.0v 1969.45n 5.0v 1969.55n 5.0v 1979.45n 5.0v 1979.55n 0.0v 1989.45n 0.0v 1989.55n 0.0v 1999.45n 0.0v 1999.55n 0.0v 2009.45n 0.0v 2009.55n 0.0v 2019.45n 0.0v 2019.55n 0.0v 2029.45n 0.0v 2029.55n 5.0v 2039.45n 5.0v 2039.55n 5.0v 2049.45n 5.0v 2049.55n 5.0v )
* (time, data): [(0, 0), (10, 0), (20, 0), (30, 1), (40, 1), (50, 0), (60, 1), (70, 1), (80, 0), (90, 0), (100, 0), (110, 0), (120, 0), (130, 1), (140, 1), (150, 0), (160, 0), (170, 1), (180, 1), (190, 1), (200, 1), (210, 1), (220, 1), (230, 1), (240, 1), (250, 1), (260, 1), (270, 1), (280, 0), (290, 0), (300, 1), (310, 1), (320, 1), (330, 1), (340, 1), (350, 1), (360, 1), (370, 1), (380, 1), (390, 1), (400, 1), (410, 1), (420, 1), (430, 1), (440, 1), (450, 0), (460, 0), (470, 0), (480, 0), (490, 1), (500, 1), (510, 0), (520, 0), (530, 1), (540, 0), (550, 0), (560, 0), (570, 0), (580, 0), (590, 0), (600, 0), (610, 1), (620, 1), (630, 1), (640, 0), (650, 0), (660, 1), (670, 1), (680, 1), (690, 1), (700, 1), (710, 1), (720, 1), (730, 1), (740, 1), (750, 0), (760, 0), (770, 0), (780, 1), (790, 1), (800, 1), (810, 1), (820, 1), (830, 1), (840, 1), (850, 1), (860, 1), (870, 1), (880, 1), (890, 1), (900, 1), (910, 1), (920, 1), (930, 1), (940, 1), (950, 0), (960, 0), (970, 0), (980, 0), (990, 0), (1000, 1), (1010, 1), (1020, 0), (1030, 0), (1040, 0), (1050, 0), (1060, 0), (1070, 0), (1080, 0), (1090, 0), (1100, 0), (1110, 0), (1120, 1), (1130, 1), (1140, 1), (1150, 0), (1160, 1), (1170, 1), (1180, 1), (1190, 0), (1200, 1), (1210, 1), (1220, 1), (1230, 0), (1240, 0), (1250, 0), (1260, 0), (1270, 0), (1280, 0), (1290, 0), (1300, 0), (1310, 1), (1320, 0), (1330, 0), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 1), (1390, 1), (1400, 1), (1410, 1), (1420, 1), (1430, 1), (1440, 1), (1450, 1), (1460, 1), (1470, 1), (1480, 0), (1490, 0), (1500, 0), (1510, 0), (1520, 1), (1530, 1), (1540, 0), (1550, 0), (1560, 1), (1570, 1), (1580, 1), (1590, 1), (1600, 1), (1610, 1), (1620, 1), (1630, 1), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 1), (1700, 1), (1710, 1), (1720, 0), (1730, 0), (1740, 0), (1750, 0), (1760, 1), (1770, 1), (1780, 0), (1790, 1), (1800, 1), (1810, 1), (1820, 1), (1830, 1), (1840, 0), (1850, 1), (1860, 0), (1870, 0), (1880, 0), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 0), (1940, 0), (1950, 0), (1960, 0), (1970, 1), (1980, 1), (1990, 1), (2000, 1), (2010, 1), (2020, 1), (2030, 0), (2040, 0), (2050, 0)]
Vdin0_29  din0_29  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 0.0v 19.45n 0.0v 19.55n 0.0v 29.45n 0.0v 29.55n 5.0v 39.45n 5.0v 39.55n 5.0v 49.45n 5.0v 49.55n 0.0v 59.45n 0.0v 59.55n 5.0v 69.45n 5.0v 69.55n 5.0v 79.45n 5.0v 79.55n 0.0v 89.45n 0.0v 89.55n 0.0v 99.45n 0.0v 99.55n 0.0v 109.45n 0.0v 109.55n 0.0v 119.45n 0.0v 119.55n 0.0v 129.45n 0.0v 129.55n 5.0v 139.45n 5.0v 139.55n 5.0v 149.45n 5.0v 149.55n 0.0v 159.45n 0.0v 159.55n 0.0v 169.45n 0.0v 169.55n 5.0v 179.45n 5.0v 179.55n 5.0v 189.45n 5.0v 189.55n 5.0v 199.45n 5.0v 199.55n 5.0v 209.45n 5.0v 209.55n 5.0v 219.45n 5.0v 219.55n 5.0v 229.45n 5.0v 229.55n 5.0v 239.45n 5.0v 239.55n 5.0v 249.45n 5.0v 249.55n 5.0v 259.45n 5.0v 259.55n 5.0v 269.45n 5.0v 269.55n 5.0v 279.45n 5.0v 279.55n 0.0v 289.45n 0.0v 289.55n 0.0v 299.45n 0.0v 299.55n 5.0v 309.45n 5.0v 309.55n 5.0v 319.45n 5.0v 319.55n 5.0v 329.45n 5.0v 329.55n 5.0v 339.45n 5.0v 339.55n 5.0v 349.45n 5.0v 349.55n 5.0v 359.45n 5.0v 359.55n 5.0v 369.45n 5.0v 369.55n 5.0v 379.45n 5.0v 379.55n 5.0v 389.45n 5.0v 389.55n 5.0v 399.45n 5.0v 399.55n 5.0v 409.45n 5.0v 409.55n 5.0v 419.45n 5.0v 419.55n 5.0v 429.45n 5.0v 429.55n 5.0v 439.45n 5.0v 439.55n 5.0v 449.45n 5.0v 449.55n 0.0v 459.45n 0.0v 459.55n 0.0v 469.45n 0.0v 469.55n 0.0v 479.45n 0.0v 479.55n 0.0v 489.45n 0.0v 489.55n 5.0v 499.45n 5.0v 499.55n 5.0v 509.45n 5.0v 509.55n 0.0v 519.45n 0.0v 519.55n 0.0v 529.45n 0.0v 529.55n 5.0v 539.45n 5.0v 539.55n 0.0v 549.45n 0.0v 549.55n 0.0v 559.45n 0.0v 559.55n 0.0v 569.45n 0.0v 569.55n 0.0v 579.45n 0.0v 579.55n 0.0v 589.45n 0.0v 589.55n 0.0v 599.45n 0.0v 599.55n 0.0v 609.45n 0.0v 609.55n 5.0v 619.45n 5.0v 619.55n 5.0v 629.45n 5.0v 629.55n 5.0v 639.45n 5.0v 639.55n 0.0v 649.45n 0.0v 649.55n 0.0v 659.45n 0.0v 659.55n 5.0v 669.45n 5.0v 669.55n 5.0v 679.45n 5.0v 679.55n 5.0v 689.45n 5.0v 689.55n 5.0v 699.45n 5.0v 699.55n 5.0v 709.45n 5.0v 709.55n 5.0v 719.45n 5.0v 719.55n 5.0v 729.45n 5.0v 729.55n 5.0v 739.45n 5.0v 739.55n 5.0v 749.45n 5.0v 749.55n 0.0v 759.45n 0.0v 759.55n 0.0v 769.45n 0.0v 769.55n 0.0v 779.45n 0.0v 779.55n 5.0v 789.45n 5.0v 789.55n 5.0v 799.45n 5.0v 799.55n 5.0v 809.45n 5.0v 809.55n 5.0v 819.45n 5.0v 819.55n 5.0v 829.45n 5.0v 829.55n 5.0v 839.45n 5.0v 839.55n 5.0v 849.45n 5.0v 849.55n 5.0v 859.45n 5.0v 859.55n 5.0v 869.45n 5.0v 869.55n 5.0v 879.45n 5.0v 879.55n 5.0v 889.45n 5.0v 889.55n 5.0v 899.45n 5.0v 899.55n 5.0v 909.45n 5.0v 909.55n 5.0v 919.45n 5.0v 919.55n 5.0v 929.45n 5.0v 929.55n 5.0v 939.45n 5.0v 939.55n 5.0v 949.45n 5.0v 949.55n 0.0v 959.45n 0.0v 959.55n 0.0v 969.45n 0.0v 969.55n 0.0v 979.45n 0.0v 979.55n 0.0v 989.45n 0.0v 989.55n 0.0v 999.45n 0.0v 999.55n 5.0v 1009.45n 5.0v 1009.55n 5.0v 1019.45n 5.0v 1019.55n 0.0v 1029.45n 0.0v 1029.55n 0.0v 1039.45n 0.0v 1039.55n 0.0v 1049.45n 0.0v 1049.55n 0.0v 1059.45n 0.0v 1059.55n 0.0v 1069.45n 0.0v 1069.55n 0.0v 1079.45n 0.0v 1079.55n 0.0v 1089.45n 0.0v 1089.55n 0.0v 1099.45n 0.0v 1099.55n 0.0v 1109.45n 0.0v 1109.55n 0.0v 1119.45n 0.0v 1119.55n 5.0v 1129.45n 5.0v 1129.55n 5.0v 1139.45n 5.0v 1139.55n 5.0v 1149.45n 5.0v 1149.55n 0.0v 1159.45n 0.0v 1159.55n 5.0v 1169.45n 5.0v 1169.55n 5.0v 1179.45n 5.0v 1179.55n 5.0v 1189.45n 5.0v 1189.55n 0.0v 1199.45n 0.0v 1199.55n 5.0v 1209.45n 5.0v 1209.55n 5.0v 1219.45n 5.0v 1219.55n 5.0v 1229.45n 5.0v 1229.55n 0.0v 1239.45n 0.0v 1239.55n 0.0v 1249.45n 0.0v 1249.55n 0.0v 1259.45n 0.0v 1259.55n 0.0v 1269.45n 0.0v 1269.55n 0.0v 1279.45n 0.0v 1279.55n 0.0v 1289.45n 0.0v 1289.55n 0.0v 1299.45n 0.0v 1299.55n 0.0v 1309.45n 0.0v 1309.55n 5.0v 1319.45n 5.0v 1319.55n 0.0v 1329.45n 0.0v 1329.55n 0.0v 1339.45n 0.0v 1339.55n 0.0v 1349.45n 0.0v 1349.55n 0.0v 1359.45n 0.0v 1359.55n 0.0v 1369.45n 0.0v 1369.55n 0.0v 1379.45n 0.0v 1379.55n 5.0v 1389.45n 5.0v 1389.55n 5.0v 1399.45n 5.0v 1399.55n 5.0v 1409.45n 5.0v 1409.55n 5.0v 1419.45n 5.0v 1419.55n 5.0v 1429.45n 5.0v 1429.55n 5.0v 1439.45n 5.0v 1439.55n 5.0v 1449.45n 5.0v 1449.55n 5.0v 1459.45n 5.0v 1459.55n 5.0v 1469.45n 5.0v 1469.55n 5.0v 1479.45n 5.0v 1479.55n 0.0v 1489.45n 0.0v 1489.55n 0.0v 1499.45n 0.0v 1499.55n 0.0v 1509.45n 0.0v 1509.55n 0.0v 1519.45n 0.0v 1519.55n 5.0v 1529.45n 5.0v 1529.55n 5.0v 1539.45n 5.0v 1539.55n 0.0v 1549.45n 0.0v 1549.55n 0.0v 1559.45n 0.0v 1559.55n 5.0v 1569.45n 5.0v 1569.55n 5.0v 1579.45n 5.0v 1579.55n 5.0v 1589.45n 5.0v 1589.55n 5.0v 1599.45n 5.0v 1599.55n 5.0v 1609.45n 5.0v 1609.55n 5.0v 1619.45n 5.0v 1619.55n 5.0v 1629.45n 5.0v 1629.55n 5.0v 1639.45n 5.0v 1639.55n 5.0v 1649.45n 5.0v 1649.55n 5.0v 1659.45n 5.0v 1659.55n 5.0v 1669.45n 5.0v 1669.55n 5.0v 1679.45n 5.0v 1679.55n 5.0v 1689.45n 5.0v 1689.55n 5.0v 1699.45n 5.0v 1699.55n 5.0v 1709.45n 5.0v 1709.55n 5.0v 1719.45n 5.0v 1719.55n 0.0v 1729.45n 0.0v 1729.55n 0.0v 1739.45n 0.0v 1739.55n 0.0v 1749.45n 0.0v 1749.55n 0.0v 1759.45n 0.0v 1759.55n 5.0v 1769.45n 5.0v 1769.55n 5.0v 1779.45n 5.0v 1779.55n 0.0v 1789.45n 0.0v 1789.55n 5.0v 1799.45n 5.0v 1799.55n 5.0v 1809.45n 5.0v 1809.55n 5.0v 1819.45n 5.0v 1819.55n 5.0v 1829.45n 5.0v 1829.55n 5.0v 1839.45n 5.0v 1839.55n 0.0v 1849.45n 0.0v 1849.55n 5.0v 1859.45n 5.0v 1859.55n 0.0v 1869.45n 0.0v 1869.55n 0.0v 1879.45n 0.0v 1879.55n 0.0v 1889.45n 0.0v 1889.55n 0.0v 1899.45n 0.0v 1899.55n 0.0v 1909.45n 0.0v 1909.55n 0.0v 1919.45n 0.0v 1919.55n 0.0v 1929.45n 0.0v 1929.55n 0.0v 1939.45n 0.0v 1939.55n 0.0v 1949.45n 0.0v 1949.55n 0.0v 1959.45n 0.0v 1959.55n 0.0v 1969.45n 0.0v 1969.55n 5.0v 1979.45n 5.0v 1979.55n 5.0v 1989.45n 5.0v 1989.55n 5.0v 1999.45n 5.0v 1999.55n 5.0v 2009.45n 5.0v 2009.55n 5.0v 2019.45n 5.0v 2019.55n 5.0v 2029.45n 5.0v 2029.55n 0.0v 2039.45n 0.0v 2039.55n 0.0v 2049.45n 0.0v 2049.55n 0.0v )
* (time, data): [(0, 0), (10, 0), (20, 0), (30, 0), (40, 0), (50, 0), (60, 0), (70, 1), (80, 0), (90, 0), (100, 0), (110, 0), (120, 0), (130, 1), (140, 1), (150, 0), (160, 1), (170, 0), (180, 0), (190, 0), (200, 0), (210, 0), (220, 0), (230, 0), (240, 0), (250, 0), (260, 0), (270, 0), (280, 0), (290, 0), (300, 0), (310, 0), (320, 0), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 0), (390, 0), (400, 1), (410, 1), (420, 1), (430, 0), (440, 0), (450, 1), (460, 1), (470, 0), (480, 1), (490, 0), (500, 0), (510, 1), (520, 1), (530, 1), (540, 0), (550, 0), (560, 0), (570, 0), (580, 0), (590, 1), (600, 0), (610, 1), (620, 1), (630, 1), (640, 0), (650, 0), (660, 1), (670, 1), (680, 0), (690, 0), (700, 0), (710, 0), (720, 1), (730, 1), (740, 0), (750, 1), (760, 0), (770, 0), (780, 1), (790, 1), (800, 1), (810, 1), (820, 1), (830, 1), (840, 1), (850, 0), (860, 0), (870, 0), (880, 0), (890, 0), (900, 0), (910, 0), (920, 0), (930, 0), (940, 0), (950, 1), (960, 1), (970, 1), (980, 1), (990, 1), (1000, 0), (1010, 0), (1020, 0), (1030, 0), (1040, 0), (1050, 0), (1060, 0), (1070, 0), (1080, 1), (1090, 1), (1100, 1), (1110, 1), (1120, 1), (1130, 1), (1140, 1), (1150, 0), (1160, 0), (1170, 0), (1180, 0), (1190, 1), (1200, 0), (1210, 0), (1220, 1), (1230, 1), (1240, 1), (1250, 1), (1260, 1), (1270, 0), (1280, 0), (1290, 0), (1300, 0), (1310, 1), (1320, 0), (1330, 0), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 1), (1390, 0), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 0), (1450, 0), (1460, 0), (1470, 0), (1480, 1), (1490, 1), (1500, 1), (1510, 0), (1520, 1), (1530, 1), (1540, 0), (1550, 0), (1560, 0), (1570, 0), (1580, 0), (1590, 1), (1600, 1), (1610, 1), (1620, 1), (1630, 1), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 1), (1700, 1), (1710, 1), (1720, 1), (1730, 1), (1740, 1), (1750, 1), (1760, 1), (1770, 1), (1780, 0), (1790, 0), (1800, 0), (1810, 1), (1820, 1), (1830, 1), (1840, 1), (1850, 0), (1860, 1), (1870, 1), (1880, 1), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 1), (1940, 1), (1950, 1), (1960, 1), (1970, 1), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 0), (2030, 1), (2040, 1), (2050, 1)]
Vdin0_30  din0_30  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 0.0v 19.45n 0.0v 19.55n 0.0v 29.45n 0.0v 29.55n 0.0v 39.45n 0.0v 39.55n 0.0v 49.45n 0.0v 49.55n 0.0v 59.45n 0.0v 59.55n 0.0v 69.45n 0.0v 69.55n 5.0v 79.45n 5.0v 79.55n 0.0v 89.45n 0.0v 89.55n 0.0v 99.45n 0.0v 99.55n 0.0v 109.45n 0.0v 109.55n 0.0v 119.45n 0.0v 119.55n 0.0v 129.45n 0.0v 129.55n 5.0v 139.45n 5.0v 139.55n 5.0v 149.45n 5.0v 149.55n 0.0v 159.45n 0.0v 159.55n 5.0v 169.45n 5.0v 169.55n 0.0v 179.45n 0.0v 179.55n 0.0v 189.45n 0.0v 189.55n 0.0v 199.45n 0.0v 199.55n 0.0v 209.45n 0.0v 209.55n 0.0v 219.45n 0.0v 219.55n 0.0v 229.45n 0.0v 229.55n 0.0v 239.45n 0.0v 239.55n 0.0v 249.45n 0.0v 249.55n 0.0v 259.45n 0.0v 259.55n 0.0v 269.45n 0.0v 269.55n 0.0v 279.45n 0.0v 279.55n 0.0v 289.45n 0.0v 289.55n 0.0v 299.45n 0.0v 299.55n 0.0v 309.45n 0.0v 309.55n 0.0v 319.45n 0.0v 319.55n 0.0v 329.45n 0.0v 329.55n 0.0v 339.45n 0.0v 339.55n 0.0v 349.45n 0.0v 349.55n 0.0v 359.45n 0.0v 359.55n 0.0v 369.45n 0.0v 369.55n 0.0v 379.45n 0.0v 379.55n 0.0v 389.45n 0.0v 389.55n 0.0v 399.45n 0.0v 399.55n 5.0v 409.45n 5.0v 409.55n 5.0v 419.45n 5.0v 419.55n 5.0v 429.45n 5.0v 429.55n 0.0v 439.45n 0.0v 439.55n 0.0v 449.45n 0.0v 449.55n 5.0v 459.45n 5.0v 459.55n 5.0v 469.45n 5.0v 469.55n 0.0v 479.45n 0.0v 479.55n 5.0v 489.45n 5.0v 489.55n 0.0v 499.45n 0.0v 499.55n 0.0v 509.45n 0.0v 509.55n 5.0v 519.45n 5.0v 519.55n 5.0v 529.45n 5.0v 529.55n 5.0v 539.45n 5.0v 539.55n 0.0v 549.45n 0.0v 549.55n 0.0v 559.45n 0.0v 559.55n 0.0v 569.45n 0.0v 569.55n 0.0v 579.45n 0.0v 579.55n 0.0v 589.45n 0.0v 589.55n 5.0v 599.45n 5.0v 599.55n 0.0v 609.45n 0.0v 609.55n 5.0v 619.45n 5.0v 619.55n 5.0v 629.45n 5.0v 629.55n 5.0v 639.45n 5.0v 639.55n 0.0v 649.45n 0.0v 649.55n 0.0v 659.45n 0.0v 659.55n 5.0v 669.45n 5.0v 669.55n 5.0v 679.45n 5.0v 679.55n 0.0v 689.45n 0.0v 689.55n 0.0v 699.45n 0.0v 699.55n 0.0v 709.45n 0.0v 709.55n 0.0v 719.45n 0.0v 719.55n 5.0v 729.45n 5.0v 729.55n 5.0v 739.45n 5.0v 739.55n 0.0v 749.45n 0.0v 749.55n 5.0v 759.45n 5.0v 759.55n 0.0v 769.45n 0.0v 769.55n 0.0v 779.45n 0.0v 779.55n 5.0v 789.45n 5.0v 789.55n 5.0v 799.45n 5.0v 799.55n 5.0v 809.45n 5.0v 809.55n 5.0v 819.45n 5.0v 819.55n 5.0v 829.45n 5.0v 829.55n 5.0v 839.45n 5.0v 839.55n 5.0v 849.45n 5.0v 849.55n 0.0v 859.45n 0.0v 859.55n 0.0v 869.45n 0.0v 869.55n 0.0v 879.45n 0.0v 879.55n 0.0v 889.45n 0.0v 889.55n 0.0v 899.45n 0.0v 899.55n 0.0v 909.45n 0.0v 909.55n 0.0v 919.45n 0.0v 919.55n 0.0v 929.45n 0.0v 929.55n 0.0v 939.45n 0.0v 939.55n 0.0v 949.45n 0.0v 949.55n 5.0v 959.45n 5.0v 959.55n 5.0v 969.45n 5.0v 969.55n 5.0v 979.45n 5.0v 979.55n 5.0v 989.45n 5.0v 989.55n 5.0v 999.45n 5.0v 999.55n 0.0v 1009.45n 0.0v 1009.55n 0.0v 1019.45n 0.0v 1019.55n 0.0v 1029.45n 0.0v 1029.55n 0.0v 1039.45n 0.0v 1039.55n 0.0v 1049.45n 0.0v 1049.55n 0.0v 1059.45n 0.0v 1059.55n 0.0v 1069.45n 0.0v 1069.55n 0.0v 1079.45n 0.0v 1079.55n 5.0v 1089.45n 5.0v 1089.55n 5.0v 1099.45n 5.0v 1099.55n 5.0v 1109.45n 5.0v 1109.55n 5.0v 1119.45n 5.0v 1119.55n 5.0v 1129.45n 5.0v 1129.55n 5.0v 1139.45n 5.0v 1139.55n 5.0v 1149.45n 5.0v 1149.55n 0.0v 1159.45n 0.0v 1159.55n 0.0v 1169.45n 0.0v 1169.55n 0.0v 1179.45n 0.0v 1179.55n 0.0v 1189.45n 0.0v 1189.55n 5.0v 1199.45n 5.0v 1199.55n 0.0v 1209.45n 0.0v 1209.55n 0.0v 1219.45n 0.0v 1219.55n 5.0v 1229.45n 5.0v 1229.55n 5.0v 1239.45n 5.0v 1239.55n 5.0v 1249.45n 5.0v 1249.55n 5.0v 1259.45n 5.0v 1259.55n 5.0v 1269.45n 5.0v 1269.55n 0.0v 1279.45n 0.0v 1279.55n 0.0v 1289.45n 0.0v 1289.55n 0.0v 1299.45n 0.0v 1299.55n 0.0v 1309.45n 0.0v 1309.55n 5.0v 1319.45n 5.0v 1319.55n 0.0v 1329.45n 0.0v 1329.55n 0.0v 1339.45n 0.0v 1339.55n 0.0v 1349.45n 0.0v 1349.55n 0.0v 1359.45n 0.0v 1359.55n 0.0v 1369.45n 0.0v 1369.55n 0.0v 1379.45n 0.0v 1379.55n 5.0v 1389.45n 5.0v 1389.55n 0.0v 1399.45n 0.0v 1399.55n 0.0v 1409.45n 0.0v 1409.55n 0.0v 1419.45n 0.0v 1419.55n 0.0v 1429.45n 0.0v 1429.55n 0.0v 1439.45n 0.0v 1439.55n 0.0v 1449.45n 0.0v 1449.55n 0.0v 1459.45n 0.0v 1459.55n 0.0v 1469.45n 0.0v 1469.55n 0.0v 1479.45n 0.0v 1479.55n 5.0v 1489.45n 5.0v 1489.55n 5.0v 1499.45n 5.0v 1499.55n 5.0v 1509.45n 5.0v 1509.55n 0.0v 1519.45n 0.0v 1519.55n 5.0v 1529.45n 5.0v 1529.55n 5.0v 1539.45n 5.0v 1539.55n 0.0v 1549.45n 0.0v 1549.55n 0.0v 1559.45n 0.0v 1559.55n 0.0v 1569.45n 0.0v 1569.55n 0.0v 1579.45n 0.0v 1579.55n 0.0v 1589.45n 0.0v 1589.55n 5.0v 1599.45n 5.0v 1599.55n 5.0v 1609.45n 5.0v 1609.55n 5.0v 1619.45n 5.0v 1619.55n 5.0v 1629.45n 5.0v 1629.55n 5.0v 1639.45n 5.0v 1639.55n 5.0v 1649.45n 5.0v 1649.55n 5.0v 1659.45n 5.0v 1659.55n 5.0v 1669.45n 5.0v 1669.55n 5.0v 1679.45n 5.0v 1679.55n 5.0v 1689.45n 5.0v 1689.55n 5.0v 1699.45n 5.0v 1699.55n 5.0v 1709.45n 5.0v 1709.55n 5.0v 1719.45n 5.0v 1719.55n 5.0v 1729.45n 5.0v 1729.55n 5.0v 1739.45n 5.0v 1739.55n 5.0v 1749.45n 5.0v 1749.55n 5.0v 1759.45n 5.0v 1759.55n 5.0v 1769.45n 5.0v 1769.55n 5.0v 1779.45n 5.0v 1779.55n 0.0v 1789.45n 0.0v 1789.55n 0.0v 1799.45n 0.0v 1799.55n 0.0v 1809.45n 0.0v 1809.55n 5.0v 1819.45n 5.0v 1819.55n 5.0v 1829.45n 5.0v 1829.55n 5.0v 1839.45n 5.0v 1839.55n 5.0v 1849.45n 5.0v 1849.55n 0.0v 1859.45n 0.0v 1859.55n 5.0v 1869.45n 5.0v 1869.55n 5.0v 1879.45n 5.0v 1879.55n 5.0v 1889.45n 5.0v 1889.55n 0.0v 1899.45n 0.0v 1899.55n 0.0v 1909.45n 0.0v 1909.55n 0.0v 1919.45n 0.0v 1919.55n 0.0v 1929.45n 0.0v 1929.55n 5.0v 1939.45n 5.0v 1939.55n 5.0v 1949.45n 5.0v 1949.55n 5.0v 1959.45n 5.0v 1959.55n 5.0v 1969.45n 5.0v 1969.55n 5.0v 1979.45n 5.0v 1979.55n 0.0v 1989.45n 0.0v 1989.55n 0.0v 1999.45n 0.0v 1999.55n 0.0v 2009.45n 0.0v 2009.55n 0.0v 2019.45n 0.0v 2019.55n 0.0v 2029.45n 0.0v 2029.55n 5.0v 2039.45n 5.0v 2039.55n 5.0v 2049.45n 5.0v 2049.55n 5.0v )
* (time, data): [(0, 0), (10, 1), (20, 0), (30, 1), (40, 1), (50, 1), (60, 0), (70, 1), (80, 0), (90, 0), (100, 0), (110, 0), (120, 0), (130, 1), (140, 1), (150, 0), (160, 1), (170, 1), (180, 1), (190, 1), (200, 1), (210, 1), (220, 1), (230, 1), (240, 1), (250, 0), (260, 0), (270, 0), (280, 0), (290, 0), (300, 0), (310, 0), (320, 0), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 0), (390, 1), (400, 1), (410, 1), (420, 0), (430, 0), (440, 0), (450, 0), (460, 0), (470, 1), (480, 0), (490, 0), (500, 0), (510, 0), (520, 0), (530, 1), (540, 0), (550, 0), (560, 0), (570, 0), (580, 0), (590, 1), (600, 1), (610, 0), (620, 0), (630, 0), (640, 0), (650, 0), (660, 0), (670, 1), (680, 0), (690, 0), (700, 0), (710, 0), (720, 0), (730, 0), (740, 1), (750, 1), (760, 1), (770, 1), (780, 1), (790, 1), (800, 1), (810, 1), (820, 0), (830, 0), (840, 0), (850, 0), (860, 0), (870, 0), (880, 0), (890, 0), (900, 0), (910, 0), (920, 0), (930, 0), (940, 0), (950, 1), (960, 1), (970, 1), (980, 1), (990, 1), (1000, 0), (1010, 0), (1020, 1), (1030, 1), (1040, 1), (1050, 1), (1060, 1), (1070, 1), (1080, 0), (1090, 1), (1100, 1), (1110, 1), (1120, 0), (1130, 0), (1140, 0), (1150, 0), (1160, 1), (1170, 1), (1180, 1), (1190, 1), (1200, 0), (1210, 0), (1220, 1), (1230, 1), (1240, 1), (1250, 1), (1260, 1), (1270, 0), (1280, 0), (1290, 0), (1300, 1), (1310, 1), (1320, 1), (1330, 1), (1340, 1), (1350, 1), (1360, 1), (1370, 1), (1380, 0), (1390, 0), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 1), (1450, 1), (1460, 1), (1470, 1), (1480, 1), (1490, 1), (1500, 0), (1510, 0), (1520, 0), (1530, 1), (1540, 0), (1550, 1), (1560, 0), (1570, 0), (1580, 0), (1590, 1), (1600, 1), (1610, 1), (1620, 1), (1630, 1), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 1), (1700, 1), (1710, 1), (1720, 1), (1730, 0), (1740, 0), (1750, 0), (1760, 0), (1770, 1), (1780, 0), (1790, 1), (1800, 1), (1810, 0), (1820, 0), (1830, 0), (1840, 0), (1850, 0), (1860, 0), (1870, 0), (1880, 0), (1890, 1), (1900, 1), (1910, 1), (1920, 1), (1930, 0), (1940, 0), (1950, 0), (1960, 0), (1970, 1), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 0), (2030, 0), (2040, 0), (2050, 0)]
Vdin0_31  din0_31  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 5.0v 19.45n 5.0v 19.55n 0.0v 29.45n 0.0v 29.55n 5.0v 39.45n 5.0v 39.55n 5.0v 49.45n 5.0v 49.55n 5.0v 59.45n 5.0v 59.55n 0.0v 69.45n 0.0v 69.55n 5.0v 79.45n 5.0v 79.55n 0.0v 89.45n 0.0v 89.55n 0.0v 99.45n 0.0v 99.55n 0.0v 109.45n 0.0v 109.55n 0.0v 119.45n 0.0v 119.55n 0.0v 129.45n 0.0v 129.55n 5.0v 139.45n 5.0v 139.55n 5.0v 149.45n 5.0v 149.55n 0.0v 159.45n 0.0v 159.55n 5.0v 169.45n 5.0v 169.55n 5.0v 179.45n 5.0v 179.55n 5.0v 189.45n 5.0v 189.55n 5.0v 199.45n 5.0v 199.55n 5.0v 209.45n 5.0v 209.55n 5.0v 219.45n 5.0v 219.55n 5.0v 229.45n 5.0v 229.55n 5.0v 239.45n 5.0v 239.55n 5.0v 249.45n 5.0v 249.55n 0.0v 259.45n 0.0v 259.55n 0.0v 269.45n 0.0v 269.55n 0.0v 279.45n 0.0v 279.55n 0.0v 289.45n 0.0v 289.55n 0.0v 299.45n 0.0v 299.55n 0.0v 309.45n 0.0v 309.55n 0.0v 319.45n 0.0v 319.55n 0.0v 329.45n 0.0v 329.55n 0.0v 339.45n 0.0v 339.55n 0.0v 349.45n 0.0v 349.55n 0.0v 359.45n 0.0v 359.55n 0.0v 369.45n 0.0v 369.55n 0.0v 379.45n 0.0v 379.55n 0.0v 389.45n 0.0v 389.55n 5.0v 399.45n 5.0v 399.55n 5.0v 409.45n 5.0v 409.55n 5.0v 419.45n 5.0v 419.55n 0.0v 429.45n 0.0v 429.55n 0.0v 439.45n 0.0v 439.55n 0.0v 449.45n 0.0v 449.55n 0.0v 459.45n 0.0v 459.55n 0.0v 469.45n 0.0v 469.55n 5.0v 479.45n 5.0v 479.55n 0.0v 489.45n 0.0v 489.55n 0.0v 499.45n 0.0v 499.55n 0.0v 509.45n 0.0v 509.55n 0.0v 519.45n 0.0v 519.55n 0.0v 529.45n 0.0v 529.55n 5.0v 539.45n 5.0v 539.55n 0.0v 549.45n 0.0v 549.55n 0.0v 559.45n 0.0v 559.55n 0.0v 569.45n 0.0v 569.55n 0.0v 579.45n 0.0v 579.55n 0.0v 589.45n 0.0v 589.55n 5.0v 599.45n 5.0v 599.55n 5.0v 609.45n 5.0v 609.55n 0.0v 619.45n 0.0v 619.55n 0.0v 629.45n 0.0v 629.55n 0.0v 639.45n 0.0v 639.55n 0.0v 649.45n 0.0v 649.55n 0.0v 659.45n 0.0v 659.55n 0.0v 669.45n 0.0v 669.55n 5.0v 679.45n 5.0v 679.55n 0.0v 689.45n 0.0v 689.55n 0.0v 699.45n 0.0v 699.55n 0.0v 709.45n 0.0v 709.55n 0.0v 719.45n 0.0v 719.55n 0.0v 729.45n 0.0v 729.55n 0.0v 739.45n 0.0v 739.55n 5.0v 749.45n 5.0v 749.55n 5.0v 759.45n 5.0v 759.55n 5.0v 769.45n 5.0v 769.55n 5.0v 779.45n 5.0v 779.55n 5.0v 789.45n 5.0v 789.55n 5.0v 799.45n 5.0v 799.55n 5.0v 809.45n 5.0v 809.55n 5.0v 819.45n 5.0v 819.55n 0.0v 829.45n 0.0v 829.55n 0.0v 839.45n 0.0v 839.55n 0.0v 849.45n 0.0v 849.55n 0.0v 859.45n 0.0v 859.55n 0.0v 869.45n 0.0v 869.55n 0.0v 879.45n 0.0v 879.55n 0.0v 889.45n 0.0v 889.55n 0.0v 899.45n 0.0v 899.55n 0.0v 909.45n 0.0v 909.55n 0.0v 919.45n 0.0v 919.55n 0.0v 929.45n 0.0v 929.55n 0.0v 939.45n 0.0v 939.55n 0.0v 949.45n 0.0v 949.55n 5.0v 959.45n 5.0v 959.55n 5.0v 969.45n 5.0v 969.55n 5.0v 979.45n 5.0v 979.55n 5.0v 989.45n 5.0v 989.55n 5.0v 999.45n 5.0v 999.55n 0.0v 1009.45n 0.0v 1009.55n 0.0v 1019.45n 0.0v 1019.55n 5.0v 1029.45n 5.0v 1029.55n 5.0v 1039.45n 5.0v 1039.55n 5.0v 1049.45n 5.0v 1049.55n 5.0v 1059.45n 5.0v 1059.55n 5.0v 1069.45n 5.0v 1069.55n 5.0v 1079.45n 5.0v 1079.55n 0.0v 1089.45n 0.0v 1089.55n 5.0v 1099.45n 5.0v 1099.55n 5.0v 1109.45n 5.0v 1109.55n 5.0v 1119.45n 5.0v 1119.55n 0.0v 1129.45n 0.0v 1129.55n 0.0v 1139.45n 0.0v 1139.55n 0.0v 1149.45n 0.0v 1149.55n 0.0v 1159.45n 0.0v 1159.55n 5.0v 1169.45n 5.0v 1169.55n 5.0v 1179.45n 5.0v 1179.55n 5.0v 1189.45n 5.0v 1189.55n 5.0v 1199.45n 5.0v 1199.55n 0.0v 1209.45n 0.0v 1209.55n 0.0v 1219.45n 0.0v 1219.55n 5.0v 1229.45n 5.0v 1229.55n 5.0v 1239.45n 5.0v 1239.55n 5.0v 1249.45n 5.0v 1249.55n 5.0v 1259.45n 5.0v 1259.55n 5.0v 1269.45n 5.0v 1269.55n 0.0v 1279.45n 0.0v 1279.55n 0.0v 1289.45n 0.0v 1289.55n 0.0v 1299.45n 0.0v 1299.55n 5.0v 1309.45n 5.0v 1309.55n 5.0v 1319.45n 5.0v 1319.55n 5.0v 1329.45n 5.0v 1329.55n 5.0v 1339.45n 5.0v 1339.55n 5.0v 1349.45n 5.0v 1349.55n 5.0v 1359.45n 5.0v 1359.55n 5.0v 1369.45n 5.0v 1369.55n 5.0v 1379.45n 5.0v 1379.55n 0.0v 1389.45n 0.0v 1389.55n 0.0v 1399.45n 0.0v 1399.55n 0.0v 1409.45n 0.0v 1409.55n 0.0v 1419.45n 0.0v 1419.55n 0.0v 1429.45n 0.0v 1429.55n 0.0v 1439.45n 0.0v 1439.55n 5.0v 1449.45n 5.0v 1449.55n 5.0v 1459.45n 5.0v 1459.55n 5.0v 1469.45n 5.0v 1469.55n 5.0v 1479.45n 5.0v 1479.55n 5.0v 1489.45n 5.0v 1489.55n 5.0v 1499.45n 5.0v 1499.55n 0.0v 1509.45n 0.0v 1509.55n 0.0v 1519.45n 0.0v 1519.55n 0.0v 1529.45n 0.0v 1529.55n 5.0v 1539.45n 5.0v 1539.55n 0.0v 1549.45n 0.0v 1549.55n 5.0v 1559.45n 5.0v 1559.55n 0.0v 1569.45n 0.0v 1569.55n 0.0v 1579.45n 0.0v 1579.55n 0.0v 1589.45n 0.0v 1589.55n 5.0v 1599.45n 5.0v 1599.55n 5.0v 1609.45n 5.0v 1609.55n 5.0v 1619.45n 5.0v 1619.55n 5.0v 1629.45n 5.0v 1629.55n 5.0v 1639.45n 5.0v 1639.55n 5.0v 1649.45n 5.0v 1649.55n 5.0v 1659.45n 5.0v 1659.55n 5.0v 1669.45n 5.0v 1669.55n 5.0v 1679.45n 5.0v 1679.55n 5.0v 1689.45n 5.0v 1689.55n 5.0v 1699.45n 5.0v 1699.55n 5.0v 1709.45n 5.0v 1709.55n 5.0v 1719.45n 5.0v 1719.55n 5.0v 1729.45n 5.0v 1729.55n 0.0v 1739.45n 0.0v 1739.55n 0.0v 1749.45n 0.0v 1749.55n 0.0v 1759.45n 0.0v 1759.55n 0.0v 1769.45n 0.0v 1769.55n 5.0v 1779.45n 5.0v 1779.55n 0.0v 1789.45n 0.0v 1789.55n 5.0v 1799.45n 5.0v 1799.55n 5.0v 1809.45n 5.0v 1809.55n 0.0v 1819.45n 0.0v 1819.55n 0.0v 1829.45n 0.0v 1829.55n 0.0v 1839.45n 0.0v 1839.55n 0.0v 1849.45n 0.0v 1849.55n 0.0v 1859.45n 0.0v 1859.55n 0.0v 1869.45n 0.0v 1869.55n 0.0v 1879.45n 0.0v 1879.55n 0.0v 1889.45n 0.0v 1889.55n 5.0v 1899.45n 5.0v 1899.55n 5.0v 1909.45n 5.0v 1909.55n 5.0v 1919.45n 5.0v 1919.55n 5.0v 1929.45n 5.0v 1929.55n 0.0v 1939.45n 0.0v 1939.55n 0.0v 1949.45n 0.0v 1949.55n 0.0v 1959.45n 0.0v 1959.55n 0.0v 1969.45n 0.0v 1969.55n 5.0v 1979.45n 5.0v 1979.55n 0.0v 1989.45n 0.0v 1989.55n 0.0v 1999.45n 0.0v 1999.55n 0.0v 2009.45n 0.0v 2009.55n 0.0v 2019.45n 0.0v 2019.55n 0.0v 2029.45n 0.0v 2029.55n 0.0v 2039.45n 0.0v 2039.55n 0.0v 2049.45n 0.0v 2049.55n 0.0v )
* (time, data): [(0, 0), (10, 1), (20, 1), (30, 0), (40, 0), (50, 0), (60, 0), (70, 0), (80, 1), (90, 1), (100, 0), (110, 0), (120, 1), (130, 1), (140, 1), (150, 1), (160, 1), (170, 0), (180, 1), (190, 1), (200, 1), (210, 1), (220, 1), (230, 1), (240, 1), (250, 1), (260, 1), (270, 0), (280, 1), (290, 1), (300, 1), (310, 1), (320, 1), (330, 1), (340, 1), (350, 1), (360, 1), (370, 0), (380, 1), (390, 1), (400, 0), (410, 0), (420, 0), (430, 1), (440, 0), (450, 1), (460, 1), (470, 0), (480, 1), (490, 0), (500, 0), (510, 1), (520, 1), (530, 1), (540, 0), (550, 0), (560, 0), (570, 0), (580, 1), (590, 0), (600, 0), (610, 1), (620, 1), (630, 0), (640, 0), (650, 1), (660, 1), (670, 0), (680, 1), (690, 0), (700, 0), (710, 1), (720, 0), (730, 0), (740, 1), (750, 0), (760, 1), (770, 1), (780, 0), (790, 0), (800, 0), (810, 1), (820, 1), (830, 1), (840, 1), (850, 0), (860, 1), (870, 1), (880, 1), (890, 1), (900, 1), (910, 1), (920, 1), (930, 0), (940, 0), (950, 0), (960, 0), (970, 0), (980, 0), (990, 1), (1000, 1), (1010, 0), (1020, 1), (1030, 1), (1040, 1), (1050, 1), (1060, 1), (1070, 0), (1080, 1), (1090, 0), (1100, 0), (1110, 1), (1120, 1), (1130, 1), (1140, 1), (1150, 0), (1160, 1), (1170, 1), (1180, 0), (1190, 1), (1200, 1), (1210, 1), (1220, 0), (1230, 1), (1240, 1), (1250, 0), (1260, 1), (1270, 0), (1280, 1), (1290, 0), (1300, 0), (1310, 0), (1320, 0), (1330, 0), (1340, 0), (1350, 1), (1360, 1), (1370, 0), (1380, 1), (1390, 1), (1400, 1), (1410, 1), (1420, 1), (1430, 1), (1440, 1), (1450, 1), (1460, 1), (1470, 0), (1480, 0), (1490, 0), (1500, 0), (1510, 1), (1520, 0), (1530, 0), (1540, 0), (1550, 0), (1560, 0), (1570, 0), (1580, 0), (1590, 0), (1600, 0), (1610, 0), (1620, 1), (1630, 0), (1640, 1), (1650, 1), (1660, 0), (1670, 0), (1680, 1), (1690, 1), (1700, 1), (1710, 0), (1720, 0), (1730, 1), (1740, 0), (1750, 0), (1760, 1), (1770, 1), (1780, 0), (1790, 0), (1800, 0), (1810, 1), (1820, 1), (1830, 0), (1840, 1), (1850, 0), (1860, 0), (1870, 0), (1880, 0), (1890, 0), (1900, 1), (1910, 1), (1920, 1), (1930, 1), (1940, 1), (1950, 0), (1960, 0), (1970, 1), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 0), (2030, 0), (2040, 1), (2050, 1)]
Va0_0  a0_0  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 5.0v 19.45n 5.0v 19.55n 5.0v 29.45n 5.0v 29.55n 0.0v 39.45n 0.0v 39.55n 0.0v 49.45n 0.0v 49.55n 0.0v 59.45n 0.0v 59.55n 0.0v 69.45n 0.0v 69.55n 0.0v 79.45n 0.0v 79.55n 5.0v 89.45n 5.0v 89.55n 5.0v 99.45n 5.0v 99.55n 0.0v 109.45n 0.0v 109.55n 0.0v 119.45n 0.0v 119.55n 5.0v 129.45n 5.0v 129.55n 5.0v 139.45n 5.0v 139.55n 5.0v 149.45n 5.0v 149.55n 5.0v 159.45n 5.0v 159.55n 5.0v 169.45n 5.0v 169.55n 0.0v 179.45n 0.0v 179.55n 5.0v 189.45n 5.0v 189.55n 5.0v 199.45n 5.0v 199.55n 5.0v 209.45n 5.0v 209.55n 5.0v 219.45n 5.0v 219.55n 5.0v 229.45n 5.0v 229.55n 5.0v 239.45n 5.0v 239.55n 5.0v 249.45n 5.0v 249.55n 5.0v 259.45n 5.0v 259.55n 5.0v 269.45n 5.0v 269.55n 0.0v 279.45n 0.0v 279.55n 5.0v 289.45n 5.0v 289.55n 5.0v 299.45n 5.0v 299.55n 5.0v 309.45n 5.0v 309.55n 5.0v 319.45n 5.0v 319.55n 5.0v 329.45n 5.0v 329.55n 5.0v 339.45n 5.0v 339.55n 5.0v 349.45n 5.0v 349.55n 5.0v 359.45n 5.0v 359.55n 5.0v 369.45n 5.0v 369.55n 0.0v 379.45n 0.0v 379.55n 5.0v 389.45n 5.0v 389.55n 5.0v 399.45n 5.0v 399.55n 0.0v 409.45n 0.0v 409.55n 0.0v 419.45n 0.0v 419.55n 0.0v 429.45n 0.0v 429.55n 5.0v 439.45n 5.0v 439.55n 0.0v 449.45n 0.0v 449.55n 5.0v 459.45n 5.0v 459.55n 5.0v 469.45n 5.0v 469.55n 0.0v 479.45n 0.0v 479.55n 5.0v 489.45n 5.0v 489.55n 0.0v 499.45n 0.0v 499.55n 0.0v 509.45n 0.0v 509.55n 5.0v 519.45n 5.0v 519.55n 5.0v 529.45n 5.0v 529.55n 5.0v 539.45n 5.0v 539.55n 0.0v 549.45n 0.0v 549.55n 0.0v 559.45n 0.0v 559.55n 0.0v 569.45n 0.0v 569.55n 0.0v 579.45n 0.0v 579.55n 5.0v 589.45n 5.0v 589.55n 0.0v 599.45n 0.0v 599.55n 0.0v 609.45n 0.0v 609.55n 5.0v 619.45n 5.0v 619.55n 5.0v 629.45n 5.0v 629.55n 0.0v 639.45n 0.0v 639.55n 0.0v 649.45n 0.0v 649.55n 5.0v 659.45n 5.0v 659.55n 5.0v 669.45n 5.0v 669.55n 0.0v 679.45n 0.0v 679.55n 5.0v 689.45n 5.0v 689.55n 0.0v 699.45n 0.0v 699.55n 0.0v 709.45n 0.0v 709.55n 5.0v 719.45n 5.0v 719.55n 0.0v 729.45n 0.0v 729.55n 0.0v 739.45n 0.0v 739.55n 5.0v 749.45n 5.0v 749.55n 0.0v 759.45n 0.0v 759.55n 5.0v 769.45n 5.0v 769.55n 5.0v 779.45n 5.0v 779.55n 0.0v 789.45n 0.0v 789.55n 0.0v 799.45n 0.0v 799.55n 0.0v 809.45n 0.0v 809.55n 5.0v 819.45n 5.0v 819.55n 5.0v 829.45n 5.0v 829.55n 5.0v 839.45n 5.0v 839.55n 5.0v 849.45n 5.0v 849.55n 0.0v 859.45n 0.0v 859.55n 5.0v 869.45n 5.0v 869.55n 5.0v 879.45n 5.0v 879.55n 5.0v 889.45n 5.0v 889.55n 5.0v 899.45n 5.0v 899.55n 5.0v 909.45n 5.0v 909.55n 5.0v 919.45n 5.0v 919.55n 5.0v 929.45n 5.0v 929.55n 0.0v 939.45n 0.0v 939.55n 0.0v 949.45n 0.0v 949.55n 0.0v 959.45n 0.0v 959.55n 0.0v 969.45n 0.0v 969.55n 0.0v 979.45n 0.0v 979.55n 0.0v 989.45n 0.0v 989.55n 5.0v 999.45n 5.0v 999.55n 5.0v 1009.45n 5.0v 1009.55n 0.0v 1019.45n 0.0v 1019.55n 5.0v 1029.45n 5.0v 1029.55n 5.0v 1039.45n 5.0v 1039.55n 5.0v 1049.45n 5.0v 1049.55n 5.0v 1059.45n 5.0v 1059.55n 5.0v 1069.45n 5.0v 1069.55n 0.0v 1079.45n 0.0v 1079.55n 5.0v 1089.45n 5.0v 1089.55n 0.0v 1099.45n 0.0v 1099.55n 0.0v 1109.45n 0.0v 1109.55n 5.0v 1119.45n 5.0v 1119.55n 5.0v 1129.45n 5.0v 1129.55n 5.0v 1139.45n 5.0v 1139.55n 5.0v 1149.45n 5.0v 1149.55n 0.0v 1159.45n 0.0v 1159.55n 5.0v 1169.45n 5.0v 1169.55n 5.0v 1179.45n 5.0v 1179.55n 0.0v 1189.45n 0.0v 1189.55n 5.0v 1199.45n 5.0v 1199.55n 5.0v 1209.45n 5.0v 1209.55n 5.0v 1219.45n 5.0v 1219.55n 0.0v 1229.45n 0.0v 1229.55n 5.0v 1239.45n 5.0v 1239.55n 5.0v 1249.45n 5.0v 1249.55n 0.0v 1259.45n 0.0v 1259.55n 5.0v 1269.45n 5.0v 1269.55n 0.0v 1279.45n 0.0v 1279.55n 5.0v 1289.45n 5.0v 1289.55n 0.0v 1299.45n 0.0v 1299.55n 0.0v 1309.45n 0.0v 1309.55n 0.0v 1319.45n 0.0v 1319.55n 0.0v 1329.45n 0.0v 1329.55n 0.0v 1339.45n 0.0v 1339.55n 0.0v 1349.45n 0.0v 1349.55n 5.0v 1359.45n 5.0v 1359.55n 5.0v 1369.45n 5.0v 1369.55n 0.0v 1379.45n 0.0v 1379.55n 5.0v 1389.45n 5.0v 1389.55n 5.0v 1399.45n 5.0v 1399.55n 5.0v 1409.45n 5.0v 1409.55n 5.0v 1419.45n 5.0v 1419.55n 5.0v 1429.45n 5.0v 1429.55n 5.0v 1439.45n 5.0v 1439.55n 5.0v 1449.45n 5.0v 1449.55n 5.0v 1459.45n 5.0v 1459.55n 5.0v 1469.45n 5.0v 1469.55n 0.0v 1479.45n 0.0v 1479.55n 0.0v 1489.45n 0.0v 1489.55n 0.0v 1499.45n 0.0v 1499.55n 0.0v 1509.45n 0.0v 1509.55n 5.0v 1519.45n 5.0v 1519.55n 0.0v 1529.45n 0.0v 1529.55n 0.0v 1539.45n 0.0v 1539.55n 0.0v 1549.45n 0.0v 1549.55n 0.0v 1559.45n 0.0v 1559.55n 0.0v 1569.45n 0.0v 1569.55n 0.0v 1579.45n 0.0v 1579.55n 0.0v 1589.45n 0.0v 1589.55n 0.0v 1599.45n 0.0v 1599.55n 0.0v 1609.45n 0.0v 1609.55n 0.0v 1619.45n 0.0v 1619.55n 5.0v 1629.45n 5.0v 1629.55n 0.0v 1639.45n 0.0v 1639.55n 5.0v 1649.45n 5.0v 1649.55n 5.0v 1659.45n 5.0v 1659.55n 0.0v 1669.45n 0.0v 1669.55n 0.0v 1679.45n 0.0v 1679.55n 5.0v 1689.45n 5.0v 1689.55n 5.0v 1699.45n 5.0v 1699.55n 5.0v 1709.45n 5.0v 1709.55n 0.0v 1719.45n 0.0v 1719.55n 0.0v 1729.45n 0.0v 1729.55n 5.0v 1739.45n 5.0v 1739.55n 0.0v 1749.45n 0.0v 1749.55n 0.0v 1759.45n 0.0v 1759.55n 5.0v 1769.45n 5.0v 1769.55n 5.0v 1779.45n 5.0v 1779.55n 0.0v 1789.45n 0.0v 1789.55n 0.0v 1799.45n 0.0v 1799.55n 0.0v 1809.45n 0.0v 1809.55n 5.0v 1819.45n 5.0v 1819.55n 5.0v 1829.45n 5.0v 1829.55n 0.0v 1839.45n 0.0v 1839.55n 5.0v 1849.45n 5.0v 1849.55n 0.0v 1859.45n 0.0v 1859.55n 0.0v 1869.45n 0.0v 1869.55n 0.0v 1879.45n 0.0v 1879.55n 0.0v 1889.45n 0.0v 1889.55n 0.0v 1899.45n 0.0v 1899.55n 5.0v 1909.45n 5.0v 1909.55n 5.0v 1919.45n 5.0v 1919.55n 5.0v 1929.45n 5.0v 1929.55n 5.0v 1939.45n 5.0v 1939.55n 5.0v 1949.45n 5.0v 1949.55n 0.0v 1959.45n 0.0v 1959.55n 0.0v 1969.45n 0.0v 1969.55n 5.0v 1979.45n 5.0v 1979.55n 0.0v 1989.45n 0.0v 1989.55n 0.0v 1999.45n 0.0v 1999.55n 0.0v 2009.45n 0.0v 2009.55n 0.0v 2019.45n 0.0v 2019.55n 0.0v 2029.45n 0.0v 2029.55n 0.0v 2039.45n 0.0v 2039.55n 5.0v 2049.45n 5.0v 2049.55n 5.0v )
* (time, data): [(0, 0), (10, 0), (20, 0), (30, 0), (40, 0), (50, 0), (60, 0), (70, 0), (80, 0), (90, 0), (100, 0), (110, 0), (120, 0), (130, 0), (140, 0), (150, 0), (160, 0), (170, 1), (180, 0), (190, 0), (200, 0), (210, 0), (220, 0), (230, 0), (240, 0), (250, 0), (260, 0), (270, 0), (280, 0), (290, 0), (300, 0), (310, 0), (320, 0), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 0), (390, 0), (400, 1), (410, 1), (420, 1), (430, 0), (440, 1), (450, 0), (460, 0), (470, 0), (480, 0), (490, 0), (500, 0), (510, 0), (520, 0), (530, 0), (540, 0), (550, 0), (560, 0), (570, 1), (580, 0), (590, 1), (600, 1), (610, 0), (620, 0), (630, 1), (640, 1), (650, 0), (660, 0), (670, 1), (680, 0), (690, 1), (700, 1), (710, 0), (720, 1), (730, 1), (740, 0), (750, 1), (760, 0), (770, 0), (780, 0), (790, 1), (800, 1), (810, 0), (820, 0), (830, 0), (840, 0), (850, 1), (860, 0), (870, 0), (880, 0), (890, 0), (900, 0), (910, 0), (920, 0), (930, 0), (940, 0), (950, 0), (960, 1), (970, 1), (980, 1), (990, 0), (1000, 0), (1010, 1), (1020, 0), (1030, 0), (1040, 0), (1050, 0), (1060, 0), (1070, 0), (1080, 0), (1090, 1), (1100, 0), (1110, 0), (1120, 0), (1130, 0), (1140, 0), (1150, 1), (1160, 0), (1170, 0), (1180, 1), (1190, 0), (1200, 0), (1210, 0), (1220, 1), (1230, 0), (1240, 0), (1250, 0), (1260, 0), (1270, 0), (1280, 0), (1290, 1), (1300, 1), (1310, 1), (1320, 0), (1330, 0), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 0), (1390, 0), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 0), (1450, 0), (1460, 0), (1470, 0), (1480, 0), (1490, 0), (1500, 1), (1510, 0), (1520, 1), (1530, 1), (1540, 1), (1550, 1), (1560, 1), (1570, 1), (1580, 1), (1590, 1), (1600, 1), (1610, 1), (1620, 0), (1630, 0), (1640, 0), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 0), (1700, 0), (1710, 1), (1720, 1), (1730, 0), (1740, 1), (1750, 1), (1760, 0), (1770, 0), (1780, 0), (1790, 0), (1800, 0), (1810, 0), (1820, 0), (1830, 0), (1840, 0), (1850, 1), (1860, 0), (1870, 1), (1880, 1), (1890, 0), (1900, 0), (1910, 0), (1920, 0), (1930, 0), (1940, 0), (1950, 0), (1960, 1), (1970, 0), (1980, 0), (1990, 0), (2000, 1), (2010, 0), (2020, 0), (2030, 1), (2040, 0), (2050, 0)]
Va0_1  a0_1  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 0.0v 19.45n 0.0v 19.55n 0.0v 29.45n 0.0v 29.55n 0.0v 39.45n 0.0v 39.55n 0.0v 49.45n 0.0v 49.55n 0.0v 59.45n 0.0v 59.55n 0.0v 69.45n 0.0v 69.55n 0.0v 79.45n 0.0v 79.55n 0.0v 89.45n 0.0v 89.55n 0.0v 99.45n 0.0v 99.55n 0.0v 109.45n 0.0v 109.55n 0.0v 119.45n 0.0v 119.55n 0.0v 129.45n 0.0v 129.55n 0.0v 139.45n 0.0v 139.55n 0.0v 149.45n 0.0v 149.55n 0.0v 159.45n 0.0v 159.55n 0.0v 169.45n 0.0v 169.55n 5.0v 179.45n 5.0v 179.55n 0.0v 189.45n 0.0v 189.55n 0.0v 199.45n 0.0v 199.55n 0.0v 209.45n 0.0v 209.55n 0.0v 219.45n 0.0v 219.55n 0.0v 229.45n 0.0v 229.55n 0.0v 239.45n 0.0v 239.55n 0.0v 249.45n 0.0v 249.55n 0.0v 259.45n 0.0v 259.55n 0.0v 269.45n 0.0v 269.55n 0.0v 279.45n 0.0v 279.55n 0.0v 289.45n 0.0v 289.55n 0.0v 299.45n 0.0v 299.55n 0.0v 309.45n 0.0v 309.55n 0.0v 319.45n 0.0v 319.55n 0.0v 329.45n 0.0v 329.55n 0.0v 339.45n 0.0v 339.55n 0.0v 349.45n 0.0v 349.55n 0.0v 359.45n 0.0v 359.55n 0.0v 369.45n 0.0v 369.55n 0.0v 379.45n 0.0v 379.55n 0.0v 389.45n 0.0v 389.55n 0.0v 399.45n 0.0v 399.55n 5.0v 409.45n 5.0v 409.55n 5.0v 419.45n 5.0v 419.55n 5.0v 429.45n 5.0v 429.55n 0.0v 439.45n 0.0v 439.55n 5.0v 449.45n 5.0v 449.55n 0.0v 459.45n 0.0v 459.55n 0.0v 469.45n 0.0v 469.55n 0.0v 479.45n 0.0v 479.55n 0.0v 489.45n 0.0v 489.55n 0.0v 499.45n 0.0v 499.55n 0.0v 509.45n 0.0v 509.55n 0.0v 519.45n 0.0v 519.55n 0.0v 529.45n 0.0v 529.55n 0.0v 539.45n 0.0v 539.55n 0.0v 549.45n 0.0v 549.55n 0.0v 559.45n 0.0v 559.55n 0.0v 569.45n 0.0v 569.55n 5.0v 579.45n 5.0v 579.55n 0.0v 589.45n 0.0v 589.55n 5.0v 599.45n 5.0v 599.55n 5.0v 609.45n 5.0v 609.55n 0.0v 619.45n 0.0v 619.55n 0.0v 629.45n 0.0v 629.55n 5.0v 639.45n 5.0v 639.55n 5.0v 649.45n 5.0v 649.55n 0.0v 659.45n 0.0v 659.55n 0.0v 669.45n 0.0v 669.55n 5.0v 679.45n 5.0v 679.55n 0.0v 689.45n 0.0v 689.55n 5.0v 699.45n 5.0v 699.55n 5.0v 709.45n 5.0v 709.55n 0.0v 719.45n 0.0v 719.55n 5.0v 729.45n 5.0v 729.55n 5.0v 739.45n 5.0v 739.55n 0.0v 749.45n 0.0v 749.55n 5.0v 759.45n 5.0v 759.55n 0.0v 769.45n 0.0v 769.55n 0.0v 779.45n 0.0v 779.55n 0.0v 789.45n 0.0v 789.55n 5.0v 799.45n 5.0v 799.55n 5.0v 809.45n 5.0v 809.55n 0.0v 819.45n 0.0v 819.55n 0.0v 829.45n 0.0v 829.55n 0.0v 839.45n 0.0v 839.55n 0.0v 849.45n 0.0v 849.55n 5.0v 859.45n 5.0v 859.55n 0.0v 869.45n 0.0v 869.55n 0.0v 879.45n 0.0v 879.55n 0.0v 889.45n 0.0v 889.55n 0.0v 899.45n 0.0v 899.55n 0.0v 909.45n 0.0v 909.55n 0.0v 919.45n 0.0v 919.55n 0.0v 929.45n 0.0v 929.55n 0.0v 939.45n 0.0v 939.55n 0.0v 949.45n 0.0v 949.55n 0.0v 959.45n 0.0v 959.55n 5.0v 969.45n 5.0v 969.55n 5.0v 979.45n 5.0v 979.55n 5.0v 989.45n 5.0v 989.55n 0.0v 999.45n 0.0v 999.55n 0.0v 1009.45n 0.0v 1009.55n 5.0v 1019.45n 5.0v 1019.55n 0.0v 1029.45n 0.0v 1029.55n 0.0v 1039.45n 0.0v 1039.55n 0.0v 1049.45n 0.0v 1049.55n 0.0v 1059.45n 0.0v 1059.55n 0.0v 1069.45n 0.0v 1069.55n 0.0v 1079.45n 0.0v 1079.55n 0.0v 1089.45n 0.0v 1089.55n 5.0v 1099.45n 5.0v 1099.55n 0.0v 1109.45n 0.0v 1109.55n 0.0v 1119.45n 0.0v 1119.55n 0.0v 1129.45n 0.0v 1129.55n 0.0v 1139.45n 0.0v 1139.55n 0.0v 1149.45n 0.0v 1149.55n 5.0v 1159.45n 5.0v 1159.55n 0.0v 1169.45n 0.0v 1169.55n 0.0v 1179.45n 0.0v 1179.55n 5.0v 1189.45n 5.0v 1189.55n 0.0v 1199.45n 0.0v 1199.55n 0.0v 1209.45n 0.0v 1209.55n 0.0v 1219.45n 0.0v 1219.55n 5.0v 1229.45n 5.0v 1229.55n 0.0v 1239.45n 0.0v 1239.55n 0.0v 1249.45n 0.0v 1249.55n 0.0v 1259.45n 0.0v 1259.55n 0.0v 1269.45n 0.0v 1269.55n 0.0v 1279.45n 0.0v 1279.55n 0.0v 1289.45n 0.0v 1289.55n 5.0v 1299.45n 5.0v 1299.55n 5.0v 1309.45n 5.0v 1309.55n 5.0v 1319.45n 5.0v 1319.55n 0.0v 1329.45n 0.0v 1329.55n 0.0v 1339.45n 0.0v 1339.55n 0.0v 1349.45n 0.0v 1349.55n 0.0v 1359.45n 0.0v 1359.55n 0.0v 1369.45n 0.0v 1369.55n 0.0v 1379.45n 0.0v 1379.55n 0.0v 1389.45n 0.0v 1389.55n 0.0v 1399.45n 0.0v 1399.55n 0.0v 1409.45n 0.0v 1409.55n 0.0v 1419.45n 0.0v 1419.55n 0.0v 1429.45n 0.0v 1429.55n 0.0v 1439.45n 0.0v 1439.55n 0.0v 1449.45n 0.0v 1449.55n 0.0v 1459.45n 0.0v 1459.55n 0.0v 1469.45n 0.0v 1469.55n 0.0v 1479.45n 0.0v 1479.55n 0.0v 1489.45n 0.0v 1489.55n 0.0v 1499.45n 0.0v 1499.55n 5.0v 1509.45n 5.0v 1509.55n 0.0v 1519.45n 0.0v 1519.55n 5.0v 1529.45n 5.0v 1529.55n 5.0v 1539.45n 5.0v 1539.55n 5.0v 1549.45n 5.0v 1549.55n 5.0v 1559.45n 5.0v 1559.55n 5.0v 1569.45n 5.0v 1569.55n 5.0v 1579.45n 5.0v 1579.55n 5.0v 1589.45n 5.0v 1589.55n 5.0v 1599.45n 5.0v 1599.55n 5.0v 1609.45n 5.0v 1609.55n 5.0v 1619.45n 5.0v 1619.55n 0.0v 1629.45n 0.0v 1629.55n 0.0v 1639.45n 0.0v 1639.55n 0.0v 1649.45n 0.0v 1649.55n 0.0v 1659.45n 0.0v 1659.55n 0.0v 1669.45n 0.0v 1669.55n 0.0v 1679.45n 0.0v 1679.55n 0.0v 1689.45n 0.0v 1689.55n 0.0v 1699.45n 0.0v 1699.55n 0.0v 1709.45n 0.0v 1709.55n 5.0v 1719.45n 5.0v 1719.55n 5.0v 1729.45n 5.0v 1729.55n 0.0v 1739.45n 0.0v 1739.55n 5.0v 1749.45n 5.0v 1749.55n 5.0v 1759.45n 5.0v 1759.55n 0.0v 1769.45n 0.0v 1769.55n 0.0v 1779.45n 0.0v 1779.55n 0.0v 1789.45n 0.0v 1789.55n 0.0v 1799.45n 0.0v 1799.55n 0.0v 1809.45n 0.0v 1809.55n 0.0v 1819.45n 0.0v 1819.55n 0.0v 1829.45n 0.0v 1829.55n 0.0v 1839.45n 0.0v 1839.55n 0.0v 1849.45n 0.0v 1849.55n 5.0v 1859.45n 5.0v 1859.55n 0.0v 1869.45n 0.0v 1869.55n 5.0v 1879.45n 5.0v 1879.55n 5.0v 1889.45n 5.0v 1889.55n 0.0v 1899.45n 0.0v 1899.55n 0.0v 1909.45n 0.0v 1909.55n 0.0v 1919.45n 0.0v 1919.55n 0.0v 1929.45n 0.0v 1929.55n 0.0v 1939.45n 0.0v 1939.55n 0.0v 1949.45n 0.0v 1949.55n 0.0v 1959.45n 0.0v 1959.55n 5.0v 1969.45n 5.0v 1969.55n 0.0v 1979.45n 0.0v 1979.55n 0.0v 1989.45n 0.0v 1989.55n 0.0v 1999.45n 0.0v 1999.55n 5.0v 2009.45n 5.0v 2009.55n 0.0v 2019.45n 0.0v 2019.55n 0.0v 2029.45n 0.0v 2029.55n 5.0v 2039.45n 5.0v 2039.55n 0.0v 2049.45n 0.0v 2049.55n 0.0v )
* (time, data): [(0, 0), (10, 1), (20, 1), (30, 0), (40, 0), (50, 0), (60, 0), (70, 0), (80, 0), (90, 0), (100, 0), (110, 0), (120, 1), (130, 1), (140, 1), (150, 0), (160, 0), (170, 1), (180, 1), (190, 1), (200, 1), (210, 0), (220, 0), (230, 0), (240, 1), (250, 1), (260, 0), (270, 0), (280, 1), (290, 0), (300, 1), (310, 1), (320, 1), (330, 1), (340, 1), (350, 1), (360, 0), (370, 0), (380, 1), (390, 1), (400, 1), (410, 1), (420, 1), (430, 1), (440, 1), (450, 0), (460, 0), (470, 0), (480, 0), (490, 0), (500, 0), (510, 1), (520, 0), (530, 0), (540, 0), (550, 0), (560, 0), (570, 1), (580, 0), (590, 1), (600, 1), (610, 0), (620, 0), (630, 1), (640, 1), (650, 0), (660, 0), (670, 1), (680, 0), (690, 1), (700, 1), (710, 0), (720, 1), (730, 1), (740, 1), (750, 1), (760, 1), (770, 1), (780, 0), (790, 1), (800, 1), (810, 0), (820, 1), (830, 0), (840, 0), (850, 1), (860, 0), (870, 0), (880, 0), (890, 1), (900, 0), (910, 1), (920, 1), (930, 0), (940, 0), (950, 0), (960, 1), (970, 1), (980, 1), (990, 1), (1000, 1), (1010, 1), (1020, 1), (1030, 0), (1040, 0), (1050, 1), (1060, 1), (1070, 0), (1080, 0), (1090, 1), (1100, 0), (1110, 1), (1120, 0), (1130, 0), (1140, 1), (1150, 1), (1160, 0), (1170, 0), (1180, 1), (1190, 0), (1200, 0), (1210, 0), (1220, 1), (1230, 1), (1240, 0), (1250, 0), (1260, 1), (1270, 0), (1280, 1), (1290, 1), (1300, 1), (1310, 1), (1320, 0), (1330, 0), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 1), (1390, 1), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 0), (1450, 0), (1460, 1), (1470, 0), (1480, 0), (1490, 0), (1500, 1), (1510, 1), (1520, 1), (1530, 1), (1540, 1), (1550, 1), (1560, 1), (1570, 1), (1580, 1), (1590, 1), (1600, 1), (1610, 1), (1620, 0), (1630, 0), (1640, 0), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 1), (1700, 1), (1710, 1), (1720, 1), (1730, 1), (1740, 1), (1750, 1), (1760, 0), (1770, 0), (1780, 0), (1790, 0), (1800, 0), (1810, 0), (1820, 0), (1830, 0), (1840, 0), (1850, 1), (1860, 0), (1870, 1), (1880, 1), (1890, 0), (1900, 1), (1910, 1), (1920, 1), (1930, 0), (1940, 1), (1950, 0), (1960, 1), (1970, 1), (1980, 0), (1990, 0), (2000, 1), (2010, 0), (2020, 0), (2030, 1), (2040, 1), (2050, 1)]
Va0_2  a0_2  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 5.0v 19.45n 5.0v 19.55n 5.0v 29.45n 5.0v 29.55n 0.0v 39.45n 0.0v 39.55n 0.0v 49.45n 0.0v 49.55n 0.0v 59.45n 0.0v 59.55n 0.0v 69.45n 0.0v 69.55n 0.0v 79.45n 0.0v 79.55n 0.0v 89.45n 0.0v 89.55n 0.0v 99.45n 0.0v 99.55n 0.0v 109.45n 0.0v 109.55n 0.0v 119.45n 0.0v 119.55n 5.0v 129.45n 5.0v 129.55n 5.0v 139.45n 5.0v 139.55n 5.0v 149.45n 5.0v 149.55n 0.0v 159.45n 0.0v 159.55n 0.0v 169.45n 0.0v 169.55n 5.0v 179.45n 5.0v 179.55n 5.0v 189.45n 5.0v 189.55n 5.0v 199.45n 5.0v 199.55n 5.0v 209.45n 5.0v 209.55n 0.0v 219.45n 0.0v 219.55n 0.0v 229.45n 0.0v 229.55n 0.0v 239.45n 0.0v 239.55n 5.0v 249.45n 5.0v 249.55n 5.0v 259.45n 5.0v 259.55n 0.0v 269.45n 0.0v 269.55n 0.0v 279.45n 0.0v 279.55n 5.0v 289.45n 5.0v 289.55n 0.0v 299.45n 0.0v 299.55n 5.0v 309.45n 5.0v 309.55n 5.0v 319.45n 5.0v 319.55n 5.0v 329.45n 5.0v 329.55n 5.0v 339.45n 5.0v 339.55n 5.0v 349.45n 5.0v 349.55n 5.0v 359.45n 5.0v 359.55n 0.0v 369.45n 0.0v 369.55n 0.0v 379.45n 0.0v 379.55n 5.0v 389.45n 5.0v 389.55n 5.0v 399.45n 5.0v 399.55n 5.0v 409.45n 5.0v 409.55n 5.0v 419.45n 5.0v 419.55n 5.0v 429.45n 5.0v 429.55n 5.0v 439.45n 5.0v 439.55n 5.0v 449.45n 5.0v 449.55n 0.0v 459.45n 0.0v 459.55n 0.0v 469.45n 0.0v 469.55n 0.0v 479.45n 0.0v 479.55n 0.0v 489.45n 0.0v 489.55n 0.0v 499.45n 0.0v 499.55n 0.0v 509.45n 0.0v 509.55n 5.0v 519.45n 5.0v 519.55n 0.0v 529.45n 0.0v 529.55n 0.0v 539.45n 0.0v 539.55n 0.0v 549.45n 0.0v 549.55n 0.0v 559.45n 0.0v 559.55n 0.0v 569.45n 0.0v 569.55n 5.0v 579.45n 5.0v 579.55n 0.0v 589.45n 0.0v 589.55n 5.0v 599.45n 5.0v 599.55n 5.0v 609.45n 5.0v 609.55n 0.0v 619.45n 0.0v 619.55n 0.0v 629.45n 0.0v 629.55n 5.0v 639.45n 5.0v 639.55n 5.0v 649.45n 5.0v 649.55n 0.0v 659.45n 0.0v 659.55n 0.0v 669.45n 0.0v 669.55n 5.0v 679.45n 5.0v 679.55n 0.0v 689.45n 0.0v 689.55n 5.0v 699.45n 5.0v 699.55n 5.0v 709.45n 5.0v 709.55n 0.0v 719.45n 0.0v 719.55n 5.0v 729.45n 5.0v 729.55n 5.0v 739.45n 5.0v 739.55n 5.0v 749.45n 5.0v 749.55n 5.0v 759.45n 5.0v 759.55n 5.0v 769.45n 5.0v 769.55n 5.0v 779.45n 5.0v 779.55n 0.0v 789.45n 0.0v 789.55n 5.0v 799.45n 5.0v 799.55n 5.0v 809.45n 5.0v 809.55n 0.0v 819.45n 0.0v 819.55n 5.0v 829.45n 5.0v 829.55n 0.0v 839.45n 0.0v 839.55n 0.0v 849.45n 0.0v 849.55n 5.0v 859.45n 5.0v 859.55n 0.0v 869.45n 0.0v 869.55n 0.0v 879.45n 0.0v 879.55n 0.0v 889.45n 0.0v 889.55n 5.0v 899.45n 5.0v 899.55n 0.0v 909.45n 0.0v 909.55n 5.0v 919.45n 5.0v 919.55n 5.0v 929.45n 5.0v 929.55n 0.0v 939.45n 0.0v 939.55n 0.0v 949.45n 0.0v 949.55n 0.0v 959.45n 0.0v 959.55n 5.0v 969.45n 5.0v 969.55n 5.0v 979.45n 5.0v 979.55n 5.0v 989.45n 5.0v 989.55n 5.0v 999.45n 5.0v 999.55n 5.0v 1009.45n 5.0v 1009.55n 5.0v 1019.45n 5.0v 1019.55n 5.0v 1029.45n 5.0v 1029.55n 0.0v 1039.45n 0.0v 1039.55n 0.0v 1049.45n 0.0v 1049.55n 5.0v 1059.45n 5.0v 1059.55n 5.0v 1069.45n 5.0v 1069.55n 0.0v 1079.45n 0.0v 1079.55n 0.0v 1089.45n 0.0v 1089.55n 5.0v 1099.45n 5.0v 1099.55n 0.0v 1109.45n 0.0v 1109.55n 5.0v 1119.45n 5.0v 1119.55n 0.0v 1129.45n 0.0v 1129.55n 0.0v 1139.45n 0.0v 1139.55n 5.0v 1149.45n 5.0v 1149.55n 5.0v 1159.45n 5.0v 1159.55n 0.0v 1169.45n 0.0v 1169.55n 0.0v 1179.45n 0.0v 1179.55n 5.0v 1189.45n 5.0v 1189.55n 0.0v 1199.45n 0.0v 1199.55n 0.0v 1209.45n 0.0v 1209.55n 0.0v 1219.45n 0.0v 1219.55n 5.0v 1229.45n 5.0v 1229.55n 5.0v 1239.45n 5.0v 1239.55n 0.0v 1249.45n 0.0v 1249.55n 0.0v 1259.45n 0.0v 1259.55n 5.0v 1269.45n 5.0v 1269.55n 0.0v 1279.45n 0.0v 1279.55n 5.0v 1289.45n 5.0v 1289.55n 5.0v 1299.45n 5.0v 1299.55n 5.0v 1309.45n 5.0v 1309.55n 5.0v 1319.45n 5.0v 1319.55n 0.0v 1329.45n 0.0v 1329.55n 0.0v 1339.45n 0.0v 1339.55n 0.0v 1349.45n 0.0v 1349.55n 0.0v 1359.45n 0.0v 1359.55n 0.0v 1369.45n 0.0v 1369.55n 0.0v 1379.45n 0.0v 1379.55n 5.0v 1389.45n 5.0v 1389.55n 5.0v 1399.45n 5.0v 1399.55n 0.0v 1409.45n 0.0v 1409.55n 0.0v 1419.45n 0.0v 1419.55n 0.0v 1429.45n 0.0v 1429.55n 0.0v 1439.45n 0.0v 1439.55n 0.0v 1449.45n 0.0v 1449.55n 0.0v 1459.45n 0.0v 1459.55n 5.0v 1469.45n 5.0v 1469.55n 0.0v 1479.45n 0.0v 1479.55n 0.0v 1489.45n 0.0v 1489.55n 0.0v 1499.45n 0.0v 1499.55n 5.0v 1509.45n 5.0v 1509.55n 5.0v 1519.45n 5.0v 1519.55n 5.0v 1529.45n 5.0v 1529.55n 5.0v 1539.45n 5.0v 1539.55n 5.0v 1549.45n 5.0v 1549.55n 5.0v 1559.45n 5.0v 1559.55n 5.0v 1569.45n 5.0v 1569.55n 5.0v 1579.45n 5.0v 1579.55n 5.0v 1589.45n 5.0v 1589.55n 5.0v 1599.45n 5.0v 1599.55n 5.0v 1609.45n 5.0v 1609.55n 5.0v 1619.45n 5.0v 1619.55n 0.0v 1629.45n 0.0v 1629.55n 0.0v 1639.45n 0.0v 1639.55n 0.0v 1649.45n 0.0v 1649.55n 0.0v 1659.45n 0.0v 1659.55n 0.0v 1669.45n 0.0v 1669.55n 0.0v 1679.45n 0.0v 1679.55n 0.0v 1689.45n 0.0v 1689.55n 5.0v 1699.45n 5.0v 1699.55n 5.0v 1709.45n 5.0v 1709.55n 5.0v 1719.45n 5.0v 1719.55n 5.0v 1729.45n 5.0v 1729.55n 5.0v 1739.45n 5.0v 1739.55n 5.0v 1749.45n 5.0v 1749.55n 5.0v 1759.45n 5.0v 1759.55n 0.0v 1769.45n 0.0v 1769.55n 0.0v 1779.45n 0.0v 1779.55n 0.0v 1789.45n 0.0v 1789.55n 0.0v 1799.45n 0.0v 1799.55n 0.0v 1809.45n 0.0v 1809.55n 0.0v 1819.45n 0.0v 1819.55n 0.0v 1829.45n 0.0v 1829.55n 0.0v 1839.45n 0.0v 1839.55n 0.0v 1849.45n 0.0v 1849.55n 5.0v 1859.45n 5.0v 1859.55n 0.0v 1869.45n 0.0v 1869.55n 5.0v 1879.45n 5.0v 1879.55n 5.0v 1889.45n 5.0v 1889.55n 0.0v 1899.45n 0.0v 1899.55n 5.0v 1909.45n 5.0v 1909.55n 5.0v 1919.45n 5.0v 1919.55n 5.0v 1929.45n 5.0v 1929.55n 0.0v 1939.45n 0.0v 1939.55n 5.0v 1949.45n 5.0v 1949.55n 0.0v 1959.45n 0.0v 1959.55n 5.0v 1969.45n 5.0v 1969.55n 5.0v 1979.45n 5.0v 1979.55n 0.0v 1989.45n 0.0v 1989.55n 0.0v 1999.45n 0.0v 1999.55n 5.0v 2009.45n 5.0v 2009.55n 0.0v 2019.45n 0.0v 2019.55n 0.0v 2029.45n 0.0v 2029.55n 5.0v 2039.45n 5.0v 2039.55n 5.0v 2049.45n 5.0v 2049.55n 5.0v )
* (time, data): [(0, 0), (10, 1), (20, 1), (30, 0), (40, 0), (50, 0), (60, 0), (70, 0), (80, 0), (90, 0), (100, 0), (110, 0), (120, 1), (130, 1), (140, 1), (150, 0), (160, 0), (170, 1), (180, 1), (190, 1), (200, 1), (210, 0), (220, 0), (230, 0), (240, 1), (250, 1), (260, 0), (270, 0), (280, 1), (290, 0), (300, 1), (310, 1), (320, 1), (330, 1), (340, 1), (350, 1), (360, 0), (370, 0), (380, 1), (390, 1), (400, 1), (410, 1), (420, 1), (430, 1), (440, 1), (450, 0), (460, 0), (470, 0), (480, 0), (490, 0), (500, 0), (510, 1), (520, 0), (530, 0), (540, 0), (550, 0), (560, 0), (570, 1), (580, 0), (590, 1), (600, 1), (610, 0), (620, 0), (630, 1), (640, 1), (650, 0), (660, 0), (670, 1), (680, 0), (690, 1), (700, 1), (710, 0), (720, 1), (730, 1), (740, 1), (750, 1), (760, 1), (770, 1), (780, 0), (790, 1), (800, 1), (810, 0), (820, 1), (830, 0), (840, 0), (850, 1), (860, 0), (870, 0), (880, 0), (890, 1), (900, 0), (910, 1), (920, 1), (930, 0), (940, 0), (950, 0), (960, 1), (970, 1), (980, 1), (990, 1), (1000, 1), (1010, 1), (1020, 1), (1030, 0), (1040, 0), (1050, 1), (1060, 1), (1070, 0), (1080, 0), (1090, 1), (1100, 0), (1110, 1), (1120, 0), (1130, 0), (1140, 1), (1150, 1), (1160, 0), (1170, 0), (1180, 1), (1190, 0), (1200, 0), (1210, 0), (1220, 1), (1230, 1), (1240, 0), (1250, 0), (1260, 1), (1270, 0), (1280, 1), (1290, 1), (1300, 1), (1310, 1), (1320, 0), (1330, 0), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 1), (1390, 1), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 0), (1450, 0), (1460, 1), (1470, 0), (1480, 0), (1490, 0), (1500, 1), (1510, 1), (1520, 1), (1530, 1), (1540, 1), (1550, 1), (1560, 1), (1570, 1), (1580, 1), (1590, 1), (1600, 1), (1610, 1), (1620, 0), (1630, 0), (1640, 0), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 1), (1700, 1), (1710, 1), (1720, 1), (1730, 1), (1740, 1), (1750, 1), (1760, 0), (1770, 0), (1780, 0), (1790, 0), (1800, 0), (1810, 0), (1820, 0), (1830, 0), (1840, 0), (1850, 1), (1860, 0), (1870, 1), (1880, 1), (1890, 0), (1900, 1), (1910, 1), (1920, 1), (1930, 0), (1940, 1), (1950, 0), (1960, 1), (1970, 1), (1980, 0), (1990, 0), (2000, 1), (2010, 0), (2020, 0), (2030, 1), (2040, 1), (2050, 1)]
Va0_3  a0_3  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 5.0v 19.45n 5.0v 19.55n 5.0v 29.45n 5.0v 29.55n 0.0v 39.45n 0.0v 39.55n 0.0v 49.45n 0.0v 49.55n 0.0v 59.45n 0.0v 59.55n 0.0v 69.45n 0.0v 69.55n 0.0v 79.45n 0.0v 79.55n 0.0v 89.45n 0.0v 89.55n 0.0v 99.45n 0.0v 99.55n 0.0v 109.45n 0.0v 109.55n 0.0v 119.45n 0.0v 119.55n 5.0v 129.45n 5.0v 129.55n 5.0v 139.45n 5.0v 139.55n 5.0v 149.45n 5.0v 149.55n 0.0v 159.45n 0.0v 159.55n 0.0v 169.45n 0.0v 169.55n 5.0v 179.45n 5.0v 179.55n 5.0v 189.45n 5.0v 189.55n 5.0v 199.45n 5.0v 199.55n 5.0v 209.45n 5.0v 209.55n 0.0v 219.45n 0.0v 219.55n 0.0v 229.45n 0.0v 229.55n 0.0v 239.45n 0.0v 239.55n 5.0v 249.45n 5.0v 249.55n 5.0v 259.45n 5.0v 259.55n 0.0v 269.45n 0.0v 269.55n 0.0v 279.45n 0.0v 279.55n 5.0v 289.45n 5.0v 289.55n 0.0v 299.45n 0.0v 299.55n 5.0v 309.45n 5.0v 309.55n 5.0v 319.45n 5.0v 319.55n 5.0v 329.45n 5.0v 329.55n 5.0v 339.45n 5.0v 339.55n 5.0v 349.45n 5.0v 349.55n 5.0v 359.45n 5.0v 359.55n 0.0v 369.45n 0.0v 369.55n 0.0v 379.45n 0.0v 379.55n 5.0v 389.45n 5.0v 389.55n 5.0v 399.45n 5.0v 399.55n 5.0v 409.45n 5.0v 409.55n 5.0v 419.45n 5.0v 419.55n 5.0v 429.45n 5.0v 429.55n 5.0v 439.45n 5.0v 439.55n 5.0v 449.45n 5.0v 449.55n 0.0v 459.45n 0.0v 459.55n 0.0v 469.45n 0.0v 469.55n 0.0v 479.45n 0.0v 479.55n 0.0v 489.45n 0.0v 489.55n 0.0v 499.45n 0.0v 499.55n 0.0v 509.45n 0.0v 509.55n 5.0v 519.45n 5.0v 519.55n 0.0v 529.45n 0.0v 529.55n 0.0v 539.45n 0.0v 539.55n 0.0v 549.45n 0.0v 549.55n 0.0v 559.45n 0.0v 559.55n 0.0v 569.45n 0.0v 569.55n 5.0v 579.45n 5.0v 579.55n 0.0v 589.45n 0.0v 589.55n 5.0v 599.45n 5.0v 599.55n 5.0v 609.45n 5.0v 609.55n 0.0v 619.45n 0.0v 619.55n 0.0v 629.45n 0.0v 629.55n 5.0v 639.45n 5.0v 639.55n 5.0v 649.45n 5.0v 649.55n 0.0v 659.45n 0.0v 659.55n 0.0v 669.45n 0.0v 669.55n 5.0v 679.45n 5.0v 679.55n 0.0v 689.45n 0.0v 689.55n 5.0v 699.45n 5.0v 699.55n 5.0v 709.45n 5.0v 709.55n 0.0v 719.45n 0.0v 719.55n 5.0v 729.45n 5.0v 729.55n 5.0v 739.45n 5.0v 739.55n 5.0v 749.45n 5.0v 749.55n 5.0v 759.45n 5.0v 759.55n 5.0v 769.45n 5.0v 769.55n 5.0v 779.45n 5.0v 779.55n 0.0v 789.45n 0.0v 789.55n 5.0v 799.45n 5.0v 799.55n 5.0v 809.45n 5.0v 809.55n 0.0v 819.45n 0.0v 819.55n 5.0v 829.45n 5.0v 829.55n 0.0v 839.45n 0.0v 839.55n 0.0v 849.45n 0.0v 849.55n 5.0v 859.45n 5.0v 859.55n 0.0v 869.45n 0.0v 869.55n 0.0v 879.45n 0.0v 879.55n 0.0v 889.45n 0.0v 889.55n 5.0v 899.45n 5.0v 899.55n 0.0v 909.45n 0.0v 909.55n 5.0v 919.45n 5.0v 919.55n 5.0v 929.45n 5.0v 929.55n 0.0v 939.45n 0.0v 939.55n 0.0v 949.45n 0.0v 949.55n 0.0v 959.45n 0.0v 959.55n 5.0v 969.45n 5.0v 969.55n 5.0v 979.45n 5.0v 979.55n 5.0v 989.45n 5.0v 989.55n 5.0v 999.45n 5.0v 999.55n 5.0v 1009.45n 5.0v 1009.55n 5.0v 1019.45n 5.0v 1019.55n 5.0v 1029.45n 5.0v 1029.55n 0.0v 1039.45n 0.0v 1039.55n 0.0v 1049.45n 0.0v 1049.55n 5.0v 1059.45n 5.0v 1059.55n 5.0v 1069.45n 5.0v 1069.55n 0.0v 1079.45n 0.0v 1079.55n 0.0v 1089.45n 0.0v 1089.55n 5.0v 1099.45n 5.0v 1099.55n 0.0v 1109.45n 0.0v 1109.55n 5.0v 1119.45n 5.0v 1119.55n 0.0v 1129.45n 0.0v 1129.55n 0.0v 1139.45n 0.0v 1139.55n 5.0v 1149.45n 5.0v 1149.55n 5.0v 1159.45n 5.0v 1159.55n 0.0v 1169.45n 0.0v 1169.55n 0.0v 1179.45n 0.0v 1179.55n 5.0v 1189.45n 5.0v 1189.55n 0.0v 1199.45n 0.0v 1199.55n 0.0v 1209.45n 0.0v 1209.55n 0.0v 1219.45n 0.0v 1219.55n 5.0v 1229.45n 5.0v 1229.55n 5.0v 1239.45n 5.0v 1239.55n 0.0v 1249.45n 0.0v 1249.55n 0.0v 1259.45n 0.0v 1259.55n 5.0v 1269.45n 5.0v 1269.55n 0.0v 1279.45n 0.0v 1279.55n 5.0v 1289.45n 5.0v 1289.55n 5.0v 1299.45n 5.0v 1299.55n 5.0v 1309.45n 5.0v 1309.55n 5.0v 1319.45n 5.0v 1319.55n 0.0v 1329.45n 0.0v 1329.55n 0.0v 1339.45n 0.0v 1339.55n 0.0v 1349.45n 0.0v 1349.55n 0.0v 1359.45n 0.0v 1359.55n 0.0v 1369.45n 0.0v 1369.55n 0.0v 1379.45n 0.0v 1379.55n 5.0v 1389.45n 5.0v 1389.55n 5.0v 1399.45n 5.0v 1399.55n 0.0v 1409.45n 0.0v 1409.55n 0.0v 1419.45n 0.0v 1419.55n 0.0v 1429.45n 0.0v 1429.55n 0.0v 1439.45n 0.0v 1439.55n 0.0v 1449.45n 0.0v 1449.55n 0.0v 1459.45n 0.0v 1459.55n 5.0v 1469.45n 5.0v 1469.55n 0.0v 1479.45n 0.0v 1479.55n 0.0v 1489.45n 0.0v 1489.55n 0.0v 1499.45n 0.0v 1499.55n 5.0v 1509.45n 5.0v 1509.55n 5.0v 1519.45n 5.0v 1519.55n 5.0v 1529.45n 5.0v 1529.55n 5.0v 1539.45n 5.0v 1539.55n 5.0v 1549.45n 5.0v 1549.55n 5.0v 1559.45n 5.0v 1559.55n 5.0v 1569.45n 5.0v 1569.55n 5.0v 1579.45n 5.0v 1579.55n 5.0v 1589.45n 5.0v 1589.55n 5.0v 1599.45n 5.0v 1599.55n 5.0v 1609.45n 5.0v 1609.55n 5.0v 1619.45n 5.0v 1619.55n 0.0v 1629.45n 0.0v 1629.55n 0.0v 1639.45n 0.0v 1639.55n 0.0v 1649.45n 0.0v 1649.55n 0.0v 1659.45n 0.0v 1659.55n 0.0v 1669.45n 0.0v 1669.55n 0.0v 1679.45n 0.0v 1679.55n 0.0v 1689.45n 0.0v 1689.55n 5.0v 1699.45n 5.0v 1699.55n 5.0v 1709.45n 5.0v 1709.55n 5.0v 1719.45n 5.0v 1719.55n 5.0v 1729.45n 5.0v 1729.55n 5.0v 1739.45n 5.0v 1739.55n 5.0v 1749.45n 5.0v 1749.55n 5.0v 1759.45n 5.0v 1759.55n 0.0v 1769.45n 0.0v 1769.55n 0.0v 1779.45n 0.0v 1779.55n 0.0v 1789.45n 0.0v 1789.55n 0.0v 1799.45n 0.0v 1799.55n 0.0v 1809.45n 0.0v 1809.55n 0.0v 1819.45n 0.0v 1819.55n 0.0v 1829.45n 0.0v 1829.55n 0.0v 1839.45n 0.0v 1839.55n 0.0v 1849.45n 0.0v 1849.55n 5.0v 1859.45n 5.0v 1859.55n 0.0v 1869.45n 0.0v 1869.55n 5.0v 1879.45n 5.0v 1879.55n 5.0v 1889.45n 5.0v 1889.55n 0.0v 1899.45n 0.0v 1899.55n 5.0v 1909.45n 5.0v 1909.55n 5.0v 1919.45n 5.0v 1919.55n 5.0v 1929.45n 5.0v 1929.55n 0.0v 1939.45n 0.0v 1939.55n 5.0v 1949.45n 5.0v 1949.55n 0.0v 1959.45n 0.0v 1959.55n 5.0v 1969.45n 5.0v 1969.55n 5.0v 1979.45n 5.0v 1979.55n 0.0v 1989.45n 0.0v 1989.55n 0.0v 1999.45n 0.0v 1999.55n 5.0v 2009.45n 5.0v 2009.55n 0.0v 2019.45n 0.0v 2019.55n 0.0v 2029.45n 0.0v 2029.55n 5.0v 2039.45n 5.0v 2039.55n 5.0v 2049.45n 5.0v 2049.55n 5.0v )
* (time, data): [(0, 0), (10, 1), (20, 1), (30, 0), (40, 0), (50, 0), (60, 0), (70, 0), (80, 0), (90, 0), (100, 0), (110, 0), (120, 1), (130, 1), (140, 1), (150, 0), (160, 0), (170, 1), (180, 1), (190, 1), (200, 1), (210, 0), (220, 0), (230, 0), (240, 1), (250, 1), (260, 0), (270, 0), (280, 1), (290, 0), (300, 1), (310, 1), (320, 1), (330, 1), (340, 1), (350, 1), (360, 0), (370, 0), (380, 1), (390, 1), (400, 1), (410, 1), (420, 1), (430, 1), (440, 1), (450, 0), (460, 0), (470, 0), (480, 0), (490, 0), (500, 0), (510, 1), (520, 0), (530, 0), (540, 0), (550, 0), (560, 0), (570, 1), (580, 0), (590, 1), (600, 1), (610, 0), (620, 0), (630, 1), (640, 1), (650, 0), (660, 0), (670, 1), (680, 0), (690, 1), (700, 1), (710, 0), (720, 1), (730, 1), (740, 1), (750, 1), (760, 1), (770, 1), (780, 0), (790, 1), (800, 1), (810, 0), (820, 1), (830, 0), (840, 0), (850, 1), (860, 0), (870, 0), (880, 0), (890, 1), (900, 0), (910, 1), (920, 1), (930, 0), (940, 0), (950, 0), (960, 1), (970, 1), (980, 1), (990, 1), (1000, 1), (1010, 1), (1020, 1), (1030, 0), (1040, 0), (1050, 1), (1060, 1), (1070, 0), (1080, 0), (1090, 1), (1100, 0), (1110, 1), (1120, 0), (1130, 0), (1140, 1), (1150, 1), (1160, 0), (1170, 0), (1180, 1), (1190, 0), (1200, 0), (1210, 0), (1220, 1), (1230, 1), (1240, 0), (1250, 0), (1260, 1), (1270, 0), (1280, 1), (1290, 1), (1300, 1), (1310, 1), (1320, 0), (1330, 0), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 1), (1390, 1), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 0), (1450, 0), (1460, 1), (1470, 0), (1480, 0), (1490, 0), (1500, 1), (1510, 1), (1520, 1), (1530, 1), (1540, 1), (1550, 1), (1560, 1), (1570, 1), (1580, 1), (1590, 1), (1600, 1), (1610, 1), (1620, 0), (1630, 0), (1640, 0), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 1), (1700, 1), (1710, 1), (1720, 1), (1730, 1), (1740, 1), (1750, 1), (1760, 0), (1770, 0), (1780, 0), (1790, 0), (1800, 0), (1810, 0), (1820, 0), (1830, 0), (1840, 0), (1850, 1), (1860, 0), (1870, 1), (1880, 1), (1890, 0), (1900, 1), (1910, 1), (1920, 1), (1930, 0), (1940, 1), (1950, 0), (1960, 1), (1970, 1), (1980, 0), (1990, 0), (2000, 1), (2010, 0), (2020, 0), (2030, 1), (2040, 1), (2050, 1)]
Va0_4  a0_4  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 5.0v 19.45n 5.0v 19.55n 5.0v 29.45n 5.0v 29.55n 0.0v 39.45n 0.0v 39.55n 0.0v 49.45n 0.0v 49.55n 0.0v 59.45n 0.0v 59.55n 0.0v 69.45n 0.0v 69.55n 0.0v 79.45n 0.0v 79.55n 0.0v 89.45n 0.0v 89.55n 0.0v 99.45n 0.0v 99.55n 0.0v 109.45n 0.0v 109.55n 0.0v 119.45n 0.0v 119.55n 5.0v 129.45n 5.0v 129.55n 5.0v 139.45n 5.0v 139.55n 5.0v 149.45n 5.0v 149.55n 0.0v 159.45n 0.0v 159.55n 0.0v 169.45n 0.0v 169.55n 5.0v 179.45n 5.0v 179.55n 5.0v 189.45n 5.0v 189.55n 5.0v 199.45n 5.0v 199.55n 5.0v 209.45n 5.0v 209.55n 0.0v 219.45n 0.0v 219.55n 0.0v 229.45n 0.0v 229.55n 0.0v 239.45n 0.0v 239.55n 5.0v 249.45n 5.0v 249.55n 5.0v 259.45n 5.0v 259.55n 0.0v 269.45n 0.0v 269.55n 0.0v 279.45n 0.0v 279.55n 5.0v 289.45n 5.0v 289.55n 0.0v 299.45n 0.0v 299.55n 5.0v 309.45n 5.0v 309.55n 5.0v 319.45n 5.0v 319.55n 5.0v 329.45n 5.0v 329.55n 5.0v 339.45n 5.0v 339.55n 5.0v 349.45n 5.0v 349.55n 5.0v 359.45n 5.0v 359.55n 0.0v 369.45n 0.0v 369.55n 0.0v 379.45n 0.0v 379.55n 5.0v 389.45n 5.0v 389.55n 5.0v 399.45n 5.0v 399.55n 5.0v 409.45n 5.0v 409.55n 5.0v 419.45n 5.0v 419.55n 5.0v 429.45n 5.0v 429.55n 5.0v 439.45n 5.0v 439.55n 5.0v 449.45n 5.0v 449.55n 0.0v 459.45n 0.0v 459.55n 0.0v 469.45n 0.0v 469.55n 0.0v 479.45n 0.0v 479.55n 0.0v 489.45n 0.0v 489.55n 0.0v 499.45n 0.0v 499.55n 0.0v 509.45n 0.0v 509.55n 5.0v 519.45n 5.0v 519.55n 0.0v 529.45n 0.0v 529.55n 0.0v 539.45n 0.0v 539.55n 0.0v 549.45n 0.0v 549.55n 0.0v 559.45n 0.0v 559.55n 0.0v 569.45n 0.0v 569.55n 5.0v 579.45n 5.0v 579.55n 0.0v 589.45n 0.0v 589.55n 5.0v 599.45n 5.0v 599.55n 5.0v 609.45n 5.0v 609.55n 0.0v 619.45n 0.0v 619.55n 0.0v 629.45n 0.0v 629.55n 5.0v 639.45n 5.0v 639.55n 5.0v 649.45n 5.0v 649.55n 0.0v 659.45n 0.0v 659.55n 0.0v 669.45n 0.0v 669.55n 5.0v 679.45n 5.0v 679.55n 0.0v 689.45n 0.0v 689.55n 5.0v 699.45n 5.0v 699.55n 5.0v 709.45n 5.0v 709.55n 0.0v 719.45n 0.0v 719.55n 5.0v 729.45n 5.0v 729.55n 5.0v 739.45n 5.0v 739.55n 5.0v 749.45n 5.0v 749.55n 5.0v 759.45n 5.0v 759.55n 5.0v 769.45n 5.0v 769.55n 5.0v 779.45n 5.0v 779.55n 0.0v 789.45n 0.0v 789.55n 5.0v 799.45n 5.0v 799.55n 5.0v 809.45n 5.0v 809.55n 0.0v 819.45n 0.0v 819.55n 5.0v 829.45n 5.0v 829.55n 0.0v 839.45n 0.0v 839.55n 0.0v 849.45n 0.0v 849.55n 5.0v 859.45n 5.0v 859.55n 0.0v 869.45n 0.0v 869.55n 0.0v 879.45n 0.0v 879.55n 0.0v 889.45n 0.0v 889.55n 5.0v 899.45n 5.0v 899.55n 0.0v 909.45n 0.0v 909.55n 5.0v 919.45n 5.0v 919.55n 5.0v 929.45n 5.0v 929.55n 0.0v 939.45n 0.0v 939.55n 0.0v 949.45n 0.0v 949.55n 0.0v 959.45n 0.0v 959.55n 5.0v 969.45n 5.0v 969.55n 5.0v 979.45n 5.0v 979.55n 5.0v 989.45n 5.0v 989.55n 5.0v 999.45n 5.0v 999.55n 5.0v 1009.45n 5.0v 1009.55n 5.0v 1019.45n 5.0v 1019.55n 5.0v 1029.45n 5.0v 1029.55n 0.0v 1039.45n 0.0v 1039.55n 0.0v 1049.45n 0.0v 1049.55n 5.0v 1059.45n 5.0v 1059.55n 5.0v 1069.45n 5.0v 1069.55n 0.0v 1079.45n 0.0v 1079.55n 0.0v 1089.45n 0.0v 1089.55n 5.0v 1099.45n 5.0v 1099.55n 0.0v 1109.45n 0.0v 1109.55n 5.0v 1119.45n 5.0v 1119.55n 0.0v 1129.45n 0.0v 1129.55n 0.0v 1139.45n 0.0v 1139.55n 5.0v 1149.45n 5.0v 1149.55n 5.0v 1159.45n 5.0v 1159.55n 0.0v 1169.45n 0.0v 1169.55n 0.0v 1179.45n 0.0v 1179.55n 5.0v 1189.45n 5.0v 1189.55n 0.0v 1199.45n 0.0v 1199.55n 0.0v 1209.45n 0.0v 1209.55n 0.0v 1219.45n 0.0v 1219.55n 5.0v 1229.45n 5.0v 1229.55n 5.0v 1239.45n 5.0v 1239.55n 0.0v 1249.45n 0.0v 1249.55n 0.0v 1259.45n 0.0v 1259.55n 5.0v 1269.45n 5.0v 1269.55n 0.0v 1279.45n 0.0v 1279.55n 5.0v 1289.45n 5.0v 1289.55n 5.0v 1299.45n 5.0v 1299.55n 5.0v 1309.45n 5.0v 1309.55n 5.0v 1319.45n 5.0v 1319.55n 0.0v 1329.45n 0.0v 1329.55n 0.0v 1339.45n 0.0v 1339.55n 0.0v 1349.45n 0.0v 1349.55n 0.0v 1359.45n 0.0v 1359.55n 0.0v 1369.45n 0.0v 1369.55n 0.0v 1379.45n 0.0v 1379.55n 5.0v 1389.45n 5.0v 1389.55n 5.0v 1399.45n 5.0v 1399.55n 0.0v 1409.45n 0.0v 1409.55n 0.0v 1419.45n 0.0v 1419.55n 0.0v 1429.45n 0.0v 1429.55n 0.0v 1439.45n 0.0v 1439.55n 0.0v 1449.45n 0.0v 1449.55n 0.0v 1459.45n 0.0v 1459.55n 5.0v 1469.45n 5.0v 1469.55n 0.0v 1479.45n 0.0v 1479.55n 0.0v 1489.45n 0.0v 1489.55n 0.0v 1499.45n 0.0v 1499.55n 5.0v 1509.45n 5.0v 1509.55n 5.0v 1519.45n 5.0v 1519.55n 5.0v 1529.45n 5.0v 1529.55n 5.0v 1539.45n 5.0v 1539.55n 5.0v 1549.45n 5.0v 1549.55n 5.0v 1559.45n 5.0v 1559.55n 5.0v 1569.45n 5.0v 1569.55n 5.0v 1579.45n 5.0v 1579.55n 5.0v 1589.45n 5.0v 1589.55n 5.0v 1599.45n 5.0v 1599.55n 5.0v 1609.45n 5.0v 1609.55n 5.0v 1619.45n 5.0v 1619.55n 0.0v 1629.45n 0.0v 1629.55n 0.0v 1639.45n 0.0v 1639.55n 0.0v 1649.45n 0.0v 1649.55n 0.0v 1659.45n 0.0v 1659.55n 0.0v 1669.45n 0.0v 1669.55n 0.0v 1679.45n 0.0v 1679.55n 0.0v 1689.45n 0.0v 1689.55n 5.0v 1699.45n 5.0v 1699.55n 5.0v 1709.45n 5.0v 1709.55n 5.0v 1719.45n 5.0v 1719.55n 5.0v 1729.45n 5.0v 1729.55n 5.0v 1739.45n 5.0v 1739.55n 5.0v 1749.45n 5.0v 1749.55n 5.0v 1759.45n 5.0v 1759.55n 0.0v 1769.45n 0.0v 1769.55n 0.0v 1779.45n 0.0v 1779.55n 0.0v 1789.45n 0.0v 1789.55n 0.0v 1799.45n 0.0v 1799.55n 0.0v 1809.45n 0.0v 1809.55n 0.0v 1819.45n 0.0v 1819.55n 0.0v 1829.45n 0.0v 1829.55n 0.0v 1839.45n 0.0v 1839.55n 0.0v 1849.45n 0.0v 1849.55n 5.0v 1859.45n 5.0v 1859.55n 0.0v 1869.45n 0.0v 1869.55n 5.0v 1879.45n 5.0v 1879.55n 5.0v 1889.45n 5.0v 1889.55n 0.0v 1899.45n 0.0v 1899.55n 5.0v 1909.45n 5.0v 1909.55n 5.0v 1919.45n 5.0v 1919.55n 5.0v 1929.45n 5.0v 1929.55n 0.0v 1939.45n 0.0v 1939.55n 5.0v 1949.45n 5.0v 1949.55n 0.0v 1959.45n 0.0v 1959.55n 5.0v 1969.45n 5.0v 1969.55n 5.0v 1979.45n 5.0v 1979.55n 0.0v 1989.45n 0.0v 1989.55n 0.0v 1999.45n 0.0v 1999.55n 5.0v 2009.45n 5.0v 2009.55n 0.0v 2019.45n 0.0v 2019.55n 0.0v 2029.45n 0.0v 2029.55n 5.0v 2039.45n 5.0v 2039.55n 5.0v 2049.45n 5.0v 2049.55n 5.0v )
* (time, data): [(0, 0), (10, 1), (20, 1), (30, 0), (40, 0), (50, 0), (60, 0), (70, 0), (80, 0), (90, 0), (100, 0), (110, 0), (120, 1), (130, 1), (140, 1), (150, 0), (160, 0), (170, 1), (180, 1), (190, 1), (200, 1), (210, 0), (220, 0), (230, 0), (240, 1), (250, 1), (260, 0), (270, 0), (280, 1), (290, 0), (300, 1), (310, 1), (320, 1), (330, 1), (340, 1), (350, 1), (360, 0), (370, 0), (380, 1), (390, 1), (400, 1), (410, 1), (420, 1), (430, 1), (440, 1), (450, 0), (460, 0), (470, 0), (480, 0), (490, 0), (500, 0), (510, 1), (520, 0), (530, 0), (540, 0), (550, 0), (560, 0), (570, 1), (580, 0), (590, 1), (600, 1), (610, 0), (620, 0), (630, 1), (640, 1), (650, 0), (660, 0), (670, 1), (680, 0), (690, 1), (700, 1), (710, 0), (720, 1), (730, 1), (740, 1), (750, 1), (760, 1), (770, 1), (780, 0), (790, 1), (800, 1), (810, 0), (820, 1), (830, 0), (840, 0), (850, 1), (860, 0), (870, 0), (880, 0), (890, 1), (900, 0), (910, 1), (920, 1), (930, 0), (940, 0), (950, 0), (960, 1), (970, 1), (980, 1), (990, 1), (1000, 1), (1010, 1), (1020, 1), (1030, 0), (1040, 0), (1050, 1), (1060, 1), (1070, 0), (1080, 0), (1090, 1), (1100, 0), (1110, 1), (1120, 0), (1130, 0), (1140, 1), (1150, 1), (1160, 0), (1170, 0), (1180, 1), (1190, 0), (1200, 0), (1210, 0), (1220, 1), (1230, 1), (1240, 0), (1250, 0), (1260, 1), (1270, 0), (1280, 1), (1290, 1), (1300, 1), (1310, 1), (1320, 0), (1330, 0), (1340, 0), (1350, 0), (1360, 0), (1370, 0), (1380, 1), (1390, 1), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 0), (1450, 0), (1460, 1), (1470, 0), (1480, 0), (1490, 0), (1500, 1), (1510, 1), (1520, 1), (1530, 1), (1540, 1), (1550, 1), (1560, 1), (1570, 1), (1580, 1), (1590, 1), (1600, 1), (1610, 1), (1620, 0), (1630, 0), (1640, 0), (1650, 0), (1660, 0), (1670, 0), (1680, 0), (1690, 1), (1700, 1), (1710, 1), (1720, 1), (1730, 1), (1740, 1), (1750, 1), (1760, 0), (1770, 0), (1780, 0), (1790, 0), (1800, 0), (1810, 0), (1820, 0), (1830, 0), (1840, 0), (1850, 1), (1860, 0), (1870, 1), (1880, 1), (1890, 0), (1900, 1), (1910, 1), (1920, 1), (1930, 0), (1940, 1), (1950, 0), (1960, 1), (1970, 1), (1980, 0), (1990, 0), (2000, 1), (2010, 0), (2020, 0), (2030, 1), (2040, 1), (2050, 1)]
Va0_5  a0_5  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 5.0v 19.45n 5.0v 19.55n 5.0v 29.45n 5.0v 29.55n 0.0v 39.45n 0.0v 39.55n 0.0v 49.45n 0.0v 49.55n 0.0v 59.45n 0.0v 59.55n 0.0v 69.45n 0.0v 69.55n 0.0v 79.45n 0.0v 79.55n 0.0v 89.45n 0.0v 89.55n 0.0v 99.45n 0.0v 99.55n 0.0v 109.45n 0.0v 109.55n 0.0v 119.45n 0.0v 119.55n 5.0v 129.45n 5.0v 129.55n 5.0v 139.45n 5.0v 139.55n 5.0v 149.45n 5.0v 149.55n 0.0v 159.45n 0.0v 159.55n 0.0v 169.45n 0.0v 169.55n 5.0v 179.45n 5.0v 179.55n 5.0v 189.45n 5.0v 189.55n 5.0v 199.45n 5.0v 199.55n 5.0v 209.45n 5.0v 209.55n 0.0v 219.45n 0.0v 219.55n 0.0v 229.45n 0.0v 229.55n 0.0v 239.45n 0.0v 239.55n 5.0v 249.45n 5.0v 249.55n 5.0v 259.45n 5.0v 259.55n 0.0v 269.45n 0.0v 269.55n 0.0v 279.45n 0.0v 279.55n 5.0v 289.45n 5.0v 289.55n 0.0v 299.45n 0.0v 299.55n 5.0v 309.45n 5.0v 309.55n 5.0v 319.45n 5.0v 319.55n 5.0v 329.45n 5.0v 329.55n 5.0v 339.45n 5.0v 339.55n 5.0v 349.45n 5.0v 349.55n 5.0v 359.45n 5.0v 359.55n 0.0v 369.45n 0.0v 369.55n 0.0v 379.45n 0.0v 379.55n 5.0v 389.45n 5.0v 389.55n 5.0v 399.45n 5.0v 399.55n 5.0v 409.45n 5.0v 409.55n 5.0v 419.45n 5.0v 419.55n 5.0v 429.45n 5.0v 429.55n 5.0v 439.45n 5.0v 439.55n 5.0v 449.45n 5.0v 449.55n 0.0v 459.45n 0.0v 459.55n 0.0v 469.45n 0.0v 469.55n 0.0v 479.45n 0.0v 479.55n 0.0v 489.45n 0.0v 489.55n 0.0v 499.45n 0.0v 499.55n 0.0v 509.45n 0.0v 509.55n 5.0v 519.45n 5.0v 519.55n 0.0v 529.45n 0.0v 529.55n 0.0v 539.45n 0.0v 539.55n 0.0v 549.45n 0.0v 549.55n 0.0v 559.45n 0.0v 559.55n 0.0v 569.45n 0.0v 569.55n 5.0v 579.45n 5.0v 579.55n 0.0v 589.45n 0.0v 589.55n 5.0v 599.45n 5.0v 599.55n 5.0v 609.45n 5.0v 609.55n 0.0v 619.45n 0.0v 619.55n 0.0v 629.45n 0.0v 629.55n 5.0v 639.45n 5.0v 639.55n 5.0v 649.45n 5.0v 649.55n 0.0v 659.45n 0.0v 659.55n 0.0v 669.45n 0.0v 669.55n 5.0v 679.45n 5.0v 679.55n 0.0v 689.45n 0.0v 689.55n 5.0v 699.45n 5.0v 699.55n 5.0v 709.45n 5.0v 709.55n 0.0v 719.45n 0.0v 719.55n 5.0v 729.45n 5.0v 729.55n 5.0v 739.45n 5.0v 739.55n 5.0v 749.45n 5.0v 749.55n 5.0v 759.45n 5.0v 759.55n 5.0v 769.45n 5.0v 769.55n 5.0v 779.45n 5.0v 779.55n 0.0v 789.45n 0.0v 789.55n 5.0v 799.45n 5.0v 799.55n 5.0v 809.45n 5.0v 809.55n 0.0v 819.45n 0.0v 819.55n 5.0v 829.45n 5.0v 829.55n 0.0v 839.45n 0.0v 839.55n 0.0v 849.45n 0.0v 849.55n 5.0v 859.45n 5.0v 859.55n 0.0v 869.45n 0.0v 869.55n 0.0v 879.45n 0.0v 879.55n 0.0v 889.45n 0.0v 889.55n 5.0v 899.45n 5.0v 899.55n 0.0v 909.45n 0.0v 909.55n 5.0v 919.45n 5.0v 919.55n 5.0v 929.45n 5.0v 929.55n 0.0v 939.45n 0.0v 939.55n 0.0v 949.45n 0.0v 949.55n 0.0v 959.45n 0.0v 959.55n 5.0v 969.45n 5.0v 969.55n 5.0v 979.45n 5.0v 979.55n 5.0v 989.45n 5.0v 989.55n 5.0v 999.45n 5.0v 999.55n 5.0v 1009.45n 5.0v 1009.55n 5.0v 1019.45n 5.0v 1019.55n 5.0v 1029.45n 5.0v 1029.55n 0.0v 1039.45n 0.0v 1039.55n 0.0v 1049.45n 0.0v 1049.55n 5.0v 1059.45n 5.0v 1059.55n 5.0v 1069.45n 5.0v 1069.55n 0.0v 1079.45n 0.0v 1079.55n 0.0v 1089.45n 0.0v 1089.55n 5.0v 1099.45n 5.0v 1099.55n 0.0v 1109.45n 0.0v 1109.55n 5.0v 1119.45n 5.0v 1119.55n 0.0v 1129.45n 0.0v 1129.55n 0.0v 1139.45n 0.0v 1139.55n 5.0v 1149.45n 5.0v 1149.55n 5.0v 1159.45n 5.0v 1159.55n 0.0v 1169.45n 0.0v 1169.55n 0.0v 1179.45n 0.0v 1179.55n 5.0v 1189.45n 5.0v 1189.55n 0.0v 1199.45n 0.0v 1199.55n 0.0v 1209.45n 0.0v 1209.55n 0.0v 1219.45n 0.0v 1219.55n 5.0v 1229.45n 5.0v 1229.55n 5.0v 1239.45n 5.0v 1239.55n 0.0v 1249.45n 0.0v 1249.55n 0.0v 1259.45n 0.0v 1259.55n 5.0v 1269.45n 5.0v 1269.55n 0.0v 1279.45n 0.0v 1279.55n 5.0v 1289.45n 5.0v 1289.55n 5.0v 1299.45n 5.0v 1299.55n 5.0v 1309.45n 5.0v 1309.55n 5.0v 1319.45n 5.0v 1319.55n 0.0v 1329.45n 0.0v 1329.55n 0.0v 1339.45n 0.0v 1339.55n 0.0v 1349.45n 0.0v 1349.55n 0.0v 1359.45n 0.0v 1359.55n 0.0v 1369.45n 0.0v 1369.55n 0.0v 1379.45n 0.0v 1379.55n 5.0v 1389.45n 5.0v 1389.55n 5.0v 1399.45n 5.0v 1399.55n 0.0v 1409.45n 0.0v 1409.55n 0.0v 1419.45n 0.0v 1419.55n 0.0v 1429.45n 0.0v 1429.55n 0.0v 1439.45n 0.0v 1439.55n 0.0v 1449.45n 0.0v 1449.55n 0.0v 1459.45n 0.0v 1459.55n 5.0v 1469.45n 5.0v 1469.55n 0.0v 1479.45n 0.0v 1479.55n 0.0v 1489.45n 0.0v 1489.55n 0.0v 1499.45n 0.0v 1499.55n 5.0v 1509.45n 5.0v 1509.55n 5.0v 1519.45n 5.0v 1519.55n 5.0v 1529.45n 5.0v 1529.55n 5.0v 1539.45n 5.0v 1539.55n 5.0v 1549.45n 5.0v 1549.55n 5.0v 1559.45n 5.0v 1559.55n 5.0v 1569.45n 5.0v 1569.55n 5.0v 1579.45n 5.0v 1579.55n 5.0v 1589.45n 5.0v 1589.55n 5.0v 1599.45n 5.0v 1599.55n 5.0v 1609.45n 5.0v 1609.55n 5.0v 1619.45n 5.0v 1619.55n 0.0v 1629.45n 0.0v 1629.55n 0.0v 1639.45n 0.0v 1639.55n 0.0v 1649.45n 0.0v 1649.55n 0.0v 1659.45n 0.0v 1659.55n 0.0v 1669.45n 0.0v 1669.55n 0.0v 1679.45n 0.0v 1679.55n 0.0v 1689.45n 0.0v 1689.55n 5.0v 1699.45n 5.0v 1699.55n 5.0v 1709.45n 5.0v 1709.55n 5.0v 1719.45n 5.0v 1719.55n 5.0v 1729.45n 5.0v 1729.55n 5.0v 1739.45n 5.0v 1739.55n 5.0v 1749.45n 5.0v 1749.55n 5.0v 1759.45n 5.0v 1759.55n 0.0v 1769.45n 0.0v 1769.55n 0.0v 1779.45n 0.0v 1779.55n 0.0v 1789.45n 0.0v 1789.55n 0.0v 1799.45n 0.0v 1799.55n 0.0v 1809.45n 0.0v 1809.55n 0.0v 1819.45n 0.0v 1819.55n 0.0v 1829.45n 0.0v 1829.55n 0.0v 1839.45n 0.0v 1839.55n 0.0v 1849.45n 0.0v 1849.55n 5.0v 1859.45n 5.0v 1859.55n 0.0v 1869.45n 0.0v 1869.55n 5.0v 1879.45n 5.0v 1879.55n 5.0v 1889.45n 5.0v 1889.55n 0.0v 1899.45n 0.0v 1899.55n 5.0v 1909.45n 5.0v 1909.55n 5.0v 1919.45n 5.0v 1919.55n 5.0v 1929.45n 5.0v 1929.55n 0.0v 1939.45n 0.0v 1939.55n 5.0v 1949.45n 5.0v 1949.55n 0.0v 1959.45n 0.0v 1959.55n 5.0v 1969.45n 5.0v 1969.55n 5.0v 1979.45n 5.0v 1979.55n 0.0v 1989.45n 0.0v 1989.55n 0.0v 1999.45n 0.0v 1999.55n 5.0v 2009.45n 5.0v 2009.55n 0.0v 2019.45n 0.0v 2019.55n 0.0v 2029.45n 0.0v 2029.55n 5.0v 2039.45n 5.0v 2039.55n 5.0v 2049.45n 5.0v 2049.55n 5.0v )

 * Generation of control signals
* (time, data): [(0, 1), (10, 0), (20, 0), (30, 0), (40, 0), (50, 0), (60, 0), (70, 0), (80, 0), (90, 1), (100, 0), (110, 1), (120, 0), (130, 0), (140, 1), (150, 0), (160, 0), (170, 0), (180, 0), (190, 1), (200, 1), (210, 0), (220, 0), (230, 1), (240, 0), (250, 0), (260, 0), (270, 0), (280, 0), (290, 0), (300, 0), (310, 1), (320, 0), (330, 1), (340, 1), (350, 1), (360, 0), (370, 0), (380, 0), (390, 0), (400, 0), (410, 0), (420, 0), (430, 0), (440, 0), (450, 0), (460, 1), (470, 0), (480, 0), (490, 0), (500, 1), (510, 0), (520, 0), (530, 0), (540, 0), (550, 1), (560, 0), (570, 0), (580, 0), (590, 0), (600, 0), (610, 0), (620, 0), (630, 0), (640, 0), (650, 0), (660, 0), (670, 0), (680, 0), (690, 0), (700, 1), (710, 0), (720, 0), (730, 1), (740, 0), (750, 0), (760, 0), (770, 0), (780, 0), (790, 0), (800, 0), (810, 0), (820, 0), (830, 0), (840, 0), (850, 0), (860, 0), (870, 1), (880, 1), (890, 0), (900, 0), (910, 0), (920, 1), (930, 0), (940, 1), (950, 0), (960, 0), (970, 0), (980, 0), (990, 0), (1000, 0), (1010, 0), (1020, 0), (1030, 0), (1040, 0), (1050, 0), (1060, 0), (1070, 0), (1080, 0), (1090, 0), (1100, 0), (1110, 0), (1120, 0), (1130, 1), (1140, 0), (1150, 0), (1160, 0), (1170, 1), (1180, 0), (1190, 0), (1200, 0), (1210, 1), (1220, 0), (1230, 0), (1240, 0), (1250, 0), (1260, 0), (1270, 0), (1280, 0), (1290, 0), (1300, 0), (1310, 0), (1320, 0), (1330, 0), (1340, 1), (1350, 0), (1360, 1), (1370, 0), (1380, 0), (1390, 0), (1400, 0), (1410, 1), (1420, 1), (1430, 1), (1440, 0), (1450, 0), (1460, 0), (1470, 0), (1480, 0), (1490, 0), (1500, 0), (1510, 0), (1520, 0), (1530, 0), (1540, 0), (1550, 0), (1560, 0), (1570, 1), (1580, 0), (1590, 0), (1600, 0), (1610, 1), (1620, 0), (1630, 0), (1640, 0), (1650, 1), (1660, 0), (1670, 0), (1680, 0), (1690, 0), (1700, 1), (1710, 0), (1720, 0), (1730, 0), (1740, 0), (1750, 1), (1760, 0), (1770, 0), (1780, 0), (1790, 0), (1800, 1), (1810, 0), (1820, 0), (1830, 0), (1840, 0), (1850, 0), (1860, 0), (1870, 0), (1880, 0), (1890, 0), (1900, 0), (1910, 1), (1920, 1), (1930, 0), (1940, 0), (1950, 0), (1960, 0), (1970, 0), (1980, 0), (1990, 0), (2000, 0), (2010, 0), (2020, 1), (2030, 0), (2040, 0), (2050, 1)]
VCSB0 CSB0 0 PWL (0n 5.0v 9.45n 5.0v 9.55n 0.0v 19.45n 0.0v 19.55n 0.0v 29.45n 0.0v 29.55n 0.0v 39.45n 0.0v 39.55n 0.0v 49.45n 0.0v 49.55n 0.0v 59.45n 0.0v 59.55n 0.0v 69.45n 0.0v 69.55n 0.0v 79.45n 0.0v 79.55n 0.0v 89.45n 0.0v 89.55n 5.0v 99.45n 5.0v 99.55n 0.0v 109.45n 0.0v 109.55n 5.0v 119.45n 5.0v 119.55n 0.0v 129.45n 0.0v 129.55n 0.0v 139.45n 0.0v 139.55n 5.0v 149.45n 5.0v 149.55n 0.0v 159.45n 0.0v 159.55n 0.0v 169.45n 0.0v 169.55n 0.0v 179.45n 0.0v 179.55n 0.0v 189.45n 0.0v 189.55n 5.0v 199.45n 5.0v 199.55n 5.0v 209.45n 5.0v 209.55n 0.0v 219.45n 0.0v 219.55n 0.0v 229.45n 0.0v 229.55n 5.0v 239.45n 5.0v 239.55n 0.0v 249.45n 0.0v 249.55n 0.0v 259.45n 0.0v 259.55n 0.0v 269.45n 0.0v 269.55n 0.0v 279.45n 0.0v 279.55n 0.0v 289.45n 0.0v 289.55n 0.0v 299.45n 0.0v 299.55n 0.0v 309.45n 0.0v 309.55n 5.0v 319.45n 5.0v 319.55n 0.0v 329.45n 0.0v 329.55n 5.0v 339.45n 5.0v 339.55n 5.0v 349.45n 5.0v 349.55n 5.0v 359.45n 5.0v 359.55n 0.0v 369.45n 0.0v 369.55n 0.0v 379.45n 0.0v 379.55n 0.0v 389.45n 0.0v 389.55n 0.0v 399.45n 0.0v 399.55n 0.0v 409.45n 0.0v 409.55n 0.0v 419.45n 0.0v 419.55n 0.0v 429.45n 0.0v 429.55n 0.0v 439.45n 0.0v 439.55n 0.0v 449.45n 0.0v 449.55n 0.0v 459.45n 0.0v 459.55n 5.0v 469.45n 5.0v 469.55n 0.0v 479.45n 0.0v 479.55n 0.0v 489.45n 0.0v 489.55n 0.0v 499.45n 0.0v 499.55n 5.0v 509.45n 5.0v 509.55n 0.0v 519.45n 0.0v 519.55n 0.0v 529.45n 0.0v 529.55n 0.0v 539.45n 0.0v 539.55n 0.0v 549.45n 0.0v 549.55n 5.0v 559.45n 5.0v 559.55n 0.0v 569.45n 0.0v 569.55n 0.0v 579.45n 0.0v 579.55n 0.0v 589.45n 0.0v 589.55n 0.0v 599.45n 0.0v 599.55n 0.0v 609.45n 0.0v 609.55n 0.0v 619.45n 0.0v 619.55n 0.0v 629.45n 0.0v 629.55n 0.0v 639.45n 0.0v 639.55n 0.0v 649.45n 0.0v 649.55n 0.0v 659.45n 0.0v 659.55n 0.0v 669.45n 0.0v 669.55n 0.0v 679.45n 0.0v 679.55n 0.0v 689.45n 0.0v 689.55n 0.0v 699.45n 0.0v 699.55n 5.0v 709.45n 5.0v 709.55n 0.0v 719.45n 0.0v 719.55n 0.0v 729.45n 0.0v 729.55n 5.0v 739.45n 5.0v 739.55n 0.0v 749.45n 0.0v 749.55n 0.0v 759.45n 0.0v 759.55n 0.0v 769.45n 0.0v 769.55n 0.0v 779.45n 0.0v 779.55n 0.0v 789.45n 0.0v 789.55n 0.0v 799.45n 0.0v 799.55n 0.0v 809.45n 0.0v 809.55n 0.0v 819.45n 0.0v 819.55n 0.0v 829.45n 0.0v 829.55n 0.0v 839.45n 0.0v 839.55n 0.0v 849.45n 0.0v 849.55n 0.0v 859.45n 0.0v 859.55n 0.0v 869.45n 0.0v 869.55n 5.0v 879.45n 5.0v 879.55n 5.0v 889.45n 5.0v 889.55n 0.0v 899.45n 0.0v 899.55n 0.0v 909.45n 0.0v 909.55n 0.0v 919.45n 0.0v 919.55n 5.0v 929.45n 5.0v 929.55n 0.0v 939.45n 0.0v 939.55n 5.0v 949.45n 5.0v 949.55n 0.0v 959.45n 0.0v 959.55n 0.0v 969.45n 0.0v 969.55n 0.0v 979.45n 0.0v 979.55n 0.0v 989.45n 0.0v 989.55n 0.0v 999.45n 0.0v 999.55n 0.0v 1009.45n 0.0v 1009.55n 0.0v 1019.45n 0.0v 1019.55n 0.0v 1029.45n 0.0v 1029.55n 0.0v 1039.45n 0.0v 1039.55n 0.0v 1049.45n 0.0v 1049.55n 0.0v 1059.45n 0.0v 1059.55n 0.0v 1069.45n 0.0v 1069.55n 0.0v 1079.45n 0.0v 1079.55n 0.0v 1089.45n 0.0v 1089.55n 0.0v 1099.45n 0.0v 1099.55n 0.0v 1109.45n 0.0v 1109.55n 0.0v 1119.45n 0.0v 1119.55n 0.0v 1129.45n 0.0v 1129.55n 5.0v 1139.45n 5.0v 1139.55n 0.0v 1149.45n 0.0v 1149.55n 0.0v 1159.45n 0.0v 1159.55n 0.0v 1169.45n 0.0v 1169.55n 5.0v 1179.45n 5.0v 1179.55n 0.0v 1189.45n 0.0v 1189.55n 0.0v 1199.45n 0.0v 1199.55n 0.0v 1209.45n 0.0v 1209.55n 5.0v 1219.45n 5.0v 1219.55n 0.0v 1229.45n 0.0v 1229.55n 0.0v 1239.45n 0.0v 1239.55n 0.0v 1249.45n 0.0v 1249.55n 0.0v 1259.45n 0.0v 1259.55n 0.0v 1269.45n 0.0v 1269.55n 0.0v 1279.45n 0.0v 1279.55n 0.0v 1289.45n 0.0v 1289.55n 0.0v 1299.45n 0.0v 1299.55n 0.0v 1309.45n 0.0v 1309.55n 0.0v 1319.45n 0.0v 1319.55n 0.0v 1329.45n 0.0v 1329.55n 0.0v 1339.45n 0.0v 1339.55n 5.0v 1349.45n 5.0v 1349.55n 0.0v 1359.45n 0.0v 1359.55n 5.0v 1369.45n 5.0v 1369.55n 0.0v 1379.45n 0.0v 1379.55n 0.0v 1389.45n 0.0v 1389.55n 0.0v 1399.45n 0.0v 1399.55n 0.0v 1409.45n 0.0v 1409.55n 5.0v 1419.45n 5.0v 1419.55n 5.0v 1429.45n 5.0v 1429.55n 5.0v 1439.45n 5.0v 1439.55n 0.0v 1449.45n 0.0v 1449.55n 0.0v 1459.45n 0.0v 1459.55n 0.0v 1469.45n 0.0v 1469.55n 0.0v 1479.45n 0.0v 1479.55n 0.0v 1489.45n 0.0v 1489.55n 0.0v 1499.45n 0.0v 1499.55n 0.0v 1509.45n 0.0v 1509.55n 0.0v 1519.45n 0.0v 1519.55n 0.0v 1529.45n 0.0v 1529.55n 0.0v 1539.45n 0.0v 1539.55n 0.0v 1549.45n 0.0v 1549.55n 0.0v 1559.45n 0.0v 1559.55n 0.0v 1569.45n 0.0v 1569.55n 5.0v 1579.45n 5.0v 1579.55n 0.0v 1589.45n 0.0v 1589.55n 0.0v 1599.45n 0.0v 1599.55n 0.0v 1609.45n 0.0v 1609.55n 5.0v 1619.45n 5.0v 1619.55n 0.0v 1629.45n 0.0v 1629.55n 0.0v 1639.45n 0.0v 1639.55n 0.0v 1649.45n 0.0v 1649.55n 5.0v 1659.45n 5.0v 1659.55n 0.0v 1669.45n 0.0v 1669.55n 0.0v 1679.45n 0.0v 1679.55n 0.0v 1689.45n 0.0v 1689.55n 0.0v 1699.45n 0.0v 1699.55n 5.0v 1709.45n 5.0v 1709.55n 0.0v 1719.45n 0.0v 1719.55n 0.0v 1729.45n 0.0v 1729.55n 0.0v 1739.45n 0.0v 1739.55n 0.0v 1749.45n 0.0v 1749.55n 5.0v 1759.45n 5.0v 1759.55n 0.0v 1769.45n 0.0v 1769.55n 0.0v 1779.45n 0.0v 1779.55n 0.0v 1789.45n 0.0v 1789.55n 0.0v 1799.45n 0.0v 1799.55n 5.0v 1809.45n 5.0v 1809.55n 0.0v 1819.45n 0.0v 1819.55n 0.0v 1829.45n 0.0v 1829.55n 0.0v 1839.45n 0.0v 1839.55n 0.0v 1849.45n 0.0v 1849.55n 0.0v 1859.45n 0.0v 1859.55n 0.0v 1869.45n 0.0v 1869.55n 0.0v 1879.45n 0.0v 1879.55n 0.0v 1889.45n 0.0v 1889.55n 0.0v 1899.45n 0.0v 1899.55n 0.0v 1909.45n 0.0v 1909.55n 5.0v 1919.45n 5.0v 1919.55n 5.0v 1929.45n 5.0v 1929.55n 0.0v 1939.45n 0.0v 1939.55n 0.0v 1949.45n 0.0v 1949.55n 0.0v 1959.45n 0.0v 1959.55n 0.0v 1969.45n 0.0v 1969.55n 0.0v 1979.45n 0.0v 1979.55n 0.0v 1989.45n 0.0v 1989.55n 0.0v 1999.45n 0.0v 1999.55n 0.0v 2009.45n 0.0v 2009.55n 0.0v 2019.45n 0.0v 2019.55n 5.0v 2029.45n 5.0v 2029.55n 0.0v 2039.45n 0.0v 2039.55n 0.0v 2049.45n 0.0v 2049.55n 5.0v )
* (time, data): [(0, 1), (10, 0), (20, 0), (30, 0), (40, 1), (50, 0), (60, 0), (70, 0), (80, 0), (90, 1), (100, 1), (110, 1), (120, 1), (130, 0), (140, 1), (150, 0), (160, 0), (170, 0), (180, 1), (190, 1), (200, 1), (210, 1), (220, 0), (230, 1), (240, 1), (250, 0), (260, 1), (270, 1), (280, 0), (290, 1), (300, 0), (310, 1), (320, 1), (330, 1), (340, 1), (350, 1), (360, 1), (370, 1), (380, 1), (390, 0), (400, 0), (410, 0), (420, 0), (430, 0), (440, 1), (450, 0), (460, 1), (470, 0), (480, 0), (490, 0), (500, 1), (510, 0), (520, 1), (530, 0), (540, 0), (550, 1), (560, 1), (570, 1), (580, 1), (590, 0), (600, 0), (610, 0), (620, 1), (630, 1), (640, 0), (650, 1), (660, 0), (670, 0), (680, 0), (690, 1), (700, 1), (710, 1), (720, 0), (730, 1), (740, 0), (750, 0), (760, 0), (770, 1), (780, 0), (790, 1), (800, 1), (810, 1), (820, 0), (830, 1), (840, 1), (850, 0), (860, 1), (870, 1), (880, 1), (890, 1), (900, 1), (910, 0), (920, 1), (930, 1), (940, 1), (950, 0), (960, 1), (970, 0), (980, 1), (990, 1), (1000, 0), (1010, 1), (1020, 0), (1030, 1), (1040, 1), (1050, 1), (1060, 1), (1070, 0), (1080, 0), (1090, 0), (1100, 1), (1110, 0), (1120, 0), (1130, 1), (1140, 1), (1150, 0), (1160, 0), (1170, 1), (1180, 1), (1190, 0), (1200, 0), (1210, 1), (1220, 0), (1230, 0), (1240, 1), (1250, 1), (1260, 1), (1270, 0), (1280, 0), (1290, 1), (1300, 0), (1310, 0), (1320, 0), (1330, 0), (1340, 1), (1350, 1), (1360, 1), (1370, 1), (1380, 0), (1390, 0), (1400, 1), (1410, 1), (1420, 1), (1430, 1), (1440, 0), (1450, 1), (1460, 1), (1470, 1), (1480, 0), (1490, 1), (1500, 0), (1510, 0), (1520, 0), (1530, 0), (1540, 0), (1550, 0), (1560, 0), (1570, 1), (1580, 1), (1590, 0), (1600, 1), (1610, 1), (1620, 1), (1630, 1), (1640, 0), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 1), (1700, 1), (1710, 1), (1720, 0), (1730, 0), (1740, 1), (1750, 1), (1760, 0), (1770, 0), (1780, 0), (1790, 0), (1800, 1), (1810, 0), (1820, 1), (1830, 1), (1840, 0), (1850, 0), (1860, 0), (1870, 1), (1880, 0), (1890, 0), (1900, 1), (1910, 1), (1920, 1), (1930, 0), (1940, 1), (1950, 1), (1960, 1), (1970, 0), (1980, 0), (1990, 1), (2000, 1), (2010, 1), (2020, 1), (2030, 0), (2040, 1), (2050, 1)]
VWEB0 WEB0 0 PWL (0n 5.0v 9.45n 5.0v 9.55n 0.0v 19.45n 0.0v 19.55n 0.0v 29.45n 0.0v 29.55n 0.0v 39.45n 0.0v 39.55n 5.0v 49.45n 5.0v 49.55n 0.0v 59.45n 0.0v 59.55n 0.0v 69.45n 0.0v 69.55n 0.0v 79.45n 0.0v 79.55n 0.0v 89.45n 0.0v 89.55n 5.0v 99.45n 5.0v 99.55n 5.0v 109.45n 5.0v 109.55n 5.0v 119.45n 5.0v 119.55n 5.0v 129.45n 5.0v 129.55n 0.0v 139.45n 0.0v 139.55n 5.0v 149.45n 5.0v 149.55n 0.0v 159.45n 0.0v 159.55n 0.0v 169.45n 0.0v 169.55n 0.0v 179.45n 0.0v 179.55n 5.0v 189.45n 5.0v 189.55n 5.0v 199.45n 5.0v 199.55n 5.0v 209.45n 5.0v 209.55n 5.0v 219.45n 5.0v 219.55n 0.0v 229.45n 0.0v 229.55n 5.0v 239.45n 5.0v 239.55n 5.0v 249.45n 5.0v 249.55n 0.0v 259.45n 0.0v 259.55n 5.0v 269.45n 5.0v 269.55n 5.0v 279.45n 5.0v 279.55n 0.0v 289.45n 0.0v 289.55n 5.0v 299.45n 5.0v 299.55n 0.0v 309.45n 0.0v 309.55n 5.0v 319.45n 5.0v 319.55n 5.0v 329.45n 5.0v 329.55n 5.0v 339.45n 5.0v 339.55n 5.0v 349.45n 5.0v 349.55n 5.0v 359.45n 5.0v 359.55n 5.0v 369.45n 5.0v 369.55n 5.0v 379.45n 5.0v 379.55n 5.0v 389.45n 5.0v 389.55n 0.0v 399.45n 0.0v 399.55n 0.0v 409.45n 0.0v 409.55n 0.0v 419.45n 0.0v 419.55n 0.0v 429.45n 0.0v 429.55n 0.0v 439.45n 0.0v 439.55n 5.0v 449.45n 5.0v 449.55n 0.0v 459.45n 0.0v 459.55n 5.0v 469.45n 5.0v 469.55n 0.0v 479.45n 0.0v 479.55n 0.0v 489.45n 0.0v 489.55n 0.0v 499.45n 0.0v 499.55n 5.0v 509.45n 5.0v 509.55n 0.0v 519.45n 0.0v 519.55n 5.0v 529.45n 5.0v 529.55n 0.0v 539.45n 0.0v 539.55n 0.0v 549.45n 0.0v 549.55n 5.0v 559.45n 5.0v 559.55n 5.0v 569.45n 5.0v 569.55n 5.0v 579.45n 5.0v 579.55n 5.0v 589.45n 5.0v 589.55n 0.0v 599.45n 0.0v 599.55n 0.0v 609.45n 0.0v 609.55n 0.0v 619.45n 0.0v 619.55n 5.0v 629.45n 5.0v 629.55n 5.0v 639.45n 5.0v 639.55n 0.0v 649.45n 0.0v 649.55n 5.0v 659.45n 5.0v 659.55n 0.0v 669.45n 0.0v 669.55n 0.0v 679.45n 0.0v 679.55n 0.0v 689.45n 0.0v 689.55n 5.0v 699.45n 5.0v 699.55n 5.0v 709.45n 5.0v 709.55n 5.0v 719.45n 5.0v 719.55n 0.0v 729.45n 0.0v 729.55n 5.0v 739.45n 5.0v 739.55n 0.0v 749.45n 0.0v 749.55n 0.0v 759.45n 0.0v 759.55n 0.0v 769.45n 0.0v 769.55n 5.0v 779.45n 5.0v 779.55n 0.0v 789.45n 0.0v 789.55n 5.0v 799.45n 5.0v 799.55n 5.0v 809.45n 5.0v 809.55n 5.0v 819.45n 5.0v 819.55n 0.0v 829.45n 0.0v 829.55n 5.0v 839.45n 5.0v 839.55n 5.0v 849.45n 5.0v 849.55n 0.0v 859.45n 0.0v 859.55n 5.0v 869.45n 5.0v 869.55n 5.0v 879.45n 5.0v 879.55n 5.0v 889.45n 5.0v 889.55n 5.0v 899.45n 5.0v 899.55n 5.0v 909.45n 5.0v 909.55n 0.0v 919.45n 0.0v 919.55n 5.0v 929.45n 5.0v 929.55n 5.0v 939.45n 5.0v 939.55n 5.0v 949.45n 5.0v 949.55n 0.0v 959.45n 0.0v 959.55n 5.0v 969.45n 5.0v 969.55n 0.0v 979.45n 0.0v 979.55n 5.0v 989.45n 5.0v 989.55n 5.0v 999.45n 5.0v 999.55n 0.0v 1009.45n 0.0v 1009.55n 5.0v 1019.45n 5.0v 1019.55n 0.0v 1029.45n 0.0v 1029.55n 5.0v 1039.45n 5.0v 1039.55n 5.0v 1049.45n 5.0v 1049.55n 5.0v 1059.45n 5.0v 1059.55n 5.0v 1069.45n 5.0v 1069.55n 0.0v 1079.45n 0.0v 1079.55n 0.0v 1089.45n 0.0v 1089.55n 0.0v 1099.45n 0.0v 1099.55n 5.0v 1109.45n 5.0v 1109.55n 0.0v 1119.45n 0.0v 1119.55n 0.0v 1129.45n 0.0v 1129.55n 5.0v 1139.45n 5.0v 1139.55n 5.0v 1149.45n 5.0v 1149.55n 0.0v 1159.45n 0.0v 1159.55n 0.0v 1169.45n 0.0v 1169.55n 5.0v 1179.45n 5.0v 1179.55n 5.0v 1189.45n 5.0v 1189.55n 0.0v 1199.45n 0.0v 1199.55n 0.0v 1209.45n 0.0v 1209.55n 5.0v 1219.45n 5.0v 1219.55n 0.0v 1229.45n 0.0v 1229.55n 0.0v 1239.45n 0.0v 1239.55n 5.0v 1249.45n 5.0v 1249.55n 5.0v 1259.45n 5.0v 1259.55n 5.0v 1269.45n 5.0v 1269.55n 0.0v 1279.45n 0.0v 1279.55n 0.0v 1289.45n 0.0v 1289.55n 5.0v 1299.45n 5.0v 1299.55n 0.0v 1309.45n 0.0v 1309.55n 0.0v 1319.45n 0.0v 1319.55n 0.0v 1329.45n 0.0v 1329.55n 0.0v 1339.45n 0.0v 1339.55n 5.0v 1349.45n 5.0v 1349.55n 5.0v 1359.45n 5.0v 1359.55n 5.0v 1369.45n 5.0v 1369.55n 5.0v 1379.45n 5.0v 1379.55n 0.0v 1389.45n 0.0v 1389.55n 0.0v 1399.45n 0.0v 1399.55n 5.0v 1409.45n 5.0v 1409.55n 5.0v 1419.45n 5.0v 1419.55n 5.0v 1429.45n 5.0v 1429.55n 5.0v 1439.45n 5.0v 1439.55n 0.0v 1449.45n 0.0v 1449.55n 5.0v 1459.45n 5.0v 1459.55n 5.0v 1469.45n 5.0v 1469.55n 5.0v 1479.45n 5.0v 1479.55n 0.0v 1489.45n 0.0v 1489.55n 5.0v 1499.45n 5.0v 1499.55n 0.0v 1509.45n 0.0v 1509.55n 0.0v 1519.45n 0.0v 1519.55n 0.0v 1529.45n 0.0v 1529.55n 0.0v 1539.45n 0.0v 1539.55n 0.0v 1549.45n 0.0v 1549.55n 0.0v 1559.45n 0.0v 1559.55n 0.0v 1569.45n 0.0v 1569.55n 5.0v 1579.45n 5.0v 1579.55n 5.0v 1589.45n 5.0v 1589.55n 0.0v 1599.45n 0.0v 1599.55n 5.0v 1609.45n 5.0v 1609.55n 5.0v 1619.45n 5.0v 1619.55n 5.0v 1629.45n 5.0v 1629.55n 5.0v 1639.45n 5.0v 1639.55n 0.0v 1649.45n 0.0v 1649.55n 5.0v 1659.45n 5.0v 1659.55n 5.0v 1669.45n 5.0v 1669.55n 5.0v 1679.45n 5.0v 1679.55n 5.0v 1689.45n 5.0v 1689.55n 5.0v 1699.45n 5.0v 1699.55n 5.0v 1709.45n 5.0v 1709.55n 5.0v 1719.45n 5.0v 1719.55n 0.0v 1729.45n 0.0v 1729.55n 0.0v 1739.45n 0.0v 1739.55n 5.0v 1749.45n 5.0v 1749.55n 5.0v 1759.45n 5.0v 1759.55n 0.0v 1769.45n 0.0v 1769.55n 0.0v 1779.45n 0.0v 1779.55n 0.0v 1789.45n 0.0v 1789.55n 0.0v 1799.45n 0.0v 1799.55n 5.0v 1809.45n 5.0v 1809.55n 0.0v 1819.45n 0.0v 1819.55n 5.0v 1829.45n 5.0v 1829.55n 5.0v 1839.45n 5.0v 1839.55n 0.0v 1849.45n 0.0v 1849.55n 0.0v 1859.45n 0.0v 1859.55n 0.0v 1869.45n 0.0v 1869.55n 5.0v 1879.45n 5.0v 1879.55n 0.0v 1889.45n 0.0v 1889.55n 0.0v 1899.45n 0.0v 1899.55n 5.0v 1909.45n 5.0v 1909.55n 5.0v 1919.45n 5.0v 1919.55n 5.0v 1929.45n 5.0v 1929.55n 0.0v 1939.45n 0.0v 1939.55n 5.0v 1949.45n 5.0v 1949.55n 5.0v 1959.45n 5.0v 1959.55n 5.0v 1969.45n 5.0v 1969.55n 0.0v 1979.45n 0.0v 1979.55n 0.0v 1989.45n 0.0v 1989.55n 5.0v 1999.45n 5.0v 1999.55n 5.0v 2009.45n 5.0v 2009.55n 5.0v 2019.45n 5.0v 2019.55n 5.0v 2029.45n 5.0v 2029.55n 0.0v 2039.45n 0.0v 2039.55n 5.0v 2049.45n 5.0v 2049.55n 5.0v )

* Generation of wmask signals
* (time, data): [(0, 0), (10, 1), (20, 1), (30, 1), (40, 1), (50, 0), (60, 0), (70, 1), (80, 1), (90, 1), (100, 1), (110, 1), (120, 1), (130, 1), (140, 1), (150, 1), (160, 1), (170, 1), (180, 1), (190, 1), (200, 1), (210, 1), (220, 0), (230, 0), (240, 0), (250, 1), (260, 1), (270, 1), (280, 1), (290, 1), (300, 1), (310, 1), (320, 1), (330, 1), (340, 1), (350, 1), (360, 1), (370, 1), (380, 1), (390, 1), (400, 1), (410, 0), (420, 0), (430, 0), (440, 0), (450, 1), (460, 1), (470, 1), (480, 1), (490, 1), (500, 1), (510, 0), (520, 0), (530, 1), (540, 1), (550, 1), (560, 1), (570, 1), (580, 1), (590, 1), (600, 1), (610, 1), (620, 1), (630, 1), (640, 1), (650, 1), (660, 1), (670, 1), (680, 1), (690, 1), (700, 1), (710, 1), (720, 1), (730, 1), (740, 0), (750, 1), (760, 0), (770, 0), (780, 0), (790, 0), (800, 0), (810, 0), (820, 1), (830, 1), (840, 1), (850, 0), (860, 0), (870, 0), (880, 0), (890, 0), (900, 0), (910, 0), (920, 0), (930, 0), (940, 0), (950, 1), (960, 1), (970, 1), (980, 1), (990, 1), (1000, 1), (1010, 1), (1020, 1), (1030, 1), (1040, 1), (1050, 1), (1060, 1), (1070, 0), (1080, 1), (1090, 1), (1100, 1), (1110, 1), (1120, 0), (1130, 0), (1140, 0), (1150, 1), (1160, 1), (1170, 1), (1180, 1), (1190, 0), (1200, 1), (1210, 1), (1220, 0), (1230, 1), (1240, 1), (1250, 1), (1260, 1), (1270, 0), (1280, 1), (1290, 1), (1300, 0), (1310, 1), (1320, 1), (1330, 1), (1340, 1), (1350, 1), (1360, 1), (1370, 1), (1380, 1), (1390, 1), (1400, 1), (1410, 1), (1420, 1), (1430, 1), (1440, 1), (1450, 1), (1460, 1), (1470, 1), (1480, 0), (1490, 0), (1500, 1), (1510, 1), (1520, 1), (1530, 1), (1540, 1), (1550, 1), (1560, 1), (1570, 1), (1580, 1), (1590, 1), (1600, 1), (1610, 1), (1620, 1), (1630, 1), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 1), (1700, 1), (1710, 1), (1720, 1), (1730, 1), (1740, 1), (1750, 1), (1760, 1), (1770, 0), (1780, 1), (1790, 0), (1800, 0), (1810, 1), (1820, 1), (1830, 1), (1840, 1), (1850, 0), (1860, 0), (1870, 0), (1880, 1), (1890, 1), (1900, 1), (1910, 1), (1920, 1), (1930, 1), (1940, 1), (1950, 1), (1960, 1), (1970, 1), (1980, 1), (1990, 1), (2000, 1), (2010, 1), (2020, 1), (2030, 0), (2040, 0), (2050, 0)]
VWMASK0_0  WMASK0_0  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 5.0v 19.45n 5.0v 19.55n 5.0v 29.45n 5.0v 29.55n 5.0v 39.45n 5.0v 39.55n 5.0v 49.45n 5.0v 49.55n 0.0v 59.45n 0.0v 59.55n 0.0v 69.45n 0.0v 69.55n 5.0v 79.45n 5.0v 79.55n 5.0v 89.45n 5.0v 89.55n 5.0v 99.45n 5.0v 99.55n 5.0v 109.45n 5.0v 109.55n 5.0v 119.45n 5.0v 119.55n 5.0v 129.45n 5.0v 129.55n 5.0v 139.45n 5.0v 139.55n 5.0v 149.45n 5.0v 149.55n 5.0v 159.45n 5.0v 159.55n 5.0v 169.45n 5.0v 169.55n 5.0v 179.45n 5.0v 179.55n 5.0v 189.45n 5.0v 189.55n 5.0v 199.45n 5.0v 199.55n 5.0v 209.45n 5.0v 209.55n 5.0v 219.45n 5.0v 219.55n 0.0v 229.45n 0.0v 229.55n 0.0v 239.45n 0.0v 239.55n 0.0v 249.45n 0.0v 249.55n 5.0v 259.45n 5.0v 259.55n 5.0v 269.45n 5.0v 269.55n 5.0v 279.45n 5.0v 279.55n 5.0v 289.45n 5.0v 289.55n 5.0v 299.45n 5.0v 299.55n 5.0v 309.45n 5.0v 309.55n 5.0v 319.45n 5.0v 319.55n 5.0v 329.45n 5.0v 329.55n 5.0v 339.45n 5.0v 339.55n 5.0v 349.45n 5.0v 349.55n 5.0v 359.45n 5.0v 359.55n 5.0v 369.45n 5.0v 369.55n 5.0v 379.45n 5.0v 379.55n 5.0v 389.45n 5.0v 389.55n 5.0v 399.45n 5.0v 399.55n 5.0v 409.45n 5.0v 409.55n 0.0v 419.45n 0.0v 419.55n 0.0v 429.45n 0.0v 429.55n 0.0v 439.45n 0.0v 439.55n 0.0v 449.45n 0.0v 449.55n 5.0v 459.45n 5.0v 459.55n 5.0v 469.45n 5.0v 469.55n 5.0v 479.45n 5.0v 479.55n 5.0v 489.45n 5.0v 489.55n 5.0v 499.45n 5.0v 499.55n 5.0v 509.45n 5.0v 509.55n 0.0v 519.45n 0.0v 519.55n 0.0v 529.45n 0.0v 529.55n 5.0v 539.45n 5.0v 539.55n 5.0v 549.45n 5.0v 549.55n 5.0v 559.45n 5.0v 559.55n 5.0v 569.45n 5.0v 569.55n 5.0v 579.45n 5.0v 579.55n 5.0v 589.45n 5.0v 589.55n 5.0v 599.45n 5.0v 599.55n 5.0v 609.45n 5.0v 609.55n 5.0v 619.45n 5.0v 619.55n 5.0v 629.45n 5.0v 629.55n 5.0v 639.45n 5.0v 639.55n 5.0v 649.45n 5.0v 649.55n 5.0v 659.45n 5.0v 659.55n 5.0v 669.45n 5.0v 669.55n 5.0v 679.45n 5.0v 679.55n 5.0v 689.45n 5.0v 689.55n 5.0v 699.45n 5.0v 699.55n 5.0v 709.45n 5.0v 709.55n 5.0v 719.45n 5.0v 719.55n 5.0v 729.45n 5.0v 729.55n 5.0v 739.45n 5.0v 739.55n 0.0v 749.45n 0.0v 749.55n 5.0v 759.45n 5.0v 759.55n 0.0v 769.45n 0.0v 769.55n 0.0v 779.45n 0.0v 779.55n 0.0v 789.45n 0.0v 789.55n 0.0v 799.45n 0.0v 799.55n 0.0v 809.45n 0.0v 809.55n 0.0v 819.45n 0.0v 819.55n 5.0v 829.45n 5.0v 829.55n 5.0v 839.45n 5.0v 839.55n 5.0v 849.45n 5.0v 849.55n 0.0v 859.45n 0.0v 859.55n 0.0v 869.45n 0.0v 869.55n 0.0v 879.45n 0.0v 879.55n 0.0v 889.45n 0.0v 889.55n 0.0v 899.45n 0.0v 899.55n 0.0v 909.45n 0.0v 909.55n 0.0v 919.45n 0.0v 919.55n 0.0v 929.45n 0.0v 929.55n 0.0v 939.45n 0.0v 939.55n 0.0v 949.45n 0.0v 949.55n 5.0v 959.45n 5.0v 959.55n 5.0v 969.45n 5.0v 969.55n 5.0v 979.45n 5.0v 979.55n 5.0v 989.45n 5.0v 989.55n 5.0v 999.45n 5.0v 999.55n 5.0v 1009.45n 5.0v 1009.55n 5.0v 1019.45n 5.0v 1019.55n 5.0v 1029.45n 5.0v 1029.55n 5.0v 1039.45n 5.0v 1039.55n 5.0v 1049.45n 5.0v 1049.55n 5.0v 1059.45n 5.0v 1059.55n 5.0v 1069.45n 5.0v 1069.55n 0.0v 1079.45n 0.0v 1079.55n 5.0v 1089.45n 5.0v 1089.55n 5.0v 1099.45n 5.0v 1099.55n 5.0v 1109.45n 5.0v 1109.55n 5.0v 1119.45n 5.0v 1119.55n 0.0v 1129.45n 0.0v 1129.55n 0.0v 1139.45n 0.0v 1139.55n 0.0v 1149.45n 0.0v 1149.55n 5.0v 1159.45n 5.0v 1159.55n 5.0v 1169.45n 5.0v 1169.55n 5.0v 1179.45n 5.0v 1179.55n 5.0v 1189.45n 5.0v 1189.55n 0.0v 1199.45n 0.0v 1199.55n 5.0v 1209.45n 5.0v 1209.55n 5.0v 1219.45n 5.0v 1219.55n 0.0v 1229.45n 0.0v 1229.55n 5.0v 1239.45n 5.0v 1239.55n 5.0v 1249.45n 5.0v 1249.55n 5.0v 1259.45n 5.0v 1259.55n 5.0v 1269.45n 5.0v 1269.55n 0.0v 1279.45n 0.0v 1279.55n 5.0v 1289.45n 5.0v 1289.55n 5.0v 1299.45n 5.0v 1299.55n 0.0v 1309.45n 0.0v 1309.55n 5.0v 1319.45n 5.0v 1319.55n 5.0v 1329.45n 5.0v 1329.55n 5.0v 1339.45n 5.0v 1339.55n 5.0v 1349.45n 5.0v 1349.55n 5.0v 1359.45n 5.0v 1359.55n 5.0v 1369.45n 5.0v 1369.55n 5.0v 1379.45n 5.0v 1379.55n 5.0v 1389.45n 5.0v 1389.55n 5.0v 1399.45n 5.0v 1399.55n 5.0v 1409.45n 5.0v 1409.55n 5.0v 1419.45n 5.0v 1419.55n 5.0v 1429.45n 5.0v 1429.55n 5.0v 1439.45n 5.0v 1439.55n 5.0v 1449.45n 5.0v 1449.55n 5.0v 1459.45n 5.0v 1459.55n 5.0v 1469.45n 5.0v 1469.55n 5.0v 1479.45n 5.0v 1479.55n 0.0v 1489.45n 0.0v 1489.55n 0.0v 1499.45n 0.0v 1499.55n 5.0v 1509.45n 5.0v 1509.55n 5.0v 1519.45n 5.0v 1519.55n 5.0v 1529.45n 5.0v 1529.55n 5.0v 1539.45n 5.0v 1539.55n 5.0v 1549.45n 5.0v 1549.55n 5.0v 1559.45n 5.0v 1559.55n 5.0v 1569.45n 5.0v 1569.55n 5.0v 1579.45n 5.0v 1579.55n 5.0v 1589.45n 5.0v 1589.55n 5.0v 1599.45n 5.0v 1599.55n 5.0v 1609.45n 5.0v 1609.55n 5.0v 1619.45n 5.0v 1619.55n 5.0v 1629.45n 5.0v 1629.55n 5.0v 1639.45n 5.0v 1639.55n 5.0v 1649.45n 5.0v 1649.55n 5.0v 1659.45n 5.0v 1659.55n 5.0v 1669.45n 5.0v 1669.55n 5.0v 1679.45n 5.0v 1679.55n 5.0v 1689.45n 5.0v 1689.55n 5.0v 1699.45n 5.0v 1699.55n 5.0v 1709.45n 5.0v 1709.55n 5.0v 1719.45n 5.0v 1719.55n 5.0v 1729.45n 5.0v 1729.55n 5.0v 1739.45n 5.0v 1739.55n 5.0v 1749.45n 5.0v 1749.55n 5.0v 1759.45n 5.0v 1759.55n 5.0v 1769.45n 5.0v 1769.55n 0.0v 1779.45n 0.0v 1779.55n 5.0v 1789.45n 5.0v 1789.55n 0.0v 1799.45n 0.0v 1799.55n 0.0v 1809.45n 0.0v 1809.55n 5.0v 1819.45n 5.0v 1819.55n 5.0v 1829.45n 5.0v 1829.55n 5.0v 1839.45n 5.0v 1839.55n 5.0v 1849.45n 5.0v 1849.55n 0.0v 1859.45n 0.0v 1859.55n 0.0v 1869.45n 0.0v 1869.55n 0.0v 1879.45n 0.0v 1879.55n 5.0v 1889.45n 5.0v 1889.55n 5.0v 1899.45n 5.0v 1899.55n 5.0v 1909.45n 5.0v 1909.55n 5.0v 1919.45n 5.0v 1919.55n 5.0v 1929.45n 5.0v 1929.55n 5.0v 1939.45n 5.0v 1939.55n 5.0v 1949.45n 5.0v 1949.55n 5.0v 1959.45n 5.0v 1959.55n 5.0v 1969.45n 5.0v 1969.55n 5.0v 1979.45n 5.0v 1979.55n 5.0v 1989.45n 5.0v 1989.55n 5.0v 1999.45n 5.0v 1999.55n 5.0v 2009.45n 5.0v 2009.55n 5.0v 2019.45n 5.0v 2019.55n 5.0v 2029.45n 5.0v 2029.55n 0.0v 2039.45n 0.0v 2039.55n 0.0v 2049.45n 0.0v 2049.55n 0.0v )
* (time, data): [(0, 0), (10, 1), (20, 1), (30, 1), (40, 1), (50, 1), (60, 1), (70, 1), (80, 1), (90, 1), (100, 1), (110, 1), (120, 1), (130, 1), (140, 1), (150, 0), (160, 1), (170, 1), (180, 1), (190, 1), (200, 1), (210, 1), (220, 0), (230, 0), (240, 0), (250, 1), (260, 1), (270, 1), (280, 1), (290, 1), (300, 0), (310, 0), (320, 0), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 0), (390, 1), (400, 1), (410, 1), (420, 1), (430, 0), (440, 0), (450, 1), (460, 1), (470, 1), (480, 1), (490, 1), (500, 1), (510, 0), (520, 0), (530, 1), (540, 1), (550, 1), (560, 1), (570, 1), (580, 1), (590, 0), (600, 1), (610, 1), (620, 1), (630, 1), (640, 1), (650, 1), (660, 1), (670, 1), (680, 1), (690, 1), (700, 1), (710, 1), (720, 1), (730, 1), (740, 1), (750, 1), (760, 1), (770, 1), (780, 0), (790, 0), (800, 0), (810, 0), (820, 0), (830, 0), (840, 0), (850, 1), (860, 1), (870, 1), (880, 1), (890, 1), (900, 1), (910, 0), (920, 0), (930, 0), (940, 0), (950, 1), (960, 1), (970, 0), (980, 0), (990, 0), (1000, 1), (1010, 1), (1020, 1), (1030, 1), (1040, 1), (1050, 1), (1060, 1), (1070, 0), (1080, 1), (1090, 0), (1100, 0), (1110, 1), (1120, 0), (1130, 0), (1140, 0), (1150, 1), (1160, 1), (1170, 1), (1180, 1), (1190, 0), (1200, 1), (1210, 1), (1220, 0), (1230, 1), (1240, 1), (1250, 1), (1260, 1), (1270, 0), (1280, 1), (1290, 1), (1300, 0), (1310, 1), (1320, 1), (1330, 1), (1340, 1), (1350, 1), (1360, 1), (1370, 1), (1380, 1), (1390, 0), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 0), (1450, 0), (1460, 0), (1470, 0), (1480, 0), (1490, 0), (1500, 0), (1510, 1), (1520, 0), (1530, 1), (1540, 1), (1550, 1), (1560, 1), (1570, 1), (1580, 1), (1590, 1), (1600, 1), (1610, 1), (1620, 1), (1630, 1), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 1), (1700, 1), (1710, 1), (1720, 1), (1730, 1), (1740, 1), (1750, 1), (1760, 1), (1770, 0), (1780, 1), (1790, 1), (1800, 1), (1810, 1), (1820, 1), (1830, 1), (1840, 1), (1850, 0), (1860, 1), (1870, 1), (1880, 1), (1890, 1), (1900, 1), (1910, 1), (1920, 1), (1930, 1), (1940, 1), (1950, 1), (1960, 1), (1970, 1), (1980, 1), (1990, 1), (2000, 1), (2010, 1), (2020, 1), (2030, 1), (2040, 1), (2050, 1)]
VWMASK0_1  WMASK0_1  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 5.0v 19.45n 5.0v 19.55n 5.0v 29.45n 5.0v 29.55n 5.0v 39.45n 5.0v 39.55n 5.0v 49.45n 5.0v 49.55n 5.0v 59.45n 5.0v 59.55n 5.0v 69.45n 5.0v 69.55n 5.0v 79.45n 5.0v 79.55n 5.0v 89.45n 5.0v 89.55n 5.0v 99.45n 5.0v 99.55n 5.0v 109.45n 5.0v 109.55n 5.0v 119.45n 5.0v 119.55n 5.0v 129.45n 5.0v 129.55n 5.0v 139.45n 5.0v 139.55n 5.0v 149.45n 5.0v 149.55n 0.0v 159.45n 0.0v 159.55n 5.0v 169.45n 5.0v 169.55n 5.0v 179.45n 5.0v 179.55n 5.0v 189.45n 5.0v 189.55n 5.0v 199.45n 5.0v 199.55n 5.0v 209.45n 5.0v 209.55n 5.0v 219.45n 5.0v 219.55n 0.0v 229.45n 0.0v 229.55n 0.0v 239.45n 0.0v 239.55n 0.0v 249.45n 0.0v 249.55n 5.0v 259.45n 5.0v 259.55n 5.0v 269.45n 5.0v 269.55n 5.0v 279.45n 5.0v 279.55n 5.0v 289.45n 5.0v 289.55n 5.0v 299.45n 5.0v 299.55n 0.0v 309.45n 0.0v 309.55n 0.0v 319.45n 0.0v 319.55n 0.0v 329.45n 0.0v 329.55n 0.0v 339.45n 0.0v 339.55n 0.0v 349.45n 0.0v 349.55n 0.0v 359.45n 0.0v 359.55n 0.0v 369.45n 0.0v 369.55n 0.0v 379.45n 0.0v 379.55n 0.0v 389.45n 0.0v 389.55n 5.0v 399.45n 5.0v 399.55n 5.0v 409.45n 5.0v 409.55n 5.0v 419.45n 5.0v 419.55n 5.0v 429.45n 5.0v 429.55n 0.0v 439.45n 0.0v 439.55n 0.0v 449.45n 0.0v 449.55n 5.0v 459.45n 5.0v 459.55n 5.0v 469.45n 5.0v 469.55n 5.0v 479.45n 5.0v 479.55n 5.0v 489.45n 5.0v 489.55n 5.0v 499.45n 5.0v 499.55n 5.0v 509.45n 5.0v 509.55n 0.0v 519.45n 0.0v 519.55n 0.0v 529.45n 0.0v 529.55n 5.0v 539.45n 5.0v 539.55n 5.0v 549.45n 5.0v 549.55n 5.0v 559.45n 5.0v 559.55n 5.0v 569.45n 5.0v 569.55n 5.0v 579.45n 5.0v 579.55n 5.0v 589.45n 5.0v 589.55n 0.0v 599.45n 0.0v 599.55n 5.0v 609.45n 5.0v 609.55n 5.0v 619.45n 5.0v 619.55n 5.0v 629.45n 5.0v 629.55n 5.0v 639.45n 5.0v 639.55n 5.0v 649.45n 5.0v 649.55n 5.0v 659.45n 5.0v 659.55n 5.0v 669.45n 5.0v 669.55n 5.0v 679.45n 5.0v 679.55n 5.0v 689.45n 5.0v 689.55n 5.0v 699.45n 5.0v 699.55n 5.0v 709.45n 5.0v 709.55n 5.0v 719.45n 5.0v 719.55n 5.0v 729.45n 5.0v 729.55n 5.0v 739.45n 5.0v 739.55n 5.0v 749.45n 5.0v 749.55n 5.0v 759.45n 5.0v 759.55n 5.0v 769.45n 5.0v 769.55n 5.0v 779.45n 5.0v 779.55n 0.0v 789.45n 0.0v 789.55n 0.0v 799.45n 0.0v 799.55n 0.0v 809.45n 0.0v 809.55n 0.0v 819.45n 0.0v 819.55n 0.0v 829.45n 0.0v 829.55n 0.0v 839.45n 0.0v 839.55n 0.0v 849.45n 0.0v 849.55n 5.0v 859.45n 5.0v 859.55n 5.0v 869.45n 5.0v 869.55n 5.0v 879.45n 5.0v 879.55n 5.0v 889.45n 5.0v 889.55n 5.0v 899.45n 5.0v 899.55n 5.0v 909.45n 5.0v 909.55n 0.0v 919.45n 0.0v 919.55n 0.0v 929.45n 0.0v 929.55n 0.0v 939.45n 0.0v 939.55n 0.0v 949.45n 0.0v 949.55n 5.0v 959.45n 5.0v 959.55n 5.0v 969.45n 5.0v 969.55n 0.0v 979.45n 0.0v 979.55n 0.0v 989.45n 0.0v 989.55n 0.0v 999.45n 0.0v 999.55n 5.0v 1009.45n 5.0v 1009.55n 5.0v 1019.45n 5.0v 1019.55n 5.0v 1029.45n 5.0v 1029.55n 5.0v 1039.45n 5.0v 1039.55n 5.0v 1049.45n 5.0v 1049.55n 5.0v 1059.45n 5.0v 1059.55n 5.0v 1069.45n 5.0v 1069.55n 0.0v 1079.45n 0.0v 1079.55n 5.0v 1089.45n 5.0v 1089.55n 0.0v 1099.45n 0.0v 1099.55n 0.0v 1109.45n 0.0v 1109.55n 5.0v 1119.45n 5.0v 1119.55n 0.0v 1129.45n 0.0v 1129.55n 0.0v 1139.45n 0.0v 1139.55n 0.0v 1149.45n 0.0v 1149.55n 5.0v 1159.45n 5.0v 1159.55n 5.0v 1169.45n 5.0v 1169.55n 5.0v 1179.45n 5.0v 1179.55n 5.0v 1189.45n 5.0v 1189.55n 0.0v 1199.45n 0.0v 1199.55n 5.0v 1209.45n 5.0v 1209.55n 5.0v 1219.45n 5.0v 1219.55n 0.0v 1229.45n 0.0v 1229.55n 5.0v 1239.45n 5.0v 1239.55n 5.0v 1249.45n 5.0v 1249.55n 5.0v 1259.45n 5.0v 1259.55n 5.0v 1269.45n 5.0v 1269.55n 0.0v 1279.45n 0.0v 1279.55n 5.0v 1289.45n 5.0v 1289.55n 5.0v 1299.45n 5.0v 1299.55n 0.0v 1309.45n 0.0v 1309.55n 5.0v 1319.45n 5.0v 1319.55n 5.0v 1329.45n 5.0v 1329.55n 5.0v 1339.45n 5.0v 1339.55n 5.0v 1349.45n 5.0v 1349.55n 5.0v 1359.45n 5.0v 1359.55n 5.0v 1369.45n 5.0v 1369.55n 5.0v 1379.45n 5.0v 1379.55n 5.0v 1389.45n 5.0v 1389.55n 0.0v 1399.45n 0.0v 1399.55n 0.0v 1409.45n 0.0v 1409.55n 0.0v 1419.45n 0.0v 1419.55n 0.0v 1429.45n 0.0v 1429.55n 0.0v 1439.45n 0.0v 1439.55n 0.0v 1449.45n 0.0v 1449.55n 0.0v 1459.45n 0.0v 1459.55n 0.0v 1469.45n 0.0v 1469.55n 0.0v 1479.45n 0.0v 1479.55n 0.0v 1489.45n 0.0v 1489.55n 0.0v 1499.45n 0.0v 1499.55n 0.0v 1509.45n 0.0v 1509.55n 5.0v 1519.45n 5.0v 1519.55n 0.0v 1529.45n 0.0v 1529.55n 5.0v 1539.45n 5.0v 1539.55n 5.0v 1549.45n 5.0v 1549.55n 5.0v 1559.45n 5.0v 1559.55n 5.0v 1569.45n 5.0v 1569.55n 5.0v 1579.45n 5.0v 1579.55n 5.0v 1589.45n 5.0v 1589.55n 5.0v 1599.45n 5.0v 1599.55n 5.0v 1609.45n 5.0v 1609.55n 5.0v 1619.45n 5.0v 1619.55n 5.0v 1629.45n 5.0v 1629.55n 5.0v 1639.45n 5.0v 1639.55n 5.0v 1649.45n 5.0v 1649.55n 5.0v 1659.45n 5.0v 1659.55n 5.0v 1669.45n 5.0v 1669.55n 5.0v 1679.45n 5.0v 1679.55n 5.0v 1689.45n 5.0v 1689.55n 5.0v 1699.45n 5.0v 1699.55n 5.0v 1709.45n 5.0v 1709.55n 5.0v 1719.45n 5.0v 1719.55n 5.0v 1729.45n 5.0v 1729.55n 5.0v 1739.45n 5.0v 1739.55n 5.0v 1749.45n 5.0v 1749.55n 5.0v 1759.45n 5.0v 1759.55n 5.0v 1769.45n 5.0v 1769.55n 0.0v 1779.45n 0.0v 1779.55n 5.0v 1789.45n 5.0v 1789.55n 5.0v 1799.45n 5.0v 1799.55n 5.0v 1809.45n 5.0v 1809.55n 5.0v 1819.45n 5.0v 1819.55n 5.0v 1829.45n 5.0v 1829.55n 5.0v 1839.45n 5.0v 1839.55n 5.0v 1849.45n 5.0v 1849.55n 0.0v 1859.45n 0.0v 1859.55n 5.0v 1869.45n 5.0v 1869.55n 5.0v 1879.45n 5.0v 1879.55n 5.0v 1889.45n 5.0v 1889.55n 5.0v 1899.45n 5.0v 1899.55n 5.0v 1909.45n 5.0v 1909.55n 5.0v 1919.45n 5.0v 1919.55n 5.0v 1929.45n 5.0v 1929.55n 5.0v 1939.45n 5.0v 1939.55n 5.0v 1949.45n 5.0v 1949.55n 5.0v 1959.45n 5.0v 1959.55n 5.0v 1969.45n 5.0v 1969.55n 5.0v 1979.45n 5.0v 1979.55n 5.0v 1989.45n 5.0v 1989.55n 5.0v 1999.45n 5.0v 1999.55n 5.0v 2009.45n 5.0v 2009.55n 5.0v 2019.45n 5.0v 2019.55n 5.0v 2029.45n 5.0v 2029.55n 5.0v 2039.45n 5.0v 2039.55n 5.0v 2049.45n 5.0v 2049.55n 5.0v )
* (time, data): [(0, 0), (10, 1), (20, 1), (30, 1), (40, 1), (50, 1), (60, 0), (70, 0), (80, 1), (90, 1), (100, 1), (110, 1), (120, 1), (130, 1), (140, 1), (150, 0), (160, 1), (170, 1), (180, 1), (190, 1), (200, 1), (210, 1), (220, 1), (230, 1), (240, 1), (250, 1), (260, 1), (270, 1), (280, 1), (290, 1), (300, 1), (310, 1), (320, 1), (330, 1), (340, 1), (350, 1), (360, 1), (370, 1), (380, 1), (390, 1), (400, 1), (410, 1), (420, 1), (430, 0), (440, 0), (450, 1), (460, 1), (470, 0), (480, 1), (490, 1), (500, 1), (510, 0), (520, 0), (530, 1), (540, 1), (550, 1), (560, 1), (570, 1), (580, 1), (590, 0), (600, 1), (610, 1), (620, 1), (630, 1), (640, 1), (650, 1), (660, 1), (670, 1), (680, 1), (690, 1), (700, 1), (710, 1), (720, 0), (730, 0), (740, 0), (750, 1), (760, 1), (770, 1), (780, 1), (790, 1), (800, 1), (810, 1), (820, 1), (830, 1), (840, 1), (850, 0), (860, 0), (870, 0), (880, 0), (890, 0), (900, 0), (910, 1), (920, 1), (930, 1), (940, 1), (950, 0), (960, 0), (970, 0), (980, 0), (990, 0), (1000, 0), (1010, 0), (1020, 0), (1030, 0), (1040, 0), (1050, 0), (1060, 0), (1070, 0), (1080, 1), (1090, 0), (1100, 0), (1110, 1), (1120, 1), (1130, 1), (1140, 1), (1150, 0), (1160, 1), (1170, 1), (1180, 1), (1190, 0), (1200, 1), (1210, 1), (1220, 0), (1230, 1), (1240, 1), (1250, 1), (1260, 1), (1270, 1), (1280, 0), (1290, 0), (1300, 0), (1310, 1), (1320, 1), (1330, 1), (1340, 1), (1350, 1), (1360, 1), (1370, 1), (1380, 1), (1390, 0), (1400, 0), (1410, 0), (1420, 0), (1430, 0), (1440, 1), (1450, 1), (1460, 1), (1470, 1), (1480, 1), (1490, 1), (1500, 1), (1510, 1), (1520, 0), (1530, 1), (1540, 1), (1550, 0), (1560, 1), (1570, 1), (1580, 1), (1590, 1), (1600, 1), (1610, 1), (1620, 1), (1630, 1), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 1), (1700, 1), (1710, 1), (1720, 1), (1730, 1), (1740, 1), (1750, 1), (1760, 1), (1770, 1), (1780, 1), (1790, 0), (1800, 0), (1810, 1), (1820, 1), (1830, 1), (1840, 0), (1850, 1), (1860, 1), (1870, 1), (1880, 1), (1890, 1), (1900, 1), (1910, 1), (1920, 1), (1930, 1), (1940, 1), (1950, 1), (1960, 1), (1970, 1), (1980, 1), (1990, 1), (2000, 1), (2010, 1), (2020, 1), (2030, 1), (2040, 1), (2050, 1)]
VWMASK0_2  WMASK0_2  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 5.0v 19.45n 5.0v 19.55n 5.0v 29.45n 5.0v 29.55n 5.0v 39.45n 5.0v 39.55n 5.0v 49.45n 5.0v 49.55n 5.0v 59.45n 5.0v 59.55n 0.0v 69.45n 0.0v 69.55n 0.0v 79.45n 0.0v 79.55n 5.0v 89.45n 5.0v 89.55n 5.0v 99.45n 5.0v 99.55n 5.0v 109.45n 5.0v 109.55n 5.0v 119.45n 5.0v 119.55n 5.0v 129.45n 5.0v 129.55n 5.0v 139.45n 5.0v 139.55n 5.0v 149.45n 5.0v 149.55n 0.0v 159.45n 0.0v 159.55n 5.0v 169.45n 5.0v 169.55n 5.0v 179.45n 5.0v 179.55n 5.0v 189.45n 5.0v 189.55n 5.0v 199.45n 5.0v 199.55n 5.0v 209.45n 5.0v 209.55n 5.0v 219.45n 5.0v 219.55n 5.0v 229.45n 5.0v 229.55n 5.0v 239.45n 5.0v 239.55n 5.0v 249.45n 5.0v 249.55n 5.0v 259.45n 5.0v 259.55n 5.0v 269.45n 5.0v 269.55n 5.0v 279.45n 5.0v 279.55n 5.0v 289.45n 5.0v 289.55n 5.0v 299.45n 5.0v 299.55n 5.0v 309.45n 5.0v 309.55n 5.0v 319.45n 5.0v 319.55n 5.0v 329.45n 5.0v 329.55n 5.0v 339.45n 5.0v 339.55n 5.0v 349.45n 5.0v 349.55n 5.0v 359.45n 5.0v 359.55n 5.0v 369.45n 5.0v 369.55n 5.0v 379.45n 5.0v 379.55n 5.0v 389.45n 5.0v 389.55n 5.0v 399.45n 5.0v 399.55n 5.0v 409.45n 5.0v 409.55n 5.0v 419.45n 5.0v 419.55n 5.0v 429.45n 5.0v 429.55n 0.0v 439.45n 0.0v 439.55n 0.0v 449.45n 0.0v 449.55n 5.0v 459.45n 5.0v 459.55n 5.0v 469.45n 5.0v 469.55n 0.0v 479.45n 0.0v 479.55n 5.0v 489.45n 5.0v 489.55n 5.0v 499.45n 5.0v 499.55n 5.0v 509.45n 5.0v 509.55n 0.0v 519.45n 0.0v 519.55n 0.0v 529.45n 0.0v 529.55n 5.0v 539.45n 5.0v 539.55n 5.0v 549.45n 5.0v 549.55n 5.0v 559.45n 5.0v 559.55n 5.0v 569.45n 5.0v 569.55n 5.0v 579.45n 5.0v 579.55n 5.0v 589.45n 5.0v 589.55n 0.0v 599.45n 0.0v 599.55n 5.0v 609.45n 5.0v 609.55n 5.0v 619.45n 5.0v 619.55n 5.0v 629.45n 5.0v 629.55n 5.0v 639.45n 5.0v 639.55n 5.0v 649.45n 5.0v 649.55n 5.0v 659.45n 5.0v 659.55n 5.0v 669.45n 5.0v 669.55n 5.0v 679.45n 5.0v 679.55n 5.0v 689.45n 5.0v 689.55n 5.0v 699.45n 5.0v 699.55n 5.0v 709.45n 5.0v 709.55n 5.0v 719.45n 5.0v 719.55n 0.0v 729.45n 0.0v 729.55n 0.0v 739.45n 0.0v 739.55n 0.0v 749.45n 0.0v 749.55n 5.0v 759.45n 5.0v 759.55n 5.0v 769.45n 5.0v 769.55n 5.0v 779.45n 5.0v 779.55n 5.0v 789.45n 5.0v 789.55n 5.0v 799.45n 5.0v 799.55n 5.0v 809.45n 5.0v 809.55n 5.0v 819.45n 5.0v 819.55n 5.0v 829.45n 5.0v 829.55n 5.0v 839.45n 5.0v 839.55n 5.0v 849.45n 5.0v 849.55n 0.0v 859.45n 0.0v 859.55n 0.0v 869.45n 0.0v 869.55n 0.0v 879.45n 0.0v 879.55n 0.0v 889.45n 0.0v 889.55n 0.0v 899.45n 0.0v 899.55n 0.0v 909.45n 0.0v 909.55n 5.0v 919.45n 5.0v 919.55n 5.0v 929.45n 5.0v 929.55n 5.0v 939.45n 5.0v 939.55n 5.0v 949.45n 5.0v 949.55n 0.0v 959.45n 0.0v 959.55n 0.0v 969.45n 0.0v 969.55n 0.0v 979.45n 0.0v 979.55n 0.0v 989.45n 0.0v 989.55n 0.0v 999.45n 0.0v 999.55n 0.0v 1009.45n 0.0v 1009.55n 0.0v 1019.45n 0.0v 1019.55n 0.0v 1029.45n 0.0v 1029.55n 0.0v 1039.45n 0.0v 1039.55n 0.0v 1049.45n 0.0v 1049.55n 0.0v 1059.45n 0.0v 1059.55n 0.0v 1069.45n 0.0v 1069.55n 0.0v 1079.45n 0.0v 1079.55n 5.0v 1089.45n 5.0v 1089.55n 0.0v 1099.45n 0.0v 1099.55n 0.0v 1109.45n 0.0v 1109.55n 5.0v 1119.45n 5.0v 1119.55n 5.0v 1129.45n 5.0v 1129.55n 5.0v 1139.45n 5.0v 1139.55n 5.0v 1149.45n 5.0v 1149.55n 0.0v 1159.45n 0.0v 1159.55n 5.0v 1169.45n 5.0v 1169.55n 5.0v 1179.45n 5.0v 1179.55n 5.0v 1189.45n 5.0v 1189.55n 0.0v 1199.45n 0.0v 1199.55n 5.0v 1209.45n 5.0v 1209.55n 5.0v 1219.45n 5.0v 1219.55n 0.0v 1229.45n 0.0v 1229.55n 5.0v 1239.45n 5.0v 1239.55n 5.0v 1249.45n 5.0v 1249.55n 5.0v 1259.45n 5.0v 1259.55n 5.0v 1269.45n 5.0v 1269.55n 5.0v 1279.45n 5.0v 1279.55n 0.0v 1289.45n 0.0v 1289.55n 0.0v 1299.45n 0.0v 1299.55n 0.0v 1309.45n 0.0v 1309.55n 5.0v 1319.45n 5.0v 1319.55n 5.0v 1329.45n 5.0v 1329.55n 5.0v 1339.45n 5.0v 1339.55n 5.0v 1349.45n 5.0v 1349.55n 5.0v 1359.45n 5.0v 1359.55n 5.0v 1369.45n 5.0v 1369.55n 5.0v 1379.45n 5.0v 1379.55n 5.0v 1389.45n 5.0v 1389.55n 0.0v 1399.45n 0.0v 1399.55n 0.0v 1409.45n 0.0v 1409.55n 0.0v 1419.45n 0.0v 1419.55n 0.0v 1429.45n 0.0v 1429.55n 0.0v 1439.45n 0.0v 1439.55n 5.0v 1449.45n 5.0v 1449.55n 5.0v 1459.45n 5.0v 1459.55n 5.0v 1469.45n 5.0v 1469.55n 5.0v 1479.45n 5.0v 1479.55n 5.0v 1489.45n 5.0v 1489.55n 5.0v 1499.45n 5.0v 1499.55n 5.0v 1509.45n 5.0v 1509.55n 5.0v 1519.45n 5.0v 1519.55n 0.0v 1529.45n 0.0v 1529.55n 5.0v 1539.45n 5.0v 1539.55n 5.0v 1549.45n 5.0v 1549.55n 0.0v 1559.45n 0.0v 1559.55n 5.0v 1569.45n 5.0v 1569.55n 5.0v 1579.45n 5.0v 1579.55n 5.0v 1589.45n 5.0v 1589.55n 5.0v 1599.45n 5.0v 1599.55n 5.0v 1609.45n 5.0v 1609.55n 5.0v 1619.45n 5.0v 1619.55n 5.0v 1629.45n 5.0v 1629.55n 5.0v 1639.45n 5.0v 1639.55n 5.0v 1649.45n 5.0v 1649.55n 5.0v 1659.45n 5.0v 1659.55n 5.0v 1669.45n 5.0v 1669.55n 5.0v 1679.45n 5.0v 1679.55n 5.0v 1689.45n 5.0v 1689.55n 5.0v 1699.45n 5.0v 1699.55n 5.0v 1709.45n 5.0v 1709.55n 5.0v 1719.45n 5.0v 1719.55n 5.0v 1729.45n 5.0v 1729.55n 5.0v 1739.45n 5.0v 1739.55n 5.0v 1749.45n 5.0v 1749.55n 5.0v 1759.45n 5.0v 1759.55n 5.0v 1769.45n 5.0v 1769.55n 5.0v 1779.45n 5.0v 1779.55n 5.0v 1789.45n 5.0v 1789.55n 0.0v 1799.45n 0.0v 1799.55n 0.0v 1809.45n 0.0v 1809.55n 5.0v 1819.45n 5.0v 1819.55n 5.0v 1829.45n 5.0v 1829.55n 5.0v 1839.45n 5.0v 1839.55n 0.0v 1849.45n 0.0v 1849.55n 5.0v 1859.45n 5.0v 1859.55n 5.0v 1869.45n 5.0v 1869.55n 5.0v 1879.45n 5.0v 1879.55n 5.0v 1889.45n 5.0v 1889.55n 5.0v 1899.45n 5.0v 1899.55n 5.0v 1909.45n 5.0v 1909.55n 5.0v 1919.45n 5.0v 1919.55n 5.0v 1929.45n 5.0v 1929.55n 5.0v 1939.45n 5.0v 1939.55n 5.0v 1949.45n 5.0v 1949.55n 5.0v 1959.45n 5.0v 1959.55n 5.0v 1969.45n 5.0v 1969.55n 5.0v 1979.45n 5.0v 1979.55n 5.0v 1989.45n 5.0v 1989.55n 5.0v 1999.45n 5.0v 1999.55n 5.0v 2009.45n 5.0v 2009.55n 5.0v 2019.45n 5.0v 2019.55n 5.0v 2029.45n 5.0v 2029.55n 5.0v 2039.45n 5.0v 2039.55n 5.0v 2049.45n 5.0v 2049.55n 5.0v )
* (time, data): [(0, 0), (10, 1), (20, 1), (30, 1), (40, 1), (50, 1), (60, 1), (70, 0), (80, 1), (90, 1), (100, 1), (110, 1), (120, 1), (130, 1), (140, 1), (150, 0), (160, 1), (170, 1), (180, 1), (190, 1), (200, 1), (210, 1), (220, 0), (230, 0), (240, 0), (250, 1), (260, 1), (270, 1), (280, 1), (290, 1), (300, 0), (310, 0), (320, 0), (330, 0), (340, 0), (350, 0), (360, 0), (370, 0), (380, 0), (390, 1), (400, 1), (410, 1), (420, 1), (430, 1), (440, 1), (450, 1), (460, 1), (470, 1), (480, 1), (490, 1), (500, 1), (510, 1), (520, 1), (530, 1), (540, 1), (550, 1), (560, 1), (570, 1), (580, 1), (590, 0), (600, 1), (610, 1), (620, 1), (630, 1), (640, 1), (650, 1), (660, 1), (670, 1), (680, 1), (690, 1), (700, 1), (710, 1), (720, 1), (730, 1), (740, 1), (750, 1), (760, 0), (770, 0), (780, 1), (790, 1), (800, 1), (810, 1), (820, 1), (830, 1), (840, 1), (850, 0), (860, 0), (870, 0), (880, 0), (890, 0), (900, 0), (910, 0), (920, 0), (930, 0), (940, 0), (950, 0), (960, 0), (970, 0), (980, 0), (990, 0), (1000, 1), (1010, 1), (1020, 1), (1030, 1), (1040, 1), (1050, 1), (1060, 1), (1070, 1), (1080, 1), (1090, 1), (1100, 1), (1110, 1), (1120, 0), (1130, 0), (1140, 0), (1150, 0), (1160, 1), (1170, 1), (1180, 1), (1190, 1), (1200, 1), (1210, 1), (1220, 1), (1230, 1), (1240, 1), (1250, 1), (1260, 1), (1270, 1), (1280, 0), (1290, 0), (1300, 1), (1310, 1), (1320, 1), (1330, 1), (1340, 1), (1350, 1), (1360, 1), (1370, 1), (1380, 1), (1390, 1), (1400, 1), (1410, 1), (1420, 1), (1430, 1), (1440, 1), (1450, 1), (1460, 1), (1470, 1), (1480, 0), (1490, 0), (1500, 0), (1510, 1), (1520, 0), (1530, 1), (1540, 1), (1550, 1), (1560, 1), (1570, 1), (1580, 1), (1590, 1), (1600, 1), (1610, 1), (1620, 1), (1630, 1), (1640, 1), (1650, 1), (1660, 1), (1670, 1), (1680, 1), (1690, 1), (1700, 1), (1710, 1), (1720, 1), (1730, 1), (1740, 1), (1750, 1), (1760, 1), (1770, 0), (1780, 1), (1790, 0), (1800, 0), (1810, 1), (1820, 1), (1830, 1), (1840, 1), (1850, 1), (1860, 1), (1870, 1), (1880, 1), (1890, 1), (1900, 1), (1910, 1), (1920, 1), (1930, 1), (1940, 1), (1950, 1), (1960, 1), (1970, 1), (1980, 1), (1990, 1), (2000, 1), (2010, 1), (2020, 1), (2030, 0), (2040, 0), (2050, 0)]
VWMASK0_3  WMASK0_3  0 PWL (0n 0.0v 9.45n 0.0v 9.55n 5.0v 19.45n 5.0v 19.55n 5.0v 29.45n 5.0v 29.55n 5.0v 39.45n 5.0v 39.55n 5.0v 49.45n 5.0v 49.55n 5.0v 59.45n 5.0v 59.55n 5.0v 69.45n 5.0v 69.55n 0.0v 79.45n 0.0v 79.55n 5.0v 89.45n 5.0v 89.55n 5.0v 99.45n 5.0v 99.55n 5.0v 109.45n 5.0v 109.55n 5.0v 119.45n 5.0v 119.55n 5.0v 129.45n 5.0v 129.55n 5.0v 139.45n 5.0v 139.55n 5.0v 149.45n 5.0v 149.55n 0.0v 159.45n 0.0v 159.55n 5.0v 169.45n 5.0v 169.55n 5.0v 179.45n 5.0v 179.55n 5.0v 189.45n 5.0v 189.55n 5.0v 199.45n 5.0v 199.55n 5.0v 209.45n 5.0v 209.55n 5.0v 219.45n 5.0v 219.55n 0.0v 229.45n 0.0v 229.55n 0.0v 239.45n 0.0v 239.55n 0.0v 249.45n 0.0v 249.55n 5.0v 259.45n 5.0v 259.55n 5.0v 269.45n 5.0v 269.55n 5.0v 279.45n 5.0v 279.55n 5.0v 289.45n 5.0v 289.55n 5.0v 299.45n 5.0v 299.55n 0.0v 309.45n 0.0v 309.55n 0.0v 319.45n 0.0v 319.55n 0.0v 329.45n 0.0v 329.55n 0.0v 339.45n 0.0v 339.55n 0.0v 349.45n 0.0v 349.55n 0.0v 359.45n 0.0v 359.55n 0.0v 369.45n 0.0v 369.55n 0.0v 379.45n 0.0v 379.55n 0.0v 389.45n 0.0v 389.55n 5.0v 399.45n 5.0v 399.55n 5.0v 409.45n 5.0v 409.55n 5.0v 419.45n 5.0v 419.55n 5.0v 429.45n 5.0v 429.55n 5.0v 439.45n 5.0v 439.55n 5.0v 449.45n 5.0v 449.55n 5.0v 459.45n 5.0v 459.55n 5.0v 469.45n 5.0v 469.55n 5.0v 479.45n 5.0v 479.55n 5.0v 489.45n 5.0v 489.55n 5.0v 499.45n 5.0v 499.55n 5.0v 509.45n 5.0v 509.55n 5.0v 519.45n 5.0v 519.55n 5.0v 529.45n 5.0v 529.55n 5.0v 539.45n 5.0v 539.55n 5.0v 549.45n 5.0v 549.55n 5.0v 559.45n 5.0v 559.55n 5.0v 569.45n 5.0v 569.55n 5.0v 579.45n 5.0v 579.55n 5.0v 589.45n 5.0v 589.55n 0.0v 599.45n 0.0v 599.55n 5.0v 609.45n 5.0v 609.55n 5.0v 619.45n 5.0v 619.55n 5.0v 629.45n 5.0v 629.55n 5.0v 639.45n 5.0v 639.55n 5.0v 649.45n 5.0v 649.55n 5.0v 659.45n 5.0v 659.55n 5.0v 669.45n 5.0v 669.55n 5.0v 679.45n 5.0v 679.55n 5.0v 689.45n 5.0v 689.55n 5.0v 699.45n 5.0v 699.55n 5.0v 709.45n 5.0v 709.55n 5.0v 719.45n 5.0v 719.55n 5.0v 729.45n 5.0v 729.55n 5.0v 739.45n 5.0v 739.55n 5.0v 749.45n 5.0v 749.55n 5.0v 759.45n 5.0v 759.55n 0.0v 769.45n 0.0v 769.55n 0.0v 779.45n 0.0v 779.55n 5.0v 789.45n 5.0v 789.55n 5.0v 799.45n 5.0v 799.55n 5.0v 809.45n 5.0v 809.55n 5.0v 819.45n 5.0v 819.55n 5.0v 829.45n 5.0v 829.55n 5.0v 839.45n 5.0v 839.55n 5.0v 849.45n 5.0v 849.55n 0.0v 859.45n 0.0v 859.55n 0.0v 869.45n 0.0v 869.55n 0.0v 879.45n 0.0v 879.55n 0.0v 889.45n 0.0v 889.55n 0.0v 899.45n 0.0v 899.55n 0.0v 909.45n 0.0v 909.55n 0.0v 919.45n 0.0v 919.55n 0.0v 929.45n 0.0v 929.55n 0.0v 939.45n 0.0v 939.55n 0.0v 949.45n 0.0v 949.55n 0.0v 959.45n 0.0v 959.55n 0.0v 969.45n 0.0v 969.55n 0.0v 979.45n 0.0v 979.55n 0.0v 989.45n 0.0v 989.55n 0.0v 999.45n 0.0v 999.55n 5.0v 1009.45n 5.0v 1009.55n 5.0v 1019.45n 5.0v 1019.55n 5.0v 1029.45n 5.0v 1029.55n 5.0v 1039.45n 5.0v 1039.55n 5.0v 1049.45n 5.0v 1049.55n 5.0v 1059.45n 5.0v 1059.55n 5.0v 1069.45n 5.0v 1069.55n 5.0v 1079.45n 5.0v 1079.55n 5.0v 1089.45n 5.0v 1089.55n 5.0v 1099.45n 5.0v 1099.55n 5.0v 1109.45n 5.0v 1109.55n 5.0v 1119.45n 5.0v 1119.55n 0.0v 1129.45n 0.0v 1129.55n 0.0v 1139.45n 0.0v 1139.55n 0.0v 1149.45n 0.0v 1149.55n 0.0v 1159.45n 0.0v 1159.55n 5.0v 1169.45n 5.0v 1169.55n 5.0v 1179.45n 5.0v 1179.55n 5.0v 1189.45n 5.0v 1189.55n 5.0v 1199.45n 5.0v 1199.55n 5.0v 1209.45n 5.0v 1209.55n 5.0v 1219.45n 5.0v 1219.55n 5.0v 1229.45n 5.0v 1229.55n 5.0v 1239.45n 5.0v 1239.55n 5.0v 1249.45n 5.0v 1249.55n 5.0v 1259.45n 5.0v 1259.55n 5.0v 1269.45n 5.0v 1269.55n 5.0v 1279.45n 5.0v 1279.55n 0.0v 1289.45n 0.0v 1289.55n 0.0v 1299.45n 0.0v 1299.55n 5.0v 1309.45n 5.0v 1309.55n 5.0v 1319.45n 5.0v 1319.55n 5.0v 1329.45n 5.0v 1329.55n 5.0v 1339.45n 5.0v 1339.55n 5.0v 1349.45n 5.0v 1349.55n 5.0v 1359.45n 5.0v 1359.55n 5.0v 1369.45n 5.0v 1369.55n 5.0v 1379.45n 5.0v 1379.55n 5.0v 1389.45n 5.0v 1389.55n 5.0v 1399.45n 5.0v 1399.55n 5.0v 1409.45n 5.0v 1409.55n 5.0v 1419.45n 5.0v 1419.55n 5.0v 1429.45n 5.0v 1429.55n 5.0v 1439.45n 5.0v 1439.55n 5.0v 1449.45n 5.0v 1449.55n 5.0v 1459.45n 5.0v 1459.55n 5.0v 1469.45n 5.0v 1469.55n 5.0v 1479.45n 5.0v 1479.55n 0.0v 1489.45n 0.0v 1489.55n 0.0v 1499.45n 0.0v 1499.55n 0.0v 1509.45n 0.0v 1509.55n 5.0v 1519.45n 5.0v 1519.55n 0.0v 1529.45n 0.0v 1529.55n 5.0v 1539.45n 5.0v 1539.55n 5.0v 1549.45n 5.0v 1549.55n 5.0v 1559.45n 5.0v 1559.55n 5.0v 1569.45n 5.0v 1569.55n 5.0v 1579.45n 5.0v 1579.55n 5.0v 1589.45n 5.0v 1589.55n 5.0v 1599.45n 5.0v 1599.55n 5.0v 1609.45n 5.0v 1609.55n 5.0v 1619.45n 5.0v 1619.55n 5.0v 1629.45n 5.0v 1629.55n 5.0v 1639.45n 5.0v 1639.55n 5.0v 1649.45n 5.0v 1649.55n 5.0v 1659.45n 5.0v 1659.55n 5.0v 1669.45n 5.0v 1669.55n 5.0v 1679.45n 5.0v 1679.55n 5.0v 1689.45n 5.0v 1689.55n 5.0v 1699.45n 5.0v 1699.55n 5.0v 1709.45n 5.0v 1709.55n 5.0v 1719.45n 5.0v 1719.55n 5.0v 1729.45n 5.0v 1729.55n 5.0v 1739.45n 5.0v 1739.55n 5.0v 1749.45n 5.0v 1749.55n 5.0v 1759.45n 5.0v 1759.55n 5.0v 1769.45n 5.0v 1769.55n 0.0v 1779.45n 0.0v 1779.55n 5.0v 1789.45n 5.0v 1789.55n 0.0v 1799.45n 0.0v 1799.55n 0.0v 1809.45n 0.0v 1809.55n 5.0v 1819.45n 5.0v 1819.55n 5.0v 1829.45n 5.0v 1829.55n 5.0v 1839.45n 5.0v 1839.55n 5.0v 1849.45n 5.0v 1849.55n 5.0v 1859.45n 5.0v 1859.55n 5.0v 1869.45n 5.0v 1869.55n 5.0v 1879.45n 5.0v 1879.55n 5.0v 1889.45n 5.0v 1889.55n 5.0v 1899.45n 5.0v 1899.55n 5.0v 1909.45n 5.0v 1909.55n 5.0v 1919.45n 5.0v 1919.55n 5.0v 1929.45n 5.0v 1929.55n 5.0v 1939.45n 5.0v 1939.55n 5.0v 1949.45n 5.0v 1949.55n 5.0v 1959.45n 5.0v 1959.55n 5.0v 1969.45n 5.0v 1969.55n 5.0v 1979.45n 5.0v 1979.55n 5.0v 1989.45n 5.0v 1989.55n 5.0v 1999.45n 5.0v 1999.55n 5.0v 2009.45n 5.0v 2009.55n 5.0v 2019.45n 5.0v 2019.55n 5.0v 2029.45n 5.0v 2029.55n 0.0v 2039.45n 0.0v 2039.55n 0.0v 2049.45n 0.0v 2049.55n 0.0v )
* PULSE: period=10
Vclk0 clk0 0 PULSE (0 5.0 9.95n 0.1n 0.1n 4.9n 10n)

 * Generation of dout measurements
* CHECK dout0_0 vdout0_0ck4 = 5.0 time = 50
* CHECK dout0_1 vdout0_1ck4 = 5.0 time = 50
* CHECK dout0_2 vdout0_2ck4 = 5.0 time = 50
* CHECK dout0_3 vdout0_3ck4 = 0 time = 50
* CHECK dout0_4 vdout0_4ck4 = 5.0 time = 50
* CHECK dout0_5 vdout0_5ck4 = 5.0 time = 50
* CHECK dout0_6 vdout0_6ck4 = 0 time = 50
* CHECK dout0_7 vdout0_7ck4 = 0 time = 50
* CHECK dout0_8 vdout0_8ck4 = 0 time = 50
* CHECK dout0_9 vdout0_9ck4 = 0 time = 50
* CHECK dout0_10 vdout0_10ck4 = 0 time = 50
* CHECK dout0_11 vdout0_11ck4 = 0 time = 50
* CHECK dout0_12 vdout0_12ck4 = 0 time = 50
* CHECK dout0_13 vdout0_13ck4 = 0 time = 50
* CHECK dout0_14 vdout0_14ck4 = 5.0 time = 50
* CHECK dout0_15 vdout0_15ck4 = 5.0 time = 50
* CHECK dout0_16 vdout0_16ck4 = 0 time = 50
* CHECK dout0_17 vdout0_17ck4 = 0 time = 50
* CHECK dout0_18 vdout0_18ck4 = 0 time = 50
* CHECK dout0_19 vdout0_19ck4 = 5.0 time = 50
* CHECK dout0_20 vdout0_20ck4 = 5.0 time = 50
* CHECK dout0_21 vdout0_21ck4 = 0 time = 50
* CHECK dout0_22 vdout0_22ck4 = 5.0 time = 50
* CHECK dout0_23 vdout0_23ck4 = 5.0 time = 50
* CHECK dout0_24 vdout0_24ck4 = 0 time = 50
* CHECK dout0_25 vdout0_25ck4 = 0 time = 50
* CHECK dout0_26 vdout0_26ck4 = 0 time = 50
* CHECK dout0_27 vdout0_27ck4 = 5.0 time = 50
* CHECK dout0_28 vdout0_28ck4 = 5.0 time = 50
* CHECK dout0_29 vdout0_29ck4 = 5.0 time = 50
* CHECK dout0_30 vdout0_30ck4 = 0 time = 50
* CHECK dout0_31 vdout0_31ck4 = 5.0 time = 50
* CHECK dout0_0 vdout0_0ck10 = 5.0 time = 110
* CHECK dout0_1 vdout0_1ck10 = 0 time = 110
* CHECK dout0_2 vdout0_2ck10 = 0 time = 110
* CHECK dout0_3 vdout0_3ck10 = 0 time = 110
* CHECK dout0_4 vdout0_4ck10 = 0 time = 110
* CHECK dout0_5 vdout0_5ck10 = 0 time = 110
* CHECK dout0_6 vdout0_6ck10 = 0 time = 110
* CHECK dout0_7 vdout0_7ck10 = 5.0 time = 110
* CHECK dout0_8 vdout0_8ck10 = 0 time = 110
* CHECK dout0_9 vdout0_9ck10 = 0 time = 110
* CHECK dout0_10 vdout0_10ck10 = 5.0 time = 110
* CHECK dout0_11 vdout0_11ck10 = 0 time = 110
* CHECK dout0_12 vdout0_12ck10 = 5.0 time = 110
* CHECK dout0_13 vdout0_13ck10 = 0 time = 110
* CHECK dout0_14 vdout0_14ck10 = 5.0 time = 110
* CHECK dout0_15 vdout0_15ck10 = 5.0 time = 110
* CHECK dout0_16 vdout0_16ck10 = 5.0 time = 110
* CHECK dout0_17 vdout0_17ck10 = 5.0 time = 110
* CHECK dout0_18 vdout0_18ck10 = 0 time = 110
* CHECK dout0_19 vdout0_19ck10 = 0 time = 110
* CHECK dout0_20 vdout0_20ck10 = 5.0 time = 110
* CHECK dout0_21 vdout0_21ck10 = 5.0 time = 110
* CHECK dout0_22 vdout0_22ck10 = 0 time = 110
* CHECK dout0_23 vdout0_23ck10 = 0 time = 110
* CHECK dout0_24 vdout0_24ck10 = 5.0 time = 110
* CHECK dout0_25 vdout0_25ck10 = 5.0 time = 110
* CHECK dout0_26 vdout0_26ck10 = 5.0 time = 110
* CHECK dout0_27 vdout0_27ck10 = 5.0 time = 110
* CHECK dout0_28 vdout0_28ck10 = 5.0 time = 110
* CHECK dout0_29 vdout0_29ck10 = 5.0 time = 110
* CHECK dout0_30 vdout0_30ck10 = 0 time = 110
* CHECK dout0_31 vdout0_31ck10 = 0 time = 110
* CHECK dout0_0 vdout0_0ck12 = 0 time = 130
* CHECK dout0_1 vdout0_1ck12 = 0 time = 130
* CHECK dout0_2 vdout0_2ck12 = 5.0 time = 130
* CHECK dout0_3 vdout0_3ck12 = 5.0 time = 130
* CHECK dout0_4 vdout0_4ck12 = 5.0 time = 130
* CHECK dout0_5 vdout0_5ck12 = 5.0 time = 130
* CHECK dout0_6 vdout0_6ck12 = 0 time = 130
* CHECK dout0_7 vdout0_7ck12 = 0 time = 130
* CHECK dout0_8 vdout0_8ck12 = 0 time = 130
* CHECK dout0_9 vdout0_9ck12 = 0 time = 130
* CHECK dout0_10 vdout0_10ck12 = 5.0 time = 130
* CHECK dout0_11 vdout0_11ck12 = 5.0 time = 130
* CHECK dout0_12 vdout0_12ck12 = 5.0 time = 130
* CHECK dout0_13 vdout0_13ck12 = 5.0 time = 130
* CHECK dout0_14 vdout0_14ck12 = 5.0 time = 130
* CHECK dout0_15 vdout0_15ck12 = 5.0 time = 130
* CHECK dout0_16 vdout0_16ck12 = 0 time = 130
* CHECK dout0_17 vdout0_17ck12 = 5.0 time = 130
* CHECK dout0_18 vdout0_18ck12 = 0 time = 130
* CHECK dout0_19 vdout0_19ck12 = 0 time = 130
* CHECK dout0_20 vdout0_20ck12 = 0 time = 130
* CHECK dout0_21 vdout0_21ck12 = 5.0 time = 130
* CHECK dout0_22 vdout0_22ck12 = 0 time = 130
* CHECK dout0_23 vdout0_23ck12 = 0 time = 130
* CHECK dout0_24 vdout0_24ck12 = 5.0 time = 130
* CHECK dout0_25 vdout0_25ck12 = 5.0 time = 130
* CHECK dout0_26 vdout0_26ck12 = 0 time = 130
* CHECK dout0_27 vdout0_27ck12 = 0 time = 130
* CHECK dout0_28 vdout0_28ck12 = 5.0 time = 130
* CHECK dout0_29 vdout0_29ck12 = 0 time = 130
* CHECK dout0_30 vdout0_30ck12 = 0 time = 130
* CHECK dout0_31 vdout0_31ck12 = 0 time = 130
* CHECK dout0_0 vdout0_0ck18 = 5.0 time = 190
* CHECK dout0_1 vdout0_1ck18 = 5.0 time = 190
* CHECK dout0_2 vdout0_2ck18 = 0 time = 190
* CHECK dout0_3 vdout0_3ck18 = 0 time = 190
* CHECK dout0_4 vdout0_4ck18 = 5.0 time = 190
* CHECK dout0_5 vdout0_5ck18 = 5.0 time = 190
* CHECK dout0_6 vdout0_6ck18 = 5.0 time = 190
* CHECK dout0_7 vdout0_7ck18 = 5.0 time = 190
* CHECK dout0_8 vdout0_8ck18 = 5.0 time = 190
* CHECK dout0_9 vdout0_9ck18 = 5.0 time = 190
* CHECK dout0_10 vdout0_10ck18 = 0 time = 190
* CHECK dout0_11 vdout0_11ck18 = 0 time = 190
* CHECK dout0_12 vdout0_12ck18 = 5.0 time = 190
* CHECK dout0_13 vdout0_13ck18 = 0 time = 190
* CHECK dout0_14 vdout0_14ck18 = 0 time = 190
* CHECK dout0_15 vdout0_15ck18 = 5.0 time = 190
* CHECK dout0_16 vdout0_16ck18 = 0 time = 190
* CHECK dout0_17 vdout0_17ck18 = 0 time = 190
* CHECK dout0_18 vdout0_18ck18 = 0 time = 190
* CHECK dout0_19 vdout0_19ck18 = 5.0 time = 190
* CHECK dout0_20 vdout0_20ck18 = 5.0 time = 190
* CHECK dout0_21 vdout0_21ck18 = 0 time = 190
* CHECK dout0_22 vdout0_22ck18 = 0 time = 190
* CHECK dout0_23 vdout0_23ck18 = 5.0 time = 190
* CHECK dout0_24 vdout0_24ck18 = 5.0 time = 190
* CHECK dout0_25 vdout0_25ck18 = 0 time = 190
* CHECK dout0_26 vdout0_26ck18 = 5.0 time = 190
* CHECK dout0_27 vdout0_27ck18 = 0 time = 190
* CHECK dout0_28 vdout0_28ck18 = 5.0 time = 190
* CHECK dout0_29 vdout0_29ck18 = 5.0 time = 190
* CHECK dout0_30 vdout0_30ck18 = 5.0 time = 190
* CHECK dout0_31 vdout0_31ck18 = 5.0 time = 190
* CHECK dout0_0 vdout0_0ck21 = 5.0 time = 220
* CHECK dout0_1 vdout0_1ck21 = 0 time = 220
* CHECK dout0_2 vdout0_2ck21 = 0 time = 220
* CHECK dout0_3 vdout0_3ck21 = 0 time = 220
* CHECK dout0_4 vdout0_4ck21 = 0 time = 220
* CHECK dout0_5 vdout0_5ck21 = 0 time = 220
* CHECK dout0_6 vdout0_6ck21 = 0 time = 220
* CHECK dout0_7 vdout0_7ck21 = 0 time = 220
* CHECK dout0_8 vdout0_8ck21 = 5.0 time = 220
* CHECK dout0_9 vdout0_9ck21 = 0 time = 220
* CHECK dout0_10 vdout0_10ck21 = 5.0 time = 220
* CHECK dout0_11 vdout0_11ck21 = 0 time = 220
* CHECK dout0_12 vdout0_12ck21 = 0 time = 220
* CHECK dout0_13 vdout0_13ck21 = 0 time = 220
* CHECK dout0_14 vdout0_14ck21 = 5.0 time = 220
* CHECK dout0_15 vdout0_15ck21 = 5.0 time = 220
* CHECK dout0_16 vdout0_16ck21 = 0 time = 220
* CHECK dout0_17 vdout0_17ck21 = 5.0 time = 220
* CHECK dout0_18 vdout0_18ck21 = 5.0 time = 220
* CHECK dout0_19 vdout0_19ck21 = 0 time = 220
* CHECK dout0_20 vdout0_20ck21 = 0 time = 220
* CHECK dout0_21 vdout0_21ck21 = 5.0 time = 220
* CHECK dout0_22 vdout0_22ck21 = 5.0 time = 220
* CHECK dout0_23 vdout0_23ck21 = 5.0 time = 220
* CHECK dout0_24 vdout0_24ck21 = 0 time = 220
* CHECK dout0_25 vdout0_25ck21 = 0 time = 220
* CHECK dout0_26 vdout0_26ck21 = 5.0 time = 220
* CHECK dout0_27 vdout0_27ck21 = 5.0 time = 220
* CHECK dout0_28 vdout0_28ck21 = 5.0 time = 220
* CHECK dout0_29 vdout0_29ck21 = 0 time = 220
* CHECK dout0_30 vdout0_30ck21 = 5.0 time = 220
* CHECK dout0_31 vdout0_31ck21 = 5.0 time = 220
* CHECK dout0_0 vdout0_0ck24 = 5.0 time = 250
* CHECK dout0_1 vdout0_1ck24 = 5.0 time = 250
* CHECK dout0_2 vdout0_2ck24 = 0 time = 250
* CHECK dout0_3 vdout0_3ck24 = 0 time = 250
* CHECK dout0_4 vdout0_4ck24 = 5.0 time = 250
* CHECK dout0_5 vdout0_5ck24 = 5.0 time = 250
* CHECK dout0_6 vdout0_6ck24 = 5.0 time = 250
* CHECK dout0_7 vdout0_7ck24 = 5.0 time = 250
* CHECK dout0_8 vdout0_8ck24 = 5.0 time = 250
* CHECK dout0_9 vdout0_9ck24 = 5.0 time = 250
* CHECK dout0_10 vdout0_10ck24 = 0 time = 250
* CHECK dout0_11 vdout0_11ck24 = 0 time = 250
* CHECK dout0_12 vdout0_12ck24 = 5.0 time = 250
* CHECK dout0_13 vdout0_13ck24 = 0 time = 250
* CHECK dout0_14 vdout0_14ck24 = 0 time = 250
* CHECK dout0_15 vdout0_15ck24 = 5.0 time = 250
* CHECK dout0_16 vdout0_16ck24 = 0 time = 250
* CHECK dout0_17 vdout0_17ck24 = 0 time = 250
* CHECK dout0_18 vdout0_18ck24 = 0 time = 250
* CHECK dout0_19 vdout0_19ck24 = 5.0 time = 250
* CHECK dout0_20 vdout0_20ck24 = 5.0 time = 250
* CHECK dout0_21 vdout0_21ck24 = 0 time = 250
* CHECK dout0_22 vdout0_22ck24 = 0 time = 250
* CHECK dout0_23 vdout0_23ck24 = 5.0 time = 250
* CHECK dout0_24 vdout0_24ck24 = 5.0 time = 250
* CHECK dout0_25 vdout0_25ck24 = 0 time = 250
* CHECK dout0_26 vdout0_26ck24 = 5.0 time = 250
* CHECK dout0_27 vdout0_27ck24 = 0 time = 250
* CHECK dout0_28 vdout0_28ck24 = 5.0 time = 250
* CHECK dout0_29 vdout0_29ck24 = 5.0 time = 250
* CHECK dout0_30 vdout0_30ck24 = 5.0 time = 250
* CHECK dout0_31 vdout0_31ck24 = 5.0 time = 250
* CHECK dout0_0 vdout0_0ck26 = 5.0 time = 270
* CHECK dout0_1 vdout0_1ck26 = 0 time = 270
* CHECK dout0_2 vdout0_2ck26 = 0 time = 270
* CHECK dout0_3 vdout0_3ck26 = 0 time = 270
* CHECK dout0_4 vdout0_4ck26 = 0 time = 270
* CHECK dout0_5 vdout0_5ck26 = 0 time = 270
* CHECK dout0_6 vdout0_6ck26 = 0 time = 270
* CHECK dout0_7 vdout0_7ck26 = 0 time = 270
* CHECK dout0_8 vdout0_8ck26 = 5.0 time = 270
* CHECK dout0_9 vdout0_9ck26 = 0 time = 270
* CHECK dout0_10 vdout0_10ck26 = 5.0 time = 270
* CHECK dout0_11 vdout0_11ck26 = 0 time = 270
* CHECK dout0_12 vdout0_12ck26 = 0 time = 270
* CHECK dout0_13 vdout0_13ck26 = 0 time = 270
* CHECK dout0_14 vdout0_14ck26 = 5.0 time = 270
* CHECK dout0_15 vdout0_15ck26 = 5.0 time = 270
* CHECK dout0_16 vdout0_16ck26 = 0 time = 270
* CHECK dout0_17 vdout0_17ck26 = 5.0 time = 270
* CHECK dout0_18 vdout0_18ck26 = 0 time = 270
* CHECK dout0_19 vdout0_19ck26 = 5.0 time = 270
* CHECK dout0_20 vdout0_20ck26 = 5.0 time = 270
* CHECK dout0_21 vdout0_21ck26 = 0 time = 270
* CHECK dout0_22 vdout0_22ck26 = 5.0 time = 270
* CHECK dout0_23 vdout0_23ck26 = 0 time = 270
* CHECK dout0_24 vdout0_24ck26 = 0 time = 270
* CHECK dout0_25 vdout0_25ck26 = 0 time = 270
* CHECK dout0_26 vdout0_26ck26 = 5.0 time = 270
* CHECK dout0_27 vdout0_27ck26 = 5.0 time = 270
* CHECK dout0_28 vdout0_28ck26 = 5.0 time = 270
* CHECK dout0_29 vdout0_29ck26 = 0 time = 270
* CHECK dout0_30 vdout0_30ck26 = 5.0 time = 270
* CHECK dout0_31 vdout0_31ck26 = 5.0 time = 270
* CHECK dout0_0 vdout0_0ck27 = 5.0 time = 280
* CHECK dout0_1 vdout0_1ck27 = 0 time = 280
* CHECK dout0_2 vdout0_2ck27 = 0 time = 280
* CHECK dout0_3 vdout0_3ck27 = 0 time = 280
* CHECK dout0_4 vdout0_4ck27 = 0 time = 280
* CHECK dout0_5 vdout0_5ck27 = 0 time = 280
* CHECK dout0_6 vdout0_6ck27 = 0 time = 280
* CHECK dout0_7 vdout0_7ck27 = 5.0 time = 280
* CHECK dout0_8 vdout0_8ck27 = 0 time = 280
* CHECK dout0_9 vdout0_9ck27 = 0 time = 280
* CHECK dout0_10 vdout0_10ck27 = 5.0 time = 280
* CHECK dout0_11 vdout0_11ck27 = 0 time = 280
* CHECK dout0_12 vdout0_12ck27 = 5.0 time = 280
* CHECK dout0_13 vdout0_13ck27 = 0 time = 280
* CHECK dout0_14 vdout0_14ck27 = 5.0 time = 280
* CHECK dout0_15 vdout0_15ck27 = 5.0 time = 280
* CHECK dout0_16 vdout0_16ck27 = 5.0 time = 280
* CHECK dout0_17 vdout0_17ck27 = 5.0 time = 280
* CHECK dout0_18 vdout0_18ck27 = 0 time = 280
* CHECK dout0_19 vdout0_19ck27 = 0 time = 280
* CHECK dout0_20 vdout0_20ck27 = 5.0 time = 280
* CHECK dout0_21 vdout0_21ck27 = 5.0 time = 280
* CHECK dout0_22 vdout0_22ck27 = 0 time = 280
* CHECK dout0_23 vdout0_23ck27 = 0 time = 280
* CHECK dout0_24 vdout0_24ck27 = 5.0 time = 280
* CHECK dout0_25 vdout0_25ck27 = 5.0 time = 280
* CHECK dout0_26 vdout0_26ck27 = 5.0 time = 280
* CHECK dout0_27 vdout0_27ck27 = 5.0 time = 280
* CHECK dout0_28 vdout0_28ck27 = 5.0 time = 280
* CHECK dout0_29 vdout0_29ck27 = 5.0 time = 280
* CHECK dout0_30 vdout0_30ck27 = 0 time = 280
* CHECK dout0_31 vdout0_31ck27 = 0 time = 280
* CHECK dout0_0 vdout0_0ck29 = 5.0 time = 300
* CHECK dout0_1 vdout0_1ck29 = 0 time = 300
* CHECK dout0_2 vdout0_2ck29 = 0 time = 300
* CHECK dout0_3 vdout0_3ck29 = 0 time = 300
* CHECK dout0_4 vdout0_4ck29 = 0 time = 300
* CHECK dout0_5 vdout0_5ck29 = 0 time = 300
* CHECK dout0_6 vdout0_6ck29 = 0 time = 300
* CHECK dout0_7 vdout0_7ck29 = 0 time = 300
* CHECK dout0_8 vdout0_8ck29 = 5.0 time = 300
* CHECK dout0_9 vdout0_9ck29 = 0 time = 300
* CHECK dout0_10 vdout0_10ck29 = 5.0 time = 300
* CHECK dout0_11 vdout0_11ck29 = 0 time = 300
* CHECK dout0_12 vdout0_12ck29 = 0 time = 300
* CHECK dout0_13 vdout0_13ck29 = 0 time = 300
* CHECK dout0_14 vdout0_14ck29 = 5.0 time = 300
* CHECK dout0_15 vdout0_15ck29 = 5.0 time = 300
* CHECK dout0_16 vdout0_16ck29 = 0 time = 300
* CHECK dout0_17 vdout0_17ck29 = 5.0 time = 300
* CHECK dout0_18 vdout0_18ck29 = 0 time = 300
* CHECK dout0_19 vdout0_19ck29 = 5.0 time = 300
* CHECK dout0_20 vdout0_20ck29 = 5.0 time = 300
* CHECK dout0_21 vdout0_21ck29 = 0 time = 300
* CHECK dout0_22 vdout0_22ck29 = 5.0 time = 300
* CHECK dout0_23 vdout0_23ck29 = 0 time = 300
* CHECK dout0_24 vdout0_24ck29 = 0 time = 300
* CHECK dout0_25 vdout0_25ck29 = 0 time = 300
* CHECK dout0_26 vdout0_26ck29 = 5.0 time = 300
* CHECK dout0_27 vdout0_27ck29 = 5.0 time = 300
* CHECK dout0_28 vdout0_28ck29 = 5.0 time = 300
* CHECK dout0_29 vdout0_29ck29 = 0 time = 300
* CHECK dout0_30 vdout0_30ck29 = 5.0 time = 300
* CHECK dout0_31 vdout0_31ck29 = 5.0 time = 300
* CHECK dout0_0 vdout0_0ck32 = 0 time = 330
* CHECK dout0_1 vdout0_1ck32 = 0 time = 330
* CHECK dout0_2 vdout0_2ck32 = 5.0 time = 330
* CHECK dout0_3 vdout0_3ck32 = 0 time = 330
* CHECK dout0_4 vdout0_4ck32 = 5.0 time = 330
* CHECK dout0_5 vdout0_5ck32 = 0 time = 330
* CHECK dout0_6 vdout0_6ck32 = 0 time = 330
* CHECK dout0_7 vdout0_7ck32 = 5.0 time = 330
* CHECK dout0_8 vdout0_8ck32 = 0 time = 330
* CHECK dout0_9 vdout0_9ck32 = 0 time = 330
* CHECK dout0_10 vdout0_10ck32 = 0 time = 330
* CHECK dout0_11 vdout0_11ck32 = 0 time = 330
* CHECK dout0_12 vdout0_12ck32 = 5.0 time = 330
* CHECK dout0_13 vdout0_13ck32 = 5.0 time = 330
* CHECK dout0_14 vdout0_14ck32 = 0 time = 330
* CHECK dout0_15 vdout0_15ck32 = 0 time = 330
* CHECK dout0_16 vdout0_16ck32 = 5.0 time = 330
* CHECK dout0_17 vdout0_17ck32 = 0 time = 330
* CHECK dout0_18 vdout0_18ck32 = 5.0 time = 330
* CHECK dout0_19 vdout0_19ck32 = 0 time = 330
* CHECK dout0_20 vdout0_20ck32 = 0 time = 330
* CHECK dout0_21 vdout0_21ck32 = 0 time = 330
* CHECK dout0_22 vdout0_22ck32 = 5.0 time = 330
* CHECK dout0_23 vdout0_23ck32 = 5.0 time = 330
* CHECK dout0_24 vdout0_24ck32 = 0 time = 330
* CHECK dout0_25 vdout0_25ck32 = 0 time = 330
* CHECK dout0_26 vdout0_26ck32 = 0 time = 330
* CHECK dout0_27 vdout0_27ck32 = 0 time = 330
* CHECK dout0_28 vdout0_28ck32 = 5.0 time = 330
* CHECK dout0_29 vdout0_29ck32 = 0 time = 330
* CHECK dout0_30 vdout0_30ck32 = 0 time = 330
* CHECK dout0_31 vdout0_31ck32 = 0 time = 330
* CHECK dout0_0 vdout0_0ck36 = 5.0 time = 370
* CHECK dout0_1 vdout0_1ck36 = 0 time = 370
* CHECK dout0_2 vdout0_2ck36 = 0 time = 370
* CHECK dout0_3 vdout0_3ck36 = 0 time = 370
* CHECK dout0_4 vdout0_4ck36 = 0 time = 370
* CHECK dout0_5 vdout0_5ck36 = 0 time = 370
* CHECK dout0_6 vdout0_6ck36 = 0 time = 370
* CHECK dout0_7 vdout0_7ck36 = 0 time = 370
* CHECK dout0_8 vdout0_8ck36 = 5.0 time = 370
* CHECK dout0_9 vdout0_9ck36 = 0 time = 370
* CHECK dout0_10 vdout0_10ck36 = 5.0 time = 370
* CHECK dout0_11 vdout0_11ck36 = 0 time = 370
* CHECK dout0_12 vdout0_12ck36 = 0 time = 370
* CHECK dout0_13 vdout0_13ck36 = 0 time = 370
* CHECK dout0_14 vdout0_14ck36 = 5.0 time = 370
* CHECK dout0_15 vdout0_15ck36 = 5.0 time = 370
* CHECK dout0_16 vdout0_16ck36 = 0 time = 370
* CHECK dout0_17 vdout0_17ck36 = 5.0 time = 370
* CHECK dout0_18 vdout0_18ck36 = 0 time = 370
* CHECK dout0_19 vdout0_19ck36 = 5.0 time = 370
* CHECK dout0_20 vdout0_20ck36 = 5.0 time = 370
* CHECK dout0_21 vdout0_21ck36 = 0 time = 370
* CHECK dout0_22 vdout0_22ck36 = 5.0 time = 370
* CHECK dout0_23 vdout0_23ck36 = 0 time = 370
* CHECK dout0_24 vdout0_24ck36 = 0 time = 370
* CHECK dout0_25 vdout0_25ck36 = 0 time = 370
* CHECK dout0_26 vdout0_26ck36 = 5.0 time = 370
* CHECK dout0_27 vdout0_27ck36 = 5.0 time = 370
* CHECK dout0_28 vdout0_28ck36 = 5.0 time = 370
* CHECK dout0_29 vdout0_29ck36 = 0 time = 370
* CHECK dout0_30 vdout0_30ck36 = 5.0 time = 370
* CHECK dout0_31 vdout0_31ck36 = 5.0 time = 370
* CHECK dout0_0 vdout0_0ck37 = 5.0 time = 380
* CHECK dout0_1 vdout0_1ck37 = 0 time = 380
* CHECK dout0_2 vdout0_2ck37 = 0 time = 380
* CHECK dout0_3 vdout0_3ck37 = 0 time = 380
* CHECK dout0_4 vdout0_4ck37 = 0 time = 380
* CHECK dout0_5 vdout0_5ck37 = 0 time = 380
* CHECK dout0_6 vdout0_6ck37 = 0 time = 380
* CHECK dout0_7 vdout0_7ck37 = 5.0 time = 380
* CHECK dout0_8 vdout0_8ck37 = 0 time = 380
* CHECK dout0_9 vdout0_9ck37 = 0 time = 380
* CHECK dout0_10 vdout0_10ck37 = 5.0 time = 380
* CHECK dout0_11 vdout0_11ck37 = 0 time = 380
* CHECK dout0_12 vdout0_12ck37 = 5.0 time = 380
* CHECK dout0_13 vdout0_13ck37 = 0 time = 380
* CHECK dout0_14 vdout0_14ck37 = 5.0 time = 380
* CHECK dout0_15 vdout0_15ck37 = 5.0 time = 380
* CHECK dout0_16 vdout0_16ck37 = 5.0 time = 380
* CHECK dout0_17 vdout0_17ck37 = 5.0 time = 380
* CHECK dout0_18 vdout0_18ck37 = 0 time = 380
* CHECK dout0_19 vdout0_19ck37 = 0 time = 380
* CHECK dout0_20 vdout0_20ck37 = 5.0 time = 380
* CHECK dout0_21 vdout0_21ck37 = 5.0 time = 380
* CHECK dout0_22 vdout0_22ck37 = 0 time = 380
* CHECK dout0_23 vdout0_23ck37 = 0 time = 380
* CHECK dout0_24 vdout0_24ck37 = 5.0 time = 380
* CHECK dout0_25 vdout0_25ck37 = 5.0 time = 380
* CHECK dout0_26 vdout0_26ck37 = 5.0 time = 380
* CHECK dout0_27 vdout0_27ck37 = 5.0 time = 380
* CHECK dout0_28 vdout0_28ck37 = 5.0 time = 380
* CHECK dout0_29 vdout0_29ck37 = 5.0 time = 380
* CHECK dout0_30 vdout0_30ck37 = 0 time = 380
* CHECK dout0_31 vdout0_31ck37 = 0 time = 380
* CHECK dout0_0 vdout0_0ck38 = 0 time = 390
* CHECK dout0_1 vdout0_1ck38 = 0 time = 390
* CHECK dout0_2 vdout0_2ck38 = 5.0 time = 390
* CHECK dout0_3 vdout0_3ck38 = 0 time = 390
* CHECK dout0_4 vdout0_4ck38 = 5.0 time = 390
* CHECK dout0_5 vdout0_5ck38 = 0 time = 390
* CHECK dout0_6 vdout0_6ck38 = 0 time = 390
* CHECK dout0_7 vdout0_7ck38 = 5.0 time = 390
* CHECK dout0_8 vdout0_8ck38 = 0 time = 390
* CHECK dout0_9 vdout0_9ck38 = 0 time = 390
* CHECK dout0_10 vdout0_10ck38 = 0 time = 390
* CHECK dout0_11 vdout0_11ck38 = 0 time = 390
* CHECK dout0_12 vdout0_12ck38 = 5.0 time = 390
* CHECK dout0_13 vdout0_13ck38 = 5.0 time = 390
* CHECK dout0_14 vdout0_14ck38 = 0 time = 390
* CHECK dout0_15 vdout0_15ck38 = 0 time = 390
* CHECK dout0_16 vdout0_16ck38 = 5.0 time = 390
* CHECK dout0_17 vdout0_17ck38 = 0 time = 390
* CHECK dout0_18 vdout0_18ck38 = 5.0 time = 390
* CHECK dout0_19 vdout0_19ck38 = 0 time = 390
* CHECK dout0_20 vdout0_20ck38 = 0 time = 390
* CHECK dout0_21 vdout0_21ck38 = 0 time = 390
* CHECK dout0_22 vdout0_22ck38 = 5.0 time = 390
* CHECK dout0_23 vdout0_23ck38 = 5.0 time = 390
* CHECK dout0_24 vdout0_24ck38 = 0 time = 390
* CHECK dout0_25 vdout0_25ck38 = 0 time = 390
* CHECK dout0_26 vdout0_26ck38 = 0 time = 390
* CHECK dout0_27 vdout0_27ck38 = 0 time = 390
* CHECK dout0_28 vdout0_28ck38 = 5.0 time = 390
* CHECK dout0_29 vdout0_29ck38 = 0 time = 390
* CHECK dout0_30 vdout0_30ck38 = 0 time = 390
* CHECK dout0_31 vdout0_31ck38 = 0 time = 390
* CHECK dout0_0 vdout0_0ck44 = 0 time = 450
* CHECK dout0_1 vdout0_1ck44 = 5.0 time = 450
* CHECK dout0_2 vdout0_2ck44 = 0 time = 450
* CHECK dout0_3 vdout0_3ck44 = 5.0 time = 450
* CHECK dout0_4 vdout0_4ck44 = 0 time = 450
* CHECK dout0_5 vdout0_5ck44 = 5.0 time = 450
* CHECK dout0_6 vdout0_6ck44 = 0 time = 450
* CHECK dout0_7 vdout0_7ck44 = 0 time = 450
* CHECK dout0_8 vdout0_8ck44 = 5.0 time = 450
* CHECK dout0_9 vdout0_9ck44 = 0 time = 450
* CHECK dout0_10 vdout0_10ck44 = 0 time = 450
* CHECK dout0_11 vdout0_11ck44 = 0 time = 450
* CHECK dout0_12 vdout0_12ck44 = 5.0 time = 450
* CHECK dout0_13 vdout0_13ck44 = 0 time = 450
* CHECK dout0_14 vdout0_14ck44 = 0 time = 450
* CHECK dout0_15 vdout0_15ck44 = 5.0 time = 450
* CHECK dout0_16 vdout0_16ck44 = 5.0 time = 450
* CHECK dout0_17 vdout0_17ck44 = 0 time = 450
* CHECK dout0_18 vdout0_18ck44 = 0 time = 450
* CHECK dout0_19 vdout0_19ck44 = 5.0 time = 450
* CHECK dout0_20 vdout0_20ck44 = 0 time = 450
* CHECK dout0_21 vdout0_21ck44 = 0 time = 450
* CHECK dout0_22 vdout0_22ck44 = 5.0 time = 450
* CHECK dout0_23 vdout0_23ck44 = 5.0 time = 450
* CHECK dout0_24 vdout0_24ck44 = 5.0 time = 450
* CHECK dout0_25 vdout0_25ck44 = 5.0 time = 450
* CHECK dout0_26 vdout0_26ck44 = 5.0 time = 450
* CHECK dout0_27 vdout0_27ck44 = 5.0 time = 450
* CHECK dout0_28 vdout0_28ck44 = 5.0 time = 450
* CHECK dout0_29 vdout0_29ck44 = 5.0 time = 450
* CHECK dout0_30 vdout0_30ck44 = 5.0 time = 450
* CHECK dout0_31 vdout0_31ck44 = 0 time = 450
* CHECK dout0_0 vdout0_0ck52 = 5.0 time = 530
* CHECK dout0_1 vdout0_1ck52 = 0 time = 530
* CHECK dout0_2 vdout0_2ck52 = 5.0 time = 530
* CHECK dout0_3 vdout0_3ck52 = 0 time = 530
* CHECK dout0_4 vdout0_4ck52 = 0 time = 530
* CHECK dout0_5 vdout0_5ck52 = 5.0 time = 530
* CHECK dout0_6 vdout0_6ck52 = 0 time = 530
* CHECK dout0_7 vdout0_7ck52 = 5.0 time = 530
* CHECK dout0_8 vdout0_8ck52 = 0 time = 530
* CHECK dout0_9 vdout0_9ck52 = 0 time = 530
* CHECK dout0_10 vdout0_10ck52 = 0 time = 530
* CHECK dout0_11 vdout0_11ck52 = 5.0 time = 530
* CHECK dout0_12 vdout0_12ck52 = 0 time = 530
* CHECK dout0_13 vdout0_13ck52 = 0 time = 530
* CHECK dout0_14 vdout0_14ck52 = 0 time = 530
* CHECK dout0_15 vdout0_15ck52 = 5.0 time = 530
* CHECK dout0_16 vdout0_16ck52 = 0 time = 530
* CHECK dout0_17 vdout0_17ck52 = 5.0 time = 530
* CHECK dout0_18 vdout0_18ck52 = 0 time = 530
* CHECK dout0_19 vdout0_19ck52 = 0 time = 530
* CHECK dout0_20 vdout0_20ck52 = 0 time = 530
* CHECK dout0_21 vdout0_21ck52 = 0 time = 530
* CHECK dout0_22 vdout0_22ck52 = 5.0 time = 530
* CHECK dout0_23 vdout0_23ck52 = 5.0 time = 530
* CHECK dout0_24 vdout0_24ck52 = 0 time = 530
* CHECK dout0_25 vdout0_25ck52 = 5.0 time = 530
* CHECK dout0_26 vdout0_26ck52 = 0 time = 530
* CHECK dout0_27 vdout0_27ck52 = 0 time = 530
* CHECK dout0_28 vdout0_28ck52 = 5.0 time = 530
* CHECK dout0_29 vdout0_29ck52 = 0 time = 530
* CHECK dout0_30 vdout0_30ck52 = 5.0 time = 530
* CHECK dout0_31 vdout0_31ck52 = 0 time = 530
* CHECK dout0_0 vdout0_0ck56 = 5.0 time = 570
* CHECK dout0_1 vdout0_1ck56 = 0 time = 570
* CHECK dout0_2 vdout0_2ck56 = 0 time = 570
* CHECK dout0_3 vdout0_3ck56 = 0 time = 570
* CHECK dout0_4 vdout0_4ck56 = 0 time = 570
* CHECK dout0_5 vdout0_5ck56 = 5.0 time = 570
* CHECK dout0_6 vdout0_6ck56 = 0 time = 570
* CHECK dout0_7 vdout0_7ck56 = 5.0 time = 570
* CHECK dout0_8 vdout0_8ck56 = 5.0 time = 570
* CHECK dout0_9 vdout0_9ck56 = 5.0 time = 570
* CHECK dout0_10 vdout0_10ck56 = 5.0 time = 570
* CHECK dout0_11 vdout0_11ck56 = 5.0 time = 570
* CHECK dout0_12 vdout0_12ck56 = 5.0 time = 570
* CHECK dout0_13 vdout0_13ck56 = 0 time = 570
* CHECK dout0_14 vdout0_14ck56 = 0 time = 570
* CHECK dout0_15 vdout0_15ck56 = 5.0 time = 570
* CHECK dout0_16 vdout0_16ck56 = 0 time = 570
* CHECK dout0_17 vdout0_17ck56 = 5.0 time = 570
* CHECK dout0_18 vdout0_18ck56 = 0 time = 570
* CHECK dout0_19 vdout0_19ck56 = 0 time = 570
* CHECK dout0_20 vdout0_20ck56 = 5.0 time = 570
* CHECK dout0_21 vdout0_21ck56 = 5.0 time = 570
* CHECK dout0_22 vdout0_22ck56 = 0 time = 570
* CHECK dout0_23 vdout0_23ck56 = 5.0 time = 570
* CHECK dout0_24 vdout0_24ck56 = 5.0 time = 570
* CHECK dout0_25 vdout0_25ck56 = 5.0 time = 570
* CHECK dout0_26 vdout0_26ck56 = 0 time = 570
* CHECK dout0_27 vdout0_27ck56 = 0 time = 570
* CHECK dout0_28 vdout0_28ck56 = 5.0 time = 570
* CHECK dout0_29 vdout0_29ck56 = 0 time = 570
* CHECK dout0_30 vdout0_30ck56 = 0 time = 570
* CHECK dout0_31 vdout0_31ck56 = 0 time = 570
* CHECK dout0_0 vdout0_0ck57 = 0 time = 580
* CHECK dout0_1 vdout0_1ck57 = 5.0 time = 580
* CHECK dout0_2 vdout0_2ck57 = 0 time = 580
* CHECK dout0_3 vdout0_3ck57 = 5.0 time = 580
* CHECK dout0_4 vdout0_4ck57 = 0 time = 580
* CHECK dout0_5 vdout0_5ck57 = 5.0 time = 580
* CHECK dout0_6 vdout0_6ck57 = 0 time = 580
* CHECK dout0_7 vdout0_7ck57 = 0 time = 580
* CHECK dout0_8 vdout0_8ck57 = 5.0 time = 580
* CHECK dout0_9 vdout0_9ck57 = 0 time = 580
* CHECK dout0_10 vdout0_10ck57 = 0 time = 580
* CHECK dout0_11 vdout0_11ck57 = 0 time = 580
* CHECK dout0_12 vdout0_12ck57 = 5.0 time = 580
* CHECK dout0_13 vdout0_13ck57 = 0 time = 580
* CHECK dout0_14 vdout0_14ck57 = 0 time = 580
* CHECK dout0_15 vdout0_15ck57 = 5.0 time = 580
* CHECK dout0_16 vdout0_16ck57 = 5.0 time = 580
* CHECK dout0_17 vdout0_17ck57 = 0 time = 580
* CHECK dout0_18 vdout0_18ck57 = 0 time = 580
* CHECK dout0_19 vdout0_19ck57 = 5.0 time = 580
* CHECK dout0_20 vdout0_20ck57 = 0 time = 580
* CHECK dout0_21 vdout0_21ck57 = 0 time = 580
* CHECK dout0_22 vdout0_22ck57 = 5.0 time = 580
* CHECK dout0_23 vdout0_23ck57 = 5.0 time = 580
* CHECK dout0_24 vdout0_24ck57 = 5.0 time = 580
* CHECK dout0_25 vdout0_25ck57 = 5.0 time = 580
* CHECK dout0_26 vdout0_26ck57 = 5.0 time = 580
* CHECK dout0_27 vdout0_27ck57 = 5.0 time = 580
* CHECK dout0_28 vdout0_28ck57 = 5.0 time = 580
* CHECK dout0_29 vdout0_29ck57 = 5.0 time = 580
* CHECK dout0_30 vdout0_30ck57 = 5.0 time = 580
* CHECK dout0_31 vdout0_31ck57 = 0 time = 580
* CHECK dout0_0 vdout0_0ck58 = 0 time = 590
* CHECK dout0_1 vdout0_1ck58 = 0 time = 590
* CHECK dout0_2 vdout0_2ck58 = 5.0 time = 590
* CHECK dout0_3 vdout0_3ck58 = 0 time = 590
* CHECK dout0_4 vdout0_4ck58 = 5.0 time = 590
* CHECK dout0_5 vdout0_5ck58 = 0 time = 590
* CHECK dout0_6 vdout0_6ck58 = 5.0 time = 590
* CHECK dout0_7 vdout0_7ck58 = 0 time = 590
* CHECK dout0_8 vdout0_8ck58 = 0 time = 590
* CHECK dout0_9 vdout0_9ck58 = 0 time = 590
* CHECK dout0_10 vdout0_10ck58 = 0 time = 590
* CHECK dout0_11 vdout0_11ck58 = 0 time = 590
* CHECK dout0_12 vdout0_12ck58 = 0 time = 590
* CHECK dout0_13 vdout0_13ck58 = 5.0 time = 590
* CHECK dout0_14 vdout0_14ck58 = 0 time = 590
* CHECK dout0_15 vdout0_15ck58 = 0 time = 590
* CHECK dout0_16 vdout0_16ck58 = 5.0 time = 590
* CHECK dout0_17 vdout0_17ck58 = 5.0 time = 590
* CHECK dout0_18 vdout0_18ck58 = 5.0 time = 590
* CHECK dout0_19 vdout0_19ck58 = 0 time = 590
* CHECK dout0_20 vdout0_20ck58 = 0 time = 590
* CHECK dout0_21 vdout0_21ck58 = 0 time = 590
* CHECK dout0_22 vdout0_22ck58 = 0 time = 590
* CHECK dout0_23 vdout0_23ck58 = 0 time = 590
* CHECK dout0_24 vdout0_24ck58 = 0 time = 590
* CHECK dout0_25 vdout0_25ck58 = 5.0 time = 590
* CHECK dout0_26 vdout0_26ck58 = 0 time = 590
* CHECK dout0_27 vdout0_27ck58 = 0 time = 590
* CHECK dout0_28 vdout0_28ck58 = 5.0 time = 590
* CHECK dout0_29 vdout0_29ck58 = 5.0 time = 590
* CHECK dout0_30 vdout0_30ck58 = 5.0 time = 590
* CHECK dout0_31 vdout0_31ck58 = 5.0 time = 590
* CHECK dout0_0 vdout0_0ck62 = 5.0 time = 630
* CHECK dout0_1 vdout0_1ck62 = 0 time = 630
* CHECK dout0_2 vdout0_2ck62 = 0 time = 630
* CHECK dout0_3 vdout0_3ck62 = 5.0 time = 630
* CHECK dout0_4 vdout0_4ck62 = 0 time = 630
* CHECK dout0_5 vdout0_5ck62 = 5.0 time = 630
* CHECK dout0_6 vdout0_6ck62 = 0 time = 630
* CHECK dout0_7 vdout0_7ck62 = 5.0 time = 630
* CHECK dout0_8 vdout0_8ck62 = 0 time = 630
* CHECK dout0_9 vdout0_9ck62 = 0 time = 630
* CHECK dout0_10 vdout0_10ck62 = 5.0 time = 630
* CHECK dout0_11 vdout0_11ck62 = 0 time = 630
* CHECK dout0_12 vdout0_12ck62 = 0 time = 630
* CHECK dout0_13 vdout0_13ck62 = 5.0 time = 630
* CHECK dout0_14 vdout0_14ck62 = 0 time = 630
* CHECK dout0_15 vdout0_15ck62 = 0 time = 630
* CHECK dout0_16 vdout0_16ck62 = 0 time = 630
* CHECK dout0_17 vdout0_17ck62 = 5.0 time = 630
* CHECK dout0_18 vdout0_18ck62 = 0 time = 630
* CHECK dout0_19 vdout0_19ck62 = 0 time = 630
* CHECK dout0_20 vdout0_20ck62 = 5.0 time = 630
* CHECK dout0_21 vdout0_21ck62 = 5.0 time = 630
* CHECK dout0_22 vdout0_22ck62 = 5.0 time = 630
* CHECK dout0_23 vdout0_23ck62 = 0 time = 630
* CHECK dout0_24 vdout0_24ck62 = 0 time = 630
* CHECK dout0_25 vdout0_25ck62 = 5.0 time = 630
* CHECK dout0_26 vdout0_26ck62 = 0 time = 630
* CHECK dout0_27 vdout0_27ck62 = 5.0 time = 630
* CHECK dout0_28 vdout0_28ck62 = 0 time = 630
* CHECK dout0_29 vdout0_29ck62 = 5.0 time = 630
* CHECK dout0_30 vdout0_30ck62 = 5.0 time = 630
* CHECK dout0_31 vdout0_31ck62 = 0 time = 630
* CHECK dout0_0 vdout0_0ck63 = 0 time = 640
* CHECK dout0_1 vdout0_1ck63 = 5.0 time = 640
* CHECK dout0_2 vdout0_2ck63 = 0 time = 640
* CHECK dout0_3 vdout0_3ck63 = 0 time = 640
* CHECK dout0_4 vdout0_4ck63 = 0 time = 640
* CHECK dout0_5 vdout0_5ck63 = 5.0 time = 640
* CHECK dout0_6 vdout0_6ck63 = 5.0 time = 640
* CHECK dout0_7 vdout0_7ck63 = 0 time = 640
* CHECK dout0_8 vdout0_8ck63 = 5.0 time = 640
* CHECK dout0_9 vdout0_9ck63 = 5.0 time = 640
* CHECK dout0_10 vdout0_10ck63 = 5.0 time = 640
* CHECK dout0_11 vdout0_11ck63 = 5.0 time = 640
* CHECK dout0_12 vdout0_12ck63 = 0 time = 640
* CHECK dout0_13 vdout0_13ck63 = 0 time = 640
* CHECK dout0_14 vdout0_14ck63 = 5.0 time = 640
* CHECK dout0_15 vdout0_15ck63 = 5.0 time = 640
* CHECK dout0_16 vdout0_16ck63 = 5.0 time = 640
* CHECK dout0_17 vdout0_17ck63 = 5.0 time = 640
* CHECK dout0_18 vdout0_18ck63 = 0 time = 640
* CHECK dout0_19 vdout0_19ck63 = 0 time = 640
* CHECK dout0_20 vdout0_20ck63 = 0 time = 640
* CHECK dout0_21 vdout0_21ck63 = 5.0 time = 640
* CHECK dout0_22 vdout0_22ck63 = 5.0 time = 640
* CHECK dout0_23 vdout0_23ck63 = 5.0 time = 640
* CHECK dout0_24 vdout0_24ck63 = 5.0 time = 640
* CHECK dout0_25 vdout0_25ck63 = 0 time = 640
* CHECK dout0_26 vdout0_26ck63 = 0 time = 640
* CHECK dout0_27 vdout0_27ck63 = 0 time = 640
* CHECK dout0_28 vdout0_28ck63 = 5.0 time = 640
* CHECK dout0_29 vdout0_29ck63 = 0 time = 640
* CHECK dout0_30 vdout0_30ck63 = 0 time = 640
* CHECK dout0_31 vdout0_31ck63 = 5.0 time = 640
* CHECK dout0_0 vdout0_0ck65 = 5.0 time = 660
* CHECK dout0_1 vdout0_1ck65 = 0 time = 660
* CHECK dout0_2 vdout0_2ck65 = 0 time = 660
* CHECK dout0_3 vdout0_3ck65 = 5.0 time = 660
* CHECK dout0_4 vdout0_4ck65 = 0 time = 660
* CHECK dout0_5 vdout0_5ck65 = 5.0 time = 660
* CHECK dout0_6 vdout0_6ck65 = 0 time = 660
* CHECK dout0_7 vdout0_7ck65 = 5.0 time = 660
* CHECK dout0_8 vdout0_8ck65 = 0 time = 660
* CHECK dout0_9 vdout0_9ck65 = 0 time = 660
* CHECK dout0_10 vdout0_10ck65 = 5.0 time = 660
* CHECK dout0_11 vdout0_11ck65 = 0 time = 660
* CHECK dout0_12 vdout0_12ck65 = 0 time = 660
* CHECK dout0_13 vdout0_13ck65 = 5.0 time = 660
* CHECK dout0_14 vdout0_14ck65 = 0 time = 660
* CHECK dout0_15 vdout0_15ck65 = 0 time = 660
* CHECK dout0_16 vdout0_16ck65 = 0 time = 660
* CHECK dout0_17 vdout0_17ck65 = 5.0 time = 660
* CHECK dout0_18 vdout0_18ck65 = 0 time = 660
* CHECK dout0_19 vdout0_19ck65 = 0 time = 660
* CHECK dout0_20 vdout0_20ck65 = 5.0 time = 660
* CHECK dout0_21 vdout0_21ck65 = 5.0 time = 660
* CHECK dout0_22 vdout0_22ck65 = 5.0 time = 660
* CHECK dout0_23 vdout0_23ck65 = 0 time = 660
* CHECK dout0_24 vdout0_24ck65 = 0 time = 660
* CHECK dout0_25 vdout0_25ck65 = 5.0 time = 660
* CHECK dout0_26 vdout0_26ck65 = 0 time = 660
* CHECK dout0_27 vdout0_27ck65 = 5.0 time = 660
* CHECK dout0_28 vdout0_28ck65 = 0 time = 660
* CHECK dout0_29 vdout0_29ck65 = 5.0 time = 660
* CHECK dout0_30 vdout0_30ck65 = 5.0 time = 660
* CHECK dout0_31 vdout0_31ck65 = 0 time = 660
* CHECK dout0_0 vdout0_0ck69 = 0 time = 700
* CHECK dout0_1 vdout0_1ck69 = 0 time = 700
* CHECK dout0_2 vdout0_2ck69 = 5.0 time = 700
* CHECK dout0_3 vdout0_3ck69 = 0 time = 700
* CHECK dout0_4 vdout0_4ck69 = 0 time = 700
* CHECK dout0_5 vdout0_5ck69 = 5.0 time = 700
* CHECK dout0_6 vdout0_6ck69 = 0 time = 700
* CHECK dout0_7 vdout0_7ck69 = 0 time = 700
* CHECK dout0_8 vdout0_8ck69 = 5.0 time = 700
* CHECK dout0_9 vdout0_9ck69 = 5.0 time = 700
* CHECK dout0_10 vdout0_10ck69 = 0 time = 700
* CHECK dout0_11 vdout0_11ck69 = 0 time = 700
* CHECK dout0_12 vdout0_12ck69 = 5.0 time = 700
* CHECK dout0_13 vdout0_13ck69 = 5.0 time = 700
* CHECK dout0_14 vdout0_14ck69 = 5.0 time = 700
* CHECK dout0_15 vdout0_15ck69 = 0 time = 700
* CHECK dout0_16 vdout0_16ck69 = 0 time = 700
* CHECK dout0_17 vdout0_17ck69 = 0 time = 700
* CHECK dout0_18 vdout0_18ck69 = 0 time = 700
* CHECK dout0_19 vdout0_19ck69 = 0 time = 700
* CHECK dout0_20 vdout0_20ck69 = 5.0 time = 700
* CHECK dout0_21 vdout0_21ck69 = 5.0 time = 700
* CHECK dout0_22 vdout0_22ck69 = 0 time = 700
* CHECK dout0_23 vdout0_23ck69 = 0 time = 700
* CHECK dout0_24 vdout0_24ck69 = 5.0 time = 700
* CHECK dout0_25 vdout0_25ck69 = 5.0 time = 700
* CHECK dout0_26 vdout0_26ck69 = 5.0 time = 700
* CHECK dout0_27 vdout0_27ck69 = 5.0 time = 700
* CHECK dout0_28 vdout0_28ck69 = 0 time = 700
* CHECK dout0_29 vdout0_29ck69 = 5.0 time = 700
* CHECK dout0_30 vdout0_30ck69 = 5.0 time = 700
* CHECK dout0_31 vdout0_31ck69 = 5.0 time = 700
* CHECK dout0_0 vdout0_0ck71 = 0 time = 720
* CHECK dout0_1 vdout0_1ck71 = 5.0 time = 720
* CHECK dout0_2 vdout0_2ck71 = 5.0 time = 720
* CHECK dout0_3 vdout0_3ck71 = 0 time = 720
* CHECK dout0_4 vdout0_4ck71 = 5.0 time = 720
* CHECK dout0_5 vdout0_5ck71 = 0 time = 720
* CHECK dout0_6 vdout0_6ck71 = 5.0 time = 720
* CHECK dout0_7 vdout0_7ck71 = 5.0 time = 720
* CHECK dout0_8 vdout0_8ck71 = 5.0 time = 720
* CHECK dout0_9 vdout0_9ck71 = 5.0 time = 720
* CHECK dout0_10 vdout0_10ck71 = 0 time = 720
* CHECK dout0_11 vdout0_11ck71 = 0 time = 720
* CHECK dout0_12 vdout0_12ck71 = 0 time = 720
* CHECK dout0_13 vdout0_13ck71 = 0 time = 720
* CHECK dout0_14 vdout0_14ck71 = 0 time = 720
* CHECK dout0_15 vdout0_15ck71 = 5.0 time = 720
* CHECK dout0_16 vdout0_16ck71 = 5.0 time = 720
* CHECK dout0_17 vdout0_17ck71 = 0 time = 720
* CHECK dout0_18 vdout0_18ck71 = 5.0 time = 720
* CHECK dout0_19 vdout0_19ck71 = 0 time = 720
* CHECK dout0_20 vdout0_20ck71 = 5.0 time = 720
* CHECK dout0_21 vdout0_21ck71 = 0 time = 720
* CHECK dout0_22 vdout0_22ck71 = 5.0 time = 720
* CHECK dout0_23 vdout0_23ck71 = 0 time = 720
* CHECK dout0_24 vdout0_24ck71 = 0 time = 720
* CHECK dout0_25 vdout0_25ck71 = 5.0 time = 720
* CHECK dout0_26 vdout0_26ck71 = 5.0 time = 720
* CHECK dout0_27 vdout0_27ck71 = 0 time = 720
* CHECK dout0_28 vdout0_28ck71 = 0 time = 720
* CHECK dout0_29 vdout0_29ck71 = 5.0 time = 720
* CHECK dout0_30 vdout0_30ck71 = 0 time = 720
* CHECK dout0_31 vdout0_31ck71 = 0 time = 720
* CHECK dout0_0 vdout0_0ck77 = 5.0 time = 780
* CHECK dout0_1 vdout0_1ck77 = 0 time = 780
* CHECK dout0_2 vdout0_2ck77 = 0 time = 780
* CHECK dout0_3 vdout0_3ck77 = 0 time = 780
* CHECK dout0_4 vdout0_4ck77 = 0 time = 780
* CHECK dout0_5 vdout0_5ck77 = 0 time = 780
* CHECK dout0_6 vdout0_6ck77 = 0 time = 780
* CHECK dout0_7 vdout0_7ck77 = 0 time = 780
* CHECK dout0_8 vdout0_8ck77 = 5.0 time = 780
* CHECK dout0_9 vdout0_9ck77 = 0 time = 780
* CHECK dout0_10 vdout0_10ck77 = 5.0 time = 780
* CHECK dout0_11 vdout0_11ck77 = 5.0 time = 780
* CHECK dout0_12 vdout0_12ck77 = 0 time = 780
* CHECK dout0_13 vdout0_13ck77 = 5.0 time = 780
* CHECK dout0_14 vdout0_14ck77 = 5.0 time = 780
* CHECK dout0_15 vdout0_15ck77 = 0 time = 780
* CHECK dout0_16 vdout0_16ck77 = 5.0 time = 780
* CHECK dout0_17 vdout0_17ck77 = 5.0 time = 780
* CHECK dout0_18 vdout0_18ck77 = 0 time = 780
* CHECK dout0_19 vdout0_19ck77 = 5.0 time = 780
* CHECK dout0_20 vdout0_20ck77 = 0 time = 780
* CHECK dout0_21 vdout0_21ck77 = 0 time = 780
* CHECK dout0_22 vdout0_22ck77 = 5.0 time = 780
* CHECK dout0_23 vdout0_23ck77 = 0 time = 780
* CHECK dout0_24 vdout0_24ck77 = 0 time = 780
* CHECK dout0_25 vdout0_25ck77 = 5.0 time = 780
* CHECK dout0_26 vdout0_26ck77 = 0 time = 780
* CHECK dout0_27 vdout0_27ck77 = 5.0 time = 780
* CHECK dout0_28 vdout0_28ck77 = 0 time = 780
* CHECK dout0_29 vdout0_29ck77 = 5.0 time = 780
* CHECK dout0_30 vdout0_30ck77 = 0 time = 780
* CHECK dout0_31 vdout0_31ck77 = 5.0 time = 780
* CHECK dout0_0 vdout0_0ck79 = 5.0 time = 800
* CHECK dout0_1 vdout0_1ck79 = 0 time = 800
* CHECK dout0_2 vdout0_2ck79 = 0 time = 800
* CHECK dout0_3 vdout0_3ck79 = 5.0 time = 800
* CHECK dout0_4 vdout0_4ck79 = 5.0 time = 800
* CHECK dout0_5 vdout0_5ck79 = 0 time = 800
* CHECK dout0_6 vdout0_6ck79 = 5.0 time = 800
* CHECK dout0_7 vdout0_7ck79 = 0 time = 800
* CHECK dout0_8 vdout0_8ck79 = 0 time = 800
* CHECK dout0_9 vdout0_9ck79 = 0 time = 800
* CHECK dout0_10 vdout0_10ck79 = 0 time = 800
* CHECK dout0_11 vdout0_11ck79 = 0 time = 800
* CHECK dout0_12 vdout0_12ck79 = 5.0 time = 800
* CHECK dout0_13 vdout0_13ck79 = 0 time = 800
* CHECK dout0_14 vdout0_14ck79 = 0 time = 800
* CHECK dout0_15 vdout0_15ck79 = 5.0 time = 800
* CHECK dout0_16 vdout0_16ck79 = 5.0 time = 800
* CHECK dout0_17 vdout0_17ck79 = 5.0 time = 800
* CHECK dout0_18 vdout0_18ck79 = 5.0 time = 800
* CHECK dout0_19 vdout0_19ck79 = 5.0 time = 800
* CHECK dout0_20 vdout0_20ck79 = 5.0 time = 800
* CHECK dout0_21 vdout0_21ck79 = 5.0 time = 800
* CHECK dout0_22 vdout0_22ck79 = 0 time = 800
* CHECK dout0_23 vdout0_23ck79 = 0 time = 800
* CHECK dout0_24 vdout0_24ck79 = 5.0 time = 800
* CHECK dout0_25 vdout0_25ck79 = 5.0 time = 800
* CHECK dout0_26 vdout0_26ck79 = 0 time = 800
* CHECK dout0_27 vdout0_27ck79 = 5.0 time = 800
* CHECK dout0_28 vdout0_28ck79 = 5.0 time = 800
* CHECK dout0_29 vdout0_29ck79 = 0 time = 800
* CHECK dout0_30 vdout0_30ck79 = 5.0 time = 800
* CHECK dout0_31 vdout0_31ck79 = 5.0 time = 800
* CHECK dout0_0 vdout0_0ck80 = 5.0 time = 810
* CHECK dout0_1 vdout0_1ck80 = 0 time = 810
* CHECK dout0_2 vdout0_2ck80 = 0 time = 810
* CHECK dout0_3 vdout0_3ck80 = 5.0 time = 810
* CHECK dout0_4 vdout0_4ck80 = 5.0 time = 810
* CHECK dout0_5 vdout0_5ck80 = 0 time = 810
* CHECK dout0_6 vdout0_6ck80 = 5.0 time = 810
* CHECK dout0_7 vdout0_7ck80 = 0 time = 810
* CHECK dout0_8 vdout0_8ck80 = 0 time = 810
* CHECK dout0_9 vdout0_9ck80 = 0 time = 810
* CHECK dout0_10 vdout0_10ck80 = 0 time = 810
* CHECK dout0_11 vdout0_11ck80 = 0 time = 810
* CHECK dout0_12 vdout0_12ck80 = 5.0 time = 810
* CHECK dout0_13 vdout0_13ck80 = 0 time = 810
* CHECK dout0_14 vdout0_14ck80 = 0 time = 810
* CHECK dout0_15 vdout0_15ck80 = 5.0 time = 810
* CHECK dout0_16 vdout0_16ck80 = 5.0 time = 810
* CHECK dout0_17 vdout0_17ck80 = 5.0 time = 810
* CHECK dout0_18 vdout0_18ck80 = 5.0 time = 810
* CHECK dout0_19 vdout0_19ck80 = 5.0 time = 810
* CHECK dout0_20 vdout0_20ck80 = 5.0 time = 810
* CHECK dout0_21 vdout0_21ck80 = 5.0 time = 810
* CHECK dout0_22 vdout0_22ck80 = 0 time = 810
* CHECK dout0_23 vdout0_23ck80 = 0 time = 810
* CHECK dout0_24 vdout0_24ck80 = 5.0 time = 810
* CHECK dout0_25 vdout0_25ck80 = 5.0 time = 810
* CHECK dout0_26 vdout0_26ck80 = 0 time = 810
* CHECK dout0_27 vdout0_27ck80 = 5.0 time = 810
* CHECK dout0_28 vdout0_28ck80 = 5.0 time = 810
* CHECK dout0_29 vdout0_29ck80 = 0 time = 810
* CHECK dout0_30 vdout0_30ck80 = 5.0 time = 810
* CHECK dout0_31 vdout0_31ck80 = 5.0 time = 810
* CHECK dout0_0 vdout0_0ck81 = 0 time = 820
* CHECK dout0_1 vdout0_1ck81 = 5.0 time = 820
* CHECK dout0_2 vdout0_2ck81 = 5.0 time = 820
* CHECK dout0_3 vdout0_3ck81 = 0 time = 820
* CHECK dout0_4 vdout0_4ck81 = 5.0 time = 820
* CHECK dout0_5 vdout0_5ck81 = 0 time = 820
* CHECK dout0_6 vdout0_6ck81 = 5.0 time = 820
* CHECK dout0_7 vdout0_7ck81 = 5.0 time = 820
* CHECK dout0_8 vdout0_8ck81 = 5.0 time = 820
* CHECK dout0_9 vdout0_9ck81 = 5.0 time = 820
* CHECK dout0_10 vdout0_10ck81 = 0 time = 820
* CHECK dout0_11 vdout0_11ck81 = 0 time = 820
* CHECK dout0_12 vdout0_12ck81 = 0 time = 820
* CHECK dout0_13 vdout0_13ck81 = 0 time = 820
* CHECK dout0_14 vdout0_14ck81 = 0 time = 820
* CHECK dout0_15 vdout0_15ck81 = 5.0 time = 820
* CHECK dout0_16 vdout0_16ck81 = 5.0 time = 820
* CHECK dout0_17 vdout0_17ck81 = 0 time = 820
* CHECK dout0_18 vdout0_18ck81 = 5.0 time = 820
* CHECK dout0_19 vdout0_19ck81 = 0 time = 820
* CHECK dout0_20 vdout0_20ck81 = 5.0 time = 820
* CHECK dout0_21 vdout0_21ck81 = 0 time = 820
* CHECK dout0_22 vdout0_22ck81 = 5.0 time = 820
* CHECK dout0_23 vdout0_23ck81 = 0 time = 820
* CHECK dout0_24 vdout0_24ck81 = 0 time = 820
* CHECK dout0_25 vdout0_25ck81 = 5.0 time = 820
* CHECK dout0_26 vdout0_26ck81 = 5.0 time = 820
* CHECK dout0_27 vdout0_27ck81 = 0 time = 820
* CHECK dout0_28 vdout0_28ck81 = 0 time = 820
* CHECK dout0_29 vdout0_29ck81 = 5.0 time = 820
* CHECK dout0_30 vdout0_30ck81 = 0 time = 820
* CHECK dout0_31 vdout0_31ck81 = 0 time = 820
* CHECK dout0_0 vdout0_0ck83 = 0 time = 840
* CHECK dout0_1 vdout0_1ck83 = 5.0 time = 840
* CHECK dout0_2 vdout0_2ck83 = 5.0 time = 840
* CHECK dout0_3 vdout0_3ck83 = 0 time = 840
* CHECK dout0_4 vdout0_4ck83 = 5.0 time = 840
* CHECK dout0_5 vdout0_5ck83 = 0 time = 840
* CHECK dout0_6 vdout0_6ck83 = 5.0 time = 840
* CHECK dout0_7 vdout0_7ck83 = 5.0 time = 840
* CHECK dout0_8 vdout0_8ck83 = 5.0 time = 840
* CHECK dout0_9 vdout0_9ck83 = 5.0 time = 840
* CHECK dout0_10 vdout0_10ck83 = 0 time = 840
* CHECK dout0_11 vdout0_11ck83 = 0 time = 840
* CHECK dout0_12 vdout0_12ck83 = 0 time = 840
* CHECK dout0_13 vdout0_13ck83 = 0 time = 840
* CHECK dout0_14 vdout0_14ck83 = 0 time = 840
* CHECK dout0_15 vdout0_15ck83 = 5.0 time = 840
* CHECK dout0_16 vdout0_16ck83 = 5.0 time = 840
* CHECK dout0_17 vdout0_17ck83 = 0 time = 840
* CHECK dout0_18 vdout0_18ck83 = 5.0 time = 840
* CHECK dout0_19 vdout0_19ck83 = 0 time = 840
* CHECK dout0_20 vdout0_20ck83 = 5.0 time = 840
* CHECK dout0_21 vdout0_21ck83 = 0 time = 840
* CHECK dout0_22 vdout0_22ck83 = 5.0 time = 840
* CHECK dout0_23 vdout0_23ck83 = 0 time = 840
* CHECK dout0_24 vdout0_24ck83 = 0 time = 840
* CHECK dout0_25 vdout0_25ck83 = 5.0 time = 840
* CHECK dout0_26 vdout0_26ck83 = 5.0 time = 840
* CHECK dout0_27 vdout0_27ck83 = 0 time = 840
* CHECK dout0_28 vdout0_28ck83 = 0 time = 840
* CHECK dout0_29 vdout0_29ck83 = 5.0 time = 840
* CHECK dout0_30 vdout0_30ck83 = 0 time = 840
* CHECK dout0_31 vdout0_31ck83 = 0 time = 840
* CHECK dout0_0 vdout0_0ck84 = 0 time = 850
* CHECK dout0_1 vdout0_1ck84 = 5.0 time = 850
* CHECK dout0_2 vdout0_2ck84 = 5.0 time = 850
* CHECK dout0_3 vdout0_3ck84 = 0 time = 850
* CHECK dout0_4 vdout0_4ck84 = 5.0 time = 850
* CHECK dout0_5 vdout0_5ck84 = 0 time = 850
* CHECK dout0_6 vdout0_6ck84 = 5.0 time = 850
* CHECK dout0_7 vdout0_7ck84 = 5.0 time = 850
* CHECK dout0_8 vdout0_8ck84 = 5.0 time = 850
* CHECK dout0_9 vdout0_9ck84 = 5.0 time = 850
* CHECK dout0_10 vdout0_10ck84 = 0 time = 850
* CHECK dout0_11 vdout0_11ck84 = 0 time = 850
* CHECK dout0_12 vdout0_12ck84 = 0 time = 850
* CHECK dout0_13 vdout0_13ck84 = 0 time = 850
* CHECK dout0_14 vdout0_14ck84 = 0 time = 850
* CHECK dout0_15 vdout0_15ck84 = 5.0 time = 850
* CHECK dout0_16 vdout0_16ck84 = 5.0 time = 850
* CHECK dout0_17 vdout0_17ck84 = 0 time = 850
* CHECK dout0_18 vdout0_18ck84 = 5.0 time = 850
* CHECK dout0_19 vdout0_19ck84 = 0 time = 850
* CHECK dout0_20 vdout0_20ck84 = 5.0 time = 850
* CHECK dout0_21 vdout0_21ck84 = 0 time = 850
* CHECK dout0_22 vdout0_22ck84 = 5.0 time = 850
* CHECK dout0_23 vdout0_23ck84 = 0 time = 850
* CHECK dout0_24 vdout0_24ck84 = 0 time = 850
* CHECK dout0_25 vdout0_25ck84 = 5.0 time = 850
* CHECK dout0_26 vdout0_26ck84 = 5.0 time = 850
* CHECK dout0_27 vdout0_27ck84 = 0 time = 850
* CHECK dout0_28 vdout0_28ck84 = 0 time = 850
* CHECK dout0_29 vdout0_29ck84 = 5.0 time = 850
* CHECK dout0_30 vdout0_30ck84 = 0 time = 850
* CHECK dout0_31 vdout0_31ck84 = 0 time = 850
* CHECK dout0_0 vdout0_0ck86 = 0 time = 870
* CHECK dout0_1 vdout0_1ck86 = 5.0 time = 870
* CHECK dout0_2 vdout0_2ck86 = 5.0 time = 870
* CHECK dout0_3 vdout0_3ck86 = 0 time = 870
* CHECK dout0_4 vdout0_4ck86 = 5.0 time = 870
* CHECK dout0_5 vdout0_5ck86 = 0 time = 870
* CHECK dout0_6 vdout0_6ck86 = 5.0 time = 870
* CHECK dout0_7 vdout0_7ck86 = 5.0 time = 870
* CHECK dout0_8 vdout0_8ck86 = 5.0 time = 870
* CHECK dout0_9 vdout0_9ck86 = 5.0 time = 870
* CHECK dout0_10 vdout0_10ck86 = 0 time = 870
* CHECK dout0_11 vdout0_11ck86 = 0 time = 870
* CHECK dout0_12 vdout0_12ck86 = 0 time = 870
* CHECK dout0_13 vdout0_13ck86 = 0 time = 870
* CHECK dout0_14 vdout0_14ck86 = 0 time = 870
* CHECK dout0_15 vdout0_15ck86 = 5.0 time = 870
* CHECK dout0_16 vdout0_16ck86 = 5.0 time = 870
* CHECK dout0_17 vdout0_17ck86 = 0 time = 870
* CHECK dout0_18 vdout0_18ck86 = 5.0 time = 870
* CHECK dout0_19 vdout0_19ck86 = 0 time = 870
* CHECK dout0_20 vdout0_20ck86 = 5.0 time = 870
* CHECK dout0_21 vdout0_21ck86 = 0 time = 870
* CHECK dout0_22 vdout0_22ck86 = 5.0 time = 870
* CHECK dout0_23 vdout0_23ck86 = 0 time = 870
* CHECK dout0_24 vdout0_24ck86 = 0 time = 870
* CHECK dout0_25 vdout0_25ck86 = 5.0 time = 870
* CHECK dout0_26 vdout0_26ck86 = 5.0 time = 870
* CHECK dout0_27 vdout0_27ck86 = 0 time = 870
* CHECK dout0_28 vdout0_28ck86 = 0 time = 870
* CHECK dout0_29 vdout0_29ck86 = 5.0 time = 870
* CHECK dout0_30 vdout0_30ck86 = 0 time = 870
* CHECK dout0_31 vdout0_31ck86 = 0 time = 870
* CHECK dout0_0 vdout0_0ck89 = 0 time = 900
* CHECK dout0_1 vdout0_1ck89 = 5.0 time = 900
* CHECK dout0_2 vdout0_2ck89 = 0 time = 900
* CHECK dout0_3 vdout0_3ck89 = 0 time = 900
* CHECK dout0_4 vdout0_4ck89 = 5.0 time = 900
* CHECK dout0_5 vdout0_5ck89 = 5.0 time = 900
* CHECK dout0_6 vdout0_6ck89 = 5.0 time = 900
* CHECK dout0_7 vdout0_7ck89 = 0 time = 900
* CHECK dout0_8 vdout0_8ck89 = 5.0 time = 900
* CHECK dout0_9 vdout0_9ck89 = 0 time = 900
* CHECK dout0_10 vdout0_10ck89 = 5.0 time = 900
* CHECK dout0_11 vdout0_11ck89 = 5.0 time = 900
* CHECK dout0_12 vdout0_12ck89 = 0 time = 900
* CHECK dout0_13 vdout0_13ck89 = 5.0 time = 900
* CHECK dout0_14 vdout0_14ck89 = 5.0 time = 900
* CHECK dout0_15 vdout0_15ck89 = 0 time = 900
* CHECK dout0_16 vdout0_16ck89 = 5.0 time = 900
* CHECK dout0_17 vdout0_17ck89 = 5.0 time = 900
* CHECK dout0_18 vdout0_18ck89 = 0 time = 900
* CHECK dout0_19 vdout0_19ck89 = 0 time = 900
* CHECK dout0_20 vdout0_20ck89 = 0 time = 900
* CHECK dout0_21 vdout0_21ck89 = 0 time = 900
* CHECK dout0_22 vdout0_22ck89 = 0 time = 900
* CHECK dout0_23 vdout0_23ck89 = 0 time = 900
* CHECK dout0_24 vdout0_24ck89 = 5.0 time = 900
* CHECK dout0_25 vdout0_25ck89 = 0 time = 900
* CHECK dout0_26 vdout0_26ck89 = 0 time = 900
* CHECK dout0_27 vdout0_27ck89 = 5.0 time = 900
* CHECK dout0_28 vdout0_28ck89 = 5.0 time = 900
* CHECK dout0_29 vdout0_29ck89 = 5.0 time = 900
* CHECK dout0_30 vdout0_30ck89 = 5.0 time = 900
* CHECK dout0_31 vdout0_31ck89 = 0 time = 900
* CHECK dout0_0 vdout0_0ck90 = 0 time = 910
* CHECK dout0_1 vdout0_1ck90 = 5.0 time = 910
* CHECK dout0_2 vdout0_2ck90 = 5.0 time = 910
* CHECK dout0_3 vdout0_3ck90 = 0 time = 910
* CHECK dout0_4 vdout0_4ck90 = 5.0 time = 910
* CHECK dout0_5 vdout0_5ck90 = 0 time = 910
* CHECK dout0_6 vdout0_6ck90 = 5.0 time = 910
* CHECK dout0_7 vdout0_7ck90 = 5.0 time = 910
* CHECK dout0_8 vdout0_8ck90 = 5.0 time = 910
* CHECK dout0_9 vdout0_9ck90 = 5.0 time = 910
* CHECK dout0_10 vdout0_10ck90 = 0 time = 910
* CHECK dout0_11 vdout0_11ck90 = 0 time = 910
* CHECK dout0_12 vdout0_12ck90 = 0 time = 910
* CHECK dout0_13 vdout0_13ck90 = 0 time = 910
* CHECK dout0_14 vdout0_14ck90 = 0 time = 910
* CHECK dout0_15 vdout0_15ck90 = 5.0 time = 910
* CHECK dout0_16 vdout0_16ck90 = 5.0 time = 910
* CHECK dout0_17 vdout0_17ck90 = 0 time = 910
* CHECK dout0_18 vdout0_18ck90 = 5.0 time = 910
* CHECK dout0_19 vdout0_19ck90 = 0 time = 910
* CHECK dout0_20 vdout0_20ck90 = 5.0 time = 910
* CHECK dout0_21 vdout0_21ck90 = 0 time = 910
* CHECK dout0_22 vdout0_22ck90 = 5.0 time = 910
* CHECK dout0_23 vdout0_23ck90 = 0 time = 910
* CHECK dout0_24 vdout0_24ck90 = 0 time = 910
* CHECK dout0_25 vdout0_25ck90 = 5.0 time = 910
* CHECK dout0_26 vdout0_26ck90 = 5.0 time = 910
* CHECK dout0_27 vdout0_27ck90 = 0 time = 910
* CHECK dout0_28 vdout0_28ck90 = 0 time = 910
* CHECK dout0_29 vdout0_29ck90 = 5.0 time = 910
* CHECK dout0_30 vdout0_30ck90 = 0 time = 910
* CHECK dout0_31 vdout0_31ck90 = 0 time = 910
* CHECK dout0_0 vdout0_0ck93 = 5.0 time = 940
* CHECK dout0_1 vdout0_1ck93 = 0 time = 940
* CHECK dout0_2 vdout0_2ck93 = 0 time = 940
* CHECK dout0_3 vdout0_3ck93 = 0 time = 940
* CHECK dout0_4 vdout0_4ck93 = 0 time = 940
* CHECK dout0_5 vdout0_5ck93 = 5.0 time = 940
* CHECK dout0_6 vdout0_6ck93 = 0 time = 940
* CHECK dout0_7 vdout0_7ck93 = 5.0 time = 940
* CHECK dout0_8 vdout0_8ck93 = 5.0 time = 940
* CHECK dout0_9 vdout0_9ck93 = 5.0 time = 940
* CHECK dout0_10 vdout0_10ck93 = 5.0 time = 940
* CHECK dout0_11 vdout0_11ck93 = 5.0 time = 940
* CHECK dout0_12 vdout0_12ck93 = 5.0 time = 940
* CHECK dout0_13 vdout0_13ck93 = 0 time = 940
* CHECK dout0_14 vdout0_14ck93 = 0 time = 940
* CHECK dout0_15 vdout0_15ck93 = 5.0 time = 940
* CHECK dout0_16 vdout0_16ck93 = 5.0 time = 940
* CHECK dout0_17 vdout0_17ck93 = 5.0 time = 940
* CHECK dout0_18 vdout0_18ck93 = 5.0 time = 940
* CHECK dout0_19 vdout0_19ck93 = 5.0 time = 940
* CHECK dout0_20 vdout0_20ck93 = 0 time = 940
* CHECK dout0_21 vdout0_21ck93 = 0 time = 940
* CHECK dout0_22 vdout0_22ck93 = 0 time = 940
* CHECK dout0_23 vdout0_23ck93 = 0 time = 940
* CHECK dout0_24 vdout0_24ck93 = 5.0 time = 940
* CHECK dout0_25 vdout0_25ck93 = 5.0 time = 940
* CHECK dout0_26 vdout0_26ck93 = 0 time = 940
* CHECK dout0_27 vdout0_27ck93 = 0 time = 940
* CHECK dout0_28 vdout0_28ck93 = 0 time = 940
* CHECK dout0_29 vdout0_29ck93 = 5.0 time = 940
* CHECK dout0_30 vdout0_30ck93 = 5.0 time = 940
* CHECK dout0_31 vdout0_31ck93 = 5.0 time = 940
* CHECK dout0_0 vdout0_0ck96 = 5.0 time = 970
* CHECK dout0_1 vdout0_1ck96 = 0 time = 970
* CHECK dout0_2 vdout0_2ck96 = 0 time = 970
* CHECK dout0_3 vdout0_3ck96 = 5.0 time = 970
* CHECK dout0_4 vdout0_4ck96 = 5.0 time = 970
* CHECK dout0_5 vdout0_5ck96 = 0 time = 970
* CHECK dout0_6 vdout0_6ck96 = 5.0 time = 970
* CHECK dout0_7 vdout0_7ck96 = 0 time = 970
* CHECK dout0_8 vdout0_8ck96 = 0 time = 970
* CHECK dout0_9 vdout0_9ck96 = 0 time = 970
* CHECK dout0_10 vdout0_10ck96 = 5.0 time = 970
* CHECK dout0_11 vdout0_11ck96 = 5.0 time = 970
* CHECK dout0_12 vdout0_12ck96 = 5.0 time = 970
* CHECK dout0_13 vdout0_13ck96 = 5.0 time = 970
* CHECK dout0_14 vdout0_14ck96 = 0 time = 970
* CHECK dout0_15 vdout0_15ck96 = 5.0 time = 970
* CHECK dout0_16 vdout0_16ck96 = 5.0 time = 970
* CHECK dout0_17 vdout0_17ck96 = 5.0 time = 970
* CHECK dout0_18 vdout0_18ck96 = 5.0 time = 970
* CHECK dout0_19 vdout0_19ck96 = 5.0 time = 970
* CHECK dout0_20 vdout0_20ck96 = 5.0 time = 970
* CHECK dout0_21 vdout0_21ck96 = 5.0 time = 970
* CHECK dout0_22 vdout0_22ck96 = 0 time = 970
* CHECK dout0_23 vdout0_23ck96 = 0 time = 970
* CHECK dout0_24 vdout0_24ck96 = 5.0 time = 970
* CHECK dout0_25 vdout0_25ck96 = 5.0 time = 970
* CHECK dout0_26 vdout0_26ck96 = 0 time = 970
* CHECK dout0_27 vdout0_27ck96 = 5.0 time = 970
* CHECK dout0_28 vdout0_28ck96 = 5.0 time = 970
* CHECK dout0_29 vdout0_29ck96 = 0 time = 970
* CHECK dout0_30 vdout0_30ck96 = 5.0 time = 970
* CHECK dout0_31 vdout0_31ck96 = 5.0 time = 970
* CHECK dout0_0 vdout0_0ck98 = 5.0 time = 990
* CHECK dout0_1 vdout0_1ck98 = 5.0 time = 990
* CHECK dout0_2 vdout0_2ck98 = 5.0 time = 990
* CHECK dout0_3 vdout0_3ck98 = 5.0 time = 990
* CHECK dout0_4 vdout0_4ck98 = 0 time = 990
* CHECK dout0_5 vdout0_5ck98 = 0 time = 990
* CHECK dout0_6 vdout0_6ck98 = 0 time = 990
* CHECK dout0_7 vdout0_7ck98 = 0 time = 990
* CHECK dout0_8 vdout0_8ck98 = 0 time = 990
* CHECK dout0_9 vdout0_9ck98 = 0 time = 990
* CHECK dout0_10 vdout0_10ck98 = 5.0 time = 990
* CHECK dout0_11 vdout0_11ck98 = 5.0 time = 990
* CHECK dout0_12 vdout0_12ck98 = 5.0 time = 990
* CHECK dout0_13 vdout0_13ck98 = 5.0 time = 990
* CHECK dout0_14 vdout0_14ck98 = 0 time = 990
* CHECK dout0_15 vdout0_15ck98 = 5.0 time = 990
* CHECK dout0_16 vdout0_16ck98 = 5.0 time = 990
* CHECK dout0_17 vdout0_17ck98 = 5.0 time = 990
* CHECK dout0_18 vdout0_18ck98 = 5.0 time = 990
* CHECK dout0_19 vdout0_19ck98 = 5.0 time = 990
* CHECK dout0_20 vdout0_20ck98 = 5.0 time = 990
* CHECK dout0_21 vdout0_21ck98 = 5.0 time = 990
* CHECK dout0_22 vdout0_22ck98 = 0 time = 990
* CHECK dout0_23 vdout0_23ck98 = 0 time = 990
* CHECK dout0_24 vdout0_24ck98 = 5.0 time = 990
* CHECK dout0_25 vdout0_25ck98 = 5.0 time = 990
* CHECK dout0_26 vdout0_26ck98 = 0 time = 990
* CHECK dout0_27 vdout0_27ck98 = 5.0 time = 990
* CHECK dout0_28 vdout0_28ck98 = 5.0 time = 990
* CHECK dout0_29 vdout0_29ck98 = 0 time = 990
* CHECK dout0_30 vdout0_30ck98 = 5.0 time = 990
* CHECK dout0_31 vdout0_31ck98 = 5.0 time = 990
* CHECK dout0_0 vdout0_0ck99 = 0 time = 1000
* CHECK dout0_1 vdout0_1ck99 = 5.0 time = 1000
* CHECK dout0_2 vdout0_2ck99 = 0 time = 1000
* CHECK dout0_3 vdout0_3ck99 = 0 time = 1000
* CHECK dout0_4 vdout0_4ck99 = 5.0 time = 1000
* CHECK dout0_5 vdout0_5ck99 = 5.0 time = 1000
* CHECK dout0_6 vdout0_6ck99 = 5.0 time = 1000
* CHECK dout0_7 vdout0_7ck99 = 0 time = 1000
* CHECK dout0_8 vdout0_8ck99 = 5.0 time = 1000
* CHECK dout0_9 vdout0_9ck99 = 0 time = 1000
* CHECK dout0_10 vdout0_10ck99 = 5.0 time = 1000
* CHECK dout0_11 vdout0_11ck99 = 5.0 time = 1000
* CHECK dout0_12 vdout0_12ck99 = 0 time = 1000
* CHECK dout0_13 vdout0_13ck99 = 5.0 time = 1000
* CHECK dout0_14 vdout0_14ck99 = 5.0 time = 1000
* CHECK dout0_15 vdout0_15ck99 = 0 time = 1000
* CHECK dout0_16 vdout0_16ck99 = 5.0 time = 1000
* CHECK dout0_17 vdout0_17ck99 = 5.0 time = 1000
* CHECK dout0_18 vdout0_18ck99 = 0 time = 1000
* CHECK dout0_19 vdout0_19ck99 = 0 time = 1000
* CHECK dout0_20 vdout0_20ck99 = 0 time = 1000
* CHECK dout0_21 vdout0_21ck99 = 0 time = 1000
* CHECK dout0_22 vdout0_22ck99 = 5.0 time = 1000
* CHECK dout0_23 vdout0_23ck99 = 5.0 time = 1000
* CHECK dout0_24 vdout0_24ck99 = 5.0 time = 1000
* CHECK dout0_25 vdout0_25ck99 = 0 time = 1000
* CHECK dout0_26 vdout0_26ck99 = 0 time = 1000
* CHECK dout0_27 vdout0_27ck99 = 5.0 time = 1000
* CHECK dout0_28 vdout0_28ck99 = 5.0 time = 1000
* CHECK dout0_29 vdout0_29ck99 = 5.0 time = 1000
* CHECK dout0_30 vdout0_30ck99 = 5.0 time = 1000
* CHECK dout0_31 vdout0_31ck99 = 0 time = 1000
* CHECK dout0_0 vdout0_0ck101 = 5.0 time = 1020
* CHECK dout0_1 vdout0_1ck101 = 5.0 time = 1020
* CHECK dout0_2 vdout0_2ck101 = 5.0 time = 1020
* CHECK dout0_3 vdout0_3ck101 = 5.0 time = 1020
* CHECK dout0_4 vdout0_4ck101 = 0 time = 1020
* CHECK dout0_5 vdout0_5ck101 = 0 time = 1020
* CHECK dout0_6 vdout0_6ck101 = 0 time = 1020
* CHECK dout0_7 vdout0_7ck101 = 0 time = 1020
* CHECK dout0_8 vdout0_8ck101 = 0 time = 1020
* CHECK dout0_9 vdout0_9ck101 = 0 time = 1020
* CHECK dout0_10 vdout0_10ck101 = 5.0 time = 1020
* CHECK dout0_11 vdout0_11ck101 = 5.0 time = 1020
* CHECK dout0_12 vdout0_12ck101 = 5.0 time = 1020
* CHECK dout0_13 vdout0_13ck101 = 5.0 time = 1020
* CHECK dout0_14 vdout0_14ck101 = 0 time = 1020
* CHECK dout0_15 vdout0_15ck101 = 5.0 time = 1020
* CHECK dout0_16 vdout0_16ck101 = 5.0 time = 1020
* CHECK dout0_17 vdout0_17ck101 = 5.0 time = 1020
* CHECK dout0_18 vdout0_18ck101 = 5.0 time = 1020
* CHECK dout0_19 vdout0_19ck101 = 5.0 time = 1020
* CHECK dout0_20 vdout0_20ck101 = 5.0 time = 1020
* CHECK dout0_21 vdout0_21ck101 = 5.0 time = 1020
* CHECK dout0_22 vdout0_22ck101 = 0 time = 1020
* CHECK dout0_23 vdout0_23ck101 = 0 time = 1020
* CHECK dout0_24 vdout0_24ck101 = 5.0 time = 1020
* CHECK dout0_25 vdout0_25ck101 = 5.0 time = 1020
* CHECK dout0_26 vdout0_26ck101 = 0 time = 1020
* CHECK dout0_27 vdout0_27ck101 = 5.0 time = 1020
* CHECK dout0_28 vdout0_28ck101 = 5.0 time = 1020
* CHECK dout0_29 vdout0_29ck101 = 0 time = 1020
* CHECK dout0_30 vdout0_30ck101 = 5.0 time = 1020
* CHECK dout0_31 vdout0_31ck101 = 5.0 time = 1020
* CHECK dout0_0 vdout0_0ck103 = 0 time = 1040
* CHECK dout0_1 vdout0_1ck103 = 5.0 time = 1040
* CHECK dout0_2 vdout0_2ck103 = 5.0 time = 1040
* CHECK dout0_3 vdout0_3ck103 = 0 time = 1040
* CHECK dout0_4 vdout0_4ck103 = 5.0 time = 1040
* CHECK dout0_5 vdout0_5ck103 = 0 time = 1040
* CHECK dout0_6 vdout0_6ck103 = 5.0 time = 1040
* CHECK dout0_7 vdout0_7ck103 = 5.0 time = 1040
* CHECK dout0_8 vdout0_8ck103 = 5.0 time = 1040
* CHECK dout0_9 vdout0_9ck103 = 5.0 time = 1040
* CHECK dout0_10 vdout0_10ck103 = 0 time = 1040
* CHECK dout0_11 vdout0_11ck103 = 0 time = 1040
* CHECK dout0_12 vdout0_12ck103 = 0 time = 1040
* CHECK dout0_13 vdout0_13ck103 = 0 time = 1040
* CHECK dout0_14 vdout0_14ck103 = 0 time = 1040
* CHECK dout0_15 vdout0_15ck103 = 5.0 time = 1040
* CHECK dout0_16 vdout0_16ck103 = 5.0 time = 1040
* CHECK dout0_17 vdout0_17ck103 = 0 time = 1040
* CHECK dout0_18 vdout0_18ck103 = 5.0 time = 1040
* CHECK dout0_19 vdout0_19ck103 = 0 time = 1040
* CHECK dout0_20 vdout0_20ck103 = 5.0 time = 1040
* CHECK dout0_21 vdout0_21ck103 = 0 time = 1040
* CHECK dout0_22 vdout0_22ck103 = 5.0 time = 1040
* CHECK dout0_23 vdout0_23ck103 = 0 time = 1040
* CHECK dout0_24 vdout0_24ck103 = 0 time = 1040
* CHECK dout0_25 vdout0_25ck103 = 5.0 time = 1040
* CHECK dout0_26 vdout0_26ck103 = 5.0 time = 1040
* CHECK dout0_27 vdout0_27ck103 = 0 time = 1040
* CHECK dout0_28 vdout0_28ck103 = 0 time = 1040
* CHECK dout0_29 vdout0_29ck103 = 5.0 time = 1040
* CHECK dout0_30 vdout0_30ck103 = 0 time = 1040
* CHECK dout0_31 vdout0_31ck103 = 0 time = 1040
* CHECK dout0_0 vdout0_0ck104 = 0 time = 1050
* CHECK dout0_1 vdout0_1ck104 = 5.0 time = 1050
* CHECK dout0_2 vdout0_2ck104 = 5.0 time = 1050
* CHECK dout0_3 vdout0_3ck104 = 0 time = 1050
* CHECK dout0_4 vdout0_4ck104 = 5.0 time = 1050
* CHECK dout0_5 vdout0_5ck104 = 0 time = 1050
* CHECK dout0_6 vdout0_6ck104 = 5.0 time = 1050
* CHECK dout0_7 vdout0_7ck104 = 5.0 time = 1050
* CHECK dout0_8 vdout0_8ck104 = 5.0 time = 1050
* CHECK dout0_9 vdout0_9ck104 = 5.0 time = 1050
* CHECK dout0_10 vdout0_10ck104 = 0 time = 1050
* CHECK dout0_11 vdout0_11ck104 = 0 time = 1050
* CHECK dout0_12 vdout0_12ck104 = 0 time = 1050
* CHECK dout0_13 vdout0_13ck104 = 0 time = 1050
* CHECK dout0_14 vdout0_14ck104 = 0 time = 1050
* CHECK dout0_15 vdout0_15ck104 = 5.0 time = 1050
* CHECK dout0_16 vdout0_16ck104 = 5.0 time = 1050
* CHECK dout0_17 vdout0_17ck104 = 0 time = 1050
* CHECK dout0_18 vdout0_18ck104 = 5.0 time = 1050
* CHECK dout0_19 vdout0_19ck104 = 0 time = 1050
* CHECK dout0_20 vdout0_20ck104 = 5.0 time = 1050
* CHECK dout0_21 vdout0_21ck104 = 0 time = 1050
* CHECK dout0_22 vdout0_22ck104 = 5.0 time = 1050
* CHECK dout0_23 vdout0_23ck104 = 0 time = 1050
* CHECK dout0_24 vdout0_24ck104 = 0 time = 1050
* CHECK dout0_25 vdout0_25ck104 = 5.0 time = 1050
* CHECK dout0_26 vdout0_26ck104 = 5.0 time = 1050
* CHECK dout0_27 vdout0_27ck104 = 0 time = 1050
* CHECK dout0_28 vdout0_28ck104 = 0 time = 1050
* CHECK dout0_29 vdout0_29ck104 = 5.0 time = 1050
* CHECK dout0_30 vdout0_30ck104 = 0 time = 1050
* CHECK dout0_31 vdout0_31ck104 = 0 time = 1050
* CHECK dout0_0 vdout0_0ck105 = 0 time = 1060
* CHECK dout0_1 vdout0_1ck105 = 0 time = 1060
* CHECK dout0_2 vdout0_2ck105 = 5.0 time = 1060
* CHECK dout0_3 vdout0_3ck105 = 5.0 time = 1060
* CHECK dout0_4 vdout0_4ck105 = 0 time = 1060
* CHECK dout0_5 vdout0_5ck105 = 5.0 time = 1060
* CHECK dout0_6 vdout0_6ck105 = 0 time = 1060
* CHECK dout0_7 vdout0_7ck105 = 0 time = 1060
* CHECK dout0_8 vdout0_8ck105 = 0 time = 1060
* CHECK dout0_9 vdout0_9ck105 = 5.0 time = 1060
* CHECK dout0_10 vdout0_10ck105 = 0 time = 1060
* CHECK dout0_11 vdout0_11ck105 = 5.0 time = 1060
* CHECK dout0_12 vdout0_12ck105 = 5.0 time = 1060
* CHECK dout0_13 vdout0_13ck105 = 0 time = 1060
* CHECK dout0_14 vdout0_14ck105 = 0 time = 1060
* CHECK dout0_15 vdout0_15ck105 = 5.0 time = 1060
* CHECK dout0_16 vdout0_16ck105 = 5.0 time = 1060
* CHECK dout0_17 vdout0_17ck105 = 5.0 time = 1060
* CHECK dout0_18 vdout0_18ck105 = 0 time = 1060
* CHECK dout0_19 vdout0_19ck105 = 0 time = 1060
* CHECK dout0_20 vdout0_20ck105 = 0 time = 1060
* CHECK dout0_21 vdout0_21ck105 = 0 time = 1060
* CHECK dout0_22 vdout0_22ck105 = 5.0 time = 1060
* CHECK dout0_23 vdout0_23ck105 = 5.0 time = 1060
* CHECK dout0_24 vdout0_24ck105 = 0 time = 1060
* CHECK dout0_25 vdout0_25ck105 = 5.0 time = 1060
* CHECK dout0_26 vdout0_26ck105 = 0 time = 1060
* CHECK dout0_27 vdout0_27ck105 = 5.0 time = 1060
* CHECK dout0_28 vdout0_28ck105 = 0 time = 1060
* CHECK dout0_29 vdout0_29ck105 = 0 time = 1060
* CHECK dout0_30 vdout0_30ck105 = 0 time = 1060
* CHECK dout0_31 vdout0_31ck105 = 5.0 time = 1060
* CHECK dout0_0 vdout0_0ck106 = 0 time = 1070
* CHECK dout0_1 vdout0_1ck106 = 0 time = 1070
* CHECK dout0_2 vdout0_2ck106 = 5.0 time = 1070
* CHECK dout0_3 vdout0_3ck106 = 5.0 time = 1070
* CHECK dout0_4 vdout0_4ck106 = 0 time = 1070
* CHECK dout0_5 vdout0_5ck106 = 5.0 time = 1070
* CHECK dout0_6 vdout0_6ck106 = 0 time = 1070
* CHECK dout0_7 vdout0_7ck106 = 0 time = 1070
* CHECK dout0_8 vdout0_8ck106 = 0 time = 1070
* CHECK dout0_9 vdout0_9ck106 = 5.0 time = 1070
* CHECK dout0_10 vdout0_10ck106 = 0 time = 1070
* CHECK dout0_11 vdout0_11ck106 = 5.0 time = 1070
* CHECK dout0_12 vdout0_12ck106 = 5.0 time = 1070
* CHECK dout0_13 vdout0_13ck106 = 0 time = 1070
* CHECK dout0_14 vdout0_14ck106 = 0 time = 1070
* CHECK dout0_15 vdout0_15ck106 = 5.0 time = 1070
* CHECK dout0_16 vdout0_16ck106 = 5.0 time = 1070
* CHECK dout0_17 vdout0_17ck106 = 5.0 time = 1070
* CHECK dout0_18 vdout0_18ck106 = 0 time = 1070
* CHECK dout0_19 vdout0_19ck106 = 0 time = 1070
* CHECK dout0_20 vdout0_20ck106 = 0 time = 1070
* CHECK dout0_21 vdout0_21ck106 = 0 time = 1070
* CHECK dout0_22 vdout0_22ck106 = 5.0 time = 1070
* CHECK dout0_23 vdout0_23ck106 = 5.0 time = 1070
* CHECK dout0_24 vdout0_24ck106 = 0 time = 1070
* CHECK dout0_25 vdout0_25ck106 = 5.0 time = 1070
* CHECK dout0_26 vdout0_26ck106 = 0 time = 1070
* CHECK dout0_27 vdout0_27ck106 = 5.0 time = 1070
* CHECK dout0_28 vdout0_28ck106 = 0 time = 1070
* CHECK dout0_29 vdout0_29ck106 = 0 time = 1070
* CHECK dout0_30 vdout0_30ck106 = 0 time = 1070
* CHECK dout0_31 vdout0_31ck106 = 5.0 time = 1070
* CHECK dout0_0 vdout0_0ck110 = 5.0 time = 1110
* CHECK dout0_1 vdout0_1ck110 = 0 time = 1110
* CHECK dout0_2 vdout0_2ck110 = 0 time = 1110
* CHECK dout0_3 vdout0_3ck110 = 5.0 time = 1110
* CHECK dout0_4 vdout0_4ck110 = 0 time = 1110
* CHECK dout0_5 vdout0_5ck110 = 5.0 time = 1110
* CHECK dout0_6 vdout0_6ck110 = 0 time = 1110
* CHECK dout0_7 vdout0_7ck110 = 5.0 time = 1110
* CHECK dout0_8 vdout0_8ck110 = 0 time = 1110
* CHECK dout0_9 vdout0_9ck110 = 5.0 time = 1110
* CHECK dout0_10 vdout0_10ck110 = 5.0 time = 1110
* CHECK dout0_11 vdout0_11ck110 = 5.0 time = 1110
* CHECK dout0_12 vdout0_12ck110 = 5.0 time = 1110
* CHECK dout0_13 vdout0_13ck110 = 0 time = 1110
* CHECK dout0_14 vdout0_14ck110 = 0 time = 1110
* CHECK dout0_15 vdout0_15ck110 = 5.0 time = 1110
* CHECK dout0_16 vdout0_16ck110 = 5.0 time = 1110
* CHECK dout0_17 vdout0_17ck110 = 5.0 time = 1110
* CHECK dout0_18 vdout0_18ck110 = 5.0 time = 1110
* CHECK dout0_19 vdout0_19ck110 = 5.0 time = 1110
* CHECK dout0_20 vdout0_20ck110 = 0 time = 1110
* CHECK dout0_21 vdout0_21ck110 = 0 time = 1110
* CHECK dout0_22 vdout0_22ck110 = 0 time = 1110
* CHECK dout0_23 vdout0_23ck110 = 0 time = 1110
* CHECK dout0_24 vdout0_24ck110 = 0 time = 1110
* CHECK dout0_25 vdout0_25ck110 = 5.0 time = 1110
* CHECK dout0_26 vdout0_26ck110 = 0 time = 1110
* CHECK dout0_27 vdout0_27ck110 = 0 time = 1110
* CHECK dout0_28 vdout0_28ck110 = 5.0 time = 1110
* CHECK dout0_29 vdout0_29ck110 = 0 time = 1110
* CHECK dout0_30 vdout0_30ck110 = 0 time = 1110
* CHECK dout0_31 vdout0_31ck110 = 5.0 time = 1110
* CHECK dout0_0 vdout0_0ck114 = 5.0 time = 1150
* CHECK dout0_1 vdout0_1ck114 = 5.0 time = 1150
* CHECK dout0_2 vdout0_2ck114 = 5.0 time = 1150
* CHECK dout0_3 vdout0_3ck114 = 0 time = 1150
* CHECK dout0_4 vdout0_4ck114 = 5.0 time = 1150
* CHECK dout0_5 vdout0_5ck114 = 5.0 time = 1150
* CHECK dout0_6 vdout0_6ck114 = 0 time = 1150
* CHECK dout0_7 vdout0_7ck114 = 5.0 time = 1150
* CHECK dout0_8 vdout0_8ck114 = 5.0 time = 1150
* CHECK dout0_9 vdout0_9ck114 = 5.0 time = 1150
* CHECK dout0_10 vdout0_10ck114 = 5.0 time = 1150
* CHECK dout0_11 vdout0_11ck114 = 0 time = 1150
* CHECK dout0_12 vdout0_12ck114 = 5.0 time = 1150
* CHECK dout0_13 vdout0_13ck114 = 5.0 time = 1150
* CHECK dout0_14 vdout0_14ck114 = 5.0 time = 1150
* CHECK dout0_15 vdout0_15ck114 = 0 time = 1150
* CHECK dout0_16 vdout0_16ck114 = 5.0 time = 1150
* CHECK dout0_17 vdout0_17ck114 = 0 time = 1150
* CHECK dout0_18 vdout0_18ck114 = 0 time = 1150
* CHECK dout0_19 vdout0_19ck114 = 0 time = 1150
* CHECK dout0_20 vdout0_20ck114 = 0 time = 1150
* CHECK dout0_21 vdout0_21ck114 = 0 time = 1150
* CHECK dout0_22 vdout0_22ck114 = 5.0 time = 1150
* CHECK dout0_23 vdout0_23ck114 = 0 time = 1150
* CHECK dout0_24 vdout0_24ck114 = 0 time = 1150
* CHECK dout0_25 vdout0_25ck114 = 0 time = 1150
* CHECK dout0_26 vdout0_26ck114 = 0 time = 1150
* CHECK dout0_27 vdout0_27ck114 = 5.0 time = 1150
* CHECK dout0_28 vdout0_28ck114 = 0 time = 1150
* CHECK dout0_29 vdout0_29ck114 = 0 time = 1150
* CHECK dout0_30 vdout0_30ck114 = 5.0 time = 1150
* CHECK dout0_31 vdout0_31ck114 = 5.0 time = 1150
* CHECK dout0_0 vdout0_0ck118 = 0 time = 1190
* CHECK dout0_1 vdout0_1ck118 = 5.0 time = 1190
* CHECK dout0_2 vdout0_2ck118 = 0 time = 1190
* CHECK dout0_3 vdout0_3ck118 = 5.0 time = 1190
* CHECK dout0_4 vdout0_4ck118 = 0 time = 1190
* CHECK dout0_5 vdout0_5ck118 = 5.0 time = 1190
* CHECK dout0_6 vdout0_6ck118 = 5.0 time = 1190
* CHECK dout0_7 vdout0_7ck118 = 5.0 time = 1190
* CHECK dout0_8 vdout0_8ck118 = 5.0 time = 1190
* CHECK dout0_9 vdout0_9ck118 = 0 time = 1190
* CHECK dout0_10 vdout0_10ck118 = 5.0 time = 1190
* CHECK dout0_11 vdout0_11ck118 = 5.0 time = 1190
* CHECK dout0_12 vdout0_12ck118 = 5.0 time = 1190
* CHECK dout0_13 vdout0_13ck118 = 0 time = 1190
* CHECK dout0_14 vdout0_14ck118 = 0 time = 1190
* CHECK dout0_15 vdout0_15ck118 = 0 time = 1190
* CHECK dout0_16 vdout0_16ck118 = 5.0 time = 1190
* CHECK dout0_17 vdout0_17ck118 = 5.0 time = 1190
* CHECK dout0_18 vdout0_18ck118 = 5.0 time = 1190
* CHECK dout0_19 vdout0_19ck118 = 5.0 time = 1190
* CHECK dout0_20 vdout0_20ck118 = 5.0 time = 1190
* CHECK dout0_21 vdout0_21ck118 = 5.0 time = 1190
* CHECK dout0_22 vdout0_22ck118 = 0 time = 1190
* CHECK dout0_23 vdout0_23ck118 = 0 time = 1190
* CHECK dout0_24 vdout0_24ck118 = 0 time = 1190
* CHECK dout0_25 vdout0_25ck118 = 5.0 time = 1190
* CHECK dout0_26 vdout0_26ck118 = 0 time = 1190
* CHECK dout0_27 vdout0_27ck118 = 0 time = 1190
* CHECK dout0_28 vdout0_28ck118 = 0 time = 1190
* CHECK dout0_29 vdout0_29ck118 = 0 time = 1190
* CHECK dout0_30 vdout0_30ck118 = 5.0 time = 1190
* CHECK dout0_31 vdout0_31ck118 = 5.0 time = 1190
* CHECK dout0_0 vdout0_0ck124 = 0 time = 1250
* CHECK dout0_1 vdout0_1ck124 = 5.0 time = 1250
* CHECK dout0_2 vdout0_2ck124 = 0 time = 1250
* CHECK dout0_3 vdout0_3ck124 = 5.0 time = 1250
* CHECK dout0_4 vdout0_4ck124 = 5.0 time = 1250
* CHECK dout0_5 vdout0_5ck124 = 5.0 time = 1250
* CHECK dout0_6 vdout0_6ck124 = 5.0 time = 1250
* CHECK dout0_7 vdout0_7ck124 = 0 time = 1250
* CHECK dout0_8 vdout0_8ck124 = 5.0 time = 1250
* CHECK dout0_9 vdout0_9ck124 = 0 time = 1250
* CHECK dout0_10 vdout0_10ck124 = 5.0 time = 1250
* CHECK dout0_11 vdout0_11ck124 = 0 time = 1250
* CHECK dout0_12 vdout0_12ck124 = 0 time = 1250
* CHECK dout0_13 vdout0_13ck124 = 5.0 time = 1250
* CHECK dout0_14 vdout0_14ck124 = 0 time = 1250
* CHECK dout0_15 vdout0_15ck124 = 0 time = 1250
* CHECK dout0_16 vdout0_16ck124 = 0 time = 1250
* CHECK dout0_17 vdout0_17ck124 = 5.0 time = 1250
* CHECK dout0_18 vdout0_18ck124 = 0 time = 1250
* CHECK dout0_19 vdout0_19ck124 = 0 time = 1250
* CHECK dout0_20 vdout0_20ck124 = 0 time = 1250
* CHECK dout0_21 vdout0_21ck124 = 5.0 time = 1250
* CHECK dout0_22 vdout0_22ck124 = 0 time = 1250
* CHECK dout0_23 vdout0_23ck124 = 0 time = 1250
* CHECK dout0_24 vdout0_24ck124 = 0 time = 1250
* CHECK dout0_25 vdout0_25ck124 = 5.0 time = 1250
* CHECK dout0_26 vdout0_26ck124 = 5.0 time = 1250
* CHECK dout0_27 vdout0_27ck124 = 5.0 time = 1250
* CHECK dout0_28 vdout0_28ck124 = 5.0 time = 1250
* CHECK dout0_29 vdout0_29ck124 = 5.0 time = 1250
* CHECK dout0_30 vdout0_30ck124 = 0 time = 1250
* CHECK dout0_31 vdout0_31ck124 = 0 time = 1250
* CHECK dout0_0 vdout0_0ck125 = 5.0 time = 1260
* CHECK dout0_1 vdout0_1ck125 = 0 time = 1260
* CHECK dout0_2 vdout0_2ck125 = 0 time = 1260
* CHECK dout0_3 vdout0_3ck125 = 5.0 time = 1260
* CHECK dout0_4 vdout0_4ck125 = 0 time = 1260
* CHECK dout0_5 vdout0_5ck125 = 5.0 time = 1260
* CHECK dout0_6 vdout0_6ck125 = 0 time = 1260
* CHECK dout0_7 vdout0_7ck125 = 5.0 time = 1260
* CHECK dout0_8 vdout0_8ck125 = 0 time = 1260
* CHECK dout0_9 vdout0_9ck125 = 5.0 time = 1260
* CHECK dout0_10 vdout0_10ck125 = 5.0 time = 1260
* CHECK dout0_11 vdout0_11ck125 = 5.0 time = 1260
* CHECK dout0_12 vdout0_12ck125 = 5.0 time = 1260
* CHECK dout0_13 vdout0_13ck125 = 0 time = 1260
* CHECK dout0_14 vdout0_14ck125 = 0 time = 1260
* CHECK dout0_15 vdout0_15ck125 = 5.0 time = 1260
* CHECK dout0_16 vdout0_16ck125 = 5.0 time = 1260
* CHECK dout0_17 vdout0_17ck125 = 5.0 time = 1260
* CHECK dout0_18 vdout0_18ck125 = 5.0 time = 1260
* CHECK dout0_19 vdout0_19ck125 = 5.0 time = 1260
* CHECK dout0_20 vdout0_20ck125 = 0 time = 1260
* CHECK dout0_21 vdout0_21ck125 = 0 time = 1260
* CHECK dout0_22 vdout0_22ck125 = 0 time = 1260
* CHECK dout0_23 vdout0_23ck125 = 0 time = 1260
* CHECK dout0_24 vdout0_24ck125 = 0 time = 1260
* CHECK dout0_25 vdout0_25ck125 = 5.0 time = 1260
* CHECK dout0_26 vdout0_26ck125 = 0 time = 1260
* CHECK dout0_27 vdout0_27ck125 = 0 time = 1260
* CHECK dout0_28 vdout0_28ck125 = 5.0 time = 1260
* CHECK dout0_29 vdout0_29ck125 = 0 time = 1260
* CHECK dout0_30 vdout0_30ck125 = 0 time = 1260
* CHECK dout0_31 vdout0_31ck125 = 5.0 time = 1260
* CHECK dout0_0 vdout0_0ck126 = 5.0 time = 1270
* CHECK dout0_1 vdout0_1ck126 = 0 time = 1270
* CHECK dout0_2 vdout0_2ck126 = 5.0 time = 1270
* CHECK dout0_3 vdout0_3ck126 = 0 time = 1270
* CHECK dout0_4 vdout0_4ck126 = 5.0 time = 1270
* CHECK dout0_5 vdout0_5ck126 = 0 time = 1270
* CHECK dout0_6 vdout0_6ck126 = 0 time = 1270
* CHECK dout0_7 vdout0_7ck126 = 0 time = 1270
* CHECK dout0_8 vdout0_8ck126 = 0 time = 1270
* CHECK dout0_9 vdout0_9ck126 = 5.0 time = 1270
* CHECK dout0_10 vdout0_10ck126 = 0 time = 1270
* CHECK dout0_11 vdout0_11ck126 = 0 time = 1270
* CHECK dout0_12 vdout0_12ck126 = 0 time = 1270
* CHECK dout0_13 vdout0_13ck126 = 5.0 time = 1270
* CHECK dout0_14 vdout0_14ck126 = 5.0 time = 1270
* CHECK dout0_15 vdout0_15ck126 = 0 time = 1270
* CHECK dout0_16 vdout0_16ck126 = 5.0 time = 1270
* CHECK dout0_17 vdout0_17ck126 = 0 time = 1270
* CHECK dout0_18 vdout0_18ck126 = 5.0 time = 1270
* CHECK dout0_19 vdout0_19ck126 = 5.0 time = 1270
* CHECK dout0_20 vdout0_20ck126 = 5.0 time = 1270
* CHECK dout0_21 vdout0_21ck126 = 0 time = 1270
* CHECK dout0_22 vdout0_22ck126 = 5.0 time = 1270
* CHECK dout0_23 vdout0_23ck126 = 5.0 time = 1270
* CHECK dout0_24 vdout0_24ck126 = 5.0 time = 1270
* CHECK dout0_25 vdout0_25ck126 = 0 time = 1270
* CHECK dout0_26 vdout0_26ck126 = 0 time = 1270
* CHECK dout0_27 vdout0_27ck126 = 0 time = 1270
* CHECK dout0_28 vdout0_28ck126 = 5.0 time = 1270
* CHECK dout0_29 vdout0_29ck126 = 0 time = 1270
* CHECK dout0_30 vdout0_30ck126 = 5.0 time = 1270
* CHECK dout0_31 vdout0_31ck126 = 5.0 time = 1270
* CHECK dout0_0 vdout0_0ck129 = 0 time = 1300
* CHECK dout0_1 vdout0_1ck129 = 5.0 time = 1300
* CHECK dout0_2 vdout0_2ck129 = 0 time = 1300
* CHECK dout0_3 vdout0_3ck129 = 5.0 time = 1300
* CHECK dout0_4 vdout0_4ck129 = 0 time = 1300
* CHECK dout0_5 vdout0_5ck129 = 5.0 time = 1300
* CHECK dout0_6 vdout0_6ck129 = 5.0 time = 1300
* CHECK dout0_7 vdout0_7ck129 = 5.0 time = 1300
* CHECK dout0_8 vdout0_8ck129 = 5.0 time = 1300
* CHECK dout0_9 vdout0_9ck129 = 0 time = 1300
* CHECK dout0_10 vdout0_10ck129 = 5.0 time = 1300
* CHECK dout0_11 vdout0_11ck129 = 5.0 time = 1300
* CHECK dout0_12 vdout0_12ck129 = 5.0 time = 1300
* CHECK dout0_13 vdout0_13ck129 = 0 time = 1300
* CHECK dout0_14 vdout0_14ck129 = 0 time = 1300
* CHECK dout0_15 vdout0_15ck129 = 0 time = 1300
* CHECK dout0_16 vdout0_16ck129 = 5.0 time = 1300
* CHECK dout0_17 vdout0_17ck129 = 5.0 time = 1300
* CHECK dout0_18 vdout0_18ck129 = 5.0 time = 1300
* CHECK dout0_19 vdout0_19ck129 = 5.0 time = 1300
* CHECK dout0_20 vdout0_20ck129 = 5.0 time = 1300
* CHECK dout0_21 vdout0_21ck129 = 5.0 time = 1300
* CHECK dout0_22 vdout0_22ck129 = 0 time = 1300
* CHECK dout0_23 vdout0_23ck129 = 0 time = 1300
* CHECK dout0_24 vdout0_24ck129 = 0 time = 1300
* CHECK dout0_25 vdout0_25ck129 = 0 time = 1300
* CHECK dout0_26 vdout0_26ck129 = 5.0 time = 1300
* CHECK dout0_27 vdout0_27ck129 = 0 time = 1300
* CHECK dout0_28 vdout0_28ck129 = 0 time = 1300
* CHECK dout0_29 vdout0_29ck129 = 5.0 time = 1300
* CHECK dout0_30 vdout0_30ck129 = 5.0 time = 1300
* CHECK dout0_31 vdout0_31ck129 = 5.0 time = 1300
* CHECK dout0_0 vdout0_0ck135 = 0 time = 1360
* CHECK dout0_1 vdout0_1ck135 = 5.0 time = 1360
* CHECK dout0_2 vdout0_2ck135 = 0 time = 1360
* CHECK dout0_3 vdout0_3ck135 = 5.0 time = 1360
* CHECK dout0_4 vdout0_4ck135 = 5.0 time = 1360
* CHECK dout0_5 vdout0_5ck135 = 5.0 time = 1360
* CHECK dout0_6 vdout0_6ck135 = 5.0 time = 1360
* CHECK dout0_7 vdout0_7ck135 = 0 time = 1360
* CHECK dout0_8 vdout0_8ck135 = 5.0 time = 1360
* CHECK dout0_9 vdout0_9ck135 = 0 time = 1360
* CHECK dout0_10 vdout0_10ck135 = 5.0 time = 1360
* CHECK dout0_11 vdout0_11ck135 = 0 time = 1360
* CHECK dout0_12 vdout0_12ck135 = 0 time = 1360
* CHECK dout0_13 vdout0_13ck135 = 5.0 time = 1360
* CHECK dout0_14 vdout0_14ck135 = 0 time = 1360
* CHECK dout0_15 vdout0_15ck135 = 0 time = 1360
* CHECK dout0_16 vdout0_16ck135 = 0 time = 1360
* CHECK dout0_17 vdout0_17ck135 = 5.0 time = 1360
* CHECK dout0_18 vdout0_18ck135 = 0 time = 1360
* CHECK dout0_19 vdout0_19ck135 = 0 time = 1360
* CHECK dout0_20 vdout0_20ck135 = 0 time = 1360
* CHECK dout0_21 vdout0_21ck135 = 5.0 time = 1360
* CHECK dout0_22 vdout0_22ck135 = 0 time = 1360
* CHECK dout0_23 vdout0_23ck135 = 0 time = 1360
* CHECK dout0_24 vdout0_24ck135 = 0 time = 1360
* CHECK dout0_25 vdout0_25ck135 = 5.0 time = 1360
* CHECK dout0_26 vdout0_26ck135 = 5.0 time = 1360
* CHECK dout0_27 vdout0_27ck135 = 5.0 time = 1360
* CHECK dout0_28 vdout0_28ck135 = 5.0 time = 1360
* CHECK dout0_29 vdout0_29ck135 = 5.0 time = 1360
* CHECK dout0_30 vdout0_30ck135 = 0 time = 1360
* CHECK dout0_31 vdout0_31ck135 = 0 time = 1360
* CHECK dout0_0 vdout0_0ck137 = 0 time = 1380
* CHECK dout0_1 vdout0_1ck137 = 5.0 time = 1380
* CHECK dout0_2 vdout0_2ck137 = 0 time = 1380
* CHECK dout0_3 vdout0_3ck137 = 5.0 time = 1380
* CHECK dout0_4 vdout0_4ck137 = 5.0 time = 1380
* CHECK dout0_5 vdout0_5ck137 = 5.0 time = 1380
* CHECK dout0_6 vdout0_6ck137 = 5.0 time = 1380
* CHECK dout0_7 vdout0_7ck137 = 0 time = 1380
* CHECK dout0_8 vdout0_8ck137 = 0 time = 1380
* CHECK dout0_9 vdout0_9ck137 = 0 time = 1380
* CHECK dout0_10 vdout0_10ck137 = 5.0 time = 1380
* CHECK dout0_11 vdout0_11ck137 = 5.0 time = 1380
* CHECK dout0_12 vdout0_12ck137 = 5.0 time = 1380
* CHECK dout0_13 vdout0_13ck137 = 0 time = 1380
* CHECK dout0_14 vdout0_14ck137 = 5.0 time = 1380
* CHECK dout0_15 vdout0_15ck137 = 5.0 time = 1380
* CHECK dout0_16 vdout0_16ck137 = 5.0 time = 1380
* CHECK dout0_17 vdout0_17ck137 = 5.0 time = 1380
* CHECK dout0_18 vdout0_18ck137 = 0 time = 1380
* CHECK dout0_19 vdout0_19ck137 = 0 time = 1380
* CHECK dout0_20 vdout0_20ck137 = 0 time = 1380
* CHECK dout0_21 vdout0_21ck137 = 5.0 time = 1380
* CHECK dout0_22 vdout0_22ck137 = 5.0 time = 1380
* CHECK dout0_23 vdout0_23ck137 = 0 time = 1380
* CHECK dout0_24 vdout0_24ck137 = 5.0 time = 1380
* CHECK dout0_25 vdout0_25ck137 = 0 time = 1380
* CHECK dout0_26 vdout0_26ck137 = 0 time = 1380
* CHECK dout0_27 vdout0_27ck137 = 5.0 time = 1380
* CHECK dout0_28 vdout0_28ck137 = 0 time = 1380
* CHECK dout0_29 vdout0_29ck137 = 0 time = 1380
* CHECK dout0_30 vdout0_30ck137 = 0 time = 1380
* CHECK dout0_31 vdout0_31ck137 = 5.0 time = 1380
* CHECK dout0_0 vdout0_0ck140 = 0 time = 1410
* CHECK dout0_1 vdout0_1ck140 = 5.0 time = 1410
* CHECK dout0_2 vdout0_2ck140 = 0 time = 1410
* CHECK dout0_3 vdout0_3ck140 = 5.0 time = 1410
* CHECK dout0_4 vdout0_4ck140 = 5.0 time = 1410
* CHECK dout0_5 vdout0_5ck140 = 5.0 time = 1410
* CHECK dout0_6 vdout0_6ck140 = 5.0 time = 1410
* CHECK dout0_7 vdout0_7ck140 = 0 time = 1410
* CHECK dout0_8 vdout0_8ck140 = 5.0 time = 1410
* CHECK dout0_9 vdout0_9ck140 = 0 time = 1410
* CHECK dout0_10 vdout0_10ck140 = 5.0 time = 1410
* CHECK dout0_11 vdout0_11ck140 = 0 time = 1410
* CHECK dout0_12 vdout0_12ck140 = 0 time = 1410
* CHECK dout0_13 vdout0_13ck140 = 5.0 time = 1410
* CHECK dout0_14 vdout0_14ck140 = 0 time = 1410
* CHECK dout0_15 vdout0_15ck140 = 0 time = 1410
* CHECK dout0_16 vdout0_16ck140 = 0 time = 1410
* CHECK dout0_17 vdout0_17ck140 = 5.0 time = 1410
* CHECK dout0_18 vdout0_18ck140 = 0 time = 1410
* CHECK dout0_19 vdout0_19ck140 = 0 time = 1410
* CHECK dout0_20 vdout0_20ck140 = 0 time = 1410
* CHECK dout0_21 vdout0_21ck140 = 5.0 time = 1410
* CHECK dout0_22 vdout0_22ck140 = 0 time = 1410
* CHECK dout0_23 vdout0_23ck140 = 0 time = 1410
* CHECK dout0_24 vdout0_24ck140 = 0 time = 1410
* CHECK dout0_25 vdout0_25ck140 = 5.0 time = 1410
* CHECK dout0_26 vdout0_26ck140 = 5.0 time = 1410
* CHECK dout0_27 vdout0_27ck140 = 5.0 time = 1410
* CHECK dout0_28 vdout0_28ck140 = 5.0 time = 1410
* CHECK dout0_29 vdout0_29ck140 = 5.0 time = 1410
* CHECK dout0_30 vdout0_30ck140 = 0 time = 1410
* CHECK dout0_31 vdout0_31ck140 = 0 time = 1410
* CHECK dout0_0 vdout0_0ck145 = 0 time = 1460
* CHECK dout0_1 vdout0_1ck145 = 5.0 time = 1460
* CHECK dout0_2 vdout0_2ck145 = 0 time = 1460
* CHECK dout0_3 vdout0_3ck145 = 5.0 time = 1460
* CHECK dout0_4 vdout0_4ck145 = 5.0 time = 1460
* CHECK dout0_5 vdout0_5ck145 = 0 time = 1460
* CHECK dout0_6 vdout0_6ck145 = 0 time = 1460
* CHECK dout0_7 vdout0_7ck145 = 0 time = 1460
* CHECK dout0_8 vdout0_8ck145 = 5.0 time = 1460
* CHECK dout0_9 vdout0_9ck145 = 0 time = 1460
* CHECK dout0_10 vdout0_10ck145 = 5.0 time = 1460
* CHECK dout0_11 vdout0_11ck145 = 0 time = 1460
* CHECK dout0_12 vdout0_12ck145 = 0 time = 1460
* CHECK dout0_13 vdout0_13ck145 = 5.0 time = 1460
* CHECK dout0_14 vdout0_14ck145 = 0 time = 1460
* CHECK dout0_15 vdout0_15ck145 = 0 time = 1460
* CHECK dout0_16 vdout0_16ck145 = 0 time = 1460
* CHECK dout0_17 vdout0_17ck145 = 5.0 time = 1460
* CHECK dout0_18 vdout0_18ck145 = 0 time = 1460
* CHECK dout0_19 vdout0_19ck145 = 5.0 time = 1460
* CHECK dout0_20 vdout0_20ck145 = 0 time = 1460
* CHECK dout0_21 vdout0_21ck145 = 0 time = 1460
* CHECK dout0_22 vdout0_22ck145 = 5.0 time = 1460
* CHECK dout0_23 vdout0_23ck145 = 5.0 time = 1460
* CHECK dout0_24 vdout0_24ck145 = 5.0 time = 1460
* CHECK dout0_25 vdout0_25ck145 = 0 time = 1460
* CHECK dout0_26 vdout0_26ck145 = 0 time = 1460
* CHECK dout0_27 vdout0_27ck145 = 5.0 time = 1460
* CHECK dout0_28 vdout0_28ck145 = 0 time = 1460
* CHECK dout0_29 vdout0_29ck145 = 5.0 time = 1460
* CHECK dout0_30 vdout0_30ck145 = 0 time = 1460
* CHECK dout0_31 vdout0_31ck145 = 5.0 time = 1460
* CHECK dout0_0 vdout0_0ck146 = 5.0 time = 1470
* CHECK dout0_1 vdout0_1ck146 = 0 time = 1470
* CHECK dout0_2 vdout0_2ck146 = 0 time = 1470
* CHECK dout0_3 vdout0_3ck146 = 0 time = 1470
* CHECK dout0_4 vdout0_4ck146 = 5.0 time = 1470
* CHECK dout0_5 vdout0_5ck146 = 0 time = 1470
* CHECK dout0_6 vdout0_6ck146 = 0 time = 1470
* CHECK dout0_7 vdout0_7ck146 = 5.0 time = 1470
* CHECK dout0_8 vdout0_8ck146 = 0 time = 1470
* CHECK dout0_9 vdout0_9ck146 = 5.0 time = 1470
* CHECK dout0_10 vdout0_10ck146 = 0 time = 1470
* CHECK dout0_11 vdout0_11ck146 = 5.0 time = 1470
* CHECK dout0_12 vdout0_12ck146 = 0 time = 1470
* CHECK dout0_13 vdout0_13ck146 = 0 time = 1470
* CHECK dout0_14 vdout0_14ck146 = 0 time = 1470
* CHECK dout0_15 vdout0_15ck146 = 0 time = 1470
* CHECK dout0_16 vdout0_16ck146 = 0 time = 1470
* CHECK dout0_17 vdout0_17ck146 = 0 time = 1470
* CHECK dout0_18 vdout0_18ck146 = 0 time = 1470
* CHECK dout0_19 vdout0_19ck146 = 5.0 time = 1470
* CHECK dout0_20 vdout0_20ck146 = 5.0 time = 1470
* CHECK dout0_21 vdout0_21ck146 = 0 time = 1470
* CHECK dout0_22 vdout0_22ck146 = 5.0 time = 1470
* CHECK dout0_23 vdout0_23ck146 = 5.0 time = 1470
* CHECK dout0_24 vdout0_24ck146 = 5.0 time = 1470
* CHECK dout0_25 vdout0_25ck146 = 0 time = 1470
* CHECK dout0_26 vdout0_26ck146 = 0 time = 1470
* CHECK dout0_27 vdout0_27ck146 = 0 time = 1470
* CHECK dout0_28 vdout0_28ck146 = 5.0 time = 1470
* CHECK dout0_29 vdout0_29ck146 = 5.0 time = 1470
* CHECK dout0_30 vdout0_30ck146 = 0 time = 1470
* CHECK dout0_31 vdout0_31ck146 = 0 time = 1470
* CHECK dout0_0 vdout0_0ck147 = 0 time = 1480
* CHECK dout0_1 vdout0_1ck147 = 5.0 time = 1480
* CHECK dout0_2 vdout0_2ck147 = 0 time = 1480
* CHECK dout0_3 vdout0_3ck147 = 5.0 time = 1480
* CHECK dout0_4 vdout0_4ck147 = 5.0 time = 1480
* CHECK dout0_5 vdout0_5ck147 = 5.0 time = 1480
* CHECK dout0_6 vdout0_6ck147 = 5.0 time = 1480
* CHECK dout0_7 vdout0_7ck147 = 0 time = 1480
* CHECK dout0_8 vdout0_8ck147 = 0 time = 1480
* CHECK dout0_9 vdout0_9ck147 = 0 time = 1480
* CHECK dout0_10 vdout0_10ck147 = 5.0 time = 1480
* CHECK dout0_11 vdout0_11ck147 = 5.0 time = 1480
* CHECK dout0_12 vdout0_12ck147 = 5.0 time = 1480
* CHECK dout0_13 vdout0_13ck147 = 0 time = 1480
* CHECK dout0_14 vdout0_14ck147 = 5.0 time = 1480
* CHECK dout0_15 vdout0_15ck147 = 5.0 time = 1480
* CHECK dout0_16 vdout0_16ck147 = 5.0 time = 1480
* CHECK dout0_17 vdout0_17ck147 = 5.0 time = 1480
* CHECK dout0_18 vdout0_18ck147 = 0 time = 1480
* CHECK dout0_19 vdout0_19ck147 = 0 time = 1480
* CHECK dout0_20 vdout0_20ck147 = 0 time = 1480
* CHECK dout0_21 vdout0_21ck147 = 5.0 time = 1480
* CHECK dout0_22 vdout0_22ck147 = 5.0 time = 1480
* CHECK dout0_23 vdout0_23ck147 = 0 time = 1480
* CHECK dout0_24 vdout0_24ck147 = 5.0 time = 1480
* CHECK dout0_25 vdout0_25ck147 = 0 time = 1480
* CHECK dout0_26 vdout0_26ck147 = 0 time = 1480
* CHECK dout0_27 vdout0_27ck147 = 5.0 time = 1480
* CHECK dout0_28 vdout0_28ck147 = 0 time = 1480
* CHECK dout0_29 vdout0_29ck147 = 0 time = 1480
* CHECK dout0_30 vdout0_30ck147 = 0 time = 1480
* CHECK dout0_31 vdout0_31ck147 = 5.0 time = 1480
* CHECK dout0_0 vdout0_0ck149 = 0 time = 1500
* CHECK dout0_1 vdout0_1ck149 = 5.0 time = 1500
* CHECK dout0_2 vdout0_2ck149 = 0 time = 1500
* CHECK dout0_3 vdout0_3ck149 = 5.0 time = 1500
* CHECK dout0_4 vdout0_4ck149 = 5.0 time = 1500
* CHECK dout0_5 vdout0_5ck149 = 5.0 time = 1500
* CHECK dout0_6 vdout0_6ck149 = 5.0 time = 1500
* CHECK dout0_7 vdout0_7ck149 = 0 time = 1500
* CHECK dout0_8 vdout0_8ck149 = 0 time = 1500
* CHECK dout0_9 vdout0_9ck149 = 0 time = 1500
* CHECK dout0_10 vdout0_10ck149 = 5.0 time = 1500
* CHECK dout0_11 vdout0_11ck149 = 5.0 time = 1500
* CHECK dout0_12 vdout0_12ck149 = 5.0 time = 1500
* CHECK dout0_13 vdout0_13ck149 = 0 time = 1500
* CHECK dout0_14 vdout0_14ck149 = 5.0 time = 1500
* CHECK dout0_15 vdout0_15ck149 = 5.0 time = 1500
* CHECK dout0_16 vdout0_16ck149 = 0 time = 1500
* CHECK dout0_17 vdout0_17ck149 = 0 time = 1500
* CHECK dout0_18 vdout0_18ck149 = 0 time = 1500
* CHECK dout0_19 vdout0_19ck149 = 0 time = 1500
* CHECK dout0_20 vdout0_20ck149 = 5.0 time = 1500
* CHECK dout0_21 vdout0_21ck149 = 0 time = 1500
* CHECK dout0_22 vdout0_22ck149 = 5.0 time = 1500
* CHECK dout0_23 vdout0_23ck149 = 5.0 time = 1500
* CHECK dout0_24 vdout0_24ck149 = 5.0 time = 1500
* CHECK dout0_25 vdout0_25ck149 = 0 time = 1500
* CHECK dout0_26 vdout0_26ck149 = 0 time = 1500
* CHECK dout0_27 vdout0_27ck149 = 5.0 time = 1500
* CHECK dout0_28 vdout0_28ck149 = 0 time = 1500
* CHECK dout0_29 vdout0_29ck149 = 0 time = 1500
* CHECK dout0_30 vdout0_30ck149 = 0 time = 1500
* CHECK dout0_31 vdout0_31ck149 = 5.0 time = 1500
* CHECK dout0_0 vdout0_0ck158 = 0 time = 1590
* CHECK dout0_1 vdout0_1ck158 = 0 time = 1590
* CHECK dout0_2 vdout0_2ck158 = 5.0 time = 1590
* CHECK dout0_3 vdout0_3ck158 = 0 time = 1590
* CHECK dout0_4 vdout0_4ck158 = 0 time = 1590
* CHECK dout0_5 vdout0_5ck158 = 5.0 time = 1590
* CHECK dout0_6 vdout0_6ck158 = 5.0 time = 1590
* CHECK dout0_7 vdout0_7ck158 = 5.0 time = 1590
* CHECK dout0_8 vdout0_8ck158 = 0 time = 1590
* CHECK dout0_9 vdout0_9ck158 = 5.0 time = 1590
* CHECK dout0_10 vdout0_10ck158 = 0 time = 1590
* CHECK dout0_11 vdout0_11ck158 = 5.0 time = 1590
* CHECK dout0_12 vdout0_12ck158 = 0 time = 1590
* CHECK dout0_13 vdout0_13ck158 = 0 time = 1590
* CHECK dout0_14 vdout0_14ck158 = 0 time = 1590
* CHECK dout0_15 vdout0_15ck158 = 0 time = 1590
* CHECK dout0_16 vdout0_16ck158 = 5.0 time = 1590
* CHECK dout0_17 vdout0_17ck158 = 5.0 time = 1590
* CHECK dout0_18 vdout0_18ck158 = 0 time = 1590
* CHECK dout0_19 vdout0_19ck158 = 0 time = 1590
* CHECK dout0_20 vdout0_20ck158 = 0 time = 1590
* CHECK dout0_21 vdout0_21ck158 = 5.0 time = 1590
* CHECK dout0_22 vdout0_22ck158 = 0 time = 1590
* CHECK dout0_23 vdout0_23ck158 = 5.0 time = 1590
* CHECK dout0_24 vdout0_24ck158 = 0 time = 1590
* CHECK dout0_25 vdout0_25ck158 = 0 time = 1590
* CHECK dout0_26 vdout0_26ck158 = 0 time = 1590
* CHECK dout0_27 vdout0_27ck158 = 5.0 time = 1590
* CHECK dout0_28 vdout0_28ck158 = 0 time = 1590
* CHECK dout0_29 vdout0_29ck158 = 5.0 time = 1590
* CHECK dout0_30 vdout0_30ck158 = 0 time = 1590
* CHECK dout0_31 vdout0_31ck158 = 0 time = 1590
* CHECK dout0_0 vdout0_0ck160 = 5.0 time = 1610
* CHECK dout0_1 vdout0_1ck160 = 0 time = 1610
* CHECK dout0_2 vdout0_2ck160 = 0 time = 1610
* CHECK dout0_3 vdout0_3ck160 = 0 time = 1610
* CHECK dout0_4 vdout0_4ck160 = 0 time = 1610
* CHECK dout0_5 vdout0_5ck160 = 5.0 time = 1610
* CHECK dout0_6 vdout0_6ck160 = 5.0 time = 1610
* CHECK dout0_7 vdout0_7ck160 = 0 time = 1610
* CHECK dout0_8 vdout0_8ck160 = 5.0 time = 1610
* CHECK dout0_9 vdout0_9ck160 = 0 time = 1610
* CHECK dout0_10 vdout0_10ck160 = 5.0 time = 1610
* CHECK dout0_11 vdout0_11ck160 = 5.0 time = 1610
* CHECK dout0_12 vdout0_12ck160 = 0 time = 1610
* CHECK dout0_13 vdout0_13ck160 = 0 time = 1610
* CHECK dout0_14 vdout0_14ck160 = 5.0 time = 1610
* CHECK dout0_15 vdout0_15ck160 = 0 time = 1610
* CHECK dout0_16 vdout0_16ck160 = 5.0 time = 1610
* CHECK dout0_17 vdout0_17ck160 = 0 time = 1610
* CHECK dout0_18 vdout0_18ck160 = 0 time = 1610
* CHECK dout0_19 vdout0_19ck160 = 5.0 time = 1610
* CHECK dout0_20 vdout0_20ck160 = 0 time = 1610
* CHECK dout0_21 vdout0_21ck160 = 5.0 time = 1610
* CHECK dout0_22 vdout0_22ck160 = 0 time = 1610
* CHECK dout0_23 vdout0_23ck160 = 5.0 time = 1610
* CHECK dout0_24 vdout0_24ck160 = 0 time = 1610
* CHECK dout0_25 vdout0_25ck160 = 0 time = 1610
* CHECK dout0_26 vdout0_26ck160 = 5.0 time = 1610
* CHECK dout0_27 vdout0_27ck160 = 5.0 time = 1610
* CHECK dout0_28 vdout0_28ck160 = 0 time = 1610
* CHECK dout0_29 vdout0_29ck160 = 5.0 time = 1610
* CHECK dout0_30 vdout0_30ck160 = 5.0 time = 1610
* CHECK dout0_31 vdout0_31ck160 = 5.0 time = 1610
* CHECK dout0_0 vdout0_0ck162 = 0 time = 1630
* CHECK dout0_1 vdout0_1ck162 = 5.0 time = 1630
* CHECK dout0_2 vdout0_2ck162 = 0 time = 1630
* CHECK dout0_3 vdout0_3ck162 = 5.0 time = 1630
* CHECK dout0_4 vdout0_4ck162 = 5.0 time = 1630
* CHECK dout0_5 vdout0_5ck162 = 0 time = 1630
* CHECK dout0_6 vdout0_6ck162 = 0 time = 1630
* CHECK dout0_7 vdout0_7ck162 = 0 time = 1630
* CHECK dout0_8 vdout0_8ck162 = 5.0 time = 1630
* CHECK dout0_9 vdout0_9ck162 = 0 time = 1630
* CHECK dout0_10 vdout0_10ck162 = 5.0 time = 1630
* CHECK dout0_11 vdout0_11ck162 = 0 time = 1630
* CHECK dout0_12 vdout0_12ck162 = 0 time = 1630
* CHECK dout0_13 vdout0_13ck162 = 5.0 time = 1630
* CHECK dout0_14 vdout0_14ck162 = 0 time = 1630
* CHECK dout0_15 vdout0_15ck162 = 0 time = 1630
* CHECK dout0_16 vdout0_16ck162 = 0 time = 1630
* CHECK dout0_17 vdout0_17ck162 = 5.0 time = 1630
* CHECK dout0_18 vdout0_18ck162 = 0 time = 1630
* CHECK dout0_19 vdout0_19ck162 = 5.0 time = 1630
* CHECK dout0_20 vdout0_20ck162 = 0 time = 1630
* CHECK dout0_21 vdout0_21ck162 = 0 time = 1630
* CHECK dout0_22 vdout0_22ck162 = 5.0 time = 1630
* CHECK dout0_23 vdout0_23ck162 = 5.0 time = 1630
* CHECK dout0_24 vdout0_24ck162 = 5.0 time = 1630
* CHECK dout0_25 vdout0_25ck162 = 0 time = 1630
* CHECK dout0_26 vdout0_26ck162 = 0 time = 1630
* CHECK dout0_27 vdout0_27ck162 = 5.0 time = 1630
* CHECK dout0_28 vdout0_28ck162 = 0 time = 1630
* CHECK dout0_29 vdout0_29ck162 = 5.0 time = 1630
* CHECK dout0_30 vdout0_30ck162 = 0 time = 1630
* CHECK dout0_31 vdout0_31ck162 = 5.0 time = 1630
* CHECK dout0_0 vdout0_0ck163 = 0 time = 1640
* CHECK dout0_1 vdout0_1ck163 = 5.0 time = 1640
* CHECK dout0_2 vdout0_2ck163 = 0 time = 1640
* CHECK dout0_3 vdout0_3ck163 = 5.0 time = 1640
* CHECK dout0_4 vdout0_4ck163 = 5.0 time = 1640
* CHECK dout0_5 vdout0_5ck163 = 5.0 time = 1640
* CHECK dout0_6 vdout0_6ck163 = 5.0 time = 1640
* CHECK dout0_7 vdout0_7ck163 = 0 time = 1640
* CHECK dout0_8 vdout0_8ck163 = 0 time = 1640
* CHECK dout0_9 vdout0_9ck163 = 0 time = 1640
* CHECK dout0_10 vdout0_10ck163 = 5.0 time = 1640
* CHECK dout0_11 vdout0_11ck163 = 5.0 time = 1640
* CHECK dout0_12 vdout0_12ck163 = 5.0 time = 1640
* CHECK dout0_13 vdout0_13ck163 = 0 time = 1640
* CHECK dout0_14 vdout0_14ck163 = 5.0 time = 1640
* CHECK dout0_15 vdout0_15ck163 = 5.0 time = 1640
* CHECK dout0_16 vdout0_16ck163 = 0 time = 1640
* CHECK dout0_17 vdout0_17ck163 = 0 time = 1640
* CHECK dout0_18 vdout0_18ck163 = 0 time = 1640
* CHECK dout0_19 vdout0_19ck163 = 0 time = 1640
* CHECK dout0_20 vdout0_20ck163 = 5.0 time = 1640
* CHECK dout0_21 vdout0_21ck163 = 0 time = 1640
* CHECK dout0_22 vdout0_22ck163 = 5.0 time = 1640
* CHECK dout0_23 vdout0_23ck163 = 5.0 time = 1640
* CHECK dout0_24 vdout0_24ck163 = 5.0 time = 1640
* CHECK dout0_25 vdout0_25ck163 = 0 time = 1640
* CHECK dout0_26 vdout0_26ck163 = 0 time = 1640
* CHECK dout0_27 vdout0_27ck163 = 5.0 time = 1640
* CHECK dout0_28 vdout0_28ck163 = 0 time = 1640
* CHECK dout0_29 vdout0_29ck163 = 0 time = 1640
* CHECK dout0_30 vdout0_30ck163 = 0 time = 1640
* CHECK dout0_31 vdout0_31ck163 = 5.0 time = 1640
* CHECK dout0_0 vdout0_0ck166 = 0 time = 1670
* CHECK dout0_1 vdout0_1ck166 = 5.0 time = 1670
* CHECK dout0_2 vdout0_2ck166 = 0 time = 1670
* CHECK dout0_3 vdout0_3ck166 = 5.0 time = 1670
* CHECK dout0_4 vdout0_4ck166 = 5.0 time = 1670
* CHECK dout0_5 vdout0_5ck166 = 5.0 time = 1670
* CHECK dout0_6 vdout0_6ck166 = 5.0 time = 1670
* CHECK dout0_7 vdout0_7ck166 = 0 time = 1670
* CHECK dout0_8 vdout0_8ck166 = 0 time = 1670
* CHECK dout0_9 vdout0_9ck166 = 0 time = 1670
* CHECK dout0_10 vdout0_10ck166 = 5.0 time = 1670
* CHECK dout0_11 vdout0_11ck166 = 5.0 time = 1670
* CHECK dout0_12 vdout0_12ck166 = 5.0 time = 1670
* CHECK dout0_13 vdout0_13ck166 = 0 time = 1670
* CHECK dout0_14 vdout0_14ck166 = 5.0 time = 1670
* CHECK dout0_15 vdout0_15ck166 = 5.0 time = 1670
* CHECK dout0_16 vdout0_16ck166 = 0 time = 1670
* CHECK dout0_17 vdout0_17ck166 = 0 time = 1670
* CHECK dout0_18 vdout0_18ck166 = 0 time = 1670
* CHECK dout0_19 vdout0_19ck166 = 0 time = 1670
* CHECK dout0_20 vdout0_20ck166 = 5.0 time = 1670
* CHECK dout0_21 vdout0_21ck166 = 0 time = 1670
* CHECK dout0_22 vdout0_22ck166 = 5.0 time = 1670
* CHECK dout0_23 vdout0_23ck166 = 5.0 time = 1670
* CHECK dout0_24 vdout0_24ck166 = 5.0 time = 1670
* CHECK dout0_25 vdout0_25ck166 = 0 time = 1670
* CHECK dout0_26 vdout0_26ck166 = 0 time = 1670
* CHECK dout0_27 vdout0_27ck166 = 5.0 time = 1670
* CHECK dout0_28 vdout0_28ck166 = 0 time = 1670
* CHECK dout0_29 vdout0_29ck166 = 0 time = 1670
* CHECK dout0_30 vdout0_30ck166 = 0 time = 1670
* CHECK dout0_31 vdout0_31ck166 = 5.0 time = 1670
* CHECK dout0_0 vdout0_0ck167 = 0 time = 1680
* CHECK dout0_1 vdout0_1ck167 = 5.0 time = 1680
* CHECK dout0_2 vdout0_2ck167 = 0 time = 1680
* CHECK dout0_3 vdout0_3ck167 = 5.0 time = 1680
* CHECK dout0_4 vdout0_4ck167 = 5.0 time = 1680
* CHECK dout0_5 vdout0_5ck167 = 5.0 time = 1680
* CHECK dout0_6 vdout0_6ck167 = 5.0 time = 1680
* CHECK dout0_7 vdout0_7ck167 = 0 time = 1680
* CHECK dout0_8 vdout0_8ck167 = 0 time = 1680
* CHECK dout0_9 vdout0_9ck167 = 0 time = 1680
* CHECK dout0_10 vdout0_10ck167 = 5.0 time = 1680
* CHECK dout0_11 vdout0_11ck167 = 5.0 time = 1680
* CHECK dout0_12 vdout0_12ck167 = 5.0 time = 1680
* CHECK dout0_13 vdout0_13ck167 = 0 time = 1680
* CHECK dout0_14 vdout0_14ck167 = 5.0 time = 1680
* CHECK dout0_15 vdout0_15ck167 = 5.0 time = 1680
* CHECK dout0_16 vdout0_16ck167 = 0 time = 1680
* CHECK dout0_17 vdout0_17ck167 = 0 time = 1680
* CHECK dout0_18 vdout0_18ck167 = 0 time = 1680
* CHECK dout0_19 vdout0_19ck167 = 0 time = 1680
* CHECK dout0_20 vdout0_20ck167 = 5.0 time = 1680
* CHECK dout0_21 vdout0_21ck167 = 0 time = 1680
* CHECK dout0_22 vdout0_22ck167 = 5.0 time = 1680
* CHECK dout0_23 vdout0_23ck167 = 5.0 time = 1680
* CHECK dout0_24 vdout0_24ck167 = 5.0 time = 1680
* CHECK dout0_25 vdout0_25ck167 = 0 time = 1680
* CHECK dout0_26 vdout0_26ck167 = 0 time = 1680
* CHECK dout0_27 vdout0_27ck167 = 5.0 time = 1680
* CHECK dout0_28 vdout0_28ck167 = 0 time = 1680
* CHECK dout0_29 vdout0_29ck167 = 0 time = 1680
* CHECK dout0_30 vdout0_30ck167 = 0 time = 1680
* CHECK dout0_31 vdout0_31ck167 = 5.0 time = 1680
* CHECK dout0_0 vdout0_0ck168 = 5.0 time = 1690
* CHECK dout0_1 vdout0_1ck168 = 5.0 time = 1690
* CHECK dout0_2 vdout0_2ck168 = 5.0 time = 1690
* CHECK dout0_3 vdout0_3ck168 = 5.0 time = 1690
* CHECK dout0_4 vdout0_4ck168 = 0 time = 1690
* CHECK dout0_5 vdout0_5ck168 = 5.0 time = 1690
* CHECK dout0_6 vdout0_6ck168 = 5.0 time = 1690
* CHECK dout0_7 vdout0_7ck168 = 5.0 time = 1690
* CHECK dout0_8 vdout0_8ck168 = 5.0 time = 1690
* CHECK dout0_9 vdout0_9ck168 = 5.0 time = 1690
* CHECK dout0_10 vdout0_10ck168 = 0 time = 1690
* CHECK dout0_11 vdout0_11ck168 = 0 time = 1690
* CHECK dout0_12 vdout0_12ck168 = 5.0 time = 1690
* CHECK dout0_13 vdout0_13ck168 = 5.0 time = 1690
* CHECK dout0_14 vdout0_14ck168 = 5.0 time = 1690
* CHECK dout0_15 vdout0_15ck168 = 5.0 time = 1690
* CHECK dout0_16 vdout0_16ck168 = 5.0 time = 1690
* CHECK dout0_17 vdout0_17ck168 = 0 time = 1690
* CHECK dout0_18 vdout0_18ck168 = 0 time = 1690
* CHECK dout0_19 vdout0_19ck168 = 5.0 time = 1690
* CHECK dout0_20 vdout0_20ck168 = 0 time = 1690
* CHECK dout0_21 vdout0_21ck168 = 0 time = 1690
* CHECK dout0_22 vdout0_22ck168 = 5.0 time = 1690
* CHECK dout0_23 vdout0_23ck168 = 0 time = 1690
* CHECK dout0_24 vdout0_24ck168 = 0 time = 1690
* CHECK dout0_25 vdout0_25ck168 = 0 time = 1690
* CHECK dout0_26 vdout0_26ck168 = 5.0 time = 1690
* CHECK dout0_27 vdout0_27ck168 = 5.0 time = 1690
* CHECK dout0_28 vdout0_28ck168 = 5.0 time = 1690
* CHECK dout0_29 vdout0_29ck168 = 5.0 time = 1690
* CHECK dout0_30 vdout0_30ck168 = 5.0 time = 1690
* CHECK dout0_31 vdout0_31ck168 = 5.0 time = 1690
* CHECK dout0_0 vdout0_0ck169 = 0 time = 1700
* CHECK dout0_1 vdout0_1ck169 = 0 time = 1700
* CHECK dout0_2 vdout0_2ck169 = 0 time = 1700
* CHECK dout0_3 vdout0_3ck169 = 5.0 time = 1700
* CHECK dout0_4 vdout0_4ck169 = 0 time = 1700
* CHECK dout0_5 vdout0_5ck169 = 5.0 time = 1700
* CHECK dout0_6 vdout0_6ck169 = 0 time = 1700
* CHECK dout0_7 vdout0_7ck169 = 0 time = 1700
* CHECK dout0_8 vdout0_8ck169 = 0 time = 1700
* CHECK dout0_9 vdout0_9ck169 = 0 time = 1700
* CHECK dout0_10 vdout0_10ck169 = 0 time = 1700
* CHECK dout0_11 vdout0_11ck169 = 0 time = 1700
* CHECK dout0_12 vdout0_12ck169 = 5.0 time = 1700
* CHECK dout0_13 vdout0_13ck169 = 5.0 time = 1700
* CHECK dout0_14 vdout0_14ck169 = 0 time = 1700
* CHECK dout0_15 vdout0_15ck169 = 5.0 time = 1700
* CHECK dout0_16 vdout0_16ck169 = 5.0 time = 1700
* CHECK dout0_17 vdout0_17ck169 = 0 time = 1700
* CHECK dout0_18 vdout0_18ck169 = 5.0 time = 1700
* CHECK dout0_19 vdout0_19ck169 = 5.0 time = 1700
* CHECK dout0_20 vdout0_20ck169 = 5.0 time = 1700
* CHECK dout0_21 vdout0_21ck169 = 5.0 time = 1700
* CHECK dout0_22 vdout0_22ck169 = 0 time = 1700
* CHECK dout0_23 vdout0_23ck169 = 5.0 time = 1700
* CHECK dout0_24 vdout0_24ck169 = 0 time = 1700
* CHECK dout0_25 vdout0_25ck169 = 0 time = 1700
* CHECK dout0_26 vdout0_26ck169 = 0 time = 1700
* CHECK dout0_27 vdout0_27ck169 = 5.0 time = 1700
* CHECK dout0_28 vdout0_28ck169 = 0 time = 1700
* CHECK dout0_29 vdout0_29ck169 = 0 time = 1700
* CHECK dout0_30 vdout0_30ck169 = 0 time = 1700
* CHECK dout0_31 vdout0_31ck169 = 0 time = 1700
* CHECK dout0_0 vdout0_0ck171 = 5.0 time = 1720
* CHECK dout0_1 vdout0_1ck171 = 0 time = 1720
* CHECK dout0_2 vdout0_2ck171 = 0 time = 1720
* CHECK dout0_3 vdout0_3ck171 = 0 time = 1720
* CHECK dout0_4 vdout0_4ck171 = 0 time = 1720
* CHECK dout0_5 vdout0_5ck171 = 5.0 time = 1720
* CHECK dout0_6 vdout0_6ck171 = 5.0 time = 1720
* CHECK dout0_7 vdout0_7ck171 = 0 time = 1720
* CHECK dout0_8 vdout0_8ck171 = 5.0 time = 1720
* CHECK dout0_9 vdout0_9ck171 = 0 time = 1720
* CHECK dout0_10 vdout0_10ck171 = 5.0 time = 1720
* CHECK dout0_11 vdout0_11ck171 = 5.0 time = 1720
* CHECK dout0_12 vdout0_12ck171 = 0 time = 1720
* CHECK dout0_13 vdout0_13ck171 = 0 time = 1720
* CHECK dout0_14 vdout0_14ck171 = 5.0 time = 1720
* CHECK dout0_15 vdout0_15ck171 = 0 time = 1720
* CHECK dout0_16 vdout0_16ck171 = 5.0 time = 1720
* CHECK dout0_17 vdout0_17ck171 = 0 time = 1720
* CHECK dout0_18 vdout0_18ck171 = 0 time = 1720
* CHECK dout0_19 vdout0_19ck171 = 5.0 time = 1720
* CHECK dout0_20 vdout0_20ck171 = 0 time = 1720
* CHECK dout0_21 vdout0_21ck171 = 5.0 time = 1720
* CHECK dout0_22 vdout0_22ck171 = 0 time = 1720
* CHECK dout0_23 vdout0_23ck171 = 5.0 time = 1720
* CHECK dout0_24 vdout0_24ck171 = 0 time = 1720
* CHECK dout0_25 vdout0_25ck171 = 0 time = 1720
* CHECK dout0_26 vdout0_26ck171 = 5.0 time = 1720
* CHECK dout0_27 vdout0_27ck171 = 5.0 time = 1720
* CHECK dout0_28 vdout0_28ck171 = 0 time = 1720
* CHECK dout0_29 vdout0_29ck171 = 5.0 time = 1720
* CHECK dout0_30 vdout0_30ck171 = 5.0 time = 1720
* CHECK dout0_31 vdout0_31ck171 = 5.0 time = 1720
* CHECK dout0_0 vdout0_0ck174 = 5.0 time = 1750
* CHECK dout0_1 vdout0_1ck174 = 0 time = 1750
* CHECK dout0_2 vdout0_2ck174 = 5.0 time = 1750
* CHECK dout0_3 vdout0_3ck174 = 0 time = 1750
* CHECK dout0_4 vdout0_4ck174 = 0 time = 1750
* CHECK dout0_5 vdout0_5ck174 = 0 time = 1750
* CHECK dout0_6 vdout0_6ck174 = 5.0 time = 1750
* CHECK dout0_7 vdout0_7ck174 = 0 time = 1750
* CHECK dout0_8 vdout0_8ck174 = 0 time = 1750
* CHECK dout0_9 vdout0_9ck174 = 5.0 time = 1750
* CHECK dout0_10 vdout0_10ck174 = 0 time = 1750
* CHECK dout0_11 vdout0_11ck174 = 5.0 time = 1750
* CHECK dout0_12 vdout0_12ck174 = 0 time = 1750
* CHECK dout0_13 vdout0_13ck174 = 5.0 time = 1750
* CHECK dout0_14 vdout0_14ck174 = 5.0 time = 1750
* CHECK dout0_15 vdout0_15ck174 = 5.0 time = 1750
* CHECK dout0_16 vdout0_16ck174 = 5.0 time = 1750
* CHECK dout0_17 vdout0_17ck174 = 0 time = 1750
* CHECK dout0_18 vdout0_18ck174 = 5.0 time = 1750
* CHECK dout0_19 vdout0_19ck174 = 0 time = 1750
* CHECK dout0_20 vdout0_20ck174 = 0 time = 1750
* CHECK dout0_21 vdout0_21ck174 = 0 time = 1750
* CHECK dout0_22 vdout0_22ck174 = 0 time = 1750
* CHECK dout0_23 vdout0_23ck174 = 5.0 time = 1750
* CHECK dout0_24 vdout0_24ck174 = 0 time = 1750
* CHECK dout0_25 vdout0_25ck174 = 5.0 time = 1750
* CHECK dout0_26 vdout0_26ck174 = 5.0 time = 1750
* CHECK dout0_27 vdout0_27ck174 = 0 time = 1750
* CHECK dout0_28 vdout0_28ck174 = 0 time = 1750
* CHECK dout0_29 vdout0_29ck174 = 0 time = 1750
* CHECK dout0_30 vdout0_30ck174 = 5.0 time = 1750
* CHECK dout0_31 vdout0_31ck174 = 5.0 time = 1750
* CHECK dout0_0 vdout0_0ck182 = 0 time = 1830
* CHECK dout0_1 vdout0_1ck182 = 0 time = 1830
* CHECK dout0_2 vdout0_2ck182 = 0 time = 1830
* CHECK dout0_3 vdout0_3ck182 = 5.0 time = 1830
* CHECK dout0_4 vdout0_4ck182 = 0 time = 1830
* CHECK dout0_5 vdout0_5ck182 = 0 time = 1830
* CHECK dout0_6 vdout0_6ck182 = 0 time = 1830
* CHECK dout0_7 vdout0_7ck182 = 5.0 time = 1830
* CHECK dout0_8 vdout0_8ck182 = 0 time = 1830
* CHECK dout0_9 vdout0_9ck182 = 5.0 time = 1830
* CHECK dout0_10 vdout0_10ck182 = 5.0 time = 1830
* CHECK dout0_11 vdout0_11ck182 = 0 time = 1830
* CHECK dout0_12 vdout0_12ck182 = 5.0 time = 1830
* CHECK dout0_13 vdout0_13ck182 = 0 time = 1830
* CHECK dout0_14 vdout0_14ck182 = 5.0 time = 1830
* CHECK dout0_15 vdout0_15ck182 = 0 time = 1830
* CHECK dout0_16 vdout0_16ck182 = 0 time = 1830
* CHECK dout0_17 vdout0_17ck182 = 0 time = 1830
* CHECK dout0_18 vdout0_18ck182 = 0 time = 1830
* CHECK dout0_19 vdout0_19ck182 = 0 time = 1830
* CHECK dout0_20 vdout0_20ck182 = 5.0 time = 1830
* CHECK dout0_21 vdout0_21ck182 = 5.0 time = 1830
* CHECK dout0_22 vdout0_22ck182 = 0 time = 1830
* CHECK dout0_23 vdout0_23ck182 = 5.0 time = 1830
* CHECK dout0_24 vdout0_24ck182 = 0 time = 1830
* CHECK dout0_25 vdout0_25ck182 = 5.0 time = 1830
* CHECK dout0_26 vdout0_26ck182 = 5.0 time = 1830
* CHECK dout0_27 vdout0_27ck182 = 0 time = 1830
* CHECK dout0_28 vdout0_28ck182 = 5.0 time = 1830
* CHECK dout0_29 vdout0_29ck182 = 5.0 time = 1830
* CHECK dout0_30 vdout0_30ck182 = 5.0 time = 1830
* CHECK dout0_31 vdout0_31ck182 = 0 time = 1830
* CHECK dout0_0 vdout0_0ck183 = 5.0 time = 1840
* CHECK dout0_1 vdout0_1ck183 = 0 time = 1840
* CHECK dout0_2 vdout0_2ck183 = 0 time = 1840
* CHECK dout0_3 vdout0_3ck183 = 0 time = 1840
* CHECK dout0_4 vdout0_4ck183 = 0 time = 1840
* CHECK dout0_5 vdout0_5ck183 = 0 time = 1840
* CHECK dout0_6 vdout0_6ck183 = 0 time = 1840
* CHECK dout0_7 vdout0_7ck183 = 0 time = 1840
* CHECK dout0_8 vdout0_8ck183 = 5.0 time = 1840
* CHECK dout0_9 vdout0_9ck183 = 5.0 time = 1840
* CHECK dout0_10 vdout0_10ck183 = 5.0 time = 1840
* CHECK dout0_11 vdout0_11ck183 = 5.0 time = 1840
* CHECK dout0_12 vdout0_12ck183 = 0 time = 1840
* CHECK dout0_13 vdout0_13ck183 = 0 time = 1840
* CHECK dout0_14 vdout0_14ck183 = 0 time = 1840
* CHECK dout0_15 vdout0_15ck183 = 5.0 time = 1840
* CHECK dout0_16 vdout0_16ck183 = 5.0 time = 1840
* CHECK dout0_17 vdout0_17ck183 = 0 time = 1840
* CHECK dout0_18 vdout0_18ck183 = 0 time = 1840
* CHECK dout0_19 vdout0_19ck183 = 5.0 time = 1840
* CHECK dout0_20 vdout0_20ck183 = 5.0 time = 1840
* CHECK dout0_21 vdout0_21ck183 = 5.0 time = 1840
* CHECK dout0_22 vdout0_22ck183 = 5.0 time = 1840
* CHECK dout0_23 vdout0_23ck183 = 5.0 time = 1840
* CHECK dout0_24 vdout0_24ck183 = 5.0 time = 1840
* CHECK dout0_25 vdout0_25ck183 = 5.0 time = 1840
* CHECK dout0_26 vdout0_26ck183 = 0 time = 1840
* CHECK dout0_27 vdout0_27ck183 = 5.0 time = 1840
* CHECK dout0_28 vdout0_28ck183 = 5.0 time = 1840
* CHECK dout0_29 vdout0_29ck183 = 0 time = 1840
* CHECK dout0_30 vdout0_30ck183 = 0 time = 1840
* CHECK dout0_31 vdout0_31ck183 = 0 time = 1840
* CHECK dout0_0 vdout0_0ck187 = 5.0 time = 1880
* CHECK dout0_1 vdout0_1ck187 = 0 time = 1880
* CHECK dout0_2 vdout0_2ck187 = 5.0 time = 1880
* CHECK dout0_3 vdout0_3ck187 = 0 time = 1880
* CHECK dout0_4 vdout0_4ck187 = 0 time = 1880
* CHECK dout0_5 vdout0_5ck187 = 0 time = 1880
* CHECK dout0_6 vdout0_6ck187 = 5.0 time = 1880
* CHECK dout0_7 vdout0_7ck187 = 0 time = 1880
* CHECK dout0_8 vdout0_8ck187 = 0 time = 1880
* CHECK dout0_9 vdout0_9ck187 = 5.0 time = 1880
* CHECK dout0_10 vdout0_10ck187 = 0 time = 1880
* CHECK dout0_11 vdout0_11ck187 = 5.0 time = 1880
* CHECK dout0_12 vdout0_12ck187 = 0 time = 1880
* CHECK dout0_13 vdout0_13ck187 = 5.0 time = 1880
* CHECK dout0_14 vdout0_14ck187 = 5.0 time = 1880
* CHECK dout0_15 vdout0_15ck187 = 5.0 time = 1880
* CHECK dout0_16 vdout0_16ck187 = 5.0 time = 1880
* CHECK dout0_17 vdout0_17ck187 = 0 time = 1880
* CHECK dout0_18 vdout0_18ck187 = 0 time = 1880
* CHECK dout0_19 vdout0_19ck187 = 5.0 time = 1880
* CHECK dout0_20 vdout0_20ck187 = 5.0 time = 1880
* CHECK dout0_21 vdout0_21ck187 = 0 time = 1880
* CHECK dout0_22 vdout0_22ck187 = 5.0 time = 1880
* CHECK dout0_23 vdout0_23ck187 = 5.0 time = 1880
* CHECK dout0_24 vdout0_24ck187 = 5.0 time = 1880
* CHECK dout0_25 vdout0_25ck187 = 5.0 time = 1880
* CHECK dout0_26 vdout0_26ck187 = 0 time = 1880
* CHECK dout0_27 vdout0_27ck187 = 0 time = 1880
* CHECK dout0_28 vdout0_28ck187 = 0 time = 1880
* CHECK dout0_29 vdout0_29ck187 = 5.0 time = 1880
* CHECK dout0_30 vdout0_30ck187 = 0 time = 1880
* CHECK dout0_31 vdout0_31ck187 = 0 time = 1880
* CHECK dout0_0 vdout0_0ck190 = 0 time = 1910
* CHECK dout0_1 vdout0_1ck190 = 5.0 time = 1910
* CHECK dout0_2 vdout0_2ck190 = 5.0 time = 1910
* CHECK dout0_3 vdout0_3ck190 = 0 time = 1910
* CHECK dout0_4 vdout0_4ck190 = 0 time = 1910
* CHECK dout0_5 vdout0_5ck190 = 0 time = 1910
* CHECK dout0_6 vdout0_6ck190 = 5.0 time = 1910
* CHECK dout0_7 vdout0_7ck190 = 0 time = 1910
* CHECK dout0_8 vdout0_8ck190 = 5.0 time = 1910
* CHECK dout0_9 vdout0_9ck190 = 5.0 time = 1910
* CHECK dout0_10 vdout0_10ck190 = 5.0 time = 1910
* CHECK dout0_11 vdout0_11ck190 = 5.0 time = 1910
* CHECK dout0_12 vdout0_12ck190 = 5.0 time = 1910
* CHECK dout0_13 vdout0_13ck190 = 5.0 time = 1910
* CHECK dout0_14 vdout0_14ck190 = 5.0 time = 1910
* CHECK dout0_15 vdout0_15ck190 = 5.0 time = 1910
* CHECK dout0_16 vdout0_16ck190 = 5.0 time = 1910
* CHECK dout0_17 vdout0_17ck190 = 0 time = 1910
* CHECK dout0_18 vdout0_18ck190 = 5.0 time = 1910
* CHECK dout0_19 vdout0_19ck190 = 5.0 time = 1910
* CHECK dout0_20 vdout0_20ck190 = 5.0 time = 1910
* CHECK dout0_21 vdout0_21ck190 = 5.0 time = 1910
* CHECK dout0_22 vdout0_22ck190 = 0 time = 1910
* CHECK dout0_23 vdout0_23ck190 = 5.0 time = 1910
* CHECK dout0_24 vdout0_24ck190 = 0 time = 1910
* CHECK dout0_25 vdout0_25ck190 = 0 time = 1910
* CHECK dout0_26 vdout0_26ck190 = 5.0 time = 1910
* CHECK dout0_27 vdout0_27ck190 = 5.0 time = 1910
* CHECK dout0_28 vdout0_28ck190 = 5.0 time = 1910
* CHECK dout0_29 vdout0_29ck190 = 0 time = 1910
* CHECK dout0_30 vdout0_30ck190 = 5.0 time = 1910
* CHECK dout0_31 vdout0_31ck190 = 0 time = 1910
* CHECK dout0_0 vdout0_0ck194 = 0 time = 1950
* CHECK dout0_1 vdout0_1ck194 = 5.0 time = 1950
* CHECK dout0_2 vdout0_2ck194 = 5.0 time = 1950
* CHECK dout0_3 vdout0_3ck194 = 0 time = 1950
* CHECK dout0_4 vdout0_4ck194 = 0 time = 1950
* CHECK dout0_5 vdout0_5ck194 = 0 time = 1950
* CHECK dout0_6 vdout0_6ck194 = 5.0 time = 1950
* CHECK dout0_7 vdout0_7ck194 = 0 time = 1950
* CHECK dout0_8 vdout0_8ck194 = 5.0 time = 1950
* CHECK dout0_9 vdout0_9ck194 = 5.0 time = 1950
* CHECK dout0_10 vdout0_10ck194 = 5.0 time = 1950
* CHECK dout0_11 vdout0_11ck194 = 5.0 time = 1950
* CHECK dout0_12 vdout0_12ck194 = 5.0 time = 1950
* CHECK dout0_13 vdout0_13ck194 = 5.0 time = 1950
* CHECK dout0_14 vdout0_14ck194 = 5.0 time = 1950
* CHECK dout0_15 vdout0_15ck194 = 5.0 time = 1950
* CHECK dout0_16 vdout0_16ck194 = 5.0 time = 1950
* CHECK dout0_17 vdout0_17ck194 = 0 time = 1950
* CHECK dout0_18 vdout0_18ck194 = 5.0 time = 1950
* CHECK dout0_19 vdout0_19ck194 = 5.0 time = 1950
* CHECK dout0_20 vdout0_20ck194 = 5.0 time = 1950
* CHECK dout0_21 vdout0_21ck194 = 5.0 time = 1950
* CHECK dout0_22 vdout0_22ck194 = 0 time = 1950
* CHECK dout0_23 vdout0_23ck194 = 5.0 time = 1950
* CHECK dout0_24 vdout0_24ck194 = 0 time = 1950
* CHECK dout0_25 vdout0_25ck194 = 0 time = 1950
* CHECK dout0_26 vdout0_26ck194 = 5.0 time = 1950
* CHECK dout0_27 vdout0_27ck194 = 5.0 time = 1950
* CHECK dout0_28 vdout0_28ck194 = 5.0 time = 1950
* CHECK dout0_29 vdout0_29ck194 = 0 time = 1950
* CHECK dout0_30 vdout0_30ck194 = 5.0 time = 1950
* CHECK dout0_31 vdout0_31ck194 = 0 time = 1950
* CHECK dout0_0 vdout0_0ck195 = 0 time = 1960
* CHECK dout0_1 vdout0_1ck195 = 0 time = 1960
* CHECK dout0_2 vdout0_2ck195 = 5.0 time = 1960
* CHECK dout0_3 vdout0_3ck195 = 5.0 time = 1960
* CHECK dout0_4 vdout0_4ck195 = 5.0 time = 1960
* CHECK dout0_5 vdout0_5ck195 = 5.0 time = 1960
* CHECK dout0_6 vdout0_6ck195 = 0 time = 1960
* CHECK dout0_7 vdout0_7ck195 = 0 time = 1960
* CHECK dout0_8 vdout0_8ck195 = 5.0 time = 1960
* CHECK dout0_9 vdout0_9ck195 = 5.0 time = 1960
* CHECK dout0_10 vdout0_10ck195 = 0 time = 1960
* CHECK dout0_11 vdout0_11ck195 = 0 time = 1960
* CHECK dout0_12 vdout0_12ck195 = 0 time = 1960
* CHECK dout0_13 vdout0_13ck195 = 0 time = 1960
* CHECK dout0_14 vdout0_14ck195 = 5.0 time = 1960
* CHECK dout0_15 vdout0_15ck195 = 5.0 time = 1960
* CHECK dout0_16 vdout0_16ck195 = 0 time = 1960
* CHECK dout0_17 vdout0_17ck195 = 0 time = 1960
* CHECK dout0_18 vdout0_18ck195 = 0 time = 1960
* CHECK dout0_19 vdout0_19ck195 = 0 time = 1960
* CHECK dout0_20 vdout0_20ck195 = 5.0 time = 1960
* CHECK dout0_21 vdout0_21ck195 = 5.0 time = 1960
* CHECK dout0_22 vdout0_22ck195 = 5.0 time = 1960
* CHECK dout0_23 vdout0_23ck195 = 0 time = 1960
* CHECK dout0_24 vdout0_24ck195 = 0 time = 1960
* CHECK dout0_25 vdout0_25ck195 = 5.0 time = 1960
* CHECK dout0_26 vdout0_26ck195 = 0 time = 1960
* CHECK dout0_27 vdout0_27ck195 = 0 time = 1960
* CHECK dout0_28 vdout0_28ck195 = 0 time = 1960
* CHECK dout0_29 vdout0_29ck195 = 0 time = 1960
* CHECK dout0_30 vdout0_30ck195 = 0 time = 1960
* CHECK dout0_31 vdout0_31ck195 = 5.0 time = 1960
* CHECK dout0_0 vdout0_0ck196 = 0 time = 1970
* CHECK dout0_1 vdout0_1ck196 = 5.0 time = 1970
* CHECK dout0_2 vdout0_2ck196 = 5.0 time = 1970
* CHECK dout0_3 vdout0_3ck196 = 0 time = 1970
* CHECK dout0_4 vdout0_4ck196 = 5.0 time = 1970
* CHECK dout0_5 vdout0_5ck196 = 5.0 time = 1970
* CHECK dout0_6 vdout0_6ck196 = 5.0 time = 1970
* CHECK dout0_7 vdout0_7ck196 = 5.0 time = 1970
* CHECK dout0_8 vdout0_8ck196 = 0 time = 1970
* CHECK dout0_9 vdout0_9ck196 = 5.0 time = 1970
* CHECK dout0_10 vdout0_10ck196 = 0 time = 1970
* CHECK dout0_11 vdout0_11ck196 = 5.0 time = 1970
* CHECK dout0_12 vdout0_12ck196 = 5.0 time = 1970
* CHECK dout0_13 vdout0_13ck196 = 5.0 time = 1970
* CHECK dout0_14 vdout0_14ck196 = 5.0 time = 1970
* CHECK dout0_15 vdout0_15ck196 = 5.0 time = 1970
* CHECK dout0_16 vdout0_16ck196 = 5.0 time = 1970
* CHECK dout0_17 vdout0_17ck196 = 0 time = 1970
* CHECK dout0_18 vdout0_18ck196 = 5.0 time = 1970
* CHECK dout0_19 vdout0_19ck196 = 0 time = 1970
* CHECK dout0_20 vdout0_20ck196 = 0 time = 1970
* CHECK dout0_21 vdout0_21ck196 = 5.0 time = 1970
* CHECK dout0_22 vdout0_22ck196 = 0 time = 1970
* CHECK dout0_23 vdout0_23ck196 = 5.0 time = 1970
* CHECK dout0_24 vdout0_24ck196 = 0 time = 1970
* CHECK dout0_25 vdout0_25ck196 = 5.0 time = 1970
* CHECK dout0_26 vdout0_26ck196 = 0 time = 1970
* CHECK dout0_27 vdout0_27ck196 = 0 time = 1970
* CHECK dout0_28 vdout0_28ck196 = 0 time = 1970
* CHECK dout0_29 vdout0_29ck196 = 0 time = 1970
* CHECK dout0_30 vdout0_30ck196 = 5.0 time = 1970
* CHECK dout0_31 vdout0_31ck196 = 0 time = 1970
* CHECK dout0_0 vdout0_0ck199 = 5.0 time = 2000
* CHECK dout0_1 vdout0_1ck199 = 0 time = 2000
* CHECK dout0_2 vdout0_2ck199 = 5.0 time = 2000
* CHECK dout0_3 vdout0_3ck199 = 5.0 time = 2000
* CHECK dout0_4 vdout0_4ck199 = 0 time = 2000
* CHECK dout0_5 vdout0_5ck199 = 0 time = 2000
* CHECK dout0_6 vdout0_6ck199 = 5.0 time = 2000
* CHECK dout0_7 vdout0_7ck199 = 0 time = 2000
* CHECK dout0_8 vdout0_8ck199 = 0 time = 2000
* CHECK dout0_9 vdout0_9ck199 = 0 time = 2000
* CHECK dout0_10 vdout0_10ck199 = 0 time = 2000
* CHECK dout0_11 vdout0_11ck199 = 0 time = 2000
* CHECK dout0_12 vdout0_12ck199 = 0 time = 2000
* CHECK dout0_13 vdout0_13ck199 = 5.0 time = 2000
* CHECK dout0_14 vdout0_14ck199 = 0 time = 2000
* CHECK dout0_15 vdout0_15ck199 = 5.0 time = 2000
* CHECK dout0_16 vdout0_16ck199 = 0 time = 2000
* CHECK dout0_17 vdout0_17ck199 = 5.0 time = 2000
* CHECK dout0_18 vdout0_18ck199 = 5.0 time = 2000
* CHECK dout0_19 vdout0_19ck199 = 0 time = 2000
* CHECK dout0_20 vdout0_20ck199 = 0 time = 2000
* CHECK dout0_21 vdout0_21ck199 = 5.0 time = 2000
* CHECK dout0_22 vdout0_22ck199 = 0 time = 2000
* CHECK dout0_23 vdout0_23ck199 = 0 time = 2000
* CHECK dout0_24 vdout0_24ck199 = 0 time = 2000
* CHECK dout0_25 vdout0_25ck199 = 5.0 time = 2000
* CHECK dout0_26 vdout0_26ck199 = 0 time = 2000
* CHECK dout0_27 vdout0_27ck199 = 5.0 time = 2000
* CHECK dout0_28 vdout0_28ck199 = 0 time = 2000
* CHECK dout0_29 vdout0_29ck199 = 5.0 time = 2000
* CHECK dout0_30 vdout0_30ck199 = 0 time = 2000
* CHECK dout0_31 vdout0_31ck199 = 0 time = 2000
* CHECK dout0_0 vdout0_0ck200 = 0 time = 2010
* CHECK dout0_1 vdout0_1ck200 = 5.0 time = 2010
* CHECK dout0_2 vdout0_2ck200 = 5.0 time = 2010
* CHECK dout0_3 vdout0_3ck200 = 0 time = 2010
* CHECK dout0_4 vdout0_4ck200 = 5.0 time = 2010
* CHECK dout0_5 vdout0_5ck200 = 5.0 time = 2010
* CHECK dout0_6 vdout0_6ck200 = 5.0 time = 2010
* CHECK dout0_7 vdout0_7ck200 = 5.0 time = 2010
* CHECK dout0_8 vdout0_8ck200 = 0 time = 2010
* CHECK dout0_9 vdout0_9ck200 = 5.0 time = 2010
* CHECK dout0_10 vdout0_10ck200 = 0 time = 2010
* CHECK dout0_11 vdout0_11ck200 = 5.0 time = 2010
* CHECK dout0_12 vdout0_12ck200 = 5.0 time = 2010
* CHECK dout0_13 vdout0_13ck200 = 5.0 time = 2010
* CHECK dout0_14 vdout0_14ck200 = 5.0 time = 2010
* CHECK dout0_15 vdout0_15ck200 = 5.0 time = 2010
* CHECK dout0_16 vdout0_16ck200 = 5.0 time = 2010
* CHECK dout0_17 vdout0_17ck200 = 0 time = 2010
* CHECK dout0_18 vdout0_18ck200 = 5.0 time = 2010
* CHECK dout0_19 vdout0_19ck200 = 0 time = 2010
* CHECK dout0_20 vdout0_20ck200 = 0 time = 2010
* CHECK dout0_21 vdout0_21ck200 = 5.0 time = 2010
* CHECK dout0_22 vdout0_22ck200 = 0 time = 2010
* CHECK dout0_23 vdout0_23ck200 = 5.0 time = 2010
* CHECK dout0_24 vdout0_24ck200 = 0 time = 2010
* CHECK dout0_25 vdout0_25ck200 = 5.0 time = 2010
* CHECK dout0_26 vdout0_26ck200 = 0 time = 2010
* CHECK dout0_27 vdout0_27ck200 = 0 time = 2010
* CHECK dout0_28 vdout0_28ck200 = 0 time = 2010
* CHECK dout0_29 vdout0_29ck200 = 0 time = 2010
* CHECK dout0_30 vdout0_30ck200 = 5.0 time = 2010
* CHECK dout0_31 vdout0_31ck200 = 0 time = 2010
* CHECK dout0_0 vdout0_0ck201 = 5.0 time = 2020
* CHECK dout0_1 vdout0_1ck201 = 0 time = 2020
* CHECK dout0_2 vdout0_2ck201 = 5.0 time = 2020
* CHECK dout0_3 vdout0_3ck201 = 5.0 time = 2020
* CHECK dout0_4 vdout0_4ck201 = 0 time = 2020
* CHECK dout0_5 vdout0_5ck201 = 0 time = 2020
* CHECK dout0_6 vdout0_6ck201 = 5.0 time = 2020
* CHECK dout0_7 vdout0_7ck201 = 0 time = 2020
* CHECK dout0_8 vdout0_8ck201 = 0 time = 2020
* CHECK dout0_9 vdout0_9ck201 = 0 time = 2020
* CHECK dout0_10 vdout0_10ck201 = 0 time = 2020
* CHECK dout0_11 vdout0_11ck201 = 0 time = 2020
* CHECK dout0_12 vdout0_12ck201 = 0 time = 2020
* CHECK dout0_13 vdout0_13ck201 = 5.0 time = 2020
* CHECK dout0_14 vdout0_14ck201 = 0 time = 2020
* CHECK dout0_15 vdout0_15ck201 = 5.0 time = 2020
* CHECK dout0_16 vdout0_16ck201 = 0 time = 2020
* CHECK dout0_17 vdout0_17ck201 = 5.0 time = 2020
* CHECK dout0_18 vdout0_18ck201 = 5.0 time = 2020
* CHECK dout0_19 vdout0_19ck201 = 0 time = 2020
* CHECK dout0_20 vdout0_20ck201 = 0 time = 2020
* CHECK dout0_21 vdout0_21ck201 = 5.0 time = 2020
* CHECK dout0_22 vdout0_22ck201 = 0 time = 2020
* CHECK dout0_23 vdout0_23ck201 = 0 time = 2020
* CHECK dout0_24 vdout0_24ck201 = 0 time = 2020
* CHECK dout0_25 vdout0_25ck201 = 5.0 time = 2020
* CHECK dout0_26 vdout0_26ck201 = 0 time = 2020
* CHECK dout0_27 vdout0_27ck201 = 5.0 time = 2020
* CHECK dout0_28 vdout0_28ck201 = 0 time = 2020
* CHECK dout0_29 vdout0_29ck201 = 5.0 time = 2020
* CHECK dout0_30 vdout0_30ck201 = 0 time = 2020
* CHECK dout0_31 vdout0_31ck201 = 0 time = 2020
* CHECK dout0_0 vdout0_0ck204 = 5.0 time = 2050
* CHECK dout0_1 vdout0_1ck204 = 0 time = 2050
* CHECK dout0_2 vdout0_2ck204 = 5.0 time = 2050
* CHECK dout0_3 vdout0_3ck204 = 5.0 time = 2050
* CHECK dout0_4 vdout0_4ck204 = 0 time = 2050
* CHECK dout0_5 vdout0_5ck204 = 5.0 time = 2050
* CHECK dout0_6 vdout0_6ck204 = 0 time = 2050
* CHECK dout0_7 vdout0_7ck204 = 0 time = 2050
* CHECK dout0_8 vdout0_8ck204 = 5.0 time = 2050
* CHECK dout0_9 vdout0_9ck204 = 0 time = 2050
* CHECK dout0_10 vdout0_10ck204 = 5.0 time = 2050
* CHECK dout0_11 vdout0_11ck204 = 5.0 time = 2050
* CHECK dout0_12 vdout0_12ck204 = 5.0 time = 2050
* CHECK dout0_13 vdout0_13ck204 = 5.0 time = 2050
* CHECK dout0_14 vdout0_14ck204 = 0 time = 2050
* CHECK dout0_15 vdout0_15ck204 = 0 time = 2050
* CHECK dout0_16 vdout0_16ck204 = 0 time = 2050
* CHECK dout0_17 vdout0_17ck204 = 5.0 time = 2050
* CHECK dout0_18 vdout0_18ck204 = 0 time = 2050
* CHECK dout0_19 vdout0_19ck204 = 0 time = 2050
* CHECK dout0_20 vdout0_20ck204 = 0 time = 2050
* CHECK dout0_21 vdout0_21ck204 = 5.0 time = 2050
* CHECK dout0_22 vdout0_22ck204 = 0 time = 2050
* CHECK dout0_23 vdout0_23ck204 = 0 time = 2050
* CHECK dout0_24 vdout0_24ck204 = 5.0 time = 2050
* CHECK dout0_25 vdout0_25ck204 = 5.0 time = 2050
* CHECK dout0_26 vdout0_26ck204 = 5.0 time = 2050
* CHECK dout0_27 vdout0_27ck204 = 0 time = 2050
* CHECK dout0_28 vdout0_28ck204 = 5.0 time = 2050
* CHECK dout0_29 vdout0_29ck204 = 5.0 time = 2050
* CHECK dout0_30 vdout0_30ck204 = 5.0 time = 2050
* CHECK dout0_31 vdout0_31ck204 = 5.0 time = 2050
.include /home/anupam-sarashwat/Documents/antigravity/cool-hawking/titan_x_soc/06_Macro_Generation_Openram/sram_output/functional_meas.sp
* probe is used for hspice/xa, while plot is used in ngspice
*.probe V(*)
*.plot V(*)
.end

