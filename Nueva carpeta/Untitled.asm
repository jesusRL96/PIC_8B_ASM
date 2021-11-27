				PROCESSOR   16F887
				INCLUDE <P16F887.inc>
                __CONFIG    0X2007,0X2BE2
				__CONFIG	0X2008,0X3FFF
      			ORG			0X00
      			GOTO		INICIO
			    ORG			0X04
			    GOTO		RSI
				INCLUDE		<SUBS_TIEMPO.ASM>
;********************************************************************************************
;Tx_Dato: Transmite v�a serie el dato presente en el reg. W

TX_DATO		 	BCF   		PIR1,TXIF   ;Restaura el flag del transmisor
		      	MOVWF   	TXREG      ;Almacena el byte a transmitir
		      	BSF   		STATUS,RP0
TX_DATO_ES   	BTFSS 		TXSTA,TRMT   ;Byte transmitido ??
      			GOTO	   	TX_DATO_ES   ;No, esperar
      			BCF   		STATUS,RP0
      			RETURN

;******************************************************************************************
;Tratamiento de la interrupci�n

RSI      		BTFSS   	PIR1,RCIF   ;Ha sido interrupci�n en la recepci�n ??
				GOTO		INT2
INT1			CALL 		LCD_INI
		   	  	BCF  		PIR1,RCIF   ;Si, restaurar el flag de interrupci�n
	;	      	movf   RCREG,W      ;Lee el dato recibido
	;	      	movwf   PORTB      ;Lo saca por la puerta B
	;	      	call   Tx_Dato      ;Lo retransmite a modo de eco
				MOVF 		RCREG,W
				MOVWF		PORTD
				CALL  		MANDAR
		      	RETFIE

INT2 			CALL		T25MS
				CLRF		0X40
				MOVF		PORTB,W

FUEF0			BTFSC		PORTB,4	;FILAS	
				GOTO		FUEF1
				MOVLW		.12
				GOTO		FINF			

FUEF1			BTFSC		PORTB,5	
				GOTO		FUEF2
				MOVLW		.8
				GOTO		FINF				

FUEF2			BTFSC		PORTB,6
				GOTO		FUEF3
				MOVLW		.4
				GOTO		FINF			

FUEF3			MOVLW		.0

FINF			MOVWF		0X40			
				CLRF		PORTB
				BSF			STATUS,RP0	;B1	
				MOVLW		0X0F
				MOVWF		TRISB
				MOVLW		0XFF
				MOVWF		WPUB
				BCF			STATUS,RP0	;B0
				CLRF		PORTB				
				BCF			OPTION_REG,.7

FUEC1			BTFSC		PORTB,1	;COLUMNAS
				GOTO		FUEC2
				MOVLW		.2
				GOTO		FINC			

FUEC2			BTFSC		PORTB,2	
				GOTO		FUEC3
				MOVLW		.1
				GOTO		FINC			

FUEC3			BTFSC		PORTB,3	
				GOTO		FUEC4
				MOVLW		.0
				GOTO		FINC			

FUEC4			MOVLW		.3


FINC			ADDWF		0X40,F
				MOVF		0X40,W
				CALL   		TX_DATO 

				MOVF		PORTB,W
				XORLW		0X0F
				BTFSS		STATUS,Z
				GOTO		$-3
				CALL		T25MS

				BSF			STATUS,RP0	;B1
				MOVLW		0XF0
				MOVWF		TRISB
				BCF			STATUS,RP0	;B0
				BCF			OPTION_REG,.7
				MOVF		PORTB,W
				BCF			INTCON,RBIF
				RETFIE
;*******************************************************************************************
;Programa principal

INICIO    	    CLRF 		PORTC      
			    CLRF   		PORTB
			    BSF   		STATUS,RP0   ;Selecciona banco 1
			 	CLRF		TRISD
				MOVLW		0XF0
				MOVWF		TRISB
				MOVLW		0XFF		
			    MOVWF		IOCB		;TODOS LOS PINES INT_ON_CHANGE	
			    MOVLW   	B'10110011'
			    MOVWF   	TRISC      ;RC7/Rx entrada, RC6/Tx salida
			    MOVLW   	B'11001111'
			    MOVWF   	OPTION_REG   ;Preescaler de 128 asociado al WDT
			    BCF			OPTION_REG,.7
				BSF			STATUS,RP1	;BANCO3
				CLRF		ANSEL
				CLRF		ANSELH	
				BCF			STATUS,RP1
				MOVLW   	b'00100100'   
				MOVWF   	TXSTA      ;TX en On, modo as�ncrono con 8 bits y alta velocidad
				MOVLW   	.25
				MOVWF   	SPBRG      ;9600 baudios con Fosc=4MHz
		
		        BSF   		PIE1,RCIE   ;Habilita interrupci�n en la recepci�n
		        BCF   		STATUS,RP0   ;Selecciona banco 0
		     		
		
			    MOVLW   	b'10010000'
			    MOVWF   	RCSTA      ;USART en On, recepci�n cont�nua
			    BSF   		INTCON,PEIE   ;Activa interrupci�n de perif�ricos
			    MOVF		PORTB,W
				BCF			INTCON,RBIF	
				BSF			INTCON,RBIE
		     	BSF  		INTCON,GIE   ;Activa interrupciones
		  		CALL 		LCD_INI
		
				GOTO		$

LCD_INI			BCF			PORTC,.2
				MOVLW		0X01
				MOVWF		PORTD
				CALL		EJECUTA
				MOVLW		0X0C
				MOVWF		PORTD
				CALL		EJECUTA
				MOVLW		0X3C
				MOVWF		PORTD
				CALL		EJECUTA
				BSF			PORTC,.2
				RETURN
	
EJECUTA			BSF			PORTC,.3
				CALL		TIEMPO
				CALL		TIEMPO
				BCF			PORTC,.3
				CALL		TIEMPO
				RETURN
	
MANDAR			BSF			PORTC,.2
				CALL		EJECUTA
				RETURN
	
NEXT			BCF			PORTC,.2
				MOVLW		0XC0
				MOVWF		PORTD
				CALL		EJECUTA
				RETURN
	
TIEMPO			MOVLW		.10	
				MOVWF		0X61
				MOVLW		.10
				MOVWF		0X62
				CALL		ST2V
				RETURN
T25MS			MOVLW		.44
				MOVWF		0X61
				MOVLW		.94
				MOVWF		0X62
				CALL		ST2V
				RETURN
     			END 