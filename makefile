load: code adnGen.o			
	ld -s -o adnGen adnGen.o io.o
	nasm -f elf analisis.asm
	ld -s -o analisis.o io.o
code: adnGen.asm
	nasm -f elf adnGen.asm	
