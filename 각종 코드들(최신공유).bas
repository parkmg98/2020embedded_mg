'******** 2�� ����κ� �ʱ� ���� ���α׷� ********

DIM I AS BYTE
DIM J AS BYTE
DIM MODE AS BYTE
DIM A AS BYTE
DIM A_old AS BYTE
DIM B AS BYTE
DIM C AS BYTE
DIM ����ӵ� AS BYTE
DIM �¿�ӵ� AS BYTE
DIM �¿�ӵ�2 AS BYTE
DIM ������� AS BYTE
DIM �������� AS BYTE
DIM ����üũ AS BYTE
DIM ����ONOFF AS BYTE
DIM ���̷�ONOFF AS BYTE
DIM ����յ� AS INTEGER
DIM �����¿� AS INTEGER
DIM ��Ƚ�� AS BYTE
DIM ����� AS BYTE

DIM �Ѿ���Ȯ�� AS BYTE
DIM ����Ȯ��Ƚ�� AS BYTE
DIM ����Ƚ�� AS BYTE
DIM ����COUNT AS BYTE
DIM ���ܼ��Ÿ���  AS BYTE

'************************************************

'************************************************


DIM S11  AS BYTE
DIM S16  AS BYTE
'************************************************
DIM NO_0 AS BYTE
DIM NO_1 AS BYTE
DIM NO_2 AS BYTE
DIM NO_3 AS BYTE
DIM NO_4 AS BYTE

DIM NUM AS BYTE

DIM BUTTON_NO AS INTEGER
DIM SOUND_BUSY AS BYTE
DIM TEMP_INTEGER AS INTEGER

'**** ���⼾����Ʈ ���� ****
CONST �յڱ���AD��Ʈ = 0
CONST �¿����AD��Ʈ = 1
CONST ����Ȯ�νð� = 20  'ms

CONST ���ܼ�AD��Ʈ  = 4


CONST min = 61	'�ڷγѾ�������
CONST max = 107	'�����γѾ�������
CONST COUNT_MAX = 3


CONST �Ӹ��̵��ӵ� = 10
'************************************************



PTP SETON 				'�����׷캰 ���������� ����
PTP ALLON				'��ü���� ������ ���� ����

DIR G6A,1,0,0,1,0,0		'����0~5��
DIR G6D,0,1,1,0,1,1		'����18~23��
DIR G6B,1,1,1,1,1,1		'����6~11��
DIR G6C,0,0,0,0,1,0		'����12~17��

'************************************************

OUT 52,0	'�Ӹ� LED �ѱ�
'***** �ʱ⼱�� '************************************************

������� = 0
����üũ = 0
����Ȯ��Ƚ�� = 0
����Ƚ�� = 2
����ONOFF = 0
��Ƚ��= 3

'************************************************

'************************************************

'****�ʱ���ġ �ǵ��*****************************


TEMPO 230
MUSIC "cdefg"



SPEED 5
GOSUB MOTOR_ON

S11 = MOTORIN(11)
S16 = MOTORIN(16)

SERVO 11, 100
SERVO 16, S16

SERVO 16, 100


GOSUB �����ʱ��ڼ�
GOSUB �⺻�ڼ�2


GOSUB ���̷�INIT
GOSUB ���̷�MID
GOSUB ���̷�ON



PRINT "VOLUME 200 !"
PRINT "SOUND 12 !" '�ȳ��ϼ���

GOSUB All_motor_mode3





GOTO MAIN	'�ø��� ���� ��ƾ���� ����

'************************************************

'*********************************************
' Infrared_Distance = 60 ' About 20cm
' Infrared_Distance = 50 ' About 25cm
' Infrared_Distance = 30 ' About 45cm
' Infrared_Distance = 20 ' About 65cm
' Infrared_Distance = 10 ' About 95cm
'*********************************************
'************************************************
������:
    TEMPO 220
    MUSIC "O23EAB7EA>3#C"
    RETURN
    '************************************************
������:
    TEMPO 220
    MUSIC "O38GD<BGD<BG"
    RETURN
    '************************************************
������:
    TEMPO 250
    MUSIC "FFF"
    RETURN
    '************************************************
    '************************************************
MOTOR_ON: '����Ʈ�������ͻ�뼳��

    GOSUB MOTOR_GET

    MOTOR G6B
    DELAY 50
    MOTOR G6C
    DELAY 50
    MOTOR G6A
    DELAY 50
    MOTOR G6D

    ����ONOFF = 0
    GOSUB ������			
    RETURN

    '************************************************
    '����Ʈ�������ͻ�뼳��
MOTOR_OFF:

    MOTOROFF G6B
    MOTOROFF G6C
    MOTOROFF G6A
    MOTOROFF G6D
    ����ONOFF = 1	
    GOSUB MOTOR_GET	
    GOSUB ������	
    RETURN
    '************************************************
    '��ġ���ǵ��
MOTOR_GET:
    GETMOTORSET G6A,1,1,1,1,1,0
    GETMOTORSET G6B,1,1,1,0,0,1
    GETMOTORSET G6C,1,1,1,0,1,0
    GETMOTORSET G6D,1,1,1,1,1,0
    RETURN

    '************************************************
    '��ġ���ǵ��
MOTOR_SET:
    GETMOTORSET G6A,1,1,1,1,1,0
    GETMOTORSET G6B,1,1,1,0,0,1
    GETMOTORSET G6C,1,1,1,0,1,0
    GETMOTORSET G6D,1,1,1,1,1,0
    RETURN

    '************************************************
All_motor_Reset:

    MOTORMODE G6A,1,1,1,1,1,1
    MOTORMODE G6D,1,1,1,1,1,1
    MOTORMODE G6B,1,1,1,,,1
    MOTORMODE G6C,1,1,1,,1

    RETURN
    '************************************************
All_motor_mode2:

    MOTORMODE G6A,2,2,2,2,2
    MOTORMODE G6D,2,2,2,2,2
    MOTORMODE G6B,2,2,2,,,2
    MOTORMODE G6C,2,2,2,,2

    RETURN
    '************************************************
All_motor_mode3:

    MOTORMODE G6A,3,3,3,3,3
    MOTORMODE G6D,3,3,3,3,3
    MOTORMODE G6B,3,3,3,,,3
    MOTORMODE G6C,3,3,3,,3

    RETURN
    '************************************************
Leg_motor_mode1:
    MOTORMODE G6A,1,1,1,1,1
    MOTORMODE G6D,1,1,1,1,1
    RETURN
    '************************************************
Leg_motor_mode2:
    MOTORMODE G6A,2,2,2,2,2
    MOTORMODE G6D,2,2,2,2,2
    RETURN

    '************************************************
Leg_motor_mode3:
    MOTORMODE G6A,3,3,3,3,3
    MOTORMODE G6D,3,3,3,3,3
    RETURN
    '************************************************
Leg_motor_mode4:
    MOTORMODE G6A,3,2,2,1,3
    MOTORMODE G6D,3,2,2,1,3
    RETURN
    '************************************************
Leg_motor_mode5:
    MOTORMODE G6A,3,2,2,1,2
    MOTORMODE G6D,3,2,2,1,2
    RETURN
    '************************************************
Arm_motor_mode1:
    MOTORMODE G6B,1,1,1,,,1
    MOTORMODE G6C,1,1,1,,1
    RETURN
    '************************************************
Arm_motor_mode2:
    MOTORMODE G6B,2,2,2,,,2
    MOTORMODE G6C,2,2,2,,2
    RETURN

    '************************************************
Arm_motor_mode3:
    MOTORMODE G6B,3,3,3,,,3
    MOTORMODE G6C,3,3,3,,3
    RETURN
    '************************************************

�����ʱ��ڼ�:
    MOVE G6A,100,  76, 145,  93, 100, 100
    MOVE G6D,100,  76, 145,  93, 100, 100
    MOVE G6B,100,  35,  90,
    MOVE G6C,100,  35,  90
    WAIT
    mode = 0
    RETURN
    '************************************************
����ȭ�ڼ�:
    MOVE G6A,98,  76, 145,  93, 101, 100
    MOVE G6D,98,  76, 145,  93, 101, 100
    MOVE G6B,100,  35,  90,
    MOVE G6C,100,  35,  90
    WAIT
    mode = 0

    RETURN
    '******************************************	



    '******************************************	
�⺻�ڼ�2:
    MOVE G6A,100,  76, 145,  93, 100, 100
    MOVE G6D,100,  76, 145,  93, 100, 100
    MOVE G6B,100,  30,  80,	   ,    , 100
    MOVE G6C,100,  30,  80,	   , 100,
    WAIT

    mode = 0
    RETURN

�Ӹ��⺻�ڼ�return:
    MOVE G6B,	,	 ,	  ,	   ,    , 100
    MOVE G6C,	,    ,	  ,	   , 100,
    WAIT

    RETURN

�Ӹ������Ա⺻�ڼ�return:
    MOVE G6A,100,  76, 145,  93, 100, 100
    MOVE G6D,100,  76, 145,  93, 100, 100
    MOVE G6B,100,  30,  80,
    MOVE G6C,100,  30,  80,
    WAIT
    mode = 0

    RETURN

�Ӹ��⺻�ڼ�:
    MOVE G6B,	,	 ,	  ,	   ,    , 100
    MOVE G6C,	,    ,	  ,	   , 100,
    WAIT

    GOTO RX_EXIT

�Ӹ������Ա⺻�ڼ�:
    MOVE G6A,100,  76, 145,  93, 100, 100
    MOVE G6D,100,  76, 145,  93, 100, 100
    MOVE G6B,100,  30,  80,
    MOVE G6C,100,  30,  80,
    WAIT
    mode = 0

    GOTO RX_EXIT

    '******************************************	
�����ڼ�:
    MOVE G6A,100, 56, 182, 76, 100, 100
    MOVE G6D,100, 56, 182, 76, 100, 100
    MOVE G6B,100,  30,  80,
    MOVE G6C,100,  30,  80
    WAIT
    mode = 2
    RETURN
    '******************************************
�����ڼ�:
    GOSUB ���̷�OFF
    MOVE G6A,100, 145,  28, 145, 100, 100
    MOVE G6D,100, 145,  28, 145, 100, 100
    MOVE G6B,100,  30,  80,
    MOVE G6C,100,  30,  80
    WAIT
    mode = 1

    RETURN
    '******************************************
    '***********************************************
    '***********************************************
    '**** ���̷ΰ��� ���� ****
���̷�INIT:

    GYRODIR G6A, 0, 0, 1, 0,0
    GYRODIR G6D, 1, 0, 1, 0,0

    GYROSENSE G6A,200,150,30,150,0
    GYROSENSE G6D,200,150,30,150,0

    RETURN
    '***********************************************
    '**** ���̷ΰ��� ���� ****
���̷�MAX:

    GYROSENSE G6A,250,180,30,180,0
    GYROSENSE G6D,250,180,30,180,0

    RETURN
    '***********************************************
���̷�MID:

    GYROSENSE G6A,200,150,30,150,0
    GYROSENSE G6D,200,150,30,150,0

    RETURN
    '***********************************************
���̷�MIN:

    GYROSENSE G6A,200,100,30,100,0
    GYROSENSE G6D,200,100,30,100,0
    RETURN
    '***********************************************
���̷�ON:

    GYROSET G6A, 4, 3, 3, 3, 0
    GYROSET G6D, 4, 3, 3, 3, 0

    ���̷�ONOFF = 1

    RETURN
    '***********************************************
���̷�OFF:

    GYROSET G6A, 0, 0, 0, 0, 0
    GYROSET G6D, 0, 0, 0, 0, 0


    ���̷�ONOFF = 0
    RETURN

    '************************************************

    '******************************************
    '**********************************************
    '**********************************************
RX_EXIT:

    ERX 4800, A, MAIN

    GOTO RX_EXIT
    '**********************************************
GOSUB_RX_EXIT:

    ERX 4800, A, GOSUB_RX_EXIT2

    GOTO GOSUB_RX_EXIT

GOSUB_RX_EXIT2:
    RETURN

    '**********************************************

�յڱ�������:
    FOR i = 0 TO COUNT_MAX
        A = AD(�յڱ���AD��Ʈ)	'���� �յ�
        IF A > 250 OR A < 5 THEN RETURN
        IF A > MIN AND A < MAX THEN RETURN
        DELAY ����Ȯ�νð�
    NEXT i

    IF A < MIN THEN
        GOSUB �����
    ELSEIF A > MAX THEN
        GOSUB �����
    ENDIF

    RETURN
    '**************************************************
�����:
    A = AD(�յڱ���AD��Ʈ)
    'IF A < MIN THEN GOSUB �������Ͼ��
    IF A < MIN THEN
        ETX  4800,16
        GOSUB �ڷ��Ͼ��

    ENDIF
    RETURN

�����:
    A = AD(�յڱ���AD��Ʈ)
    'IF A > MAX THEN GOSUB �ڷ��Ͼ��
    IF A > MAX THEN
        ETX  4800,15
        GOSUB �������Ͼ��
    ENDIF
    RETURN

    '**************************************************

�¿��������:
    FOR i = 0 TO COUNT_MAX
        B = AD(�¿����AD��Ʈ)	'���� �¿�
        IF B > 250 OR B < 5 THEN RETURN
        IF B > MIN AND B < MAX THEN RETURN
        DELAY ����Ȯ�νð�
    NEXT i

    IF B < MIN OR B > MAX THEN
        SPEED 8
        MOVE G6B,140,  40,  80
        MOVE G6C,140,  40,  80
        WAIT
        GOSUB �⺻�ڼ�2	
    ENDIF
    RETURN

    '**************************************************

�ڷ��Ͼ��:

    HIGHSPEED SETOFF
    PTP SETON 				
    PTP ALLON		

    GOSUB ���̷�OFF

    GOSUB All_motor_Reset

    SPEED 15
    GOSUB �⺻�ڼ�2

    MOVE G6A,90, 130, ,  80, 110, 100
    MOVE G6D,90, 130, 120,  80, 110, 100
    MOVE G6B,150, 160,  10, 100, 100, 100
    MOVE G6C,150, 160,  10, 100, 100, 100
    WAIT

    MOVE G6B,170, 140,  10, 100, 100, 100
    MOVE G6C,170, 140,  10, 100, 100, 100
    WAIT

    MOVE G6B,185,  20, 70,  100, 100, 100
    MOVE G6C,185,  20, 70,  100, 100, 100
    WAIT
    SPEED 10
    MOVE G6A, 80, 155,  85, 150, 150, 100
    MOVE G6D, 80, 155,  85, 150, 150, 100
    MOVE G6B,185,  20, 70,  100, 100, 100
    MOVE G6C,185,  20, 70,  100, 100, 100
    WAIT



    MOVE G6A, 75, 162,  55, 162, 155, 100
    MOVE G6D, 75, 162,  59, 162, 155, 100
    MOVE G6B,188,  10, 100, 100, 100, 100
    MOVE G6C,188,  10, 100, 100, 100, 100
    WAIT

    SPEED 10
    MOVE G6A, 60, 162,  30, 162, 145, 100
    MOVE G6D, 60, 162,  30, 162, 145, 100
    MOVE G6B,170,  10, 100, 100, 100, 100
    MOVE G6C,170,  10, 100, 100, 100, 100
    WAIT
    GOSUB Leg_motor_mode3	
    MOVE G6A, 60, 150,  28, 155, 140, 100
    MOVE G6D, 60, 150,  28, 155, 140, 100
    MOVE G6B,150,  60,  90, 100, 100, 100
    MOVE G6C,150,  60,  90, 100, 100, 100
    WAIT

    MOVE G6A,100, 150,  28, 140, 100, 100
    MOVE G6D,100, 150,  28, 140, 100, 100
    MOVE G6B,130,  50,  85, 100, 100, 100
    MOVE G6C,130,  50,  85, 100, 100, 100
    WAIT
    DELAY 100

    MOVE G6A,100, 150,  33, 140, 100, 100
    MOVE G6D,100, 150,  33, 140, 100, 100
    WAIT
    SPEED 10
    GOSUB �⺻�ڼ�2

    �Ѿ���Ȯ�� = 1

    DELAY 200
    GOSUB ���̷�ON

    RETURN


    '**********************************************
�������Ͼ��:


    HIGHSPEED SETOFF
    PTP SETON 				
    PTP ALLON

    GOSUB ���̷�OFF

    HIGHSPEED SETOFF

    GOSUB All_motor_Reset

    SPEED 15
    MOVE G6A,100, 15,  70, 140, 100,
    MOVE G6D,100, 15,  70, 140, 100,
    MOVE G6B,20,  140,  15
    MOVE G6C,20,  140,  15
    WAIT

    SPEED 12
    MOVE G6A,100, 136,  35, 80, 100,
    MOVE G6D,100, 136,  35, 80, 100,
    MOVE G6B,20,  30,  80
    MOVE G6C,20,  30,  80
    WAIT

    SPEED 12
    MOVE G6A,100, 165,  70, 30, 100,
    MOVE G6D,100, 165,  70, 30, 100,
    MOVE G6B,30,  20,  95
    MOVE G6C,30,  20,  95
    WAIT

    GOSUB Leg_motor_mode3

    SPEED 10
    MOVE G6A,100, 165,  45, 90, 100,
    MOVE G6D,100, 165,  45, 90, 100,
    MOVE G6B,130,  50,  60
    MOVE G6C,130,  50,  60
    WAIT

    SPEED 6
    MOVE G6A,100, 145,  45, 130, 100,
    MOVE G6D,100, 145,  45, 130, 100,
    WAIT


    SPEED 8
    GOSUB All_motor_mode2
    GOSUB �⺻�ڼ�2
    �Ѿ���Ȯ�� = 1

    '******************************
    DELAY 200
    GOSUB ���̷�ON
    RETURN

    '******************************

���ܼ��Ÿ�����Ȯ��:

    ���ܼ��Ÿ��� = AD(���ܼ�AD��Ʈ)

    IF ���ܼ��Ÿ��� > 50 THEN '50 = ���ܼ��Ÿ��� = 25cm
        MUSIC "C"
        DELAY 200
    ENDIF




    RETURN

    '**********************************************
    '**********************************************
    '**********************************************
    '**********************************************

�޼յ��: 'left hand up
    MOVE G6B,180,    30,  80,    ,    ,
    WAIT

    GOTO RX_EXIT
    '**********************************************
    '**********************************************

�����յ��: 'right hand up
    MOVE G6C,180,    30,  80,    ,    ,
    WAIT

    GOTO RX_EXIT
    '**********************************************
    '**********************************************

��վ�����: 'hands front
    MOVE G6B,180,    30,  80,    ,    ,
    MOVE G6C,180,    30,  80,    ,    ,
    WAIT

    GOTO RX_EXIT
    '**********************************************
    '**********************************************

��յڷ�: 'hands behind
    MOVE G6B,20,    30,  80,    ,    ,
    MOVE G6C,20,    30,  80,    ,    ,
    WAIT

    GOTO RX_EXIT
    '**********************************************
    '**********************************************

��������:
    MOVE G6C,	,	,	,	,   60 ,
    WAIT

    GOTO RX_EXIT

    '**********************************************
    '**********************************************

���ʹ����ΰ�������:
    MOVE G6B,	,	,	,	,	,60
    MOVE G6C,	,	,	,	, 60,
    WAIT

    GOTO RX_EXIT

�����ʹ����ΰ�������:
    MOVE G6B,	,	,	,	,	,140
    MOVE G6C,	,	,	,	, 60,
    WAIT

    GOTO RX_EXIT

    '**********************************************
    '**********************************************

�Ӹ�x������10:
    MOTORMODE G6A,3,3,3,3,2
    MOTORMODE G6D,3,3,3,3,2
�Ӹ�x������10_LOOP:

    SPEED 5
    MOVE G6A,97,  86, 145,  83, 103, 100
    MOVE G6D,97,  66, 145,  103, 103, 100
    WAIT

    SPEED 12
    MOVE G6A,94,  86, 145,  83, 101, 100
    MOVE G6D,94,  66, 145,  103, 101, 100
    WAIT

    SPEED 6
    MOVE G6A,101,  76, 146,  93, 98, 100
    MOVE G6D,101,  76, 146,  93, 98, 100
    WAIT

    GOSUB �Ӹ������Ա⺻�ڼ�return
    DELAY 100
    GOSUB �յڱ�������
    IF �Ѿ���Ȯ�� = 1 THEN
        �Ѿ���Ȯ�� = 0
        GOTO RX_EXIT
    ENDIF

    ERX 4800,A,�Ӹ�x������10_LOOP	'��)ȯ�ڹױ���ã�ƽ�ȣ������
    DELAY 300
    GOTO RX_EXIT

    '**********************************************
    '**********************************************

�Ӹ�x��������10:
    MOTORMODE G6A,3,3,3,3,2
    MOTORMODE G6D,3,3,3,3,2
�Ӹ�x��������10_LOOP:

    SPEED 5
    MOVE G6A,97,  66, 145,  103, 103, 100
    MOVE G6D,97,  86, 145,  83, 103, 100
    WAIT

    SPEED 12
    MOVE G6A,94,  66, 145,  103, 101, 100
    MOVE G6D,94,  86, 145,  83, 101, 100
    WAIT

    SPEED 6
    MOVE G6A,101,  76, 146,  93, 98, 100
    MOVE G6D,101,  76, 146,  93, 98, 100
    WAIT

    GOSUB �Ӹ������Ա⺻�ڼ�return
    DELAY 100
    GOSUB �յڱ�������
    IF �Ѿ���Ȯ�� = 1 THEN
        �Ѿ���Ȯ�� = 0
        GOTO RX_EXIT
    ENDIF

    ERX 4800,A,�Ӹ�x��������10_LOOP	'��)ȯ�ڹױ���ã�ƽ�ȣ������
    DELAY 300
    GOTO RX_EXIT

    '**********************************************
    '**********************************************

�Ӹ�x������20:
    MOTORMODE G6A,3,3,3,3,2
    MOTORMODE G6D,3,3,3,3,2
�Ӹ�x������20_LOOP:

    SPEED 8
    MOVE G6A,95,  96, 145,  73, 105, 100
    MOVE G6D,95,  56, 145,  113, 105, 100
    MOVE G6B,110
    MOVE G6C,90
    WAIT

    SPEED 12
    MOVE G6A,93,  96, 145,  73, 105, 100
    MOVE G6D,93,  56, 145,  113, 105, 100
    WAIT

    SPEED 6
    MOVE G6A,101,  76, 146,  93, 98, 100
    MOVE G6D,101,  76, 146,  93, 98, 100
    WAIT

    GOSUB �Ӹ������Ա⺻�ڼ�return
    DELAY 100
    GOSUB �յڱ�������
    IF �Ѿ���Ȯ�� = 1 THEN
        �Ѿ���Ȯ�� = 0
        GOTO RX_EXIT
    ENDIF

    ERX 4800,A,�Ӹ�x������20_LOOP	'��)ȯ�ڹױ���ã�ƽ�ȣ������
    DELAY 300
    GOTO RX_EXIT

    '**********************************************
    '**********************************************

�Ӹ�x��������20:
    MOTORMODE G6A,3,3,3,3,2
    MOTORMODE G6D,3,3,3,3,2
�Ӹ�x��������20_LOOP:

    SPEED 8
    MOVE G6A,95,  56, 145,  113, 105, 100
    MOVE G6D,95,  96, 145,  73, 105, 100
    MOVE G6B,90
    MOVE G6C,110
    WAIT

    SPEED 12
    MOVE G6A,93,  56, 145,  113, 105, 100
    MOVE G6D,93,  96, 145,  73, 105, 100
    WAIT

    SPEED 6
    MOVE G6A,101,  76, 146,  93, 98, 100
    MOVE G6D,101,  76, 146,  93, 98, 100
    WAIT

    GOSUB �Ӹ������Ա⺻�ڼ�return
    DELAY 100
    GOSUB �յڱ�������
    IF �Ѿ���Ȯ�� = 1 THEN
        �Ѿ���Ȯ�� = 0
        GOTO RX_EXIT
    ENDIF

    ERX 4800,A,�Ӹ�x��������20_LOOP	'��)ȯ�ڹױ���ã�ƽ�ȣ������
    DELAY 300
    GOTO RX_EXIT

    '**********************************************
    '**********************************************

�ڷε���Ӹ�x������20:
    MOTORMODE G6A,3,3,3,3,2
    MOTORMODE G6D,3,3,3,3,2
    ����COUNT = 0

�ڷε���Ӹ�x������20_LOOP:

    SPEED 8
    MOVE G6A,95,  96, 145,  73, 105, 100
    MOVE G6D,95,  56, 145,  113, 105, 100
    MOVE G6B,110
    MOVE G6C,90
    WAIT

    SPEED 12
    MOVE G6A,93,  96, 145,  73, 105, 100
    MOVE G6D,93,  56, 145,  113, 105, 100
    WAIT

    SPEED 6
    MOVE G6A,101,  76, 146,  93, 98, 100
    MOVE G6D,101,  76, 146,  93, 98, 100
    WAIT

    GOSUB �Ӹ������Ա⺻�ڼ�return
    DELAY 100
    GOSUB �յڱ�������
    IF �Ѿ���Ȯ�� = 1 THEN
        �Ѿ���Ȯ�� = 0
        GOTO RX_EXIT
    ENDIF

    ����COUNT = ����COUNT + 1
    IF ����COUNT > ��Ƚ�� THEN
        GOTO RX_EXIT
    ELSE
        GOTO �ڷε���Ӹ�x������20_LOOP
    ENDIF
        '**********************************************
        '**********************************************

�ڷε���Ӹ�x��������20:
    MOTORMODE G6A,3,3,3,3,2
    MOTORMODE G6D,3,3,3,3,2
    ����COUNT = 0

�ڷε���Ӹ�x��������20_LOOP:

    SPEED 8
    MOVE G6A,95,  56, 145,  113, 105, 100
    MOVE G6D,95,  96, 145,  73, 105, 100
    MOVE G6B,90
    MOVE G6C,110
    WAIT

    SPEED 12
    MOVE G6A,93,  56, 145,  113, 105, 100
    MOVE G6D,93,  96, 145,  73, 105, 100
    WAIT

    SPEED 6
    MOVE G6A,101,  76, 146,  93, 98, 100
    MOVE G6D,101,  76, 146,  93, 98, 100
    WAIT

    GOSUB �Ӹ������Ա⺻�ڼ�return
    DELAY 100
    GOSUB �յڱ�������
    IF �Ѿ���Ȯ�� = 1 THEN
        �Ѿ���Ȯ�� = 0
        GOTO RX_EXIT
    ENDIF

    ����COUNT = ����COUNT + 1
    IF ����COUNT > ��Ƚ�� THEN
        GOTO RX_EXIT
    ELSE
        GOTO �ڷε���Ӹ�x��������20_LOOP
	ENDIF
        '**********************************************
        '**********************************************

�ѹ��Ӹ�x������20:
    MOTORMODE G6A,3,3,3,3,2
    MOTORMODE G6D,3,3,3,3,2
�ѹ��Ӹ�x������20_1:

    SPEED 8
    MOVE G6A,95,  96, 145,  73, 105, 100
    MOVE G6D,95,  56, 145,  113, 105, 100
    MOVE G6B,110
    MOVE G6C,90
    WAIT

    SPEED 12
    MOVE G6A,93,  96, 145,  73, 105, 100
    MOVE G6D,93,  56, 145,  113, 105, 100
    WAIT

    SPEED 6
    MOVE G6A,101,  76, 146,  93, 98, 100
    MOVE G6D,101,  76, 146,  93, 98, 100
    WAIT

    GOSUB �Ӹ������Ա⺻�ڼ�return
    DELAY 100
    GOTO RX_EXIT

    '**********************************************
    '**********************************************

�ѹ��Ӹ�x��������20:
    MOTORMODE G6A,3,3,3,3,2
    MOTORMODE G6D,3,3,3,3,2
�ѹ��Ӹ�x��������20_1:

    SPEED 8
    MOVE G6A,95,  56, 145,  113, 105, 100
    MOVE G6D,95,  96, 145,  73, 105, 100
    MOVE G6B,90
    MOVE G6C,110
    WAIT

    SPEED 12
    MOVE G6A,93,  56, 145,  113, 105, 100
    MOVE G6D,93,  96, 145,  73, 105, 100
    WAIT

    SPEED 6
    MOVE G6A,101,  76, 146,  93, 98, 100
    MOVE G6D,101,  76, 146,  93, 98, 100
    WAIT

    GOSUB �Ӹ������Ա⺻�ڼ�return
    DELAY 100
    GOTO RX_EXIT

    '**********************************************
    '**********************************************

�ѹ��Ӹ�x������10:
    MOTORMODE G6A,3,3,3,3,2
    MOTORMODE G6D,3,3,3,3,2
�ѹ��Ӹ�x������10_1:

    SPEED 5
    MOVE G6A,97,  86, 145,  83, 103, 100
    MOVE G6D,97,  66, 145,  103, 103, 100
    WAIT

    SPEED 12
    MOVE G6A,94,  86, 145,  83, 101, 100
    MOVE G6D,94,  66, 145,  103, 101, 100
    WAIT

    SPEED 6
    MOVE G6A,101,  76, 146,  93, 98, 100
    MOVE G6D,101,  76, 146,  93, 98, 100

    GOSUB �Ӹ������Ա⺻�ڼ�return
    DELAY 100
    WAIT
    GOTO RX_EXIT

    '**********************************************
    '**********************************************

�ѹ��Ӹ�x��������10:
    MOTORMODE G6A,3,3,3,3,2
    MOTORMODE G6D,3,3,3,3,2
�ѹ��Ӹ�x��������10_1:

    SPEED 5
    MOVE G6A,97,  66, 145,  103, 103, 100
    MOVE G6D,97,  86, 145,  83, 103, 100
    WAIT

    SPEED 12
    MOVE G6A,94,  66, 145,  103, 101, 100
    MOVE G6D,94,  86, 145,  83, 101, 100
    WAIT

    SPEED 6
    MOVE G6A,101,  76, 146,  93, 98, 100
    MOVE G6D,101,  76, 146,  93, 98, 100
    WAIT

    GOSUB �Ӹ������Ա⺻�ڼ�return
    DELAY 100
    GOTO RX_EXIT

    '**********************************************
    '**********************************************

�ɱ�:
    'sit down posture
    SPEED 5
    GOSUB ���̷�OFF							
    MOVE G6A,100, 145,  28, 155, 100, 100
    MOVE G6D,100, 145,  28, 155, 100, 100
    MOVE G6B,100,  30,  80
    MOVE G6C,100,  30,  80
    WAIT

    GOTO RX_EXIT

    '**********************************************
    '**********************************************

���������Ͼ��:
    SPEED 5
    'picking up step 1
    MOVE G6B,151,    30,  80,    ,    ,
    MOVE G6C,151,   30 , 80   ,    ,    ,
    WAIT

    'picking up step 2
    MOVE G6B,151,    10,  60,    ,    ,
    MOVE G6C,151,   10 , 60   ,    ,    ,
    WAIT
    DELAY 1000

    'stand up
    MOVE G6A,100,  76, 145,  93, 100, 100
    MOVE G6D,100,  76, 145,  93, 100, 100
    WAIT

    GOSUB ���̷�ON	
    GOTO RX_EXIT

    '******************************************	
    '**********************************************


���ǳ���⺻�ڼ�:
    'picking up step 1
    MOVE G6B,151,    30,  80,    ,    ,
    MOVE G6C,151,   30 , 80   ,    ,    ,
    WAIT

    MOVE G6A,100,  76, 145,  93, 100, 100  'normal posture'
    MOVE G6D,100,  76, 145,  93, 100, 100
    MOVE G6B,100,  30,  80,
    MOVE G6C,100,  30,  80,,100
    WAIT

    GOTO RX_EXIT

    '******************************************	
    '**********************************************

������������:
    GOSUB All_motor_mode3
    ����COUNT = 0
    SPEED 3
    HIGHSPEED SETON


    IF ������� = 0 THEN
        ������� = 1
        MOVE G6A,95,  76, 147, 93, 101
        MOVE G6D,101,  76, 147,  93, 98
        WAIT

        GOTO ������������_1
    ELSE
        ������� = 0
        MOVE G6D,95,  76, 147,  93, 101
        MOVE G6A,101,  76, 147,  93, 98
        WAIT

        GOTO ������������_4
    ENDIF

������������_1:
    MOVE G6A,95,  90, 125, 100, 104
    MOVE G6D,104,  77, 147,  93,  102
    WAIT

������������_2:

    MOVE G6A,103,   73, 140, 103,  100
    MOVE G6D, 95,  85, 147,  85, 102
    WAIT

    GOSUB �յڱ�������
    IF �Ѿ���Ȯ�� = 1 THEN
        �Ѿ���Ȯ�� = 0

        GOTO RX_EXIT
    ENDIF

    ERX 4800,A, ������������_4
    IF A <> A_old THEN
������������_2_stop:
        MOVE G6D,95,  90, 125, 95, 104
        MOVE G6A,104,  76, 145,  91,  102
        MOVE G6C, 100
        MOVE G6B,100
        WAIT
        HIGHSPEED SETOFF
        SPEED 15
        MOVE G6A,98,  76, 145,  93, 101, 100
        MOVE G6D,98,  76, 145,  93, 101, 100
        WAIT
        SPEED 5
        MOVE G6A,100,  76, 145,  93, 100, 100
        MOVE G6D,100,  76, 145,  93, 100, 100
        WAIT

        'DELAY 400
        GOTO RX_EXIT
    ENDIF

������������_4:
    MOVE G6D,95,  95, 120, 100, 104
    MOVE G6A,104,  77, 147,  93,  102
    WAIT

������������_5:
    MOVE G6D,103,    73, 140, 103,  100
    MOVE G6A, 95,  85, 147,  85, 102
    WAIT


    GOSUB �յڱ�������
    IF �Ѿ���Ȯ�� = 1 THEN
        �Ѿ���Ȯ�� = 0
        GOTO RX_EXIT
    ENDIF

    ERX 4800,A, ������������_1
    IF A <> A_old THEN
������������_5_stop:
        MOVE G6A,95,  90, 125, 95, 104
        MOVE G6D,104,  76, 145,  91,  102
        MOVE G6B, 100
        MOVE G6C,100
        WAIT
        HIGHSPEED SETOFF
        SPEED 15
        MOVE G6A,98,  76, 145,  93, 101, 100
        MOVE G6D,98,  76, 145,  93, 101, 100
        WAIT
        SPEED 5
        MOVE G6A,100,  76, 145,  93, 100, 100
        MOVE G6D,100,  76, 145,  93, 100, 100
        WAIT

        'DELAY 400
        GOTO RX_EXIT
    ENDIF

    GOTO ������������_1

    '**********************************************
    '**********************************************

Ƚ��_������������:
    GOSUB All_motor_mode3
    ����COUNT = 0
    SPEED 3
    HIGHSPEED SETON

    IF ������� = 0 THEN
        ������� = 1
        MOVE G6A,95,  76, 147,  93, 101
        MOVE G6D,101,  76, 147,  93, 98

        WAIT

        GOTO Ƚ��_������������_1
    ELSE
        ������� = 0
        MOVE G6D,95,  76, 147,  93, 101
        MOVE G6A,101,  76, 147,  93, 98

        WAIT

        GOTO Ƚ��_������������_4
    ENDIF

Ƚ��_������������_1:
    MOVE G6A,95,  90, 125, 100, 104
    MOVE G6D,104,  77, 147,  93,  102

    WAIT

Ƚ��_������������_2:

    MOVE G6A,103,   73, 140, 103,  100
    MOVE G6D, 95,  85, 147,  85, 102
    WAIT

    GOSUB �յڱ�������
    IF �Ѿ���Ȯ�� = 1 THEN
        �Ѿ���Ȯ�� = 0

        GOTO RX_EXIT
    ENDIF

    ����COUNT = ����COUNT + 1
    IF ����COUNT > ����Ƚ�� THEN  GOTO Ƚ��_������������_2_stop

    ERX 4800,A, Ƚ��_������������_4
    IF A <> A_old THEN
Ƚ��_������������_2_stop:
        MOVE G6D,95,  90, 125, 95, 104
        MOVE G6A,104,  76, 145,  91,  102
        WAIT
        HIGHSPEED SETOFF
        SPEED 15
        MOVE G6A,98,  76, 145,  93, 101, 100
        MOVE G6D,98,  76, 145,  93, 101, 100
        WAIT
        SPEED 5
        MOVE G6A,100,  76, 145,  93, 100, 100
        MOVE G6D,100,  76, 145,  93, 100, 100
        WAIT

        'DELAY 400
        GOTO RX_EXIT
    ENDIF

Ƚ��_������������_4:
    MOVE G6D,95,  95, 120, 100, 104
    MOVE G6A,104,  77, 147,  93,  102

    WAIT

Ƚ��_������������_5:
    MOVE G6D,103,    73, 140, 103,  100
    MOVE G6A, 95,  85, 147,  85, 102
    WAIT

    GOSUB �յڱ�������
    IF �Ѿ���Ȯ�� = 1 THEN
        �Ѿ���Ȯ�� = 0
        GOTO RX_EXIT
    ENDIF

    ����COUNT = ����COUNT + 1
    IF ����COUNT > ����Ƚ�� THEN  GOTO Ƚ��_������������_5_stop

    ERX 4800,A, Ƚ��_������������_1
    IF A <> A_old THEN
Ƚ��_������������_5_stop:
        MOVE G6A,95,  90, 125, 95, 104
        MOVE G6D,104,  76, 145,  91,  102
        WAIT
        HIGHSPEED SETOFF
        SPEED 15
        MOVE G6A,98,  76, 145,  93, 101, 100
        MOVE G6D,98,  76, 145,  93, 101, 100
        WAIT
        SPEED 5
        MOVE G6A,100,  76, 145,  93, 100, 100
        MOVE G6D,100,  76, 145,  93, 100, 100
        WAIT

        'DELAY 400
        GOTO RX_EXIT
    ENDIF

    GOTO Ƚ��_������������_1

    '**********************************************
    '**********************************************

��������:
    ����COUNT = 0
    ����ӵ� = 13
    �¿�ӵ� = 4
    �Ѿ���Ȯ�� = 0

    GOSUB Leg_motor_mode3
    ETX 4800,25 '�����ڵ带 ����
    IF ������� = 0 THEN
        ������� = 1

        SPEED 4

        MOVE G6A, 88,  74, 144,  95, 110
        MOVE G6D,108,  76, 146,  93,  96
        MOVE G6B,100
        MOVE G6C,100
        WAIT

        SPEED 10

        MOVE G6A, 90, 90, 120, 105, 110,100
        MOVE G6D,110,  76, 147,  93,  96,100
        MOVE G6B,90
        MOVE G6C,110
        WAIT

        GOTO ��������_1	
    ELSE
        ������� = 0

        SPEED 4

        MOVE G6D,  88,  74, 144,  95, 110
        MOVE G6A, 108,  76, 146,  93,  96
        MOVE G6C, 100
        MOVE G6B, 100
        WAIT

        SPEED 10

        MOVE G6D, 90, 90, 120, 105, 110,100
        MOVE G6A,110,  76, 147,  93,  96,100
        MOVE G6C,90
        MOVE G6B,110
        WAIT

        GOTO ��������_2	

    ENDIF

��������_1:

    ETX 4800,25 '�����ڵ带 ����
    SPEED ����ӵ�

    MOVE G6A, 86,  56, 145, 115, 110
    MOVE G6D,108,  76, 147,  93,  96
    WAIT

    SPEED �¿�ӵ�
    GOSUB Leg_motor_mode3

    MOVE G6A,110,  76, 147, 93,  96
    MOVE G6D,86, 100, 145,  69, 110
    WAIT

    SPEED ����ӵ�

    GOSUB �յڱ�������
    IF �Ѿ���Ȯ�� = 1 THEN
        �Ѿ���Ȯ�� = 0
        GOTO MAIN
    ENDIF

    ERX 4800,A, ��������_2
    IF A = 25 THEN
        GOTO ��������_2
    ELSE
        ' GOSUB Leg_motor_mode3

        MOVE G6A,112,  76, 146,  93, 96,100
        MOVE G6D,90, 100, 100, 115, 110,100
        MOVE G6B,110
        MOVE G6C,90
        WAIT
        HIGHSPEED SETOFF

        SPEED 8
        MOVE G6A, 106,  76, 146,  93,  96,100		
        MOVE G6D,  88,  71, 152,  91, 106,100
        MOVE G6B, 100
        MOVE G6C, 100
        WAIT	

        SPEED 2
        GOSUB �Ӹ������Ա⺻�ڼ�return

        GOTO RX_EXIT
    ENDIF

��������_2:

    MOVE G6A,110,  76, 147,  93, 96,100
    MOVE G6D,90, 90, 120, 105, 110,100
    MOVE G6B,110
    MOVE G6C,90
    WAIT

��������_3:
    ETX 4800,25 '�����ڵ带 ����

    SPEED ����ӵ�

    MOVE G6D, 86,  56, 145, 115, 110
    MOVE G6A,108,  76, 147,  93,  96
    WAIT

    SPEED �¿�ӵ�
    MOVE G6D,110,  76, 147, 93,  96
    MOVE G6A,86, 100, 145,  69, 110
    WAIT

    SPEED ����ӵ�

    GOSUB �յڱ�������
    IF �Ѿ���Ȯ�� = 1 THEN
        �Ѿ���Ȯ�� = 0
        GOTO MAIN
    ENDIF

    ERX 4800,A, ��������_4
    IF A = 25 THEN
        GOTO ��������_4
    ELSE

        MOVE G6A, 90, 100, 100, 115, 110,100
        MOVE G6D,112,  76, 146,  93,  96,100
        MOVE G6B,90
        MOVE G6C,110
        WAIT
        HIGHSPEED SETOFF
        SPEED 8

        MOVE G6D, 106,  76, 146,  93,  96,100		
        MOVE G6A,  88,  71, 152,  91, 106,100
        MOVE G6C, 100
        MOVE G6B, 100
        WAIT	
        SPEED 2
        GOSUB �Ӹ������Ա⺻�ڼ�return

        GOTO RX_EXIT
    ENDIF

��������_4:
    '�޹ߵ��10
    MOVE G6A,90, 90, 120, 105, 110,100
    MOVE G6D,110,  76, 146,  93,  96,100
    MOVE G6B, 90
    MOVE G6C,110
    WAIT

    GOTO ��������_1

'******************************************	
'******************************************	

�ѹ���������:
    ����COUNT = 0
    ����ӵ� = 13
    �¿�ӵ� = 4
    �Ѿ���Ȯ�� = 0

    GOSUB Leg_motor_mode3
    ETX 4800,29 '�����ڵ带 ����
    IF ������� = 0 THEN
        ������� = 1

        SPEED 4

        MOVE G6A, 88,  74, 144,  95, 110
        MOVE G6D,108,  76, 146,  93,  96
        MOVE G6B,100
        MOVE G6C,100
        WAIT

        SPEED 10

        MOVE G6A, 90, 90, 120, 105, 110,100
        MOVE G6D,110,  76, 147,  93,  96,100
        MOVE G6B,90
        MOVE G6C,110
        WAIT

        GOTO �ѹ���������_1	
    ELSE
        ������� = 0

        SPEED 4

        MOVE G6D,  88,  74, 144,  95, 110
        MOVE G6A, 108,  76, 146,  93,  96
        MOVE G6C, 100
        MOVE G6B, 100
        WAIT

        SPEED 10

        MOVE G6D, 90, 90, 120, 105, 110,100
        MOVE G6A,110,  76, 147,  93,  96,100
        MOVE G6C,90
        MOVE G6B,110
        WAIT

        GOTO �ѹ���������_2	

    ENDIF

�ѹ���������_1:

    ETX 4800,29 '�����ڵ带 ����
    SPEED ����ӵ�

    MOVE G6A, 86,  56, 145, 115, 110
    MOVE G6D,108,  76, 147,  93,  96
    WAIT

    SPEED �¿�ӵ�
    GOSUB Leg_motor_mode3

    MOVE G6A,110,  76, 147, 93,  96
    MOVE G6D,86, 100, 145,  69, 110
    WAIT

    SPEED ����ӵ�

    GOSUB �յڱ�������
    IF �Ѿ���Ȯ�� = 1 THEN
        �Ѿ���Ȯ�� = 0
        GOTO MAIN
    ENDIF

    ����COUNT = ����COUNT + 1
    IF ����COUNT = ����Ƚ�� THEN
        ' GOSUB Leg_motor_mode3
�ѹ���������_1stop:
        MOVE G6A,112,  76, 146,  93, 96,100
        MOVE G6D,90, 100, 100, 115, 110,100
        MOVE G6B,110
        MOVE G6C,90
        WAIT
        HIGHSPEED SETOFF

        SPEED 8
        MOVE G6A, 106,  76, 146,  93,  96,100		
        MOVE G6D,  88,  71, 152,  91, 106,100
        MOVE G6B, 100
        MOVE G6C, 100
        WAIT	

        SPEED 2
        GOSUB �Ӹ������Ա⺻�ڼ�return

        GOTO RX_EXIT
	
	ELSE 
		GOTO �ѹ���������_2
	
	ENDIF
	
�ѹ���������_2:

    MOVE G6A,110,  76, 147,  93, 96,100
    MOVE G6D,90, 90, 120, 105, 110,100
    MOVE G6B,110
    MOVE G6C,90
    WAIT

�ѹ���������_3:
    ETX 4800,29 '�����ڵ带 ����

    SPEED ����ӵ�

    MOVE G6D, 86,  56, 145, 115, 110
    MOVE G6A,108,  76, 147,  93,  96
    WAIT

    SPEED �¿�ӵ�
    MOVE G6D,110,  76, 147, 93,  96
    MOVE G6A,86, 100, 145,  69, 110
    WAIT

    SPEED ����ӵ�

    GOSUB �յڱ�������
    IF �Ѿ���Ȯ�� = 1 THEN
        �Ѿ���Ȯ�� = 0
        GOTO MAIN
    ENDIF

    ����COUNT = ����COUNT + 1
    IF ����COUNT = ����Ƚ�� THEN
                         
�ѹ���������_2stop:
        MOVE G6A, 90, 100, 100, 115, 110,100
        MOVE G6D,112,  76, 146,  93,  96,100
        MOVE G6B,90
        MOVE G6C,110
        WAIT
        HIGHSPEED SETOFF
        SPEED 8

        MOVE G6D, 106,  76, 146,  93,  96,100		
        MOVE G6A,  88,  71, 152,  91, 106,100
        MOVE G6C, 100
        MOVE G6B, 100
        WAIT	
        SPEED 2
        GOSUB �Ӹ������Ա⺻�ڼ�return

        GOTO RX_EXIT
    
    ELSE 
    	GOTO �ѹ���������_4
            
	ENDIF 
�ѹ���������_4:
    '�޹ߵ��10
    MOVE G6A,90, 90, 120, 105, 110,100
    MOVE G6D,110,  76, 146,  93,  96,100
    MOVE G6B, 90
    MOVE G6C,110
    WAIT

    GOTO �ѹ���������_1
        
'******************************************	
'******************************************

��x��������:
    ����COUNT = 0
    ����ӵ� = 13
    �¿�ӵ� = 4
    �Ѿ���Ȯ�� = 0

    GOSUB Leg_motor_mode3
    ETX 4800,27 '�����ڵ带 ����
    IF ������� = 0 THEN
        ������� = 1

        SPEED 4

        MOVE G6A, 88,  74, 144,  95, 110
        MOVE G6D,108,  76, 146,  93,  96
        WAIT

        SPEED 10'

        MOVE G6A, 90, 90, 120, 105, 110,100
        MOVE G6D,110,  76, 147,  93,  96,100
        WAIT


        GOTO ��x��������_1	
    ELSE
        ������� = 0

        SPEED 4

        MOVE G6D,  88,  74, 144,  95, 110
        MOVE G6A, 108,  76, 146,  93,  96
        WAIT

        SPEED 10

        MOVE G6D, 90, 90, 120, 105, 110,100
        MOVE G6A,110,  76, 147,  93,  96,100
        WAIT

        GOTO ��x��������_2	

    ENDIF

��x��������_1:


    SPEED ����ӵ�

    MOVE G6A, 86,  56, 145, 115, 110
    MOVE G6D,108,  76, 147,  93,  96
    WAIT


    SPEED �¿�ӵ�
    GOSUB Leg_motor_mode3

    MOVE G6A,110,  76, 147, 93,  96
    MOVE G6D,86, 100, 145,  69, 110
    WAIT


    SPEED ����ӵ�

    GOSUB �յڱ�������
    IF �Ѿ���Ȯ�� = 1 THEN
        �Ѿ���Ȯ�� = 0
        GOTO MAIN
    ENDIF

    ERX 4800,A, ��x��������_2
    IF A = 27 THEN
        GOTO ��x��������_2
    ELSE
        ' GOSUB Leg_motor_mode3

        MOVE G6A,112,  76, 146,  93, 96,100
        MOVE G6D,90, 100, 100, 115, 110,100
        WAIT

        HIGHSPEED SETOFF

        SPEED 8
        MOVE G6A, 106,  76, 146,  93,  96,100		
        MOVE G6D,  88,  71, 152,  91, 106,100
        WAIT	

        SPEED 4
        MOVE G6A,100,  76, 145,  93, 100, 100
        MOVE G6D,100,  76, 145,  93, 100, 100

        GOTO RX_EXIT
    ENDIF

��x��������_2:

    MOVE G6A,110,  76, 147,  93, 96,100
    MOVE G6D,90, 90, 120, 105, 110,100
    WAIT

��x��������_3:
    ETX 4800,27 '�����ڵ带 ����

    SPEED ����ӵ�

    MOVE G6D, 86,  56, 145, 115, 110
    MOVE G6A,108,  76, 147,  93,  96
    WAIT

    SPEED �¿�ӵ�
    MOVE G6D,110,  76, 147, 93,  96
    MOVE G6A,86, 100, 145,  69, 110
    WAIT

    SPEED ����ӵ�

    GOSUB �յڱ�������
    IF �Ѿ���Ȯ�� = 1 THEN
        �Ѿ���Ȯ�� = 0
        GOTO MAIN
    ENDIF

    ERX 4800,A, ��x��������_4
    IF A = 27 THEN
        GOTO ��x��������_4
    ELSE

        MOVE G6A,112,  76, 146,  93, 96,100
        MOVE G6D,90, 100, 100, 115, 110,100
        WAIT

        HIGHSPEED SETOFF

        SPEED 8
        MOVE G6A, 106,  76, 146,  93,  96,100		
        MOVE G6D,  88,  71, 152,  91, 106,100
        WAIT	

        SPEED 4
        MOVE G6A,100,  76, 145,  93, 100, 100
        MOVE G6D,100,  76, 145,  93, 100, 100

        GOTO RX_EXIT
    ENDIF

��x��������_4:
    '�޹ߵ��10
    MOVE G6A,90, 90, 120, 105, 110,100
    MOVE G6D,110,  76, 146,  93,  96,100
    WAIT

    GOTO ��x��������_1
    GOTO RX_EXIT
    RETURN

    '******************************************	
    '******************************************	

�ѹ���x��������:
    ����COUNT = 2
    ����ӵ� = 13
    �¿�ӵ� = 4
    �Ѿ���Ȯ�� = 0

    GOSUB Leg_motor_mode3
    ETX 4800,30 '�����ڵ带 ����
    IF ������� = 0 THEN
        ������� = 1

        SPEED 4

        MOVE G6A, 88,  74, 144,  95, 110
        MOVE G6D,108,  76, 146,  93,  96
        WAIT

        SPEED 10

        MOVE G6A, 90, 90, 120, 105, 110,100
        MOVE G6D,110,  76, 147,  93,  96,100
        WAIT


        GOTO �ѹ���x��������_1	
    ELSE
        ������� = 0

        SPEED 4

        MOVE G6D,  88,  74, 144,  95, 110
        MOVE G6A, 108,  76, 146,  93,  96
        WAIT

        SPEED 10

        MOVE G6D, 90, 90, 120, 105, 110,100
        MOVE G6A,110,  76, 147,  93,  96,100
        WAIT

        GOTO �ѹ���x��������_2	

    ENDIF


�ѹ���x��������_1:


    SPEED ����ӵ�

    MOVE G6A, 86,  56, 145, 115, 110
    MOVE G6D,108,  76, 147,  93,  96
    WAIT


    SPEED �¿�ӵ�
    GOSUB Leg_motor_mode3

    MOVE G6A,110,  76, 147, 93,  96
    MOVE G6D,86, 100, 145,  69, 110
    WAIT


    SPEED ����ӵ�

    GOSUB �յڱ�������
    IF �Ѿ���Ȯ�� = 1 THEN
        �Ѿ���Ȯ�� = 0
        GOTO MAIN
    ENDIF

    ����COUNT = ����COUNT + 1
    IF ����COUNT > ����Ƚ�� THEN  GOTO �ѹ���x��������_1stop

    ERX 4800,A, �ѹ���x��������_2
    IF A = 30 THEN
        GOTO �ѹ���x��������_2
    ELSE
        ' GOSUB Leg_motor_mode3
�ѹ���x��������_1stop:
        MOVE G6A,112,  76, 146,  93, 96,100
        MOVE G6D,90, 100, 100, 115, 110,100
        WAIT

        HIGHSPEED SETOFF

        SPEED 8
        MOVE G6A, 106,  76, 146,  93,  96,100		
        MOVE G6D,  88,  71, 152,  91, 106,100
        WAIT	

        SPEED 4
        MOVE G6A,100,  76, 145,  93, 100, 100
        MOVE G6D,100,  76, 145,  93, 100, 100

        GOTO RX_EXIT
    ENDIF

�ѹ���x��������_2:

    MOVE G6A,110,  76, 147,  93, 96,100
    MOVE G6D,90, 90, 120, 105, 110,100
    WAIT

�ѹ���x��������_3:
    ETX 4800,30 '�����ڵ带 ����

    SPEED ����ӵ�

    MOVE G6D, 86,  56, 145, 115, 110
    MOVE G6A,108,  76, 147,  93,  96
    WAIT

    SPEED �¿�ӵ�
    MOVE G6D,110,  76, 147, 93,  96
    MOVE G6A,86, 100, 145,  69, 110
    WAIT

    SPEED ����ӵ�

    GOSUB �յڱ�������
    IF �Ѿ���Ȯ�� = 1 THEN
        �Ѿ���Ȯ�� = 0
        GOTO MAIN
    ENDIF

    ����COUNT = ����COUNT + 1
    IF ����COUNT > ����Ƚ�� THEN  GOTO �ѹ���x��������_3stop

    ERX 4800,A, �ѹ���x��������_4
    IF A = 30 THEN
        GOTO �ѹ���x��������_4
    ELSE
    
�ѹ���x��������_3stop:
        MOVE G6A,112,  76, 146,  93, 96,100
        MOVE G6D,90, 100, 100, 115, 110,100
        WAIT

        HIGHSPEED SETOFF

        SPEED 8
        MOVE G6A, 106,  76, 146,  93,  96,100		
        MOVE G6D,  88,  71, 152,  91, 106,100
        WAIT	

        SPEED 4
        MOVE G6A,100,  76, 145,  93, 100, 100
        MOVE G6D,100,  76, 145,  93, 100, 100

        GOTO RX_EXIT
    ENDIF

�ѹ���x��������_4:
    '�޹ߵ��10
    MOVE G6A,90, 90, 120, 105, 110,100
    MOVE G6D,110,  76, 146,  93,  96,100
    WAIT

    GOTO �ѹ���x��������_1
    GOTO RX_EXIT
    RETURN

    '*******************************************
    '		MAIN �󺧷� ����
    '*******************************************


MAIN: '�󺧼���

    ETX 4800, 38 ' ���� ���� Ȯ�� �۽� ��

MAIN_2:

    GOSUB �յڱ�������
    GOSUB �¿��������
    GOSUB ���ܼ��Ÿ�����Ȯ��


    ERX 4800,A,MAIN_2	

    A_old = A

    '**** �Էµ� A���� 0 �̸� MAIN �󺧷� ����
    '**** 1�̸� KEY1 ��, 2�̸� key2��... ���¹�
    '**** ������ ���߱����� MAIN/ ������ ����
    ON A GOTO MAIN,KEY1,KEY2,KEY3,KEY4,KEY5,KEY6,KEY7,KEY8,KEY9,KEY10,KEY11,KEY12,KEY13,KEY14,KEY15,KEY16,KEY17,KEY18,KEY19,KEY20,KEY21,KEY22,KEY23,KEY24,KEY25,KEY26,KEY27,KEY28,KEY29

    IF A > 100 AND A < 110 THEN
        BUTTON_NO = A - 100
        GOSUB Number_Play
        GOSUB SOUND_PLAY_CHK
        GOSUB GOSUB_RX_EXIT


    ELSEIF A = 250 THEN
        GOSUB All_motor_mode3
        SPEED 4
        MOVE G6A,100,  76, 145,  93, 100, 100
        MOVE G6D,100,  76, 145,  93, 100, 100
        MOVE G6B,100,  40,  90,
        MOVE G6C,100,  40,  90,
        WAIT
        DELAY 500
        SPEED 6
        GOSUB �⺻�ڼ�2

    ENDIF


    GOTO MAIN	

    '*******************************************
    '		MAIN �󺧷� ����
    '*******************************************



    'key�� ����

KEY1:
    ETX  4800,1
    GOTO �Ӹ��⺻�ڼ�

    GOTO RX_EXIT

KEY2:
    ETX  4800,2
    GOTO �Ӹ������Ա⺻�ڼ�

    GOTO RX_EXIT

KEY3:
    ETX  4800,3
    GOTO ��������

    GOTO RX_EXIT

KEY4:
    ETX  4800,4
    GOTO ���ʹ����ΰ�������

    GOTO RX_EXIT

KEY5:
    ETX  4800,5
    GOTO �����ʹ����ΰ�������

    GOTO RX_EXIT

KEY6:
    ETX  4800,6
    GOTO �޼յ��

    GOTO RX_EXIT

KEY7:
    ETX  4800,7
    GOTO �����յ��

    GOTO RX_EXIT

KEY8:
    ETX  4800,8
    GOTO ��վ�����

    GOTO RX_EXIT

KEY9:
    ETX  4800,9
    GOTO ��յڷ�

    GOTO RX_EXIT

KEY10:
    ETX  4800,10
    GOTO �ɱ�

    GOTO RX_EXIT

KEY11:
    ETX  4800,11
    GOTO ���������Ͼ��

    GOTO RX_EXIT

KEY12:
    ETX  4800,12
    GOTO ���ǳ���⺻�ڼ�

    GOTO RX_EXIT

KEY13:
    ETX  4800,13
    GOTO �Ӹ�x������10

    GOTO RX_EXIT

KEY14:
    ETX  4800,14
    GOTO �Ӹ�x��������10

    GOTO RX_EXIT

KEY15:
    ETX  4800,15
    GOTO �Ӹ�x������20

    GOTO RX_EXIT

KEY17:
    ETX  4800,17
    GOTO �Ӹ�x��������20

    GOTO RX_EXIT


KEY18:
    ETX  4800,18
    GOTO �ڷε���Ӹ�x������20

    GOTO RX_EXIT

KEY19:
    ETX  4800,19
    GOTO �ڷε���Ӹ�x��������20

    GOTO RX_EXIT

KEY20:
    ETX  4800,20
    GOTO �ѹ��Ӹ�x������10

    GOTO RX_EXIT

KEY21:
    ETX  4800,21
    GOTO �ѹ��Ӹ�x��������10

    GOTO RX_EXIT

KEY22:
    ETX  4800,22
    GOTO �ѹ��Ӹ�x������20

    GOTO RX_EXIT

KEY23:
    ETX  4800,23
    GOTO �ѹ��Ӹ�x��������20

    GOTO RX_EXIT

KEY24:
    ETX  4800,24
    GOTO ������������

    GOTO RX_EXIT

KEY25:
    ETX  4800,25
    GOTO ��������

    GOTO RX_EXIT

KEY27:
    ETX  4800,27
    GOTO ��x��������

    GOTO RX_EXIT

KEY28:
    ETX  4800,28
    GOTO Ƚ��_������������

    GOTO RX_EXIT

KEY29:
    ETX  4800,29
    GOTO �ѹ���������

    GOTO RX_EXIT

KEY30:
    ETX  4800,30
    GOTO �ѹ���x��������

    GOTO RX_EXIT



KEY16: ' POWER
    ERX 4800,A,KEY16
    ETX  4800,A

    GOSUB Leg_motor_mode3
    IF MODE = 0 THEN
        SPEED 10
        MOVE G6A,100, 140,  37, 145, 100, 100
        MOVE G6D,100, 140,  37, 145, 100, 100
        WAIT
    ENDIF
    SPEED 4
    GOSUB �����ڼ�	
    GOSUB ������

    GOSUB MOTOR_GET
    GOSUB MOTOR_OFF

    GOSUB GOSUB_RX_EXIT


KEY16_1:

    IF ����ONOFF = 1  THEN
        OUT 52,1
        DELAY 200
        OUT 52,0
        DELAY 200
    ENDIF
    ERX 4800,A,KEY16_1
    ETX  4800,A

    '**** RX DATA Number Sound ********
    BUTTON_NO = A
    GOSUB Number_Play
    GOSUB SOUND_PLAY_CHK


    IF  A = 16 THEN 	'�ٽ� �Ŀ���ư�� �����߸� ����
        GOSUB MOTOR_ON
        SPEED 10
        MOVE G6A,100, 140,  37, 145, 100, 100
        MOVE G6D,100, 140,  37, 145, 100, 100
        WAIT

        GOSUB �⺻�ڼ�2
        GOSUB ���̷�ON
        GOSUB All_motor_mode3
        GOTO RX_EXIT
    ENDIF

    GOSUB GOSUB_RX_EXIT
    GOTO KEY16_1



    GOTO RX_EXIT
    '***************

KEY26: ' ��
    ETX  4800,26

    SPEED 5
    GOSUB �⺻�ڼ�2	
    TEMPO 220
    MUSIC "ff"
    GOSUB �⺻�ڼ�2
    GOTO RX_EXIT

    '***************

    'sound

Number_Play: '  BUTTON_NO = ���ڴ���


    GOSUB NUM_TO_ARR

    PRINT "NPL "
    '*************

    NUM = NO_4
    GOSUB NUM_1_9

    '*************
    NUM = NO_3
    GOSUB NUM_1_9

    '*************
    NUM = NO_2
    GOSUB NUM_1_9
    '*************
    NUM = NO_1
    GOSUB NUM_1_9
    '*************
    NUM = NO_0
    GOSUB NUM_1_9
    PRINT " !"

    GOSUB SOUND_PLAY_CHK
    PRINT "SND 16 !"
    GOSUB SOUND_PLAY_CHK
    RETURN

    '************************************************

NUM_1_9:
    IF NUM = 1 THEN
        PRINT "1"
    ELSEIF NUM = 2 THEN
        PRINT "2"
    ELSEIF NUM = 3 THEN
        PRINT "3"
    ELSEIF NUM = 4 THEN
        PRINT "4"
    ELSEIF NUM = 5 THEN
        PRINT "5"
    ELSEIF NUM = 6 THEN
        PRINT "6"
    ELSEIF NUM = 7 THEN
        PRINT "7"
    ELSEIF NUM = 8 THEN
        PRINT "8"
    ELSEIF NUM = 9 THEN
        PRINT "9"
    ELSEIF NUM = 0 THEN
        PRINT "0"
    ENDIF

    RETURN

    '************************************************
NUM_TO_ARR:

    NO_4 =  BUTTON_NO / 10000
    TEMP_INTEGER = BUTTON_NO MOD 10000

    NO_3 =  TEMP_INTEGER / 1000
    TEMP_INTEGER = BUTTON_NO MOD 1000

    NO_2 =  TEMP_INTEGER / 100
    TEMP_INTEGER = BUTTON_NO MOD 100

    NO_1 =  TEMP_INTEGER / 10
    TEMP_INTEGER = BUTTON_NO MOD 10

    NO_0 =  TEMP_INTEGER

    RETURN

    '************************************************

SOUND_PLAY_CHK:
    DELAY 60
    SOUND_BUSY = IN(46)
    IF SOUND_BUSY = 1 THEN GOTO SOUND_PLAY_CHK
    DELAY 50

    RETURN
    '************************************************
