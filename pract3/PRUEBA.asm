			PROCESSOR   16F887
	        __CONFIG    0X2007,0X2BE2
			__CONFIG	0X2008,0X3FFF
	        INCLUDE     <P16F887.INC>
			CBLOCK 		0X20
			DIS1,DIS2,DIS3,DIS4,DIS5,DIS6	
			ENDC
			ORG			0X0000
    		GOTO		INICIO
			INCLUDE		<TABLA7SEG.ASM>
			INCLUDE		<SUBS_TIEMPO.ASM>

;******************************************************************
;			CONFIGURACION DE PUERTOS
;PORTB.6--->PAUSA	PORTB.7--->CAMBIO
;******************************************************************

INICIO:		BSF		STATUS,RP0	;BANCO1
			CLRF	TRISA
			CLRF	TRISD
			BSF		STATUS,RP1	;BANCO3
			CLRF	ANSEL
			CLRF	ANSELH	
			BCF		STATUS,RP1
			BCF		STATUS,RP0	;BANCO0
;*****************************************************************
			MOVLW	0XFF
			MOVWF	PORTA
			CLRF	DIS1
			CLRF	DIS2
			CLRF	DIS3
			CLRF	DIS4
			CLRF	DIS5
			CLRF	DIS6

			CALL	ASC_DES			
			BTFSS	0X30,.0
			GOTO	ASCENDENTE
			MOVLW	.9
			MOVWF	DIS1
			MOVWF	DIS2
			MOVWF	DIS3
			MOVWF	DIS4
			MOVWF	DIS5
			MOVWF	DIS6
			GOTO	DESCENDENTE

LIMP_6		CLRF	DIS6	
LIMP_5		CLRF	DIS5
LIMP_4		CLRF	DIS4
LIMP_3		CLRF	DIS3
LIMP_2		CLRF	DIS2
LIMP_1		CLRF	DIS1

ASCENDENTE	CLRF	0X31
			CALL	MOSTRAR
			NOP
				nop
				nop
				nop
				nop
				nop
				nop
				NOP
				NOP
				NOP
			CALL	BOTONES	;PREGUNTAR POR RB7 Y RB6
			BTFSC	0X31,.7
			GOTO	DESCENDENTE
			BTFSC	0X31,.6
			CALL	PAUSA

			INCF	DIS1,F		;INCREMENTOS
			MOVLW	.10
			XORWF	DIS1,W
			BTFSS	STATUS,Z
			GOTO	ASCENDENTE
			NOP	
			INCF	DIS2,F
			MOVLW	.10
			XORWF	DIS2,W
			BTFSS	STATUS,Z
			GOTO	LIMP_1
			NOP
			NOP
			INCF	DIS3,F	;26
			MOVLW	.10
			XORWF	DIS3,W
			BTFSS	STATUS,Z
			GOTO	LIMP_2
					
			INCF	DIS4,F
			MOVLW	.10
			XORWF	DIS4,W
			BTFSS	STATUS,Z
			GOTO	LIMP_3
					nop
			INCF	DIS5,F
			MOVLW	.10
			XORWF	DIS5,W
			BTFSS	STATUS,Z
			GOTO	LIMP_4
					nop
					nop
						call REBOTE
						
			INCF	DIS6,F
			MOVLW	.10
			XORWF	DIS6,W
			BTFSS	STATUS,Z
			GOTO	LIMP_5
			GOTO	LIMP_6	;46

NUEVE_6		MOVLW	.9
			MOVWF	DIS6	
NUEVE_5		MOVLW	.9
			MOVWF	DIS5
NUEVE_4		MOVLW	.9
			MOVWF	DIS4
NUEVE_3		MOVLW	.9
			MOVWF	DIS3
NUEVE_2		MOVLW	.9
			MOVWF	DIS2
NUEVE_1		MOVLW	.9
			MOVWF	DIS1

DESCENDENTE	CLRF	0X31
			CALL	MOSTRAR

			CALL	BOTONES	;PREGUNTAR POR RB7 Y RB6
			BTFSC	0X31,.7
			GOTO	ASCENDENTE
			BTFSC	0X31,.6
			CALL	PAUSA
			
			DECF	DIS1,F		;DECREMENTOS
			MOVLW	.255
			XORWF	DIS1,W
			BTFSS	STATUS,Z
			GOTO	DESCENDENTE
			DECF	DIS2,F
			MOVLW	.255
			XORWF	DIS2,W
			BTFSS	STATUS,Z
			GOTO	NUEVE_1
			DECF	DIS3,F
			MOVLW	.255
			XORWF	DIS3,W
			BTFSS	STATUS,Z
			GOTO	NUEVE_2
			DECF	DIS4,F
			MOVLW	.255
			XORWF	DIS4,W
			BTFSS	STATUS,Z
			GOTO	NUEVE_3
			DECF	DIS5,F
			MOVLW	.255
			XORWF	DIS5,W
			BTFSS	STATUS,Z
			GOTO	NUEVE_4
			DECF	DIS6,F
			MOVLW	.255
			XORWF	DIS6,W
			BTFSS	STATUS,Z
			GOTO	NUEVE_5
			GOTO	NUEVE_6


PAUSA		CALL 	MOSTRAR
			BTFSS	PORTB,.6
			GOTO	PAUSA
			CALL	REBOTE
			BTFSC	PORTB,.6
			GOTO	$-1
			CALL	REBOTE
			CLRF	0X31
			RETURN
			
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
MOSTRAR		MOVF	DIS1,W
			CALL	SIETESEGK
			MOVWF	PORTD
			BCF		PORTA,.0					
			CALL	_20E6
			BSF		PORTA,.0
			MOVF	DIS2,W
			CALL	SIETESEGK
			MOVWF	PORTD
			BCF		PORTA,.1
			CALL	_20E6
			BSF		PORTA,.1
			MOVF	DIS3,W
			CALL	SIETESEGK
			MOVWF	PORTD
			BCF		PORTA,.2				
			CALL	_20E6
			BSF		PORTA,.2
			MOVF	DIS4,W
			CALL	SIETESEGK
			MOVWF	PORTD
			BCF		PORTA,.3
			CALL	_20E6
			BSF		PORTA,.3
			MOVF	DIS5,W
			CALL	SIETESEGK
			MOVWF	PORTD
			BCF		PORTA,.4				
			CALL	_20E6
			BSF		PORTA,.4
			MOVF	DIS6,W
			CALL	SIETESEGK
			MOVWF	PORTD
			BCF		PORTA,.5
			CALL	_20E6
			BSF		PORTA,.5
			RETURN
			
ASC_DES		MOVLW	0X00		;ASCENDENTE
			BTFSC	PORTB,.7
			MOVLW	0X01		;DESCENDENTE
			MOVWF	0X30		;REGISTRO INDICADOR
			CALL	REBOTE
			BTFSC	PORTB,.7
			GOTO	$-1
			CALL	REBOTE
			RETURN

BOTONES		MOVF	PORTB,W
			ANDLW	0XC0
			BTFSC	STATUS,Z
			RETURN
			CALL	REBOTE
			BTFSC	PORTB,.6
			BSF		0X31,.6
			BTFSC	PORTB,.7
			BSF		0X31,.7
			MOVF	PORTB,W
			ANDLW	0XC0
			BTFSS	STATUS,Z
			GOTO	$-3
			CALL	REBOTE	
			RETURN	

REBOTE:		MOVLW		.142
			MOVWF		0X61
			MOVLW		.58
			MOVWF		0X62
			CALL		ST2V
			RETURN

_20E6		MOVLW	.102		;1648-1653		(1650)
			MOVWF	0X61
			MOVLW	.2
			MOVWF	0X62
			CALL	ST2V
			NOP
			NOP
			NOP
				nop
				nop
				NOP
				NOP
				NOP
			RETURN
			END