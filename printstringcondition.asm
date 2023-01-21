;Aquino Nathaniel
section .data
    msg dd 'helloworld'
    count dd 0
    
section .text
    global _start
    
_start:
    mov esi, 0                     ;set the index to 0
    mov eax, [esi + msg]
    
loop_start:
    mov eax, [esi+ msg]    
    
display:
    mov ebx, eax                   ;move yung eax which is array + index sa ebx
    mov [count], ebx
    
printinFeed:
    mov edx, 1
    mov ecx, count
    mov ebx, 1
    mov eax, 4
    int 0x80  

looper:
    add esi, 1                      ; for every index it will add 1
    inc esi                         ;increment
    cmp esi, 10                     ;compare index to 10          
    je loop_exit;                   ;if index=10 exit the loop 
    jmp loop_start

loop_exit:
    mov eax, 1
    int 0x80