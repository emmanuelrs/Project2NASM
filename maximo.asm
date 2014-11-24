%include "io.mac"
.DATA
	
.UDATA
	num1: resb 32
	num2: resb 32
	num3: resb 32
	maxi: resb 32
.CODE
	.STARTUP
main:
	GetInt [num1]
	GetInt [num2]
	GetInt [num3]
	call maximo 
	PutInt [maxi]
	call salir
	
maximo:
	mov AX, [num1]
	mov BX, [num2]
	mov CX, [num3]
	cmp AX,BX
	jle num2Mayor
	jmp num1Mayor 
	ret 
 
num1Mayor:  
	cmp AX,CX 
	jle num3Mayor
	MOV [maxi],AX 
	ret

num2Mayor:  
	cmp BX,CX 
	jle num3Mayor 
	MOV [maxi], BX 
	ret

num3Mayor: 
	MOV [maxi], CX  
	ret
	

salir:
	.EXIT
