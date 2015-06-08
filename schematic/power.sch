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
Sheet 8 8
Title "Power supply"
Date "8 jun 2015"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L LED D3
U 1 1 5575E792
P 4100 2900
F 0 "D3" V 4150 3050 50  0000 C CNN
F 1 "20-40mA" V 4050 3150 50  0000 C CNN
F 2 "" H 4100 2900 60  0000 C CNN
F 3 "" H 4100 2900 60  0000 C CNN
	1    4100 2900
	0    1    -1   0   
$EndComp
$Comp
L BF244C Q1
U 1 1 5575E798
P 4200 3400
F 0 "Q1" H 4400 3475 50  0000 L CNN
F 1 "J309" H 4400 3400 50  0000 L CNN
F 2 "TO-92" H 4400 3325 50  0000 L CIN
F 3 "" H 4200 3350 50  0000 L CNN
	1    4200 3400
	-1   0    0    -1  
$EndComp
$Comp
L CP1 C7
U 1 1 5575E79E
P 5100 2850
F 0 "C7" H 4900 2900 50  0000 L CNN
F 1 "100μ" H 4800 2800 50  0000 L CNN
F 2 "" H 5100 2850 60  0000 C CNN
F 3 "" H 5100 2850 60  0000 C CNN
	1    5100 2850
	-1   0    0    -1  
$EndComp
$Comp
L CP1 C8
U 1 1 5575E7A4
P 5100 3350
F 0 "C8" H 4900 3400 50  0000 L CNN
F 1 "100μ" H 4800 3300 50  0000 L CNN
F 2 "" H 5100 3350 60  0000 C CNN
F 3 "" H 5100 3350 60  0000 C CNN
	1    5100 3350
	-1   0    0    -1  
$EndComp
$Comp
L R R22
U 1 1 5575E7AA
P 4700 2850
F 0 "R22" H 4600 2900 50  0000 C CNN
F 1 "1k" H 4600 2800 50  0000 C CNN
F 2 "" V 4630 2850 30  0000 C CNN
F 3 "" H 4700 2850 30  0000 C CNN
	1    4700 2850
	-1   0    0    -1  
$EndComp
$Comp
L R R23
U 1 1 5575E7B0
P 4700 3350
F 0 "R23" H 4600 3400 50  0000 C CNN
F 1 "1k" H 4600 3300 50  0000 C CNN
F 2 "" V 4630 3350 30  0000 C CNN
F 3 "" H 4700 3350 30  0000 C CNN
	1    4700 3350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5100 3000 5100 3200
Wire Wire Line
	4700 3200 4700 3000
Wire Wire Line
	5650 3100 4700 3100
Connection ~ 4700 3100
Connection ~ 5100 3100
Wire Wire Line
	4100 3100 4100 3200
Wire Wire Line
	4400 3450 4400 3700
Wire Wire Line
	4100 3700 4100 3600
Connection ~ 4400 3700
Wire Wire Line
	4700 3500 4700 3700
Connection ~ 4700 3700
Wire Wire Line
	5100 3500 5100 3700
Connection ~ 5100 3700
Wire Wire Line
	4100 2700 4100 2500
Wire Wire Line
	5100 2700 5100 2500
Connection ~ 5100 2500
Wire Wire Line
	4700 2700 4700 2500
Connection ~ 4700 2500
$Comp
L BATTERY BAT1
U 1 1 5575E7D1
P 3600 3350
F 0 "BAT1" H 3700 3400 50  0000 L CNN
F 1 "4-12V" H 3700 3300 50  0000 L CNN
F 2 "" V 3600 3390 60  0000 C CNN
F 3 "" V 3600 3390 60  0000 C CNN
	1    3600 3350
	-1   0    0    -1  
$EndComp
Connection ~ 4100 2500
Connection ~ 4100 3700
$Comp
L D_SCHOTTKY D1
U 1 1 5575E7DB
P 3350 2500
F 0 "D1" H 3350 2600 50  0000 C CNN
F 1 " " H 3350 2400 50  0000 C CNN
F 2 "" H 3350 2500 60  0000 C CNN
F 3 "" H 3350 2500 60  0000 C CNN
	1    3350 2500
	-1   0    0    -1  
$EndComp
$Comp
L USB_OTG P1
U 1 1 5575E7E1
P 2700 3200
F 0 "P1" V 2400 3200 50  0000 C CNN
F 1 "MICRO-USB-B" V 3200 3150 50  0000 C CNN
F 2 "" V 2650 3100 60  0000 C CNN
F 3 "" V 2650 3100 60  0000 C CNN
	1    2700 3200
	0    -1   1    0   
$EndComp
Connection ~ 3600 2500
Wire Wire Line
	3100 2500 3200 2500
Connection ~ 3600 3700
$Comp
L R R21
U 1 1 5575E7EA
P 3100 2750
F 0 "R21" H 3000 2800 50  0000 C CNN
F 1 "10" H 3000 2700 50  0000 C CNN
F 2 "" V 3030 2750 30  0000 C CNN
F 3 "" H 3100 2750 30  0000 C CNN
	1    3100 2750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3000 3000 3100 3000
Wire Wire Line
	3100 3000 3100 2900
Wire Wire Line
	3100 2600 3100 2500
NoConn ~ 3000 3100
NoConn ~ 3000 3200
NoConn ~ 3000 3300
NoConn ~ 2600 3600
$Comp
L D_SCHOTTKY D2
U 1 1 5575EB0B
P 3600 2850
F 0 "D2" H 3600 2950 50  0000 C CNN
F 1 " " H 3600 2750 50  0000 C CNN
F 2 "" H 3600 2850 60  0000 C CNN
F 3 "" H 3600 2850 60  0000 C CNN
	1    3600 2850
	0    -1   1    0   
$EndComp
Wire Wire Line
	3600 2500 3600 2700
Wire Wire Line
	3600 3000 3600 3200
Wire Wire Line
	3600 3500 3600 3700
Text HLabel 5650 3100 2    60   Output ~ 0
0V
Text HLabel 5650 2500 2    60   Output ~ 0
+V
Text HLabel 5650 3700 2    60   Output ~ 0
-V
Wire Wire Line
	3500 2500 5650 2500
Wire Wire Line
	3000 3400 3100 3400
Wire Wire Line
	3100 3400 3100 3700
Wire Wire Line
	3100 3700 5650 3700
$EndSCHEMATC
