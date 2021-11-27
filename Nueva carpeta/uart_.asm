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

TX_DATO		 	BCF   		PIR1,TXIF  
		      	MOVWF   	TXREG      
		      	BSF   		STATUS,RP0
			   	BTFSS 		TXSTA,TRMT  
      			GOTO	   	$-1
      			BCF   		STATUS,RP0
      			RETURN

;******************************************************************************************

RSI      		BTFSS   	PIR1,RCIF   
				GOTO		INT2
INT1			CALL 		LCD_INI
		   	  	BCF  		PIR1,RCIF   
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

INICIO    	    CLRF 		PORTC      
			    CLRF   		PORTB
			    BSF   		STATUS,RP0  
			 	CLRF		TRISD
				MOVLW		0XF0
				MOVWF		TRISB
				MOVLW		0XFF		
			    MOVWF		IOCB	
			    MOVLW   	B'10110011'
			    MOVWF   	TRISC    
			    MOVLW   	B'11001111'
			    MOVWF   	OPTION_REG   
			    BCF			OPTION_REG,.7
				BSF			STATUS,RP1	
				CLRF		ANSEL
				CLRF		ANSELH	
				BCF			STATUS,RP1
				MOVLW   	b'00100100'   
				MOVWF   	TXSTA     
				MOVLW   	.25
				MOVWF   	SPBRG     
		
		        BSF   		PIE1,RCIE 
		        BCF   		STATUS,RP0 
		     		
		
			    MOVLW   	b'10010000'
			    MOVWF   	RCSTA     
			    BSF   		INTCON,PEIE   
			    MOVF		PORTB,W
				BCF			INTCON,RBIF	
				BSF			INTCON,RBIE
		     	BSF  		INTCON,GIE   
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