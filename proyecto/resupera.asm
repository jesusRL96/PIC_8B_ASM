			MOVF		PC_R,W
			MOVWF		PCLATH
			SWAPF		ST_R,W
			MOVWF		STATUS
			SWAPF		W_R,F
			SWAPF		W_R,W
			RETFIE