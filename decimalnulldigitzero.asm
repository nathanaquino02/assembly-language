section .data
    greaterThanTen db 'decimal', 0xa
    gtt_length equ $ - greaterThanTen
    
    betweenZeroAndTen db 'digit', 0xa
    bzt_length equ $ - betweenZeroAndTen
    
    equalToZero db 'null', 0xa
    etz_length equ $ - equalToZero
    
    negativeNumber db 'negative', 0xa
    nn_length equ $ - negativeNumber
    
    integer dd 123
    compareNum1 dd 0
    compareNum2 dd 10

section .text
    global _start                  ;eax: current element  ;ebx: integer, compareNum  ;edi: index
    
_start: 
   
    mov ebx,[integer]
    cmp ebx,[compareNum1]
    
    jne else_if
        mov edx, etz_length        ;length of string to print
        mov ecx, equalToZero       ;first element of string
        mov ebx, 1
        mov eax, 4
        int 0x80
        jmp exit
        
    else_if:
        cmp ebx,[compareNum2]
    
    jna else
        mov edx, gtt_length        ;length of string to print
        mov ecx, greaterThanTen    ;first element of string
        mov ebx, 1
        mov eax, 4
        int 0x80
        jmp exit
    
    else:
        cmp ebx,[compareNum1]
        
        mov edx, bzt_length        ;length of string to print
        mov ecx, betweenZeroAndTen ;first element of string
        mov ebx, 1
        mov eax, 4
        int 0x80
        jmp exit

exit:
    mov eax, 1                     ;sys_exit
    int 0x80                       ;call kernel