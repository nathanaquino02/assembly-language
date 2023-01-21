
;Aquino Nathaniel
section .data
    msg dd 'helloworld'
    count dd 0
    
section .text
    global _start
    
_start:
    mov esi, 0                     ;set the index to 0
    mov eax, [esi + msg]
    jmp display                    
    
loop_start:
    mov eax, [esi+ msg]    
    
display:
    mov ebx, eax                   ;move yung eax which is array + index sa ebx
    mov [count], ebx
    mov edx, 1
    mov ecx, count
    mov ebx, 1
    mov eax, 4
    int 0x80  
    
linebreak:                      
    mov eax,0xa                   ;print lang ng line break 
    mov [count],eax               ;every index in eax-array 
    mov edx,1                   
    mov ecx,count
    mov ebx,1
    mov eax,4
    int 0x80

looper:
    inc esi                         ;increment
    cmp esi, 10                     ;length of the array you want to compare with           
    je loop_exit;                   ;stop the loop after all iterations
    jmp loop_start

loop_exit:
    mov eax, 1
    int 0x80