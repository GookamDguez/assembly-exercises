;3) Implementar la siguiente instruccion, Pedir EAX y EBX desde Consola
;if((EAX <= 10 and EAX >5 ) or (EAX == 0))
;    if(EBX !=5){
;       Print "cierto"}
TITLE EJERCICIO3
INCLUDE IRVINE32.INC
;@AUTHOR: GABRIELA MARISOL DOMINGUEZ HERNANDEZ
;@COUNTRY: EL SALVADOR, CENTRO AMERICA
.DATA
	PRINT BYTE "CIERTO",0
	PRINTFALSO BYTE "NO SE CUMPLIERON LAS CONDICIONES", 0
	SMS1 BYTE "INGRESE VALOR PARA EAX: ",0
	SMS2 BYTE "INGRESE VALOR PARA EBX: ",0
.CODE
	MARANHON PROC
		CALL CLRSCR
		MOV EDX, OFFSET SMS2
		CALL WRITESTRING
		CALL READDEC
		MOV EBX, EAX
		CALL CRLF
		;
		MOV EDX, OFFSET SMS1
		CALL WRITESTRING
		CALL READDEC
		CALL CRLF
		
		;INCICIAMOS / GET STARTED
			CMP EAX, 0
			JE COND2
			CMP EAX, 10
			JBE COND1	;<=10
			JMP SALIDA1
		
		
		COND1:CMP EAX, 5
			JA COND2	;>5
			JMP SALIDA1
			
		COND2:CMP EBX, 5
			JNE IMPRESION	;!=5
			JMP SALIDA
			
		IMPRESION: MOV EDX, OFFSET PRINT
				CALL WRITESTRING
				CALL CRLF
				JMP SALIDA
		
		SALIDA: EXIT
		
		SALIDA1: MOV EDX, OFFSET PRINTFALSO	;MENSAJE QUE NELES
				CALL WRITESTRING			;NO SE CUMPLIO NADA
				CALL CRLF
				EXIT
	
	MARANHON ENDP
	END MARANHON