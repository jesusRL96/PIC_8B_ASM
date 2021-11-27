
				PROCESSOR   16F887
                __CONFIG    0X2007,0X23E4
				__CONFIG	0X2008,0X3FFF
                INCLUDE     <P16F887.INC>
				ORG			0X0000
				MOVLW		.105
				MOVWF		0X61
				MOVLW		.158
				MOVWF		0X62
                CALL        ST2V
				MOVLW		.4
				MOVWF		0X60
				CALL		ST1V
				NOP
				NOP
				NOP
				NOP
				ADDLW		0X00
				GOTO		0X0000
				INCLUDE     <C:\CÓDIGOS 2MM8\SUBS_TIEMPO.ASM>

				END	
