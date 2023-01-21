section .text
    global _start                 
    
_start: 

    mov  ebp, arr           ;point to the current address of array
    mov  esi, 0             ;counter
    
    mov edx, 0              ;clear edx for remainder
    mov edi, [num]          ;store the input to a temporary register
    
conversion:
    mov eax, edi            ;store the input to a 32-bit register dividend
    mov ecx, [septenary]    ;store the "base number" to a 32-bit register as the divisor
    div ecx                 ;divide the input and store the remainder at edx
    
    mov [ebp], edx          ;store the remainder as the first element of an array (repeat)
    add ebp, 1              ;increment the pointer of the array
    inc esi                 ;increment the counter on how many elements were stored
    mov edi, eax            ;store the new quotient to the temporary register
    
    mov edx, 0              ;clear the remainder register
    cmp edi, 0              ;compare if the quotient is already zero
    jnz conversion          ;loop again if not yet zero
    
reverse:
    sub ebp, 1              ;point to the last stored element of the array
    mov esp, [ebp]          ;store the current element to a register
    
    add esp, 48             ;convert to digit
    mov [output], esp       ;store the digit to the output variable
    
    ;print the reversed content
    mov edx, 1              
    mov ecx, output
    mov ebx, 1
    mov eax, 4
    int 0x80
    
    dec esi                 ;decrement counter to know if it reached the very first element
    cmp esi, 0              ;compare if the counter is zero
    jnz reverse             ;if counter not 0, then loop again
    

exit:
    mov eax, 1     
    int 0x80
    
section .data
    num dd 34
    arr db 20 dup(0)
    septenary db 7
    
section .bss
    output resb 1