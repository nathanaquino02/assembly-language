;Aquino Nathaniel
section	.data
global x
arr:    
   db   2
   db   1
   db   1
   db   2
   db   2
   db   1
   db   1
   db   1
   
sum dd  0
number1 dd 1

section	.text
   global _start        
	
_start:	
   mov  eax, 8          ;number bytes to be summed
   mov  ebx, 0          ;EBX will store the sum 
   mov  ecx, arr        ;ECX will point to the current element to be summed
   mov dh, [number1]    ;dh will point the  element to be the number we need to compare to our ECX
   
for:
    cmp [ecx], dh       ;compare ecx to 1
    je adder            ;if equal yung ecx-array to 1 jump sa adder
                        ;if hindi naman equal sa 1 proceed sa next element
    add  ecx,1          ;move pointer to next element
    dec  eax            ;decrement index
    cmp eax, 0          ;compare eax to 0
    jnz  for            ;if index not 0 then loop again
    
adder:
    add ebx, [ecx]      ;add the elements
    add  ecx,1          ;move pointer to next element
    dec  eax            ;decrement index
    cmp eax, 0          ;compare eax to 0
    jnz  for            ;if index not 0 then loop again
    
display:
   add   ebx, 96       ;starting ascii code for small letter alphabets
   mov  [sum], ebx     ;done, store result in "sum"
   
   mov  edx, 1     ;message length
   mov  ecx, sum   ;message to write
   mov  ebx, 1     ;file descriptor (stdout)
   mov  eax, 4     ;system call number (sys_write)
   int  0x80       ;call kernel
   
   mov  eax, 1     ;system call number (sys_exit)
   int  0x80       ;call kernel

