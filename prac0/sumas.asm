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
			SUMA1 EQU 0X20
			SUMA2 EQU 0X21
			SUMA3 EQU 0X22
			SUMA4 EQU 0X23
;******************************************************************
;			INICIO DEL PROGRAMA
;******************************************************************
			ORG 0X00
;******************************************************************
;suma cuando no hay acarreo ni acarreo medio y el resultado es cero
;******************************************************************
INICIO:		MOVLW 0X00
			ADDLW 0X00
			MOVWF SUMA1
;******************************************************************
;suma cuando hay acarreo medio y no hay acarreo
;******************************************************************
			MOVLW 0X0F
			MOVWF SUMA2
			MOVLW 0X01
			ADDWF SUMA2,F
;******************************************************************
;suma cuando hay acarreo medio y acarreo
;******************************************************************
			MOVLW 0XFF
			MOVWF SUMA3
			MOVLW 0X02
			ADDWF SUMA3,F
;******************************************************************
;suma cuando hay acarreo y el resultado es cero
;******************************************************************
			MOVLW 0X01
			ADDLW 0XFF
			MOVWF SUMA4
			NOP
			GOTO INICIO
			END