;************************************************************
;*				INSTITUTO POLITECNICO NACIONAL				*
;*			Unidad Profesional Interdisciplinara De 		*
;*			  Ingenieria Y Tecnologías Avanzadas			*
;*															*
;*															*
;*			Programacion De Sistemas En Tiempo Real			*
;*															*
;*		Fecha: 29 de marzo del 2018							*	
;*															*
;*		Ramírez López Jesús Alberto							*
;*		Zoza Tejeda Nicole Denisse							*
;*		Becerril Ortega Saul								*
;*															*
;*		PROGRAMA:division de dos puertos					*
;*		PARA: MICROCONTROLADOR PIC16F887					*
;*		ENSAMBLADO EN: MPLAB For Windows					*
;************************************************************
			PROCESSOR 16F887
			INCLUDE <P16F887.inc>
			__CONFIG 0X2007,0X2BE2
			__CONFIG 0X2008,0X3FFF

			DATO1		EQU	0X21
			DATO2		EQU	0X22
			CONTADOR	EQU	0X23	
			RESULTADOM	EQU	0X24	
;******************************************************************
;			CONFIGURACION DE PUERTOS
;PORTA->NUMERADOR		PORTB->DENOMINADOR		
;PORTC->SALIDA1			PORTD->SALIDA2
;******************************************************************
			ORG 	0X00
			CLRF	PORTA
			CLRF	PORTB
			CLRF	PORTC
			CLRF	PORTD	
			BSF		STATUS,RP0	;BANCO1
			CLRF	TRISC
			BCF		TRISB,D'7'
			BSF		STATUS,RP1	;BANCO3
			CLRF	ANSEL
			CLRF	ANSELH	
			BCF		STATUS,RP1
			BCF		STATUS,RP0	;BANCO0

			BTFSS	PORTB,D'0'
			GOTO	$-1
			MOVF	PORTD,W
			MOVWF	PORTC
			MOVWF	DATO1		;INGRESO DEL PRIMER DATO
			BTFSC	PORTB,D'0'
			GOTO	$-1

			CLRW
			MOVF	PORTB,W
			ANDLW	B'00001110'
			BTFSC	STATUS,Z
			GOTO	$-4
			MOVF	PORTD,W
			MOVWF	DATO2		;DATO2
			
MENU:		BTFSC	PORTB,D'1'
			GOTO	INICIOS		;INICIO SUMA
			BTFSC	PORTB,D'2'
			GOTO	INICIOR		;INICIO RESTA
			BTFSC	PORTB,D'3'
			GOTO	INICIOM		;INICIO MULTIPLICACION
			GOTO	MENU	
;******************************************************************
;			INICIO DE DIVISION
;******************************************************************
INICIOD:	CLRF	CONTADOR
			MOVF	DATO2,F
			BTFSC	STATUS,Z
			GOTO	INDETER
			MOVF	DATO1,F
			BTFSC	STATUS,Z
			GOTO	CERO

RESTA:		MOVF	DATO2,W		;RAM1<RAM2
			SUBWF	DATO1,F

			BTFSS	STATUS,C
			GOTO	RESULTADO
			BTFSC	STATUS,Z
			GOTO	RESULTADO
			INCF	CONTADOR
			GOTO	RESTA

INDETER:	MOVLW	D'255'
			MOVWF	PORTC	
			BSF		PORTB,7
			SLEEP
	
CERO:		MOVLW	D'000'
			MOVWF	PORTC	
			BCF		PORTB,D'7'
			SLEEP

RESULTADO:	BCF		PORTB,D'7'
			BTFSS	STATUS,Z
			BSF		PORTB,D'7'
			BTFSC	STATUS,Z
			INCF	CONTADOR

			MOVF	CONTADOR,W
			MOVWF	PORTC

			SLEEP
;******************************************************************
;			INICIO DE SUMA
;******************************************************************
INICIOS:	MOVF	DATO1,W
			ADDWF	DATO2,W
			MOVWF	PORTC
			BCF		PORTB,D'7'
			BTFSC	STATUS,C
			BSF		PORTB,D'7'
			BTFSS	PORTB,D'0'
			GOTO	$-1
			GOTO	INICIOD
;******************************************************************
;			INICIO DE RESTA
;******************************************************************
INICIOR:	MOVF	DATO2,W
			SUBWF	DATO1,W
			BTFSS	STATUS,C
			GOTO	NEGATIVO
			MOVWF	PORTC
			BCF		PORTB,D'7'
			GOTO	FINR
NEGATIVO:	SUBLW	0x00
			MOVWF	PORTC
			BSF		PORTB,D'7'
		
FINR:		BTFSS	PORTB,D'0'
			GOTO	$-1
			GOTO	INICIOD
;******************************************************************
;			INICIO DE MULTIPLICACION
;******************************************************************
INICIOM:	CLRF	RESULTADOM
			BCF		PORTB,D'7'
			MOVF	DATO1,W
			BTFSC	STATUS,Z
			GOTO 	RESULTM
			MOVF	DATO2,W
			BTFSC	STATUS,Z
			GOTO 	RESULTM

SUMA1:		MOVF	DATO1,W
			ADDWF	RESULTADOM,F
			BTFSC	STATUS,C
			BSF		PORTB,D'7'
			DECFSZ	DATO2,F
			GOTO 	SUMA1
			
RESULTM:	MOVF	RESULTADOM,W
			MOVWF	PORTC				
			BTFSS	PORTB,D'0'
			GOTO	$-1
			GOTO	INICIOD

			END