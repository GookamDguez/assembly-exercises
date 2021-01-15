;1-	Hacer un programa que pida por consola una cadena, luego esa cadena debe 
;de ser mostrada en consola reemplazando las vocales por los siguientes caracteres:
;A reemplazarla por &
;e reemplazarla por $
;i reemplazarla por =
;o reemplazarla por *
;u reemplazarla por /
TITLE EJERCICIO1_PARCIAL2
INCLUDE IRVINE32.INC 
.DATA  
	TEXTO_INGRESADO BYTE 60 DUP(0)
	MENSAJE BYTE "INGRESE UN TEXTO: ",0
.CODE
	REEMPLAZO PROC 
		MOV EDX,OFFSET MENSAJE 
		CALL WRITESTRING 
		
		MOV EDX,OFFSET TEXTO_INGRESADO
		MOV ECX, SIZEOF TEXTO_INGRESADO
		CALL READSTRING 
		
		MOV ESI,OFFSET TEXTO_INGRESADO
		MOV EBX, LENGTHOF TEXTO_INGRESADO

		SALTO:MOV AL,[ESI]
			.IF( AL=="A")
				MOV [ESI], BYTE PTR"&"
			.ENDIF
			.IF( AL=="E")
				MOV [ESI], BYTE PTR"$"
			.ENDIF
			.IF( AL=="I")
				MOV [ESI], BYTE PTR"="
			.ENDIF
			.IF( AL=="O")
				MOV [ESI], BYTE PTR"*"
			.ENDIF
			.IF( AL=="U")
				MOV [ESI], BYTE PTR"/"
			.ENDIF
			INC ESI 
		LOOP SALTO
		
		CALL CRLF
		MOV EDX,OFFSET TEXTO_INGRESADO
		CALL WRITESTRING 
		
		CALL CRLF
		EXIT 
	REEMPLAZO ENDP
END REEMPLAZO 
