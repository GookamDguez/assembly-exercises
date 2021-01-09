Title Hola
;@Author : Gabriela Dominguez Hernandez
;@Country: El Salvador, Centro America
include irvine32.inc
.DATA
	men BYTE "PRIMER PROGRAMA", 0
.CODE
	main PROC
		call CRLF;
		mov EDX, OFFSET MEN 
		call writestring
		call CRLF
		EXIT	
	main ENDP
	END main