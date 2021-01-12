;2) Implementar la siguiente instruccion
;A=10, B=3
;If(A > B){Print "A Es Mayor Que B"}
;Else{Print "A No Es Mayor Que B"}
TITLE EJERCICIO2
INCLUDE IRVINE32.INC
;@AUTHOR: GABRIELA MARISOL DOMINGUEZ HERNANDEZ
;@COUNTRY: EL SALVADOR, CENTRO AMERICA
.DATA
	A DWORD 10
	B DWORD 3
	AMAYORB BYTE "A ES MAYOR QUE B",0
	ANELESMAYORB BYTE "A NO ES MAYOR QUE B",0
	SHOWA BYTE "VALOR DE A: ",0
	SHOWB BYTE "VALOR DE B: ",0
.CODE
	CHANCLA PROC
		CALL CLRSCR
		;MOSTRAR VALORES / SHOW VALUES
		MOV EDX, OFFSET SHOWA
		CALL WRITESTRING
		MOV EAX, A
		CALL WRITEDEC
		CALL CRLF
		;
		MOV EDX, OFFSET SHOWB
		CALL WRITESTRING
		MOV EAX, B
		CALL WRITEDEC
		CALL CRLF
		CALL CRLF
		;COMIENZA COMPARACÓN / LET'S START COMPARING
		MOV EAX, A
		CMP EAX, B
		JA YESMAYOR
		JNA NELMAYOR
		
		YESMAYOR: MOV EDX, OFFSET AMAYORB
				CALL WRITESTRING
				CALL CRLF
				JMP SALIDA
				
		NELMAYOR: MOV EDX, OFFSET ANELESMAYORB
				CALL WRITESTRING
				CALL CRLF
				JMP SALIDA
				
		SALIDA: EXIT
	
	CHANCLA ENDP
	END CHANCLA