;3. Hacer un programa que pida 4 números por consola y se los asigne 
;a las variables declaradas en la sección de datos .DATA
;Luego multiplique VAR1 POR VAR2 POR VAR3  y el resultado dividirlo entre VAR4.

TITLE EJERCICIO3_PARCIAL2
INCLUDE IRVINE32.INC 
.DATA
	VAR1 BYTE 0
	VAR2 DWORD 0
	VAR3 WORD 0
	VAR4 WORD 0
	RESP DWORD 0
	MESSAGE1 BYTE "INGRESE UN #: ",0
	MENSAJE2 BYTE "RESULTADO DE LA OPERACION: ",0
.CODE
	MMM PROC 
		MOV EDX,OFFSET MESSAGE1 
		CALL WRITESTRING 
		CALL READDEC 
		;VALIDAR QUE SEA DEL TAMAÑO INDICADO DE BYTE
			.IF(EAX<=0FFH)
				MOV VAR1, AL
			.ENDIF
			CALL CRLF
		MOV EDX,OFFSET MESSAGE1 
		CALL WRITESTRING 
		CALL READDEC 
			;VALIDAR QUE SEA DEL TAMAÑO DWORD
			.IF(EAX<=0FFFFFFFFH)
				MOV VAR2, EAX
			.ENDIF
			CALL CRLF
		MOV EDX,OFFSET MESSAGE1 
		CALL WRITESTRING 
		CALL READDEC 
		;;VALIDAR QUE SEA DEL TAMAÑO WORD
			.IF(EAX<=0FFFFH)
				MOV VAR3,AX
			.ENDIF
			CALL CRLF
		MOV EDX,OFFSET MESSAGE1 
		CALL WRITESTRING 
		CALL READDEC 
		;VALIDAR QUE SEA DEL TAMAÑO INDICADO DE WORD
			.IF(EAX<=0FFFFH)
				MOV VAR4, AX
			.ENDIF
			CALL CRLF
			
		MOV EDX,OFFSET MENSAJE2 ;MULTIPLICACION
		CALL WRITESTRING 
		MOV EAX, 0
		MOV EBX, 0
		MOV BL, VAR1
		MOV AX, VAR3
		MUL EBX
		MUL VAR2
		MOV RESP, EAX 
		
		MOV EAX, 0 ; PROCESO DE DIVISION
		MOV EBX, 0
		MOV EDX, 0
		MOV EAX, RESP 
		MOV BX, VAR4
		DIV EBX
		CALL WRITEDEC
			
	 
	EXIT 
	MMM ENDP
	END MMM