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
;*		PROGRAMA:Ejemplo de uso de MPLAB					*
;*		PARA: MICROCONTROLADOR PIC16F887					*
;*		ENSAMBLADO EN: MPLAB For Windows					*
;************************************************************
			PROCESSOR 16F877
			INCLUDE <P16F877.inc>
			__CONFIG 0X3F71
			CBLOCK 0X20
				R_SUMA
			ENDC
;***************************************************************
;			INICIO DEL PROGRAMA
;***************************************************************
			ORG 0X00
			GOTO 0X05
			ORG 0X05
;***************************************************************
;hace la suma de 0xFF + 0x01 y el resultado lo guarda en r_suma
;***************************************************************
			MOVLW 0XFF
			ADDLW 0X01
			MOVWF R_SUMA
SINFIN:		GOTO SINFIN
			END