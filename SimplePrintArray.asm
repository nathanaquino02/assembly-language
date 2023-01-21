section .data
    array db 2,2,3,4,5
    count dd 0
    
section .text
    global _start
    
_start:
    mov esi, 0                     ;set the index to 0
    mov eax, [array]
    
top:
    mov eax, [array]    

display:
    mov ebx, eax                   
    mov [count], ebx
    
printinFeed:
    mov edx, 1
    mov ecx, count
    mov ebx, 1
    mov eax, 4
    int 0x80
    
looper:
    inc esi                         ;increment
    cmp esi, 5                     ;length of the array you want to compare with           
    je loop_exit;                   ;stop the loop after all iterations
    loop top

loop_exit:
mov eax, 1
int 0x80