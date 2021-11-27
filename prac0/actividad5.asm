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
;*		PROGRAMA:Ejemplo de uso de MPLAB actividad5			*
;*		PARA: MICROCONTROLADOR PIC16F887					*
;*		ENSAMBLADO EN: MPLAB For Windows					*
;************************************************************
			PROCESSOR 16F887
			INCLUDE <P16F887.inc>
			__CONFIG 0X2007,0X2BE2
			__CONFIG 0X2008,0X3FFF
			ANDLITERAL	 EQU 	0X20	;ANDLW
			ANDREGISTRO	 EQU 	0X21	;ANDWF
			XORLITERAL	 EQU 	0X22	;XORLW
			XORREGISTRO	 EQU 	0X23	;XORWF
			ORLITERAL	 EQU 	0X24	;IORLW
			ORREGISTRO	 EQU 	0X25	;IORWF
;******************************************************************7
;			INICIO DEL PROGRAMA
;******************************************************************
			ORG 0X00
;******************************************************************
;ANDLW Y ANDWF
;******************************************************************
			MOVLW 0X0F
			MOVWF ANDREGISTRO
			MOVLW 0XF0
			ANDWF ANDREGISTRO,F

			MOVLW 0XFF
			ANDLW 0X0F
			MOVWF ANDLITERAL
;******************************************************************
;XORLW Y XORWF
;******************************************************************
			MOVLW 0X0F
			MOVWF XORREGISTRO
			MOVLW 0XF0
			XORWF XORREGISTRO,F

			MOVLW 0X0F
			XORLW 0XF0
			MOVWF XORLITERAL
;******************************************************************
;IORLW Y IORWF
;******************************************************************
			MOVLW 0XF0
			MOVWF ORREGISTRO
			MOVLW 0X0F
			IORWF ORREGISTRO,F

			MOVLW 0XF0
			IORLW 0X0F
			MOVWF ORLITERAL

			END