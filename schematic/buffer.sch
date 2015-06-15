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
Sheet 2 8
Title "noname.sch"
Date "15 jun 2015"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L OPAMPX2 U1
U 1 1 5575B732
P 3800 3100
AR Path="/557585B2/5575B732" Ref="U1"  Part="1" 
AR Path="/5575AD0A/5575B732" Ref="U5"  Part="2" 
F 0 "U1" H 3950 3250 50  0000 C CNN
F 1 "LM358AN" H 4050 2950 50  0000 C CNN
F 2 "~" H 3800 3100 60  0000 C CNN
F 3 "~" H 3800 3100 60  0000 C CNN
	1    3800 3100
	1    0    0    -1  
$EndComp
$Comp
L VSS #PWR07
U 1 1 5575B73B
P 3800 3400
AR Path="/557585B2/5575B73B" Ref="#PWR07"  Part="1" 
AR Path="/5575AD0A/5575B73B" Ref="#PWR038"  Part="1" 
F 0 "#PWR038" H 3800 3250 50  0001 C CNN
F 1 "VSS" H 3800 3550 50  0000 C CNN
F 2 "" H 3800 3400 60  0000 C CNN
F 3 "" H 3800 3400 60  0000 C CNN
	1    3800 3400
	-1   0    0    1   
$EndComp
$Comp
L VDD #PWR08
U 1 1 5575B741
P 3800 2800
AR Path="/557585B2/5575B741" Ref="#PWR08"  Part="1" 
AR Path="/5575AD0A/5575B741" Ref="#PWR039"  Part="1" 
F 0 "#PWR039" H 3800 2650 50  0001 C CNN
F 1 "VDD" H 3800 2950 50  0000 C CNN
F 2 "" H 3800 2800 60  0000 C CNN
F 3 "" H 3800 2800 60  0000 C CNN
	1    3800 2800
	1    0    0    -1  
$EndComp
$Comp
L R_SMALL R3
U 1 1 5575B74A
P 4600 3300
AR Path="/557585B2/5575B74A" Ref="R3"  Part="1" 
AR Path="/5575AD0A/5575B74A" Ref="R28"  Part="1" 
F 0 "R3" H 4650 3350 50  0000 L CNN
F 1 "1k" H 4650 3250 50  0000 L CNN
F 2 "" H 4600 3300 60  0000 C CNN
F 3 "" H 4600 3300 60  0000 C CNN
	1    4600 3300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 5575B751
P 4600 3500
AR Path="/557585B2/5575B751" Ref="#PWR09"  Part="1" 
AR Path="/5575AD0A/5575B751" Ref="#PWR040"  Part="1" 
F 0 "#PWR040" H 4600 3250 50  0001 C CNN
F 1 "GND" H 4600 3350 50  0000 C CNN
F 2 "" H 4600 3500 60  0000 C CNN
F 3 "" H 4600 3500 60  0000 C CNN
	1    4600 3500
	1    0    0    -1  
$EndComp
Text HLabel 4700 3100 2    60   Output ~ 0
BUFFER_OUT
Text HLabel 3400 3200 0    60   Input ~ 0
BUFFER_IN
$Comp
L CP1_SMALL C1
U 1 1 5575B75D
P 4400 3100
AR Path="/557585B2/5575B75D" Ref="C1"  Part="1" 
AR Path="/5575AD0A/5575B75D" Ref="C6"  Part="1" 
F 0 "C1" V 4550 3050 50  0000 L CNN
F 1 "1μ" V 4250 3050 50  0000 L CNN
F 2 "" H 4400 3100 60  0000 C CNN
F 3 "" H 4400 3100 60  0000 C CNN
	1    4400 3100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3500 3000 3400 3000
Wire Wire Line
	3400 3000 3400 2500
Wire Wire Line
	3400 2500 4200 2500
Wire Wire Line
	4200 2500 4200 3100
Connection ~ 4200 3100
Wire Wire Line
	4100 3100 4300 3100
Wire Wire Line
	3500 3200 3400 3200
Wire Wire Line
	4600 3500 4600 3400
Wire Wire Line
	4500 3100 4700 3100
Wire Wire Line
	4600 3100 4600 3200
Connection ~ 4600 3100
Wire Wire Line
	3800 3400 3800 3300
Wire Wire Line
	3800 2900 3800 2800
$EndSCHEMATC
