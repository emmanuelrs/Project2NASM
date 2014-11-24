;*****************************************************************
;*         Proyecto Número 2  Arquitectura de Computadores       *
;*								 *
;* 	   Elaborado por: Emmanuel Rosales Salas 2013108931      *
;*	  		  Miuyin Yong Wong 2014079293            *
;*								 *
;*	   Profesor: Esteban Méndez				 *
;*	   							 *
;*****************************************************************
%include "io.mac"
.DATA
	welcome: db "Bienvenid@ al analizador de Secuencias ADN",0
	archi1: db "Ingrese el nombre del primer archivo con la secuencia: ",0
	archi2: db "Ingrese el nombre del segundo archivo con la secuencia: ",0
.UDATA
	filename1: rest 32 
	filename2: rest 32 
	file_des: rest 0 
	buffer_archivo: rest 20000 
	file_des2: rest 0 
	buffer_archivo2: rest 20000
	archivo1: rest 20000
	archivo2: rest 20000 
	Score: rest 32 
	AliSequeA: rest 32
	AliSequeB: rest 32 
	TamArch1: rest 32 
	TamArch2: rest 32
.CODE
	.STARTUP

main:
	PutStr welcome
	nwln
	PutStr archi1
	GetStr filename1
	PutStr archi2
	GetStr filename2
	call leeArch1
	call leeArch2
	PutStr [archivo1]
	nwln
	PutInt [TamArch1]
	nwln 
	PutStr [archivo2]
	nwln	
	PutInt [TamArch2]
	nwln
	call salir

leeArch1:
	xor ECX, ECX
	xor EAX, EAX
	xor EBX, EBX
	mov EAX,5
	mov EBX,filename1
	mov ECX,0 ;read permission 
	int 80h
	mov [file_des],EAX

	mov EAX, 3
	mov EBX, [file_des]
	mov ECX, buffer_archivo
	mov EDX, 20000
	int 80h 
	mov [archivo1], ECX 
	mov [TamArch1], EAX
	ret
leeArch2:
	xor ECX,ECX
	xor EAX, EAX
	xor EBX, EBX
	mov EAX,5
	mov EBX,filename2
	mov ECX,0 ;read permission 
	int 80h
	mov [file_des2],EAX

	mov EAX, 3
	mov EBX, [file_des2]
	mov ECX, buffer_archivo2
	mov EDX, 20000
	int 80h 
	mov [archivo2], ECX 
	mov [TamArch2], EAX	
	ret
salir:
	.EXIT
