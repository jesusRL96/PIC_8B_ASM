# MPLAB IDE generated this makefile for use with GNU make.
# Project: practtr.mcp
# Date: Tue Jun 12 16:07:42 2018

AS = MPASMWIN.exe
CC = 
LD = mplink.exe
AR = mplib.exe
RM = rm

practtr.cof : uart_.o
	$(CC) /p16F887 "uart_.o" /u_DEBUG /z__MPLAB_BUILD=1 /z__MPLAB_DEBUG=1 /o"practtr.cof" /M"practtr.map" /W

uart_.o : uart_.asm ../../../../../../Program\ Files\ (x86)/Microchip/MPASM\ Suite/P16F887.inc SUBS_TIEMPO.ASM
	$(AS) /q /p16F887 "uart_.asm" /l"uart_.lst" /e"uart_.err" /o"uart_.o" /d__DEBUG=1

clean : 
	$(CC) "uart_.o" "uart_.err" "uart_.lst" "practtr.cof" "practtr.hex"

