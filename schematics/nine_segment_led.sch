EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Nine segment LED"
Date "lun. 30 mars 2015"
Rev ""
Comp ""
Comment1 "We're only using 7 segments though"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR03
U 1 1 56D70CC2
P 4350 4550
F 0 "#PWR03" H 4350 4300 50  0001 C CNN
F 1 "GND" H 4350 4400 50  0000 C CNN
F 2 "" H 4350 4550 50  0000 C CNN
F 3 "" H 4350 4550 50  0000 C CNN
	1    4350 4550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 56D70CFF
P 5350 4550
F 0 "#PWR04" H 5350 4300 50  0001 C CNN
F 1 "GND" H 5350 4400 50  0000 C CNN
F 2 "" H 5350 4550 50  0000 C CNN
F 3 "" H 5350 4550 50  0000 C CNN
	1    5350 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 2900 5350 4550
Text Label 4000 2850 1    60   ~ 0
Vin
Text Label 4400 2850 1    60   ~ 0
IOREF
Text Label 3950 3900 0    60   ~ 0
A0
Text Label 3950 4000 0    60   ~ 0
A1
Text Label 3950 4100 0    60   ~ 0
A2
Text Label 3950 4200 0    60   ~ 0
A3
Text Label 3950 4300 0    60   ~ 0
A4(SDA)
Text Label 3950 4400 0    60   ~ 0
A5(SCL)
Text Label 5600 4400 0    60   ~ 0
0(Rx)
Text Label 5600 4200 0    60   ~ 0
2
Text Label 5600 4300 0    60   ~ 0
1(Tx)
Text Label 5600 4100 0    60   ~ 0
3(**)
Text Label 5600 4000 0    60   ~ 0
4
Text Label 5600 3900 0    60   ~ 0
5(**)
Text Label 5600 3800 0    60   ~ 0
6(**)
Text Label 5600 3700 0    60   ~ 0
7
Text Label 5600 3500 0    60   ~ 0
8
Text Label 5600 3400 0    60   ~ 0
9(**)
Text Label 5600 3300 0    60   ~ 0
10(**/SS)
Text Label 5600 3200 0    60   ~ 0
11(**/MOSI)
Text Label 5600 3100 0    60   ~ 0
12(MISO)
Text Label 5600 3000 0    60   ~ 0
13(SCK)
Text Label 5600 2800 0    60   ~ 0
AREF
NoConn ~ 4450 3000
Text Label 5600 2700 0    60   ~ 0
A4(SDA)
Text Label 5600 2600 0    60   ~ 0
A5(SCL)
Text Notes 4000 2350 0    60   ~ 0
Assuming Arduino Uno R3\nshield on Cyclone 10 LP\ndev kit
$Comp
L power:+3.3V #PWR01
U 1 1 56D70538
P 4200 2850
F 0 "#PWR01" H 4200 2700 50  0001 C CNN
F 1 "+3.3V" V 4200 3100 50  0000 C CNN
F 2 "" H 4200 2850 50  0000 C CNN
F 3 "" H 4200 2850 50  0000 C CNN
	1    4200 2850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR02
U 1 1 56D707BB
P 4100 2750
F 0 "#PWR02" H 4100 2600 50  0001 C CNN
F 1 "+5V" V 4100 2950 50  0000 C CNN
F 2 "" H 4100 2750 50  0000 C CNN
F 3 "" H 4100 2750 50  0000 C CNN
	1    4100 2750
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x06 P2
U 1 1 56D70DD8
P 4650 4100
F 0 "P2" H 4650 3700 50  0000 C CNN
F 1 "Analog" V 4750 4100 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x06" V 4800 4150 20  0000 C CNN
F 3 "" H 4650 4100 50  0000 C CNN
	1    4650 4100
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x08 P4
U 1 1 56D7164F
P 5050 4000
F 0 "P4" H 5050 3500 50  0000 C CNN
F 1 "Digital" V 5150 4000 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x08" V 5200 3950 20  0000 C CNN
F 3 "" H 5050 4000 50  0000 C CNN
	1    5050 4000
	-1   0    0    -1  
$EndComp
Wire Notes Line
	3975 2425 5375 2425
Wire Notes Line
	5375 2425 5375 2075
Wire Wire Line
	4400 2850 4400 3100
Wire Wire Line
	4400 3100 4450 3100
Wire Wire Line
	4450 3900 3950 3900
Wire Wire Line
	4450 4000 3950 4000
Wire Wire Line
	4450 4100 3950 4100
Wire Wire Line
	4450 4200 3950 4200
Wire Wire Line
	4450 4300 3950 4300
Wire Wire Line
	4450 4400 3950 4400
$Comp
L Connector_Generic:Conn_01x10 P3
U 1 1 56D721E0
P 5050 3000
F 0 "P3" H 5050 3550 50  0000 C CNN
F 1 "Digital" V 5150 3000 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x10" V 5200 3000 20  0000 C CNN
F 3 "" H 5050 3000 50  0000 C CNN
	1    5050 3000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5250 3200 5600 3200
Wire Wire Line
	5250 3100 5600 3100
Wire Wire Line
	5250 3000 5600 3000
Wire Wire Line
	5250 2800 5600 2800
Wire Wire Line
	5250 2700 5600 2700
Wire Wire Line
	5250 2600 5600 2600
Wire Wire Line
	5250 4100 5600 4100
Wire Wire Line
	5250 4000 5600 4000
Wire Wire Line
	5250 3900 5600 3900
Wire Wire Line
	5250 3800 5600 3800
Wire Wire Line
	5250 3700 5600 3700
Wire Wire Line
	5250 2900 5350 2900
Text Notes 4750 3000 0    60   ~ 0
1
Wire Wire Line
	4450 3200 3700 3200
Wire Wire Line
	4350 3600 4350 4550
Wire Wire Line
	4350 3500 4350 3600
Wire Wire Line
	4200 3300 4200 2850
Wire Wire Line
	4100 3400 4100 2750
Wire Wire Line
	4000 3700 4000 2850
Connection ~ 4350 3600
Wire Wire Line
	4450 3600 4350 3600
Wire Wire Line
	4450 3500 4350 3500
Wire Wire Line
	4450 3700 4000 3700
Wire Wire Line
	4450 3400 4100 3400
Wire Wire Line
	4450 3300 4200 3300
Text Label 3700 3200 0    60   ~ 0
Reset
$Comp
L Connector_Generic:Conn_01x08 P1
U 1 1 56D70129
P 4650 3300
F 0 "P1" H 4650 3750 50  0000 C CNN
F 1 "Power" V 4750 3300 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x08" V 4800 3300 20  0000 C CNN
F 3 "" H 4650 3300 50  0000 C CNN
	1    4650 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 61506481
P 6650 2750
F 0 "R1" V 6443 2750 50  0000 C CNN
F 1 "68" V 6534 2750 50  0000 C CNN
F 2 "" V 6580 2750 50  0001 C CNN
F 3 "~" H 6650 2750 50  0001 C CNN
	1    6650 2750
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 61509C76
P 6650 3000
F 0 "R2" V 6443 3000 50  0000 C CNN
F 1 "68" V 6534 3000 50  0000 C CNN
F 2 "" V 6580 3000 50  0001 C CNN
F 3 "~" H 6650 3000 50  0001 C CNN
	1    6650 3000
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 6150A25B
P 6650 3250
F 0 "R3" V 6443 3250 50  0000 C CNN
F 1 "68" V 6534 3250 50  0000 C CNN
F 2 "" V 6580 3250 50  0001 C CNN
F 3 "~" H 6650 3250 50  0001 C CNN
	1    6650 3250
	0    1    1    0   
$EndComp
$Comp
L MyLED:TOM-15888H-B U1
U 1 1 6156C8AA
P 7900 3500
F 0 "U1" H 8758 3614 50  0000 L CNN
F 1 "TOM-15888H-B" H 8758 3523 50  0000 L CNN
F 2 "" H 8300 2350 50  0001 C CNN
F 3 "" H 8300 2350 50  0001 C CNN
	1    7900 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 2750 7000 2750
Wire Wire Line
	6800 3000 7000 3000
Wire Wire Line
	6800 3250 7000 3250
Wire Wire Line
	6200 4400 6200 2750
Wire Wire Line
	5250 4400 6200 4400
Wire Wire Line
	6350 4300 6350 3000
Wire Wire Line
	6350 3000 6500 3000
Wire Wire Line
	5250 4300 6350 4300
Wire Wire Line
	6500 4200 6500 3250
Wire Wire Line
	6200 2750 6500 2750
Wire Wire Line
	5250 4200 6500 4200
Wire Wire Line
	7300 2350 6100 2350
Wire Wire Line
	6100 2350 6100 3500
Wire Wire Line
	5250 3500 6100 3500
Wire Wire Line
	7500 2350 7500 2250
Wire Wire Line
	7500 2250 6000 2250
Wire Wire Line
	6000 2250 6000 3400
Wire Wire Line
	5250 3400 6000 3400
Wire Wire Line
	7700 2350 7700 2150
Wire Wire Line
	7700 2150 5900 2150
Wire Wire Line
	5900 2150 5900 3300
Wire Wire Line
	5250 3300 5900 3300
NoConn ~ 7000 3500
NoConn ~ 7000 3750
NoConn ~ 7000 4000
NoConn ~ 7000 4250
NoConn ~ 7000 4500
NoConn ~ 7900 2350
NoConn ~ 8100 2350
NoConn ~ 8300 2350
NoConn ~ 8500 2350
NoConn ~ 8700 2350
NoConn ~ 5250 3700
NoConn ~ 5250 3800
NoConn ~ 5250 3900
NoConn ~ 5250 4000
NoConn ~ 5250 4100
NoConn ~ 5250 3200
NoConn ~ 5250 3100
NoConn ~ 5250 3000
NoConn ~ 5250 2800
NoConn ~ 4450 3100
NoConn ~ 4450 3700
NoConn ~ 4450 3900
NoConn ~ 4450 4000
NoConn ~ 4450 4100
NoConn ~ 4450 4200
NoConn ~ 4450 3200
$EndSCHEMATC
