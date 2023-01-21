;Aquino, Nathaniel B
;Multiply Two Numbers Using Add and Shift Operation
section .data

    ;1110
    ;1010
;---------------
    ;0000
   ;1110
 ;10000
 ;1110
;---------------
;10001100
 
    number dd 14
    number2 dd 10
    counter dd 0
    ten dd 10

section .bss
    array resb 100
    result resd 0

section .text
    global _start

_start: 
    ;move the number to the register
    mov eax, [number]
    mov ebx, [number2]

shift:
    cmp eax, 1       ;compare if the first number is 1
    je if_else       ;if it is 1 num=num+num2
    
    shr eax, 1       ;shift the value of bits to the right by 1 which is the same as multiplying it by 1
    jc else_if       ;jump if it is has carry 1

    shl ebx, 1       ;go back or shift to left of the bits by 1 which is the same as multiplying it by 1 
    jmp shift        ;jmp to shift to check again the numbers
    
else_if:
    ;if it it has carry 1
    add ecx, ebx     ;num=num+num2
    shl ebx, 1       ;go back or shift to left of the bits by 1 which is the same as multiplying it by 1
    jmp shift        ;jmp to shift to check again the numbers
    
    
if_else:
    add ecx, ebx        ;num=num+num2
    mov [result], ecx   ;move the ecx to result
    mov eax, [result]   ;move the result in eax
    mov ebx, [ten]      ;move the ten to ebxx
    mov edi, [counter]  ;move counter to edi
    mov esi, array      ;move array to esi


looper:  
    mov edx, 0
    div ebx
    mov [esi], edx
    add esi, 1
    inc edi
    
    cmp eax, 0
    jnz looper

print:
    sub esi, 1
    mov ebp, [esi]

    add ebp, 48
    mov [result], ebp
    
    mov edx, 1
    mov ecx, result
    mov ebx, 1
    mov eax, 4
    int 0x80
 
    dec edi
    cmp edi, 0
    jnz print

    jmp exit

exit:
    mov eax, 1
    int 0x80