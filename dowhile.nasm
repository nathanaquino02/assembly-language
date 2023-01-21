section .data
    integer dd 8 
    
section .bss 
    result resb 1
    
section .text 
    global _start 

_start: 
    do:
        mov eax, [integer] ;same as the while loop 
        add eax, 48
        mov [result], eax
        
        ;displaying or printing the results
        mov edx, 1
        mov ecx, result 
        mov ebx, 1
        mov eax, 4 
        int 0x80
        
        ;place the integer back to the register 
        mov eax, [integer]
        dec eax ;decrement 
        mov [integer], eax
        
        ;this part of the code will be comparing the value of the integer to 0 
        mov eax, 0
        mov ebx, [integer]
        cmp eax, ebx
        
        jne do ;kapag true na sya ma tterminate na ang code, so reverse the logic to not equal to
    
    
;exit code 
    mov eax, 1
    int 0x80
