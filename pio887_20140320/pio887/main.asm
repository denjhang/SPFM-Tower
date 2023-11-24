;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.3.0 #8604 (May 11 2013) (MINGW32)
; This file was generated Sun Mar 23 11:32:00 2014
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"main.c"
	list	p=16f887
	radix dec
	include "p16f887.inc"
;--------------------------------------------------------
; config word(s)
;--------------------------------------------------------
	__config _CONFIG1, 0x2cd2
	__config _CONFIG2, 0x3fff
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_STATUSbits
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_PORTCbits
	extern	_PORTDbits
	extern	_PORTEbits
	extern	_INTCONbits
	extern	_PIR1bits
	extern	_PIR2bits
	extern	_T1CONbits
	extern	_T2CONbits
	extern	_SSPCONbits
	extern	_CCP1CONbits
	extern	_RCSTAbits
	extern	_CCP2CONbits
	extern	_ADCON0bits
	extern	_OPTION_REGbits
	extern	_TRISAbits
	extern	_TRISBbits
	extern	_TRISCbits
	extern	_TRISDbits
	extern	_TRISEbits
	extern	_PIE1bits
	extern	_PIE2bits
	extern	_PCONbits
	extern	_OSCCONbits
	extern	_OSCTUNEbits
	extern	_SSPCON2bits
	extern	_MSKbits
	extern	_SSPMSKbits
	extern	_SSPSTATbits
	extern	_WPUBbits
	extern	_IOCBbits
	extern	_VRCONbits
	extern	_TXSTAbits
	extern	_SPBRGbits
	extern	_SPBRGHbits
	extern	_PWM1CONbits
	extern	_ECCPASbits
	extern	_PSTRCONbits
	extern	_ADCON1bits
	extern	_WDTCONbits
	extern	_CM1CON0bits
	extern	_CM2CON0bits
	extern	_CM2CON1bits
	extern	_SRCONbits
	extern	_BAUDCTLbits
	extern	_ANSELbits
	extern	_ANSELHbits
	extern	_EECON1bits
	extern	_INDF
	extern	_TMR0
	extern	_PCL
	extern	_STATUS
	extern	_FSR
	extern	_PORTA
	extern	_PORTB
	extern	_PORTC
	extern	_PORTD
	extern	_PORTE
	extern	_PCLATH
	extern	_INTCON
	extern	_PIR1
	extern	_PIR2
	extern	_TMR1
	extern	_TMR1L
	extern	_TMR1H
	extern	_T1CON
	extern	_TMR2
	extern	_T2CON
	extern	_SSPBUF
	extern	_SSPCON
	extern	_CCPR1
	extern	_CCPR1L
	extern	_CCPR1H
	extern	_CCP1CON
	extern	_RCSTA
	extern	_TXREG
	extern	_RCREG
	extern	_CCPR2
	extern	_CCPR2L
	extern	_CCPR2H
	extern	_CCP2CON
	extern	_ADRESH
	extern	_ADCON0
	extern	_OPTION_REG
	extern	_TRISA
	extern	_TRISB
	extern	_TRISC
	extern	_TRISD
	extern	_TRISE
	extern	_PIE1
	extern	_PIE2
	extern	_PCON
	extern	_OSCCON
	extern	_OSCTUNE
	extern	_SSPCON2
	extern	_PR2
	extern	_MSK
	extern	_SSPADD
	extern	_SSPMSK
	extern	_SSPSTAT
	extern	_WPUB
	extern	_IOCB
	extern	_VRCON
	extern	_TXSTA
	extern	_SPBRG
	extern	_SPBRGH
	extern	_PWM1CON
	extern	_ECCPAS
	extern	_PSTRCON
	extern	_ADRESL
	extern	_ADCON1
	extern	_WDTCON
	extern	_CM1CON0
	extern	_CM2CON0
	extern	_CM2CON1
	extern	_EEDAT
	extern	_EEDATA
	extern	_EEADR
	extern	_EEDATH
	extern	_EEADRH
	extern	_SRCON
	extern	_BAUDCTL
	extern	_ANSEL
	extern	_ANSELH
	extern	_EECON1
	extern	_EECON2
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_sendByte
	global	_main

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0070
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_main_0	udata
r0x1000	res	1
r0x1001	res	1
r0x1002	res	1
r0x1003	res	1
r0x1004	res	1
r0x1005	res	1
r0x1006	res	1
r0x1007	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_main	code
;***
;  pBlock Stats: dbName = M
;***
;entry:  _main	;Function start
; 2 exit points
;has an exit
;functions called:
;   _sendByte
;   _sendByte
;   _sendByte
;   _sendByte
;7 compiler assigned registers:
;   r0x1001
;   r0x1002
;   r0x1003
;   r0x1004
;   r0x1005
;   r0x1006
;   r0x1007
;; Starting pCode block
_main	;Function start
; 2 exit points
;	.line	15; "main.c"	unsigned short flip_cnt = 2000;
	MOVLW	0xd0
	BANKSEL	r0x1001
	MOVWF	r0x1001
	MOVLW	0x07
	MOVWF	r0x1002
;	.line	16; "main.c"	unsigned char reg_flip = 0;
	CLRF	r0x1003
;	.line	22; "main.c"	unsigned char cs = 0x00;
	CLRF	r0x1004
;	.line	25; "main.c"	OSCCON = 0x70;
	MOVLW	0x70
	BANKSEL	_OSCCON
	MOVWF	_OSCCON
;	.line	26; "main.c"	OSCTUNE = 0x52;
	MOVLW	0x52
	MOVWF	_OSCTUNE
;	.line	28; "main.c"	ANSEL	= 0x00;			// アナログセレクタ禁止
	BANKSEL	_ANSEL
	CLRF	_ANSEL
;	.line	29; "main.c"	ANSELH	= 0x00;			// アナログセレクタ禁止
	CLRF	_ANSELH
;	.line	30; "main.c"	TRISA	= 0xFF;			// 全ビット入力
	MOVLW	0xff
	BANKSEL	_TRISA
	MOVWF	_TRISA
;	.line	31; "main.c"	IOCB	= 0x00;			// 割り込み未使用
	CLRF	_IOCB
;	.line	32; "main.c"	WPUB	= 0x00;			// プルアップ未使用
	CLRF	_WPUB
;	.line	33; "main.c"	TRISB	= 0x00;			// 全ビット出力
	CLRF	_TRISB
;	.line	34; "main.c"	TRISC	= 0x80;			// シリアル入力のみ
	MOVLW	0x80
	MOVWF	_TRISC
;	.line	35; "main.c"	TRISD	= 0x00;			// 全ビット出力
	CLRF	_TRISD
;	.line	36; "main.c"	PORTA	= 0x00;			// ポートAクリア
	BANKSEL	_PORTA
	CLRF	_PORTA
;	.line	37; "main.c"	PORTB	= 0x00;			// ポートBクリア
	CLRF	_PORTB
;	.line	38; "main.c"	PORTC	= 0x00;			// ポートCクリア
	CLRF	_PORTC
;	.line	39; "main.c"	PORTD	= 0x01;			// ポートDクリア
	MOVLW	0x01
	MOVWF	_PORTD
;	.line	41; "main.c"	BRGH	= 1;			// ハイスピード
	BANKSEL	_TXSTAbits
	BSF	_TXSTAbits,2
;	.line	44; "main.c"	SPBRG	= 1;			// 625000bps
	MOVLW	0x01
	MOVWF	_SPBRG
;	.line	45; "main.c"	SYNC	= 0;			// 非同期
	BCF	_TXSTAbits,4
;	.line	46; "main.c"	SPEN	= 1;			// シリアル有効
	BANKSEL	_RCSTAbits
	BSF	_RCSTAbits,7
;	.line	47; "main.c"	TXEN	= 1;			// 送信許可
	BANKSEL	_TXSTAbits
	BSF	_TXSTAbits,5
;	.line	48; "main.c"	TX9		= 0;			// 8bitモード
	BCF	_TXSTAbits,6
;	.line	49; "main.c"	RX9		= 0;
	BANKSEL	_RCSTAbits
	BCF	_RCSTAbits,6
;	.line	50; "main.c"	RCIE	= 0;
	BANKSEL	_PIE1bits
	BCF	_PIE1bits,5
;	.line	51; "main.c"	TXIE	= 0;
	BCF	_PIE1bits,4
;	.line	52; "main.c"	CREN	= 1;			// 連続受信化
	BANKSEL	_RCSTAbits
	BSF	_RCSTAbits,4
;	.line	54; "main.c"	for(i = 0; i < 32767; i++);
	MOVLW	0xff
	BANKSEL	r0x1005
	MOVWF	r0x1005
	MOVLW	0x7f
	MOVWF	r0x1006
_00146_DS_
	MOVLW	0xff
	BANKSEL	r0x1005
	ADDWF	r0x1005,F
	BTFSS	STATUS,0
	DECF	r0x1006,F
	MOVF	r0x1005,W
	IORWF	r0x1006,W
	BTFSS	STATUS,2
	GOTO	_00146_DS_
;	.line	55; "main.c"	for(i = 0; i < 32767; i++);
	MOVLW	0xff
	MOVWF	r0x1005
	MOVLW	0x7f
	MOVWF	r0x1006
_00149_DS_
	MOVLW	0xff
	BANKSEL	r0x1005
	ADDWF	r0x1005,F
	BTFSS	STATUS,0
	DECF	r0x1006,F
	MOVF	r0x1005,W
	IORWF	r0x1006,W
	BTFSS	STATUS,2
	GOTO	_00149_DS_
;	.line	57; "main.c"	PORTD = 0x81;
	MOVLW	0x81
	BANKSEL	_PORTD
	MOVWF	_PORTD
_00142_DS_
;	.line	60; "main.c"	if(--flip_cnt == 0){
	MOVLW	0xff
	BANKSEL	r0x1001
	ADDWF	r0x1001,F
	BTFSS	STATUS,0
	DECF	r0x1002,F
	MOVF	r0x1001,W
	IORWF	r0x1002,W
	BTFSS	STATUS,2
	GOTO	_00113_DS_
;	.line	61; "main.c"	reg_flip = 0;			// レジスタモードへ変更
	CLRF	r0x1003
;	.line	62; "main.c"	flip_cnt = 10000;
	MOVLW	0x10
	MOVWF	r0x1001
	MOVLW	0x27
	MOVWF	r0x1002
;	.line	63; "main.c"	continue;
	GOTO	_00142_DS_
_00113_DS_
;	.line	66; "main.c"	if(RCIF){
	BANKSEL	_PIR1bits
	BTFSS	_PIR1bits,5
	GOTO	_00142_DS_
;	.line	68; "main.c"	if(FERR){
	BTFSS	_RCSTAbits,2
	GOTO	_00137_DS_
;	.line	70; "main.c"	RCREG = '?';
	MOVLW	0x3f
	MOVWF	_RCREG
	GOTO	_00138_DS_
_00137_DS_
;	.line	71; "main.c"	}else if(OERR){
	BANKSEL	_RCSTAbits
	BTFSS	_RCSTAbits,1
	GOTO	_00134_DS_
;	.line	73; "main.c"	CREN = 0;
	BCF	_RCSTAbits,4
;	.line	74; "main.c"	CREN = 1;
	BSF	_RCSTAbits,4
;	.line	75; "main.c"	RCREG = '?';
	MOVLW	0x3f
	MOVWF	_RCREG
	GOTO	_00138_DS_
_00134_DS_
;	.line	77; "main.c"	dt = RCREG; // データを保存する
	BANKSEL	_RCREG
	MOVF	_RCREG,W
	BANKSEL	r0x1005
	MOVWF	r0x1005
;	.line	79; "main.c"	if(reg_flip == 0){
	MOVF	r0x1003,W
	BTFSS	STATUS,2
	GOTO	_00131_DS_
;	.line	80; "main.c"	if(dt == 0xff){
	MOVF	r0x1005,W
	XORLW	0xff
	BTFSS	STATUS,2
	GOTO	_00123_DS_
;	.line	81; "main.c"	PORTD = 0x01;
	MOVLW	0x01
	BANKSEL	_PORTD
	MOVWF	_PORTD
;	.line	82; "main.c"	for(i = 0; i < 20000; i++);
	MOVLW	0x20
	BANKSEL	r0x1006
	MOVWF	r0x1006
	MOVLW	0x4e
	MOVWF	r0x1007
_00152_DS_
	MOVLW	0xff
	BANKSEL	r0x1006
	ADDWF	r0x1006,F
	BTFSS	STATUS,0
	DECF	r0x1007,F
	MOVF	r0x1006,W
	IORWF	r0x1007,W
	BTFSS	STATUS,2
	GOTO	_00152_DS_
;	.line	83; "main.c"	PORTD = 0x81;
	MOVLW	0x81
	BANKSEL	_PORTD
	MOVWF	_PORTD
;	.line	84; "main.c"	for(i = 0; i < 20000; i++);
	MOVLW	0x20
	BANKSEL	r0x1006
	MOVWF	r0x1006
	MOVLW	0x4e
	MOVWF	r0x1007
_00155_DS_
	MOVLW	0xff
	BANKSEL	r0x1006
	ADDWF	r0x1006,F
	BTFSS	STATUS,0
	DECF	r0x1007,F
	MOVF	r0x1006,W
	IORWF	r0x1007,W
	BTFSS	STATUS,2
	GOTO	_00155_DS_
;	.line	85; "main.c"	sendByte('O');
	MOVLW	0x4f
	CALL	_sendByte
;	.line	86; "main.c"	sendByte('K');
	MOVLW	0x4b
	CALL	_sendByte
	GOTO	_00138_DS_
_00123_DS_
;	.line	89; "main.c"	cs = dt & 0xf0;
	MOVLW	0xf0
	BANKSEL	r0x1005
	ANDWF	r0x1005,W
	MOVWF	r0x1004
;	.line	90; "main.c"	dt &= 0x0f;
	MOVLW	0x0f
	ANDWF	r0x1005,F
;	.line	91; "main.c"	if(dt == 0x00){
	MOVF	r0x1005,W
	BTFSS	STATUS,2
	GOTO	_00120_DS_
;	.line	92; "main.c"	cs |= 0x01;
	BSF	r0x1004,0
	GOTO	_00121_DS_
_00120_DS_
;	.line	93; "main.c"	}else if(dt == 0x01){
	BANKSEL	r0x1005
	MOVF	r0x1005,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00117_DS_
;	.line	94; "main.c"	cs |= 0x05;
	MOVLW	0x05
	IORWF	r0x1004,F
	GOTO	_00121_DS_
_00117_DS_
;	.line	96; "main.c"	cs |= 0x09;
	MOVLW	0x09
	BANKSEL	r0x1004
	IORWF	r0x1004,F
_00121_DS_
;	.line	98; "main.c"	reg_flip++;
	BANKSEL	r0x1003
	INCF	r0x1003,F
	GOTO	_00138_DS_
_00131_DS_
;	.line	100; "main.c"	}else if(reg_flip == 1){
	BANKSEL	r0x1003
	MOVF	r0x1003,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00128_DS_
;	.line	101; "main.c"	PORTB = dt;
	MOVF	r0x1005,W
	BANKSEL	_PORTB
	MOVWF	_PORTB
;	.line	102; "main.c"	PORTD = cs;
	BANKSEL	r0x1004
	MOVF	r0x1004,W
	BANKSEL	_PORTD
	MOVWF	_PORTD
;	.line	103; "main.c"	PORTD |= 0x01;
	BSF	_PORTD,0
;	.line	104; "main.c"	PORTD |= 0x01;
	BSF	_PORTD,0
;	.line	105; "main.c"	PORTD &= 0xfe;
	BCF	_PORTD,0
;	.line	106; "main.c"	PORTD &= 0xfe;
	BCF	_PORTD,0
;	.line	107; "main.c"	PORTD &= 0xfe;
	BCF	_PORTD,0
;	.line	108; "main.c"	PORTD &= 0xfe;
	BCF	_PORTD,0
;	.line	109; "main.c"	PORTD |= 0x01;
	BSF	_PORTD,0
;	.line	110; "main.c"	PORTD |= 0x01;
	BSF	_PORTD,0
;	.line	111; "main.c"	PORTD |= 0x01;
	BSF	_PORTD,0
;	.line	112; "main.c"	PORTD |= 0x01;
	BSF	_PORTD,0
;	.line	113; "main.c"	reg_flip++;
	BANKSEL	r0x1003
	INCF	r0x1003,F
	GOTO	_00138_DS_
_00128_DS_
;	.line	114; "main.c"	}else if(reg_flip == 2){
	BANKSEL	r0x1003
	MOVF	r0x1003,W
	XORLW	0x02
	BTFSS	STATUS,2
	GOTO	_00138_DS_
;	.line	115; "main.c"	PORTB = dt;
	MOVF	r0x1005,W
	BANKSEL	_PORTB
	MOVWF	_PORTB
;	.line	116; "main.c"	PORTD |= 0x03;
	MOVLW	0x03
	IORWF	_PORTD,F
;	.line	117; "main.c"	PORTD |= 0x01;
	BSF	_PORTD,0
;	.line	118; "main.c"	PORTD |= 0x01;
	BSF	_PORTD,0
;	.line	119; "main.c"	PORTD &= 0xfe;
	BCF	_PORTD,0
;	.line	120; "main.c"	PORTD &= 0xfe;
	BCF	_PORTD,0
;	.line	121; "main.c"	PORTD &= 0xfe;
	BCF	_PORTD,0
;	.line	122; "main.c"	PORTD &= 0xfe;
	BCF	_PORTD,0
;	.line	123; "main.c"	PORTD |= 0x01;
	BSF	_PORTD,0
;	.line	124; "main.c"	PORTD |= 0x01;
	BSF	_PORTD,0
;	.line	125; "main.c"	PORTD |= 0x01;
	BSF	_PORTD,0
;	.line	126; "main.c"	PORTD |= 0x01;
	BSF	_PORTD,0
;	.line	127; "main.c"	reg_flip = 0;
	BANKSEL	r0x1003
	CLRF	r0x1003
_00138_DS_
;	.line	130; "main.c"	flip_cnt = 10000;
	MOVLW	0x10
	BANKSEL	r0x1001
	MOVWF	r0x1001
	MOVLW	0x27
	MOVWF	r0x1002
	GOTO	_00142_DS_
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;entry:  _sendByte	;Function start
; 2 exit points
;has an exit
;1 compiler assigned register :
;   r0x1000
;; Starting pCode block
_sendByte	;Function start
; 2 exit points
;	.line	9; "main.c"	void sendByte(unsigned char data){
	BANKSEL	r0x1000
	MOVWF	r0x1000
_00105_DS_
;	.line	10; "main.c"	while(!TRMT); 
	BANKSEL	_TXSTAbits
	BTFSS	_TXSTAbits,1
	GOTO	_00105_DS_
;	.line	11; "main.c"	TXREG = data; 
	BANKSEL	r0x1000
	MOVF	r0x1000,W
	BANKSEL	_TXREG
	MOVWF	_TXREG
	RETURN	
; exit point of _sendByte


;	code size estimation:
;	  204+   43 =   247 instructions (  580 byte)

	end
