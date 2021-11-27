;************************************************************
;*				INSTITUTO POLITECNICO NACIONAL				*
;*			Unidad Profesional Interdisciplinara De 		*
;*			  Ingenieria Y Tecnologías Avanzadas			*
;*															*
;*															*
;*			Programacion De Sistemas En Tiempo Real			*
;*															*
;*		Fecha: 13 de abril del 2018							*	
;*															*
;*		Ramírez López Jesús Alberto							*
;*		Zoza Tejeda Nicole Denisse							*
;*		Becerril Ortega Saul								*
;*															*
;*		PROGRAMA:OPERACIONES DE DOS PUERTOS Y CONTROL DE 	*
;*						POSICION DE UN SERVO				*
;*		PARA: MICROCONTROLADOR PIC16F887					*
;*		ENSAMBLADO EN: MPLAB For Windows					*
;************************************************************
			PROCESSOR 16F887
			INCLUDE <P16F887.inc>
			__CONFIG 0X2007,0X2BE2
			__CONFIG 0X2008,0X3FFF

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
			BCF		TRISB,.4	;SALIDA PARA SERVO
			BCF		TRISB,.7	;SALIDA ACARREO
			BSF		STATUS,RP1	;BANCO3
			CLRF	ANSEL
			CLRF	ANSELH	
			BCF		STATUS,RP1
			BCF		STATUS,RP0	;BANCO0

;******************CODIGO PRINCIPAL*********************************
			MOVF	PORTB,W
			ANDLW	0X0F
			BTFSC	STATUS,Z
			GOTO	$-3
			CALL 	REBOTE
			BTFSC	PORTB,.1
			GOTO	ANGULO45
			BTFSC	PORTB,.2
			GOTO	ANGULO90
			BTFSC	PORTB,.3
			GOTO	ANGULO135
			;GUARDAR DATOS (el presionado fue el portb.0) 
			BTFSC	PORTB,.0
			GOTO	$-1
			CALL 	REBOTE
			MOVF	PORTD,W
			MOVWF	0X21
			CALL	BOTONRB0
			MOVF	PORTD,W
			MOVWF	0X22
			;OPERACIONES
			CALL	BOTONRB0
			CALL	LUCES
			CALL 	SUMA
			CALL	BOTONRB0
			CALL	LUCES
			CALL 	RESTA
			CALL	BOTONRB0
			CALL	LUCES
			CALL 	MULTIPLIC
			CALL	BOTONRB0
			CALL	LUCES
			CALL 	DIVISION
			;SUBRUTINA DE 3 VARIABLES
			CALL	BOTONRB0
			MOVF	PORTD,W
			MOVWF	0X64
			CALL	BOTONRB0
			MOVF	PORTD,W
			MOVWF	0X65
			CALL	BOTONRB0
			MOVF	PORTD,W
			MOVWF	0X66
			CALL	ST3V
				
;***************SUBRUTINAS*************************			
;***************OPERACIONES*************************
SUMA:		MOVF	0X21,W
			ADDWF	0X22,W
			MOVWF	0X23
			BTFSC	STATUS,C
			CALL	PARPADEO
			MOVF	0X23,W
			MOVWF	PORTC
			RETURN
		
RESTA:		MOVF	0x22,W
			SUBWF	0x21,W
			MOVWF	0X24
			BTFSS	STATUS,C
			CALL	PARPADEO
			MOVF	0X24,W
			BTFSC	PORTB,.7
			SUBLW	0X00
			MOVWF	PORTC
			RETURN
			
MULTIPLIC:	CLRF	PORTC
			CLRF	0X25		;RESULTADO DE MULTIPLICACION
			CLRF	0X29		;VERIFICAR ACARREO
			MOVF	0X21,W
			BTFSC	STATUS,Z
			RETURN
			MOVF	0X22,W
			BTFSC	STATUS,Z
			RETURN

			MOVF	0X21,W
			ADDWF	0X25,F
			BTFSC	STATUS,C
			BSF		0X29,.0	
			DECFSZ	0X22,F
			GOTO 	$-5
			
			BTFSC	0X29,.0
			CALL	PARPADEO			
			MOVF	0X25,W
			MOVWF	PORTC				
			RETURN

DIVISION:	CLRF	PORTC
			CLRF	0X29		;CONTADOR
			MOVF	0X22,F
			BTFSC	STATUS,Z
			CALL	PARPADEO
			BTFSS	PORTB,.7
			GOTO	$+4
			MOVLW	0XFF
			MOVWF	PORTC
			RETURN

			MOVF	0X21,F
			BTFSC	STATUS,Z
			RETURN

			MOVF	0X22,W		
			SUBWF	0X21,F
			BTFSS	STATUS,C
			GOTO	$+6
			INCF	0X23
			MOVF	0X21
			BTFSC	STATUS,Z
			GOTO	$-7

			GOTO	$+3
			BTFSC	STATUS,Z
			BSF		PORTB,.7
			MOVF	0X23,W
			MOVWF	PORTC
			RETURN			

		
;************************POSICIONES DE SERVO*****************
ANGULO45:	BTFSC	PORTB,.1
			GOTO 	$-1	
			CALL 	REBOTE
			BSF		PORTB,.4
			CALL 	TIEMPOA_45
			BCF		PORTB,.4
			CALL 	TIEMPOB_45
			GOTO	$-4

ANGULO90:	BTFSC	PORTB,.2
			GOTO 	$-1	
			CALL	REBOTE
			BSF		PORTB,.4
			CALL 	TIEMPOA_90
			BCF		PORTB,.4
			CALL 	TIEMPOB_90
			GOTO	$-4

ANGULO135:	BTFSC	PORTB,.3
			GOTO 	$-1	
			CALL 	REBOTE
			BSF		PORTB,.4
			CALL 	TIEMPOA_135
			BCF		PORTB,.4
			CALL 	TIEMPOB_135
			GOTO	$-4

;*************SUBRUTINAS DE TIEMPO (PARA REBOTE Y SERVO)************
REBOTE:		MOVLW		.176
			MOVWF		0X61
			MOVLW		.23
			MOVWF		0X62
			CALL		ST2V
			RETURN
TIEMPOB_45:
			RETURN
TIEMPOA_45:	
			RETURN
TIEMPOB_90:
			RETURN
TIEMPOA_90:	
			RETURN
TIEMPOB_135:
			RETURN
TIEMPOA_135:	
			RETURN
;*********************SUBRUTINAS PUERTOC***************************
LUCES:		
			RETURN
PARPADEO:		
			BSF		PORTB,.7
			RETURN
;+++++++++++++++++EL BOTON RB0 SE OPRIMIO++++++++++++++++++++++++++
BOTONRB0:	BTFSS	PORTB,.0
			GOTO	$-1
			CALL	REBOTE
			BTFSC	PORTB,.0
			GOTO	$-1
			CALL	REBOTE
			BCF		PORTB,.7
			RETURN
;------------------------------------------------------------------
			INCLUDE     <C:\Users\Jesus\Documents\tareas\microcontroladores\lib\SUBS_TIEMPO.ASM>
			END