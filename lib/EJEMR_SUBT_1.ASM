
				PROCESSOR   16F887
                __CONFIG    0X2007,0X23E4
				__CONFIG	0X2008,0X3FFF
                INCLUDE     <P16F887.INC>
				ORG			0X0000
				CLRF		PORTC
				INCLUDE     <C:\C�DIGOS 2MM8\ini_osc_PD.asm>;B1.
				CLRF		TRISC
				BCF			STATUS,RP0
				BSF			PORTC,0
DENUEVO			CALL		ST100MS
				CALL		ST100MS
				CALL		ST100MS
				CALL		ST100MS
				RLF			PORTC,F
				GOTO		DENUEVO

ST100MS			MOVLW		.105
				MOVWF		0X61
				MOVLW		.158
				MOVWF		0X62
                CALL        ST2V
				MOVLW		.4
				MOVWF		0X60
				CALL		ST1V
				RETURN

				INCLUDE     <C:\C�DIGOS 2MM8\SUBS_TIEMPO.ASM>

				END	
