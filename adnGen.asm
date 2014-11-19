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
	;filename: db 'ADN.adn', 0
	msg2: db "Digite el nombre del archivo a generar + la extensión (.adn): ",0
	msg3: db "Su archivo con extensión .adn ha sido creado correctamente :)",0
	fd: dd 0

.UDATA
	tamBase:   rest 32
	secuencia: rest 32
	numRandom: rest 32
	cadena:    rest 32
	filename: resb 32
.CODE
    .STARTUP
main:
	call lecturaDatos
	nwln
	call creaArchivo
	call salir
lecturaDatos:
	PutStr msg
	GetInt [tamBase]
	mov CX,[tamBase]
	PutStr msg2
	GetStr filename
	xor edi, edi
	call Generador
	PutStr cadena
	nwln
	PutStr msg3
	ret	
Generador:
	call random
	call genSecuencia
	mov AL, [secuencia]
	mov byte[cadena + edi], AL
	inc edi
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

creaArchivo:
	mov eax, 8 ; Crea el Archivo
        mov ebx, filename ; Asigna el nombre del Archivo
        mov ecx, 644O 
        int 80h 
        mov [fd], eax 	
	mov eax, 4 ; Escribe en el Archivo
        mov ebx, [fd],
        mov ecx, cadena
        mov edx, [tamBase]
        int 80h
	mov eax, 6 ; close
        mov ebx, [fd]
        int 80h
	mov eax, 1 ; exit
        mov ebx, 0 ; return value
        int 80h
	ret
salir:
     .EXIT
   

