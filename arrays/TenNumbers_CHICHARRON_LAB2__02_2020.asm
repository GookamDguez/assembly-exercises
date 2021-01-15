;A-solicitar desde pantalla, 10 numeros enteros sin signo, los cuales debe ingresar a un arreglo.
;B-Ingresar en la pila los elementos en las posiciones pares del arreglo.
;C-Sacar de la pila los elementos guardados, mostrar en pantalla cada numero y sumarlos.
;D-Mostrar la suma de los valores en pantalla

TITLE CHICHARRON
INCLUDE IRVINE32.INC
;@AUTHOR: GABRIELA MARISOL DOMINGUEZ HERNANDEZ
;@COUNTRY: EL SALVADOR, CENTRO AMERICA
.DATA
	ARREGLO DWORD 0,0,0,0,0,0,0,0,0,0
	SMS BYTE "INGRESA UN VALOR: ", 0
	SUMASMS BYTE "SUMA PARES: ",0
	DOS DWORD 2
	MENSAJE3 BYTE "LISTA DE PARES",0
.CODE
	MAIN PROC
		CALL CLRSCR
		
		MOV ESI, OFFSET ARREGLO
		MOV ECX, LENGTHOF ARREGLO
		;PUNTO A
		INGRESO: MOV EDX, OFFSET SMS
			CALL WRITESTRING
			CALL READDEC
			MOV [ESI], EAX
			;CALL WRITEDEC
			ADD ESI,4
			LOOP INGRESO
			CALL CRLF
			CALL CRLF
		;PUNTO B
		MOV ESI, OFFSET ARREGLO
		MOV ECX, LENGTHOF ARREGLO
		MOV EAX,0	
		 L: MOV EDX, 0
			MOV EAX, [ESI]
			DIV DOS
			.IF(EDX == 0)
				PUSH [ESI]
			.ENDIF
			ADD ESI,4
			LOOP L
			CALL CRLF
		;PUNTO C
		MOV EAX,0
		MOV EDX,0
		MOV ECX,0
		MOV EBX,0
		MOV EDI, OFFSET ARREGLO
		MOV ECX, LENGTHOF ARREGLO
		MOV EDX, OFFSET MENSAJE3
		CALL WRITESTRING
		CALL CRLF
		MOSTRAR:
			POP EAX
			CALL WRITEDEC
			ADD EBX, EAX
			CALL CRLF
		LOOP MOSTRAR
		
		;PUNTO D
		CALL CRLF
		MOV EDX, OFFSET SUMASMS
		CALL WRITESTRING
		MOV EAX, EBX
		CALL WRITEDEC

					
	MAIN ENDP
	END MAIN 
		
		