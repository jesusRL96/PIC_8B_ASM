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
			ORG 0X00
;******************************************************************
;realiza un corrimiento a la izquierda a portb y uno a la derecha a 
;portc, luego realiza la operacion logica or y lo guarda en pord
;******************************************************************			CLRF PORTB
			BSF 	STATUS,RP0
			CLRF 	TRISB
			CLRF 	TRISC	
			CLRF 	TRISD
			BSF 	STATUS,RP1
			CLRF 	ANSEL
			CLRF 	ANSELH
			BCF 	STATUS,RP1		
			BCF 	STATUS,RP0
			CLRF 	PORTB
			CLRF 	PORTC
			CLRF 	PORTD
			BSF 	PORTB,0
			BSF 	PORTC,7
INICIO:		RLF 	PORTB,F
			RRF 	PORTC,F
			MOVF 	PORTC,W
			IORWF 	PORTB,W
			MOVWF 	PORTD
			GOTO	INICIO
			END