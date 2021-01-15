;Hacer un programa en lenguaje ensamblador, 
;que ingrese dos cadenas a la pila de forma alternada (mezclandolas), 
;utilizando direccionamiento indirecto, sin usar valores quemados en el código, 
;que dada la siguiente sección de datos:
; --Data
; Cad1 Byte "Esta es la Primera Cadena",0
; Cad2 Byte "Esta es la Segunda Cadena",0
; debe definir Cad3 de forma correcta
; -- Realizar lo siguiente:
; 1- Plantilla correcta.
; 2- Ingresar a la pila las dos cadenas de forma mezclada, pero solo los primeros 18 caracteres de cada cadena.
; 3- Sacar de la pila los datos y almacenarlos en una tercera cadena llamada Cad3.
; 4- Mostrar la cadena en pantalla.
; 5- Mostrar el tiempo de ejecucién del programa en milisegundos.
; -- Salida esperada
; Si tenemos las cadenas “HOLA” y “COMO”
; Ingresar a la pila lo siguiente HCOOLMAO
; Mostrar la tercera cadena asi: OAMLOOCH

TITLE AMVORGUEZA
INCLUDE IRVINE32.INC
;@AUTHOR: GABRIELA MARISOL DOMINGUEZ HERNANDEZ
;@COUNTRY: EL SALVADOR, CENTRO AMERICA
.DATA
	CAD1 BYTE "Esta es la Primera Cadena", 0
	CAD2 BYTE "Esta es la Segunda Cadena", 0
	CAD3 BYTE 100 DUP(0)
	INICIO DWORD 0
	SIGLAS BYTE "ms",0
	TIME_EXECUTE BYTE "TIEMPO DE EJECUCION DEL PROGRAMA: "
	
.CODE
	PAN PROC
		CALL CLRSCR
		CALL GETMSECONDS ;parte del punto 5
		MOV INICIO, EAX ;guardar en inicio el tiempo devuelto
						;por el procedimiento

		;PARA CADENA 1
		MOV ESI, OFFSET CAD1
		MOV ECX, LENGTHOF CAD1
		;PARA CADENA 2
		MOV EDI, OFFSET CAD2
		MOV ECX, LENGTHOF CAD2
		
		;PUNTO 2 MEZCLAR CADENAS Y METERLAS EN LA PILA
		MOV EBX,0
		L: 
			.IF(EBX <= 18)
			MOV AL, [ESI]
			CALL WRITECHAR
			PUSH [ESI]
			MOV AL, [EDI]
			PUSH [EDI]
			CALL WRITECHAR
			.ENDIF
			ADD EDI, 1
			ADD ESI, 1
			INC EBX
		LOOP L
		CALL CRLF
		
		;PUNTO 3 SACARLAS y METERLAS EN CAD3
		;MOV ECX, LENGTHOF CAD1 + LENGTHOF CAD2
		MOV ECX, LENGTHOF CAD1 + 12
		MOV EDI, OFFSET CAD3
		SACAR: POP EAX
			CALL WRITECHAR
			MOV [EDI], AL
			SUB EDI, 1
		LOOP SACAR
		CALL CRLF
		
		;PUNTO 4 MOSTRAR CAD3
		MOV ECX, 0
		MOV ESI, OFFSET CAD3
		MOV ECX, LENGTHOF CAD3
		M:  
			MOV AL, [ESI]
			CALL WRITECHAR
		LOOP M
			
		;PUNTO 5
		CALL CRLF
		CALL GETMSECONDS
		SUB EAX, INICIO; restarmos tiempo de inicio 
						;menos tiempo de FIN DEL PROGRAMA.
		MOV EDX, OFFSET TIME_EXECUTE 
		CALL WRITESTRING 
		CALL WRITEDEC
		MOV EDX, OFFSET SIGLAS
		CALL WRITESTRING 
		CALL CRLF
		
		EXIT
	PAN ENDP
	END PAN