;************************************************************
;*				INSTITUTO POLITECNICO NACIONAL				*
;*			Unidad Profesional Interdisciplinara De 		*
;*			  Ingenieria Y Tecnologías Avanzadas			*
;*															*
;*															*
;*			Programacion De Sistemas En Tiempo Real			*
;*															*
;*		Fecha: 15 de abril del 2018							*	
;*															*
;*		Ramírez López Jesús Alberto							*
;*		Zoza Tejeda Nicole Denisse							*
;*		Becerril Ortega Saul								*
;*															*
;*		PROGRAMA:ODOMETRO									*
;*		PARA: MICROCONTROLADOR PIC16F887					*
;*		ENSAMBLADO EN: MPLAB For Windows					*
;************************************************************
			PROCESSOR 16F887
			INCLUDE <P16F887.inc>
			__CONFIG 0X2007,0X2BE2
			__CONFIG 0X2008,0X3FFF

;******************************************************************
;			CONFIGURACION DE PUERTOS
;******************************************************************
			ORG 	0X00
			CLRF	PORTA
			CLRF	PORTB
			CLRF	PORTC		
			CLRF	PORTD	
			BSF		STATUS,RP0	;BANCO1
			CLRF	TRISC
			BSF		STATUS,RP1	;BANCO3
			CLRF	ANSEL
			CLRF	ANSELH	
			BCF		STATUS,RP1
			BCF		STATUS,RP0	;BANCO0
;****************************************************************

			CLRF	PORTC
			CALL	BOTON_IN
RECARGAR:	MOVLW	.26			;COMPENSACION
			MOVWF	0x22
			MOVLW	.1			;NUMERO DE DETECCIONES QUE EQUIVALEN A 1METRO
			MOVWF	0x21
DETECCION:	CALL	APAGADO?
			MOVF	PORTB,W
			ANDLW	0X08		;SENSOR
			BTFSC	STATUS,Z
			GOTO	DETECCION
			CALL	APAGADO?
			CALL	REBOTE		;DETECCION
			MOVF	PORTB,W
			ANDLW	0X08
			BTFSS	STATUS,Z
			GOTO	$-3
			CALL	REBOTE
			DECFSZ	0x21,F
			GOTO	DETECCION

			INCF	PORTC			
			MOVLW	.1	
			MOVWF	0x21
			DECFSZ	0X22,F
			GOTO	DETECCION
				
			INCF	PORTC
			GOTO	RECARGAR

;****************************************************************

APAGADO?	BTFSS	PORTB,.2
			RETURN
			CALL	REBOTE
			BTFSC	PORTB,.2
			GOTO	$-1
			SLEEP

BOTON_IN	BTFSS	PORTB,.2
			GOTO	$-1
			CALL	REBOTE
			BTFSC	PORTB,.2
			GOTO	$-1
			CALL	REBOTE
			RETURN

REBOTE		MOVLW	.44
			MOVWF	0X64
			MOVLW	.15
			MOVWF	0X65
			MOVLW	.41
			MOVWF	0X66
			CALL	ST3V
			RETURN

			INCLUDE     <C:\Users\Jesus\Documents\tareas\microcontroladores\lib\SUBS_TIEMPO.ASM>
			END