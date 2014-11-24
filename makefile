analisis: analisis.o
	ld -m elf_i386 -o analisis analisis.o io.o
	rm analisis.o
	nasm -f elf adnGen.asm
	ld -m elf_i386 -o adnGen adnGen.o io.o
	rm adnGen.o

analisis.o: analisis.asm
	nasm -f elf analisis.asm
