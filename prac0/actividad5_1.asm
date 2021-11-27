;************************************************************
;*				INSTITUTO POLITECNICO NACIONAL				*
;*			Unidad Profesional Interdisciplinara De 		*
;*			  Ingenieria Y Tecnologías Avanzadas			*
;*															*
;*															*
;*			Programacion De Sistemas En Tiempo Real			*
;*															*
;*		Fecha: 13 de marzo del 2018							*	
;*															*
;*		Ramírez López Jesús Alberto							*
;*		Zoza Tejeda Nicole Denisse							*
;*		Becerril Ortega Saul								*
;*															*
;*		PROGRAMA:Ejemplo de uso de MPLAB actividad2			*
;*		PARA: MICROCONTROLADOR PIC16F887					*
;*		ENSAMBLADO EN: MPLAB For Windows					*
;************************************************************
			PROCESSOR 16F887
			INCLUDE <P16F887.inc>
			__CONFIG 0X2007,0X2BE2
			__CONFIG 0X2008,0X3FFF
			VALOR1		EQU 	0X05
			VALOR2		EQU 	0XFC
			REGISTRO	EQU		0X20
			REGISTRO2	EQU		0X21

;******************************************************************
;			INICIO DEL PROGRAMA
;******************************************************************
			ORG 	0X00
;******************************************************************
;SWAPF,DECF,DECFSZ,INCF Y INCFSZ
;******************************************************************	
			CLRF	PORTC
			CLRF	PORTB			
			BSF 	STATUS,RP0
			CLRF 	TRISB
			CLRF 	TRISC	
			BSF 	STATUS,RP1
			CLRF 	ANSEL
			CLRF 	ANSELH
			BCF 	STATUS,RP1		
			BCF 	STATUS,RP0
			MOVLW 	VALOR1
			MOVWF 	REGISTRO
			CLRF 	REGISTRO2
INICIO1:	INCF 	REGISTRO2,F
			MOVF 	REGISTRO2,W
			MOVWF 	PORTB
			DECFSZ 	REGISTRO,F
			GOTO 	INICIO1
			MOVLW 	VALOR2
			MOVWF 	REGISTRO
INICIO2:	DECF 	PORTB,F
			INCFSZ 	REGISTRO,F
			GOTO 	INICIO2
			SWAPF 	PORTB,W
			MOVWF 	PORTC
			GOTO	$-1
			END