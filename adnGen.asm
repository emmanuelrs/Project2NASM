;*****************************************************************
;*         Proyecto Número 2  Arquitectura de Computadores       *
;*								 *
;* 	   Elaborado por: Emmanuel Rosales Salas 2013108931      *
;*	  		  Miuyin Yong Wong 2014079293            *
;*								 *
;*	   Profesor: Esteban Méndez				 *
;*	   							 *
;*****************************************************************

%include "/home/emmanuel/Desktop/Project2NASM/io.mac"

.DATA
	msg: db "Bienvenido al generador de ADN, ingrese la cantidad de bases que desea: ",0
	;ADENINE : db "A",0
	;CYTOSINE: db "C",0
	;THYMINE : db "T",0
	;GUANINE1 : db "G",0
.UDATA
	tamBase:   rest 2
	secuencia: rest 2
	numRandom: rest 2
.CODE
    .STARTUP
main:
	call lecturaDatos
	call salir
lecturaDatos:
	PutStr msg
	GetInt [tamBase]
	mov CX,[tamBase]
	call Generador
	ret	
Generador:
	call random
	call genSecuencia
	PutInt [secuencia]
	nwln
	loop Generador
	ret
random:	
	xor EAX,EAX
	xor EBX,EBX
	xor EDX,EDX
	RDTSC
	mov EAX,EDX
	mov EDX,0
	mov EBX, ECX
	div EBX
	mov EDX,0
	xor EBX,EBX
	mov EBX,4
	div EBX
	mov [numRandom],EDX
	ret
genSecuencia:
	cmp byte[numRandom],0
	je ADENINE
	cmp byte[numRandom],1
	je CYTOSINE
	cmp byte[numRandom],2
	je THYMINE
	cmp byte[numRandom],3
	je GUANINE	
	ret
ADENINE:
	mov byte[secuencia],"A"
	ret
CYTOSINE:
	mov byte[secuencia],"C"
	ret
THYMINE:
	mov byte[secuencia],"T"
	ret
GUANINE:
	mov byte[secuencia],"G"
	ret
salir:
     .EXIT
   

