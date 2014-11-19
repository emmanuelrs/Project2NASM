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
	ADENINE1 : db "A"
	CYTOSINE1: db "C"
	THYMINE1 : db "T"
	GUANINE1 : db "G"
.UDATA
	tamBase:   rest 2
	secuencia: rest 2
	numRandom: rest 2
.CODE
    .STARTUP
main:
	call lecturaDatos
	nwln
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
	PutStr secuencia
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
	;PutStr ADENINE1
	mov byte[secuencia],"A"
	ret
CYTOSINE:
	;PutStr CYTOSINE1
	mov byte[secuencia],"C"
	ret
THYMINE:
	;PutStr THYMINE1
	mov byte[secuencia],"T"
	ret
GUANINE:
	;PutStr GUANINE1
	mov byte[secuencia],"G"
	ret
salir:
     .EXIT
   

