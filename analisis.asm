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
	msg3: db "Enter the number of columns in the matrix : "
<<<<<<< HEAD
	uno: db "uno",0
	dos: db "dos",0
	tres: db "tres",0 
=======
>>>>>>> FETCH_HEAD
  	msg_size3: equ $-msg3
  	tab: db  9 ;ASCII for vertical tab
  	new_line: db 10 ;ASCII for new line
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
	num: resw 1 ;For storing a number, to be read of printed....
 	 nod: resb 1 ;For storing the number of digits....
  	temp: resb 2
  	matrix1: resw 200
 	 m: resw 1
  	n: resw 1
  	i: resw 1
  	j: resw 1
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
<<<<<<< HEAD
	call matriz
	call setDatosFor1
=======
	nwl
	call matriz
>>>>>>> FETCH_HEAD
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
<<<<<<< HEAD
	ret
matriz:
	mov AX, [TamArch1]
	mov BX, [TamArch2]
	inc AX
	inc BX
	mov word[m], AX
  	mov word[n], BX    
  	mov eax, 0
  	mov ebx, matrix1  
  	mov word[i], 0
  	mov word[j], 0
	call i_loop
	ret
  
  
i_loop:
    	mov word[j], 0
	call j_loop
	ret
j_loop:
 	mov dx , 1
 	mov  word[ebx + 2 * eax], dx
 	inc eax    ;Incrementing array index by one....
 	inc word[j]
 	mov cx, word[j]
 	cmp cx, word[n]
 	jb j_loop
    	inc word[i]
    	mov cx, word[i]
    	cmp cx, word[m]
    	jb i_loop
	mov eax, 0
  	mov ebx, matrix1  
  	mov word[i], 0
  	mov word[j], 0
	call i_loop2
	ret
i_loop2:
    	mov word[j], 0
	call j_loop2
	ret
j_loop2:
    	mov  dx, word[ebx + 2 * eax]
   	mov word[num] , dx
   	call print_num
   	pusha
     	mov eax, 4
     	mov ebx, 1
     	mov ecx, tab
     	mov edx, 1
     	int 80h    
   	popa
   	inc eax  
	inc word[j]
 	mov cx, word[j]
 	cmp cx, word[n]
 	jb j_loop2
   	pusha
     	mov eax, 4
     	mov ebx, 1
     	mov ecx, new_line
     	mov edx, 1
     	int 80h    
   	popa
    	inc word[i]
    	mov cx, word[i]
    	cmp cx, word[m]
    	jb i_loop2
	ret

exit:
  	mov eax, 1
  	mov ebx, 0
  	int 80h  
loop_read:
    	mov eax, 3
    	mov ebx, 0
    	mov ecx, temp
    	mov edx, 1
    	int 80h
    	cmp byte[temp], 10
    	je end_read   
    	mov ax, word[num]
    	mov bx, 10
    	mul bx
    	mov bl, byte[temp]
    	sub bl, 30h
    	mov bh, 0
    	add ax, bx
    	mov word[num], ax
    	jmp loop_read 
end_read:
  	popa
  	ret
print_num:
  	pusha
extract_no:
    	cmp word[num], 0
    	je print_no
    	inc byte[nod]
    	mov dx, 0
    	mov ax, word[num]
    	mov bx, 10
    	div bx
    	push dx
    	mov word[num], ax
    	jmp extract_no

print_no:
    	cmp byte[nod], 0
    	je end_print
    	dec byte[nod]
    	pop dx
    	mov byte[temp], dl
    	add byte[temp], 30h
    	mov eax, 4
    	mov ebx, 1
    	mov ecx, temp
    	mov edx, 1
    	int 80h
    	jmp print_no    
end_print:   
  	popa
  	ret 

setDatosFor1:
	xor ECX,ECX
	xor EAX,EAX
	mov EAX,10
	mov EDI,0
	mov ESI,2
	call inicializarMatriz
	ret


inicializarMatriz:
	dec eax
	mov ECX,5
	call inicializaMatriz2
	;inc edi      ;i
	cmp eax,0
	jne inicializarMatriz
	ret
inicializaMatriz2:
	dec ecx
	cmp edi,0
	je ifuno
	cmp esi,0
	je ifdos
	jmp iftres
	inc esi      ;j
	cmp ecx,0
	jne inicializaMatriz2
	ret	

ifuno:
	PutStr uno
	nwln 
	ret
ifdos:
	PutStr dos 
	nwln
	ret
iftres:
	PutStr tres
	nwln
=======
>>>>>>> FETCH_HEAD
	ret
matriz:
	mov AX, [TamArch1]
	mov BX, [TamArch2]
	mov word[m], AX
  	mov word[n], BX    
  
  
  ;Reading each element of the matrix........
  mov eax, 0
  mov ebx, matrix1  
  
  mov word[i], 0
  mov word[j], 0
  
  
  i_loop:
    mov word[j], 0
    j_loop:
 
 mov dx , 1
 ;eax will contain the array index and each element is 2 bytes(1 word) long
 mov  word[ebx + 2 * eax], dx
 inc eax    ;Incrementing array index by one....
    
 inc word[j]
 mov cx, word[j]
 cmp cx, word[n]
 jb j_loop
 
    inc word[i]
    mov cx, word[i]
    cmp cx, word[m]
    jb i_loop
;Reading each element of the matrix.(Storing the elements in row major order).......
  mov eax, 0
  mov ebx, matrix1  
  
  mov word[i], 0
  mov word[j], 0
  
  
  i_loop2:
    mov word[j], 0
    j_loop2:
 
   ;eax will contain the array index and each element is 2 bytes(1 word) long
   mov  dx, word[ebx + 2 * eax]   ;
   mov word[num] , dx
   call print_num
   
   ;Printing a space after each element.....
   pusha
     mov eax, 4
     mov ebx, 1
     mov ecx, tab
     mov edx, 1
     int 80h    
   popa
   
   inc eax  
     
     
 inc word[j]
 mov cx, word[j]
 cmp cx, word[n]
 jb j_loop2
 
  pusha
     mov eax, 4
     mov ebx, 1
     mov ecx, new_line
     mov edx, 1
     int 80h    
   popa
 
    inc word[i]
    mov cx, word[i]
    cmp cx, word[m]
    jb i_loop2
  

  
  

  
;Exit System Call.....
exit:
  mov eax, 1
  mov ebx, 0
  int 80h

  
  
;Function to read a number from console and to store that in num 
read_num:
  pusha
  mov word[num], 0
  
loop_read:
    mov eax, 3
    mov ebx, 0
    mov ecx, temp
    mov edx, 1
    int 80h
    cmp byte[temp], 10
    je end_read   
    mov ax, word[num]
    mov bx, 10
    mul bx
    mov bl, byte[temp]
    sub bl, 30h
    mov bh, 0
    add ax, bx
    mov word[num], ax
    jmp loop_read 
end_read:
  popa
  ret


;Function to print any number stored in num...
print_num:
  pusha
extract_no:
    cmp word[num], 0
    je print_no
    inc byte[nod]
    mov dx, 0
    mov ax, word[num]
    mov bx, 10
    div bx
    push dx
    mov word[num], ax
    jmp extract_no

print_no:
    cmp byte[nod], 0
    je end_print
    dec byte[nod]
    pop dx
    mov byte[temp], dl
    add byte[temp], 30h
    mov eax, 4
    mov ebx, 1
    mov ecx, temp
    mov edx, 1
    int 80h
    jmp print_no
    
end_print:   
  popa
  ret 
    
 	
salir:
	.EXIT

















