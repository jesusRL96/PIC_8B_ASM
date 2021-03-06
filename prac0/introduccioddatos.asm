;************************************************************
;*				INSTITUTO POLITECNICO NACIONAL				*
;*			Unidad Profesional Interdisciplinara De 		*
;*			  Ingenieria Y Tecnolog?as Avanzadas			*
;*															*
;*															*
;*			Programacion De Sistemas En Tiempo Real			*
;*															*
;*		Fecha: 13 de marzo del 2018							*	
;*															*
;*		Ram?rez L?pez Jes?s Alberto							*
;*		Zoza Tejeda Nicole Denisse							*
;*		Becerril Ortega Saul								*
;*															*
;*		PROGRAMA:Ejemplo de uso de MPLAB					*
;*		PARA: MICROCONTROLADOR PIC16F887					*
;*		ENSAMBLADO EN: MPLAB For Windows					*
;************************************************************
			PROCESSOR	 16F887
			INCLUDE 	<P16F887.inc>
			__CONFIG 	0X2007,0X2BE2
			__CONFIG	0X2008,0X3FFF
;***************************************************************
;			INICIO DEL PROGRAMA
;***************************************************************
			BSF 	STATUS,RP0
			BSF 	STATUS,RP1
			CLRF 	ANSEL
			CLRF 	ANSELH
			BCF 	STATUS,RP1		
			CLRF	TRISB
			BCF 	STATUS,RP0
CHECA:		BTFSS 	PORTC,0
			MOVLW 	0XAA
			BTFSC	PORTC,0
			MOVLW 	0X55
			MOVWF 	PORTB
			GOTO 	CHECA
			END