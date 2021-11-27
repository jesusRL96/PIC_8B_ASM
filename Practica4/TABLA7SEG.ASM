SIETESEG		ADDWF		PCL,F
				RETLW		0XC0
				RETLW		0XF9
				RETLW		0XA4
				RETLW		0XB0
				RETLW		0X99
				RETLW		0X92
				RETLW		0X82
				RETLW		0XF8
				RETLW		0X80
				RETLW		0X98
				RETLW		0X88
				RETLW		0X83
				RETLW		0XC6
				RETLW		0XA1
				RETLW		0X86
				RETLW		0X8E
SIETESEGK		ADDWF		PCL,F
				RETLW		0X3F
				RETLW		0X06
				RETLW		0X5B
				RETLW		0X4F
				RETLW		0X66
				RETLW		0X6D
				RETLW		0X7D
				RETLW		0X07
				RETLW		0X7F
				RETLW		0X6F
				RETLW		0X77
				RETLW		0X7C
				RETLW		0X39
				RETLW		0X5E
				RETLW		0X79
				RETLW		0X71

;++++++++++++++++++++++++++++++++++++++++++++++++
TABLADO			ADDWF		PCL,F
				RETLW		.138 	;SEGUNDA
				RETLW		.197	;TERCERA	
				RETLW		.242	;CUARTA
				RETLW		.242	;QUINTA

TABLADOPS		ADDWF		PCL,F
				RETLW		0X55
				RETLW		0X55
				RETLW		0X56
				RETLW		0X55

TABLADONOPS		ADDWF		PCL,F
				RETLW		.16
				RETLW		.4
				RETLW		.31
				RETLW		.13
;+++++++++++++++++++++++++++++++++++++++++++++++++


;+++++++++++++++++++++++++++++++++++++++++++++++++
TABLADO#		ADDWF		PCL,F
				RETLW		.200
				RETLW		.229
				RETLW		.243
				RETLW		.250

TABLADOPS#		ADDWF		PCL,F
				RETLW		0X56
				RETLW		0X56
				RETLW		0X56
				RETLW		0X56

TABLADO#NOPS	ADDWF		PCL,F
				RETLW		.4
				RETLW		.43
				RETLW		.38
				RETLW		.37
;+++++++++++++++++++++++++++++++++++++++++++++++++

TABLARE			ADDWF		PCL,F
				RETLW		.204
				RETLW		.230
				RETLW		.243
				RETLW		.250

TABLAREPS		ADDWF		PCL,F
				RETLW		0X56
				RETLW		0X56
				RETLW		0X56
				RETLW		0X56

TABLARENOPS		ADDWF		PCL,F
				RETLW		.40
				RETLW		.16
				RETLW		.5
				RETLW		.20
;++++++++++++++++++++++++++++++++++++++++++++++++++

TABLARE#		ADDWF		PCL,F
				RETLW		.207
				RETLW		.232
				RETLW		.244
				RETLW		.250

TABLAREPS#		ADDWF		PCL,F
				RETLW		0X56
				RETLW		0X56
				RETLW		0X56
				RETLW		0X56

TABLARE#NOPS	ADDWF		PCL,F
				RETLW		.40
				RETLW		.39
				RETLW		.16
				RETLW		.4
;++++++++++++++++++++++++++++++++++++++++++++++++++
TABLAMI			ADDWF		PCL,F
				RETLW		.209
				RETLW		.233
				RETLW		.245
				RETLW		.251

TABLAMIPS		ADDWF		PCL,F
				RETLW		0X56
				RETLW		0X56
				RETLW		0X56
				RETLW		0X56

TABLAMINOPS		ADDWF		PCL,F
				RETLW		.5
				RETLW		.21
				RETLW		.28
				RETLW		.32
;++++++++++++++++++++++++++++++++++++++++++++++++++
TABLAFA			ADDWF		PCL,F
				RETLW		.212
				RETLW		.234
				RETLW		.246
				RETLW		.251

TABLAFAPS		ADDWF		PCL,F
				RETLW		0X56
				RETLW		0X56
				RETLW		0X56
				RETLW		0X56

TABLAFANOPS		ADDWF		PCL,F
				RETLW		.13
				RETLW		.9
				RETLW		.43
				RETLW		.18
;+++++++++++++++++++++++++++++++++++++++++++++++++++
TABLAFA#		ADDWF		PCL,F
				RETLW		.215
				RETLW		.236
				RETLW		.246
				RETLW		.254

TABLAFAPS#		ADDWF		PCL,F
				RETLW		0X56
				RETLW		0X56
				RETLW		0X56
				RETLW		0X57

TABLAFA#NOPS	ADDWF		PCL,F
				RETLW		.40
				RETLW		.39
				RETLW		.16
				RETLW		.47
;+++++++++++++++++++++++++++++++++++++++++++++++++++

TABLASOL		ADDWF		PCL,F
				RETLW		.217
				RETLW		.237
				RETLW		.247
				RETLW		.252

TABLASOLPS		ADDWF		PCL,F
				RETLW		0X56
				RETLW		0X56
				RETLW		0X56
				RETLW		0X56

TABLASOLNOPS	ADDWF		PCL,F
				RETLW		.25
				RETLW		.30
				RETLW		.33
				RETLW		.34
;+++++++++++++++++++++++++++++++++++++++++++++++++++

TABLASOL#		ADDWF		PCL,F
				RETLW		.219
				RETLW		.238
				RETLW		.247
				RETLW		.252 ;CAMBIAR

TABLASOLPS#		ADDWF		PCL,F
				RETLW		0X56
				RETLW		0X56
				RETLW		0X56
				RETLW		0X56

TABLASOL#NOPS	ADDWF		PCL,F
				RETLW		.15
				RETLW		.25
				RETLW		.9
				RETLW		.22
;+++++++++++++++++++++++++++++++++++++++++++++++++++

TABLALA			ADDWF		PCL,F
				RETLW		.221
				RETLW		.239
				RETLW		.248
				RETLW		.252

TABLALAPS		ADDWF		PCL,F
				RETLW		0X56
				RETLW		0X56
				RETLW		0X56
				RETLW		0X56

TABLALANOPS		ADDWF		PCL,F
				RETLW		.12
				RETLW		.24
				RETLW		.30
				RETLW		.11
;+++++++++++++++++++++++++++++++++++++++++++++++++++
TABLALA#		ADDWF		PCL,F
				RETLW		.223
				RETLW		.240
				RETLW		.248
				RETLW		.253

TABLALAPS#		ADDWF		PCL,F
				RETLW		0X56
				RETLW		0X56
				RETLW		0X56
				RETLW		0X56

TABLALA#NOPS	ADDWF		PCL,F
				RETLW		.12
				RETLW		.24
				RETLW		.9
				RETLW		.44
;+++++++++++++++++++++++++++++++++++++++++++++++++++
TABLASI			ADDWF		PCL,F
				RETLW		.225
				RETLW		.241
				RETLW		.249
				RETLW		.253

TABLASIPS		ADDWF		PCL,F
				RETLW		0X56
				RETLW		0X56
				RETLW		0X56
				RETLW		0X56

TABLASINOPS		ADDWF		PCL,F
				RETLW		.17
				RETLW		.28
				RETLW		.31 ;Aumentar 1 
				RETLW		.34 ;Reducir 1

;********************FIN****************************