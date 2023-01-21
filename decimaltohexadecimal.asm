;Aquino Nathaniel B.
section .data
    ;change the value of 32 bit integer to test the program
    num dd 45 
    arrayhex db 20 dup(0)
    hexadecimal db 16
   
  
section .bss
    output_hex resb 1
    
section .text
    global _start                 
    
_start: 
    xor esi,esi
    xor edx, edx
    mov ebp, arrayhex       ;pointer to the current address of array
    mov edi, [num]          ;store the input to a temporary register
    
decimal_hexadecimal:  
    mov eax, edi            ;store the input to a 32-bit register dividend
    mov ecx, [hexadecimal]  ;store the "base number" to a 32-bit register as the divisor
    div ecx                 ;divide the input(base number) and store the remainder at edx
    
    mov [ebp], edx          ;store the remainder
    add ebp, 1              ;increment the pointer of the array
    inc esi                 ;increment the counter on how many elements were stored
    mov edi, eax            ;store the new quotient to the temporary register
    
    mov edx, 0              ;clear the remainder register
    cmp edi, 0              ;compare if the quotient is already zero
    jnz decimal_hexadecimal ;loop again if not yet zero
    
reverse_hexadecimal:
    sub ebp, 1              ;point to the last stored element of the array
    mov ah, [ebp]           ;store the current element to a 8 bit register because we need to check digit of the array 
    
    cmp ah, 9               ;convert to number to 9 because in hexadecimal the only number we have is 9 only
    ja hexa_letter          ;if it is 9 jump above(carry the flag) to the letter of hexadecimal which is A, B,C,D,E,F
                            ;if it is within the 0-9 do the following code
    add ah, 48              ;set the register to ascii value of 0
    mov [output_hex], ah    ;move the content of the register to output register
    
    ;print the content note that this will only print the number from 0-9
    mov edx, 1
    mov ecx, output_hex
    mov ebx, 1
    mov eax, 4
    int 0x80
    jmp decrement
    
hexa_letter:
    add ah, 55              ;set the register to ascii value of A
    mov [output_hex], ah
    ;print the content note that this will only print the number from A-F
    mov edx, 1
    mov ecx, output_hex
     mov eax, 4
    mov ebx, 1
    int 0x80

decrement:
    dec esi                 ;decrement counter to know if it reached the very first element
    cmp esi, 0              ;compare if the counter is zero
    jnz reverse_hexadecimal ;if counter not 0, then loop again

exit:
    mov eax, 1     
    int 0x80
    
