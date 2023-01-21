;loop statements - print out numbers from 5 to 0 
section .data
    integer dd 5 

section .bss 
    result resb 1 

section .text
    global _start
_start: 
    mov ebx, [integer] ;move the value of 5 to the ebx register 
    while: 
        mov eax, 0 ;we want to compare if our ebx is 0 
        mov ebx, [integer] ;put it inside the loop
        
        je end_while ;if equal na sila it will go to the end of while 
        
        ;printing the value of ebx 
        mov eax, [integer]
        add eax, 48
        mov [result], eax 
        
        mov edx, 1 
        mov ecx, result 
        mov ebx, 1
        mov eax, 4
	      int 0x80
        
        ;put back the original values of the registers 
        mov ebx, [integer]
        
        dec ebx ;decrement ebx which is 5
        mov [integer], ebx ;place the ebx to the integer 
        jmp while ; jump to while 
        
    end_while: ;end of our loop 
    
    ;exit code
    exit: 
        mov eax, 1
	        int 0x80
