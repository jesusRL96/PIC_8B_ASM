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
			RESTA1 EQU 0X20
			RESTA2 EQU 0X21
			RESTA3 EQU 0X22
			RESTA4 EQU 0X23
			RESTA5 EQU 0X24
			RESTA6 EQU 0X25
;******************************************************************
;			INICIO DEL PROGRAMA
;******************************************************************
			ORG 0X00
;******************************************************************
;SUBWF
;******************************************************************
INICIO:		MOVLW 0X01
			MOVWF RESTA1
			MOVLW 0X02
			SUBWF RESTA1,W
			SUBLW 0X00
			MOVWF RESTA1

			MOVLW 0X40
			MOVWF RESTA2
			MOVLW 0X50
			SUBWF RESTA2,W
			SUBLW 0X00
			MOVWF RESTA2

			MOVLW 0X30
			MOVWF RESTA3
			MOVLW 0X35
			SUBWF RESTA3,W
			SUBLW 0X00
			MOVWF RESTA3
;******************************************************************
;SUBLW
;******************************************************************
			MOVLW 0X03
			SUBLW 0X02
			SUBLW 0X00
			MOVWF RESTA4

			MOVLW 0X70
			SUBLW 0X50
			SUBLW 0X00
			MOVWF RESTA5

			MOVLW 0X30
			SUBLW 0X20
			SUBLW 0X00
			MOVWF RESTA6
			GOTO INICIO
			END