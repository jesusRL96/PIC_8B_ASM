			PROCESSOR   16F887
	        __CONFIG    0X2007,0X2BE2
			__CONFIG	0X2008,0X3FFF
	        INCLUDE     <P16F887.INC>
			ORG			0X0000
    		GOTO		INICIO
			INCLUDE     <SUBS_TIEMPO.ASM>
INICIO		BSF			STATUS,RP0
			CLRF		TRISB
			CLRF		TRISC
			BSF			STATUS,RP1
			CLRF		ANSEL
			CLRF		ANSELH
			BCF			STATUS,RP0
			BCF			STATUS,RP1
LCD			CALL		LCD_INI
			CALL		TEXTO_F1
			CALL		NEXT
			CALL		TEXTO_F2
			GOTO		$
;**************************************
LCD_INI		BCF			PORTC,.0
			MOVLW		0X01
			MOVWF		PORTB
			CALL		EJECUTA
			MOVLW		0X0C
			MOVWF		PORTB
			CALL		EJECUTA
			MOVLW		0X3C
			MOVWF		PORTB
			CALL		EJECUTA
			BSF			PORTC,.0
			RETURN

EJECUTA		BSF			PORTC,.1
			CALL		TIEMPO
			CALL		TIEMPO
			BCF			PORTC,.1
			CALL		TIEMPO
			RETURN

MANDAR		BSF			PORTC,.0
			CALL		EJECUTA
			RETURN

NEXT		BCF			PORTC,.0
			MOVLW		0XC0
			MOVWF		PORTB
			CALL		EJECUTA
			RETURN
;++++++++++++++++++++++++++++++++++++++
TEXTO_F1	MOVLW		'J'
			MOVWF		PORTB
			CALL		MANDAR
			MOVLW		'E'
			MOVWF		PORTB
			CALL		MANDAR
			MOVLW		'S'
			MOVWF		PORTB
			CALL		MANDAR
			MOVLW		'U'
			MOVWF		PORTB
			CALL		MANDAR
			MOVLW		'S'
			MOVWF		PORTB
			CALL		MANDAR
			RETURN

TEXTO_F2	MOVLW		'A'
			MOVWF		PORTB
			CALL		MANDAR
			MOVLW		'L'
			MOVWF		PORTB
			CALL		MANDAR
			MOVLW		'B'
			MOVWF		PORTB
			CALL		MANDAR
			MOVLW		'E'
			MOVWF		PORTB
			CALL		MANDAR
			MOVLW		'R'
			MOVWF		PORTB
			CALL		MANDAR
			MOVLW		'T'
			MOVWF		PORTB
			CALL		MANDAR
			MOVLW		'O'
			MOVWF		PORTB
			CALL		MANDAR
			RETURN

TIEMPO		MOVLW		.10	
			MOVWF		0X61
			MOVLW		.10
			MOVWF		0X62
			CALL		ST2V
			RETURN

			END