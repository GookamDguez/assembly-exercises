; CREATE ANOTHER TRIANGLE WITH ASTERISK
Title NACHOS
Include Irvine32.Inc
;@AUTHOR: GABRIELA DOMINGUEZ HERNANDEZ
;@COUNTRY: EL SALVADOR, CENTRO AMERICA
.Data
    nAsc DWord 10 
    nMin DWord  1
.Code
	CHURROS Proc
		Call ClrScr    
		Mov  EBX, nMin
		MIENTRAS1: CMP EBX, nAsc
					JBE BUCLE1	; <=
					JA ENDMIENTRAS1	; >
					
					BUCLE1: Mov  ECX, nMin
						MIENTRAS2: CMP ECX, nAsc
						JBE BUCLE2
						JA ENDMIENTRAS2
						
						BUCLE2: CMP EBX, ECX
							JAE YES_TRUE ; >=
							JB SINO ; <
							
						YES_TRUE: Mov AL, Byte PTR "*"
								JMP OUTIF
						
						SINO: Mov AL, Byte PTR " "
							JMP OUTIF
							
						OUTIF: Call WriteChar
							Inc  ECX
							JMP MIENTRAS2
							
					ENDMIENTRAS2: Call CrLf
					inc  EBX
					JMP MIENTRAS1
					
		ENDMIENTRAS1: EXIT
		Call CrLf
		
	CHURROS EndP
End CHURROS