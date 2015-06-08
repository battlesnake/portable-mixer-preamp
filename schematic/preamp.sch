EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:mark
EELAYER 27 0
EELAYER END
$Descr User 8500 6500
encoding utf-8
Sheet 6 8
Title "General purpose audio preamplifier with mic boost+couple and variable gain"
Date "8 jun 2015"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L OPAMPX2 U1
U 1 1 5574B10B
P 4400 2650
AR Path="/55758894/5574B10B" Ref="U1"  Part="2" 
AR Path="/55758E47/5574B10B" Ref="U2"  Part="1" 
AR Path="/55759A9A/5574B10B" Ref="U2"  Part="2" 
AR Path="/55759AA8/5574B10B" Ref="U3"  Part="1" 
F 0 "U3" H 4550 2800 50  0000 C CNN
F 1 "LM358AN" H 4650 2450 50  0000 C CNN
F 2 "~" H 4400 2650 60  0000 C CNN
F 3 "~" H 4400 2650 60  0000 C CNN
	1    4400 2650
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 5574B111
P 3750 2550
AR Path="/55758894/5574B111" Ref="R5"  Part="1" 
AR Path="/55758E47/5574B111" Ref="R9"  Part="1" 
AR Path="/55759A9A/5574B111" Ref="R13"  Part="1" 
AR Path="/55759AA8/5574B111" Ref="R17"  Part="1" 
F 0 "R17" V 3850 2550 50  0000 C CNN
F 1 "47k" V 3650 2550 50  0000 C CNN
F 2 "" V 3680 2550 30  0000 C CNN
F 3 "" H 3750 2550 30  0000 C CNN
	1    3750 2550
	0    -1   -1   0   
$EndComp
$Comp
L R R4
U 1 1 5574B117
P 3750 1950
AR Path="/55758894/5574B117" Ref="R4"  Part="1" 
AR Path="/55758E47/5574B117" Ref="R8"  Part="1" 
AR Path="/55759A9A/5574B117" Ref="R12"  Part="1" 
AR Path="/55759AA8/5574B117" Ref="R16"  Part="1" 
F 0 "R16" V 3850 1950 50  0000 C CNN
F 1 "47R" V 3650 1950 50  0000 C CNN
F 2 "" V 3680 1950 30  0000 C CNN
F 3 "" H 3750 1950 30  0000 C CNN
	1    3750 1950
	0    -1   -1   0   
$EndComp
$Comp
L R R7
U 1 1 5574B11D
P 5050 2650
AR Path="/55758894/5574B11D" Ref="R7"  Part="1" 
AR Path="/55758E47/5574B11D" Ref="R11"  Part="1" 
AR Path="/55759A9A/5574B11D" Ref="R15"  Part="1" 
AR Path="/55759AA8/5574B11D" Ref="R19"  Part="1" 
F 0 "R19" V 5130 2650 50  0000 C CNN
F 1 "1k" V 4950 2650 50  0000 C CNN
F 2 "" V 4980 2650 30  0000 C CNN
F 3 "" H 5050 2650 30  0000 C CNN
	1    5050 2650
	0    -1   -1   0   
$EndComp
$Comp
L RVAR R6
U 1 1 5574B123
P 4350 1950
AR Path="/55758894/5574B123" Ref="R6"  Part="1" 
AR Path="/55758E47/5574B123" Ref="R10"  Part="1" 
AR Path="/55759A9A/5574B123" Ref="R14"  Part="1" 
AR Path="/55759AA8/5574B123" Ref="R18"  Part="1" 
F 0 "R18" V 4450 1950 50  0000 C CNN
F 1 "500k-LOG" V 4250 1950 50  0000 C CNN
F 2 "" H 4350 1950 60  0000 C CNN
F 3 "" H 4350 1950 60  0000 C CNN
	1    4350 1950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3900 2550 4100 2550
Wire Wire Line
	3400 2550 3600 2550
Wire Wire Line
	4700 2650 4900 2650
Connection ~ 4800 2650
Connection ~ 4000 2550
$Comp
L VSS #PWR010
U 1 1 5574B131
P 4400 2950
AR Path="/55758894/5574B131" Ref="#PWR010"  Part="1" 
AR Path="/55758E47/5574B131" Ref="#PWR013"  Part="1" 
AR Path="/55759A9A/5574B131" Ref="#PWR016"  Part="1" 
AR Path="/55759AA8/5574B131" Ref="#PWR019"  Part="1" 
F 0 "#PWR019" H 4400 2800 50  0001 C CNN
F 1 "VSS" H 4400 3100 50  0000 C CNN
F 2 "" H 4400 2950 60  0000 C CNN
F 3 "" H 4400 2950 60  0000 C CNN
	1    4400 2950
	-1   0    0    1   
$EndComp
$Comp
L VDD #PWR011
U 1 1 5574B137
P 4400 2350
AR Path="/55758894/5574B137" Ref="#PWR011"  Part="1" 
AR Path="/55758E47/5574B137" Ref="#PWR014"  Part="1" 
AR Path="/55759A9A/5574B137" Ref="#PWR017"  Part="1" 
AR Path="/55759AA8/5574B137" Ref="#PWR020"  Part="1" 
F 0 "#PWR020" H 4400 2200 50  0001 C CNN
F 1 "VDD" H 4400 2500 50  0000 C CNN
F 2 "" H 4400 2350 60  0000 C CNN
F 3 "" H 4400 2350 60  0000 C CNN
	1    4400 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 1950 4100 1950
Wire Wire Line
	4000 1950 4000 2550
Connection ~ 4000 1950
Wire Wire Line
	4600 1950 4800 1950
Wire Wire Line
	4800 1950 4800 2650
$Comp
L SPST_SWITCH S5
U 1 1 5574B144
P 3350 1950
AR Path="/55758894/5574B144" Ref="S5"  Part="1" 
AR Path="/55758E47/5574B144" Ref="S6"  Part="1" 
AR Path="/55759A9A/5574B144" Ref="S7"  Part="1" 
AR Path="/55759AA8/5574B144" Ref="S8"  Part="1" 
F 0 "S8" H 3350 2050 50  0000 C CNN
F 1 "ON/OFF" H 3350 1850 50  0000 C CNN
F 2 "~" H 3350 1950 60  0000 C CNN
F 3 "~" H 3350 1950 60  0000 C CNN
	1    3350 1950
	1    0    0    -1  
$EndComp
$Comp
L C_SMALL C2
U 1 1 5574B14B
P 3300 2550
AR Path="/55758894/5574B14B" Ref="C2"  Part="1" 
AR Path="/55758E47/5574B14B" Ref="C3"  Part="1" 
AR Path="/55759A9A/5574B14B" Ref="C4"  Part="1" 
AR Path="/55759AA8/5574B14B" Ref="C5"  Part="1" 
F 0 "C5" V 3400 2500 50  0000 L CNN
F 1 "470n" V 3200 2450 50  0000 L CNN
F 2 "" H 3300 2550 60  0000 C CNN
F 3 "" H 3300 2550 60  0000 C CNN
	1    3300 2550
	0    -1   -1   0   
$EndComp
$Comp
L JACK_2P J2
U 1 1 5574B151
P 2550 2850
AR Path="/55758894/5574B151" Ref="J2"  Part="1" 
AR Path="/55758E47/5574B151" Ref="J3"  Part="1" 
AR Path="/55759A9A/5574B151" Ref="J4"  Part="1" 
AR Path="/55759AA8/5574B151" Ref="J5"  Part="1" 
F 0 "J5" H 2300 2650 50  0000 C CNN
F 1 "MONO JACK 6.35mm" H 2500 3100 50  0000 C CNN
F 2 "" H 2550 2850 60  0000 C CNN
F 3 "" H 2550 2850 60  0000 C CNN
	1    2550 2850
	1    0    0    1   
$EndComp
Text HLabel 5300 2650 2    60   Output ~ 0
PREAMP_OUT
Wire Wire Line
	3200 1950 3100 1950
Wire Wire Line
	3200 2550 3100 2550
Connection ~ 3100 2550
$Comp
L GND #PWR012
U 1 1 5574AB99
P 4000 3100
AR Path="/55758894/5574AB99" Ref="#PWR012"  Part="1" 
AR Path="/55758E47/5574AB99" Ref="#PWR015"  Part="1" 
AR Path="/55759A9A/5574AB99" Ref="#PWR018"  Part="1" 
AR Path="/55759AA8/5574AB99" Ref="#PWR021"  Part="1" 
F 0 "#PWR021" H 4000 2850 50  0001 C CNN
F 1 "GND" H 4000 2950 50  0000 C CNN
F 2 "" H 4000 3100 60  0000 C CNN
F 3 "" H 4000 3100 60  0000 C CNN
	1    4000 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 1950 3600 1950
Wire Wire Line
	3100 1950 3100 2750
Wire Wire Line
	3100 2750 3000 2750
Wire Wire Line
	3000 2850 3000 3000
Wire Wire Line
	3000 3000 4000 3000
Connection ~ 4000 3000
Wire Wire Line
	5200 2650 5300 2650
Text Notes 2100 3650 0    60   ~ 0
S1 | Passive input mode: DC coupling and +30dB gain\nR3 | Gain: Max = +10dB (normal mode) or +40dB (passive input mode)
Wire Wire Line
	4000 3100 4000 2750
Wire Wire Line
	4000 2750 4100 2750
Wire Wire Line
	4400 2350 4400 2450
Wire Wire Line
	4400 2950 4400 2850
$EndSCHEMATC
