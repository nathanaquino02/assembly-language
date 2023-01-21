;Create a program that will go through an array of positive integers with possible values from 0 to +∞+∞ and output "EVEN" if the integer is even, "ODD" if the integer is odd, and "ZERO" if the integer is zero.
;Example:
;- array: 7,1,3,6,0,1,5,7,2,4,0,1
;- output: ODD, ODD, ODD, EVEN, ZERO, ODD, ODD ODD, EVEN, EVEN, ZERO, ODD;

section .data 
    
    comma db 44     ;ascii value for comma
    
    ;array of values 
    val1 dw 4,0,3,4,5,6
    valLen equ ($ - val1)/2
    
    val2 db 2 
    counter dd 0
    
    ;string of what to print 
    even db "EVEN"
    odd db "ODD"
    zero db "ZERO"


    quo db 0 
    rem db 0 

section .text 
    global _start 
_start: 
    
    
while:     
    
;checker for the counter 
mov eax, valLen      
mov ebx, [counter]      
    
cmp ebx, eax            
je exit        
    
    ;moving to the next pointer 
    mov edx, val1 
    mov ecx, [counter]
   
   increment_pointer: 
    add edx, 2 
    loop increment_pointer
    
    
    ;the dividing process 
    mov eax, [edx]
    div byte [val2]

    cmp ah, 0       ;meaning there is no remainder 
    je printEven    ;if there is no remainder then it is even 
    jne printOdd    ;if there is a remainder then jump to printOdd
    
    cmp al, 0 
    je printZero    ;if the quotient is zero then we print zero
    
    
    ;----------------------------------------------------
    printEven:
        ;printing even 
        mov edx, 4    ;length of string to print
        mov ecx, even     ;what we will be printing
        mov ebx, 1          
        mov eax, 4         
        int 0x80 
        
        ;printing the comma 
        mov ecx, comma
        mov edx, 1 
        mov ebx, 1 
        mov eax, 4 
        int 0x80  
      
        ;incrementing the counter 
        mov ebx, [counter]
        inc ebx 
        mov [counter], ebx 
        jmp while
        

    
    ;----------------------------------------------------
    printOdd:
        ;printing odd 
        mov edx, 3    ;length of string to print
        mov ecx, odd     ;what we will be printing
        mov ebx, 1          
        mov eax, 4         
        int 0x80 
        
        ;printing the comma 
        mov ecx, comma
        mov edx, 1 
        mov ebx, 1 
        mov eax, 4 
        int 0x80  
      
        ;incrementing the counter 
        mov ebx, [counter]
        inc ebx 
        mov [counter], ebx 
        jmp while
        

    ;---------------------------------------------------
    printZero:
        ;printing zero
        mov edx, 4    ;length of string to print
        mov ecx, zero     ;what we will be printing
        mov ebx, 1          
        mov eax, 4         
        int 0x80 
        
        ;printing the comma 
        mov ecx, comma
        mov edx, 1 
        mov ebx, 1 
        mov eax, 4 
        int 0x80  
      
        ;incrementing the counter 
        mov ebx, [counter]
        inc ebx 
        mov [counter], ebx 
        jmp while
        
    
exit: 
    mov eax, 1 
    mov ebx, 0
    int 0x80