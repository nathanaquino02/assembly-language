;Create a program that displays the following words using **only ascii codes**.
;- dog
;- cat
;- pure
;- table
;(approach: know first the ascii equivalent of the words then print the variable)

section .data
	dog db 68, 111, 103
		dogLen equ $- dog
	cat db 67, 65, 116 
		catLen equ $- cat
	pure db 80, 117, 114, 101
		pureLen equ $- pure
	table db 84, 97, 98, 108, 101
		tableLen equ $- table
	
;make sure the length is right after the array

	break db 10 

section .text 
	global _start
	_start: 
		;printing dog 
		mov ecx, dog 
		mov edx, dogLen 
		mov ebx, 1
		mov eax, 4 
		int 0x80

		;printing the enter 
		mov ecx, break
		mov edx, 1 
		mov ebx, 1
		mov eax, 4
		int 0x80
	
		;printing cat 
		mov ecx, cat 
		mov edx, catLen 
		mov ebx, 1 
		mov eax, 4 
		int 0x80 

		;enter 
		mov ecx, break
		mov edx, 1 
		mov ebx, 1
		mov eax, 4
		int 0x80

		;printing pure 
		mov ecx, pure
		mov edx, pureLen 
		mov ebx, 1 
		mov eax, 4 
		int 0x80 

		;enter 
		mov ecx, break 
		mov edx, 1
		mov ebx, 1 
		mov eax, 4
		int 0x80 

		;printing table 
		mov ecx, table 
		mov edx, tableLen 
		mov ebx, 1
		mov eax, 4 
		int 0x80 


	exit: 
		mov eax, 1 
		mov ebx, 0 
		int 0x80