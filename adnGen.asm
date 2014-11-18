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
	ADENINE : db "A",0
	CYTOSINE: db "C",0
	THYMINE : db "T",0
	GUANINE : db "G",0

.UDATA
	tamBase: resb 32

.CODE
    .STARTUP


main:
	call lecturaDatos
	call salir

lecturaDatos:
	PutStr msg
	GetInt [tamBase]
	mov CX,[tamBase]
	mov AX,1
	call Generador
	ret	

Generador:
	PutInt AX
	nwln
	INC AX
	loop Generador
	ret

salir:
     .EXIT
   

