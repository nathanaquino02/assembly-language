;Aquino Nathaniel
section .data

    str1 db 'Odd', 0x2c
    len1 equ $ -str1
    
    str2 db 'Even', 0x2c
    len2 equ $ -str2
    
    str3 db 'Zero', 0x2c
    len3 equ $ - str3
    
    array db  7,1,3,6,0,1,5,7,2,4,0,1
    array_len equ $ -array
    
    divisor db 2
    remainder db 0
 
section .text
    global _start
    
_start:
    mov edi, 0              ;set the index to 0
    mov esi, array          ;move element of the array in esi
    
for:
    mov al, [esi]           ;esi=array=element in array= al 
    inc esi                 ;increment the array elements
    
    mov dl, [remainder]     ;mov remainder 0 to dl register we want to use 8 bits register for us to compare and know the elements of the array
    div word [divisor]      ; divide word meaning the size is in 2 bytes to our divisor 2
    
    cmp dl, 0               ;compare the remainder to 0
    jz IsEven               ;jump to even if dl is equal to 0
                            ;if not zero then print odd then go back to loop
    mov edx, len1
    mov ecx, str1
    mov ebx,1
    mov eax, 4
    int 0x80
    jmp looper             ;go to the next index or array elements
    
    
IsEven:
    cmp al,[remainder]      ;compare al=esi=elements of array to remainder
    jz IsZero               ;jump to zero if al is equal to 0
                            ;if al is not equal to 0 print even
    mov edx, len2
    mov ecx, str2
    mov ebx,1
    mov eax, 4
    int 0x80
    jmp looper             ;go to the next index

    
IsZero:
    mov edx, len3
    mov ecx, str3
    mov ebx, 1
    mov eax, 4
    int 0x80
    jmp looper              ;go to the next index
    
looper:
    inc edi                 ;increment the index
    cmp edi, array_len      ;length of the array you want to compare with           
    jne for;                ;stop the loop after all iteration

exit:
    mov eax, 1
    int 0x80