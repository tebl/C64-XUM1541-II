EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "C64 SpeedDOS Adapter"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 "User Port adapter for using SpeedDOS."
$EndDescr
$Comp
L speed_dos:Speed_DOS_IDC J2
U 1 1 5EF167B3
P 8200 2700
F 0 "J2" H 8200 3125 50  0000 C CNN
F 1 "SpeedDOS" H 8200 3025 50  0000 C CNN
F 2 "speed_dos:SpeedDOS_IDC" H 8200 2700 50  0001 C CNN
F 3 "~" H 8200 2700 50  0001 C CNN
	1    8200 2700
	1    0    0    -1  
$EndComp
Entry Wire Line
	7000 2900 6900 2800
Entry Wire Line
	7000 2800 6900 2700
Entry Wire Line
	7000 2700 6900 2600
Entry Wire Line
	7000 2600 6900 2500
Entry Wire Line
	6900 2900 7000 3000
Entry Wire Line
	6900 3000 7000 3100
Entry Wire Line
	6900 3100 7000 3200
Entry Wire Line
	6900 3200 7000 3300
$Comp
L power:GND #PWR01
U 1 1 5EF2A7F5
P 9050 3475
F 0 "#PWR01" H 9050 3225 50  0001 C CNN
F 1 "GND" H 9055 3302 50  0000 C CNN
F 2 "" H 9050 3475 50  0001 C CNN
F 3 "" H 9050 3475 50  0001 C CNN
	1    9050 3475
	1    0    0    -1  
$EndComp
Wire Wire Line
	8975 3400 9050 3400
Wire Wire Line
	9050 3400 9050 3475
Text Label 7025 2600 0    50   ~ 0
VIA_PA0
Entry Wire Line
	7000 2500 6900 2400
Text Label 7025 2500 0    50   ~ 0
VIA_CA2
Entry Wire Line
	7000 3400 6900 3300
Text Label 7025 3400 0    50   ~ 0
VIA_CB1
Wire Wire Line
	7000 2500 7450 2500
$Comp
L C64-User-Port:C64_User_Port J1
U 1 1 60487E42
P 5125 3050
F 0 "J1" H 5125 3862 60  0000 C CNN
F 1 "C64_User_Port" H 5125 3756 60  0000 C CNN
F 2 "C64_User_Port:C64_User-Port" H 4975 3750 60  0001 C CNN
F 3 "~" H 4975 1850 60  0001 C CNN
	1    5125 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4475 3600 4400 3600
Wire Wire Line
	4400 3600 4400 3750
Wire Wire Line
	4400 3750 5875 3750
Wire Wire Line
	5875 3750 5875 3600
Wire Wire Line
	5875 3600 5775 3600
Wire Wire Line
	5775 2500 5875 2500
Wire Wire Line
	5875 2500 5875 3600
Connection ~ 5875 3600
Wire Wire Line
	4475 2500 4400 2500
Wire Wire Line
	4400 2500 4400 3600
Connection ~ 4400 3600
Wire Wire Line
	5875 3750 5875 3825
Connection ~ 5875 3750
$Comp
L power:GND #PWR0101
U 1 1 6048C013
P 5875 3825
F 0 "#PWR0101" H 5875 3575 50  0001 C CNN
F 1 "GND" H 5880 3652 50  0000 C CNN
F 2 "" H 5875 3825 50  0001 C CNN
F 3 "" H 5875 3825 50  0001 C CNN
	1    5875 3825
	1    0    0    -1  
$EndComp
NoConn ~ 5775 2600
Text Label 7025 2700 0    50   ~ 0
VIA_PA1
Text Label 7025 2800 0    50   ~ 0
VIA_PA2
Text Label 7025 2900 0    50   ~ 0
VIA_PA3
Text Label 7025 3000 0    50   ~ 0
VIA_PA4
Text Label 7025 3100 0    50   ~ 0
VIA_PA5
Text Label 7025 3200 0    50   ~ 0
VIA_PA6
Text Label 7025 3300 0    50   ~ 0
VIA_PA7
Entry Wire Line
	3950 3000 3850 2900
Entry Wire Line
	3950 2900 3850 2800
Entry Wire Line
	3950 2800 3850 2700
Entry Wire Line
	3950 2700 3850 2600
Entry Wire Line
	3850 3000 3950 3100
Entry Wire Line
	3850 3100 3950 3200
Entry Wire Line
	3850 3200 3950 3300
Entry Wire Line
	3850 3300 3950 3400
Text Label 3975 2700 0    50   ~ 0
VIA_PA0
Entry Wire Line
	3950 2600 3850 2500
Text Label 3975 2600 0    50   ~ 0
VIA_CA2
Entry Wire Line
	6300 3200 6400 3100
Text Label 6275 3200 2    50   ~ 0
VIA_CB1
Wire Wire Line
	3950 2600 4475 2600
Wire Wire Line
	4475 2700 3950 2700
Wire Wire Line
	3950 2800 4475 2800
Wire Wire Line
	3950 2900 4475 2900
Wire Wire Line
	4475 3000 3950 3000
Wire Wire Line
	3950 3100 4475 3100
Wire Wire Line
	3950 3200 4475 3200
Wire Wire Line
	4475 3300 3950 3300
Wire Wire Line
	3950 3400 4475 3400
Wire Wire Line
	6300 3200 5775 3200
Text Label 3975 2800 0    50   ~ 0
VIA_PA1
Text Label 3975 2900 0    50   ~ 0
VIA_PA2
Text Label 3975 3000 0    50   ~ 0
VIA_PA3
Text Label 3975 3100 0    50   ~ 0
VIA_PA4
Text Label 3975 3200 0    50   ~ 0
VIA_PA5
Text Label 3975 3300 0    50   ~ 0
VIA_PA6
Text Label 3975 3400 0    50   ~ 0
VIA_PA7
NoConn ~ 4475 3500
NoConn ~ 5775 3500
NoConn ~ 5775 3400
NoConn ~ 5775 3300
NoConn ~ 5775 3100
NoConn ~ 5775 3000
NoConn ~ 5775 2900
NoConn ~ 5775 2800
NoConn ~ 5775 2700
Wire Bus Line
	3850 1800 6400 1800
Wire Bus Line
	6400 1800 6400 3100
Wire Bus Line
	6900 1800 6400 1800
Connection ~ 6400 1800
$Comp
L mounting:Mounting M1
U 1 1 604E62DD
P 10750 550
F 0 "M1" H 10750 650 50  0001 C CNN
F 1 "Mounting" H 10750 475 50  0001 C CNN
F 2 "mounting:M3_pin" H 10750 550 50  0001 C CNN
F 3 "~" H 10750 550 50  0001 C CNN
	1    10750 550 
	1    0    0    -1  
$EndComp
$Comp
L mounting:Mounting M2
U 1 1 604E7421
P 10875 550
F 0 "M2" H 10875 650 50  0001 C CNN
F 1 "Mounting" H 10875 475 50  0001 C CNN
F 2 "mounting:M3_pin" H 10875 550 50  0001 C CNN
F 3 "~" H 10875 550 50  0001 C CNN
	1    10875 550 
	1    0    0    -1  
$EndComp
$Comp
L mounting:Mounting M3
U 1 1 604E78AD
P 11000 550
F 0 "M3" H 11000 650 50  0001 C CNN
F 1 "Mounting" H 11000 475 50  0001 C CNN
F 2 "mounting:M3_pin" H 11000 550 50  0001 C CNN
F 3 "~" H 11000 550 50  0001 C CNN
	1    11000 550 
	1    0    0    -1  
$EndComp
$Comp
L mounting:Mounting M4
U 1 1 604E7CA7
P 11125 550
F 0 "M4" H 11125 650 50  0001 C CNN
F 1 "Mounting" H 11125 475 50  0001 C CNN
F 2 "mounting:M3_pin" H 11125 550 50  0001 C CNN
F 3 "~" H 11125 550 50  0001 C CNN
	1    11125 550 
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP1
U 1 1 60764DE4
P 7600 2500
F 0 "JP1" H 7600 2675 50  0000 C CNN
F 1 "CA2" H 7600 2600 50  0000 C CNN
F 2 "solder_bridge:bridge" H 7600 2500 50  0001 C CNN
F 3 "~" H 7600 2500 50  0001 C CNN
	1    7600 2500
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP2
U 1 1 6077FA79
P 7600 3400
F 0 "JP2" H 7600 3300 50  0000 C CNN
F 1 "CB1" H 7600 3225 50  0000 C CNN
F 2 "solder_bridge:bridge_r" H 7600 3400 50  0001 C CNN
F 3 "~" H 7600 3400 50  0001 C CNN
	1    7600 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 2600 7750 2600
Wire Wire Line
	7000 2700 7750 2700
Wire Wire Line
	7000 2800 7750 2800
Wire Wire Line
	7000 2900 7750 2900
Wire Wire Line
	7000 3000 7750 3000
Wire Wire Line
	7000 3100 7750 3100
Wire Wire Line
	7000 3200 7750 3200
Wire Wire Line
	7000 3300 7750 3300
Wire Wire Line
	7450 3400 7000 3400
$Comp
L Jumper:SolderJumper_2_Bridged JP3
U 1 1 608B4F78
P 8825 3400
F 0 "JP3" H 8825 3300 50  0000 C CNN
F 1 "GND" H 8825 3225 50  0000 C CNN
F 2 "solder_bridge:bridge" H 8825 3400 50  0001 C CNN
F 3 "~" H 8825 3400 50  0001 C CNN
	1    8825 3400
	1    0    0    -1  
$EndComp
Wire Bus Line
	6900 1800 6900 3300
Wire Bus Line
	3850 1800 3850 3300
$EndSCHEMATC
