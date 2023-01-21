;Create a program that will display all the uppercase letters from 'A' to 'Z' using the loop instruction and ASCII codes. 
;The letters must be displayed in alphabetical order. 

section .data
    alphabet dd 65 

section .bss 
    result resb 91

section .text 
    global _start 
_start: 
    do:
        mov eax, [alphabet] 
        mov [result], eax

      
        ;printing the results
        mov edx, 1
        mov ecx, result 
        mov ebx, 1
        mov eax, 4 
        int 0x80

        
        mov eax, [alphabet]
        inc eax 
        mov [alphabet], eax

        mov eax, 91
        mov ebx, [alphabet]
        cmp eax, ebx

        jne do 

;exit code
    mov eax, 1
    int 0x80
        