;printing a string 
section .data
    str1 db 'True', 0xa ;0xa is the hexadecimal value for 10
    len1 equ $ -str1   ;this gets the length of the string, after you define the string you must define the length 
    
    str2 db 'False', 0xa ;0xa is the hexadecimal value for 10
    len2 equ $ -str2   ;this gets the length of the string 
    
    integer1 db 1
    integer2 db 1 ;if the two numbers are equal we will print true 

section .bss


section .text
    global _start 
    
    _start: 
    
    ;what we must first do is to compare the two values 
    mov al, [integer1]
    cmp al, [integer2] ;we compare the value of integer 1 to integer2 take note that the cmp command compares the 32 bits not just one bit
    
    ;we use al because it is an 8 bit register 
    ;we can redefine the db to dd to be 8 bits only 
    
     
    jne else_block
        ;then part of the code 
    
        ;printing the string true
        mov edx, len1 ;length of string to print 
        mov ecx, str1 ;first element of string 
        mov ebx, 1 ;descriptor 
        mov eax, 4 ;for system call 
        int 0x80 
        jmp endif
    
    else_block:
        ;else part will print false 
        mov edx, len2 
        mov ecx, str2 
        mov ebx, 1 
        mov eax, 4 
        int 0x80 
        jmp endif
    
    endif: 
    ;didiretso na sya sa exit code 
    
    ;exit commands 
    exit:
    mov eax, 1
	    int 0x80
