;Create a program to display letters using only ascii codes. 

section .data 
	letters db 65,66,67    ;the array values contains the ascii values of A,B,C (refer to the ascii table)
	len equ $- letters  ;gets the lenght of the array for printing

section .text  
	global _start
	_start:
		;printing the string 
		
		mov ecx, letters 
		mov edx, len 
		mov ebx, 1 
		mov eax, 4 
		int 0x80
	
	exit: 
	    mov eax, 1 
	    mov ebx, 0 
	    int 0x80