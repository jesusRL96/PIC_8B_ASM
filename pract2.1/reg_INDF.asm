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
;*		PROGRAMA:TAREA INDF									*
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
			MOVLW	0X01
			MOVWF	0XF0
			MOVLW	0X20
			MOVWF	FSR
			
INICIO1		MOVF	0XF0,W
			MOVWF	INDF
			INCF	FSR,F
			INCF	0XF0,F
			MOVF	FSR,W
			SUBLW	0X70
			BTFSS	STATUS,Z
			GOTO	INICIO1
	
			MOVLW	0XA0
			MOVWF	FSR			
INICIO2		MOVF	0XF0,W
			MOVWF	INDF
			INCF	FSR,F
			INCF	0XF0,F
			MOVF	FSR,W
			SUBLW	0XF0
			BTFSS	STATUS,Z
			GOTO	INICIO2
	
			BSF		STATUS,IRP
			MOVLW	0X10
			MOVWF	FSR			
INICIO3		MOVF	0XF0,W
			MOVWF	INDF
			INCF	FSR,F
			INCF	0XF0,F
			MOVF	FSR,W
			SUBLW	0X70
			BTFSS	STATUS,Z
			GOTO	INICIO3

			BSF		STATUS,IRP
			MOVLW	0X90
			MOVWF	FSR			
INICIO4		MOVF	0XF0,W
			MOVWF	INDF
			INCF	FSR,F
			INCF	0XF0,F
			MOVF	FSR,W
			SUBLW	0XF0
			BTFSS	STATUS,Z
			GOTO	INICIO4
			SLEEP
			END
			
			
			