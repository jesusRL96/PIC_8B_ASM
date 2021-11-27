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
;*		PROGRAMA:Ejemplo de uso de MPLAB actividad1			*
;*		PARA: MICROCONTROLADOR PIC16F887					*
;*		ENSAMBLADO EN: MPLAB For Windows					*
;************************************************************
			PROCESSOR 16F887
			INCLUDE <P16F887.inc>
			__CONFIG 0X2007,0X2BE2
			__CONFIG 0X2008,0X3FFF

;***************************************************************
;			INICIO DEL PROGRAMA
;***************************************************************
			ORG 0X00
;***************************************************************
;configurar puertos mitad entrada, mitad salida y modificar sus 
;valores para obcervar los valores predeterminados
;***************************************************************
			BSF STATUS,RP0
			BSF STATUS,RP1
			CLRF ANSEL
			CLRF ANSELH
			BCF STATUS,RP1
			MOVLW 0XF0
			MOVWF TRISB
			MOVLW 0XF0
			MOVWF TRISC
			MOVLW 0XF0
			MOVWF TRISD
			BCF STATUS,RP0
			MOVLW 0XFF
			MOVWF PORTB
			MOVLW 0XAA
			MOVWF PORTC
			MOVLW 0X33
			MOVWF PORTD
;**************************************************************
			BSF STATUS,RP0
			BSF STATUS,RP1
			END