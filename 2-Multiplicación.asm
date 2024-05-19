section .data
    ; Definir las variables de un byte (8 bits)
    
    a db '3' ; Variable a con valor inicial '3'
    b db '2' ; Variable b con valor inicial '2'
    
    mensaje db "El resultado de la multiplicación es: " ; Mensaje para mostrar el producto
    longitud_mensaje equ $ - mensaje 

section .bss
    ; Reservar espacio en memoria para el resultado del producto
    resultado resb 3    

section .text
    global _start

_start:
    ; Cargar y convertir los valores y convertir los caracteres ASCII a valor numérico
    mov al, [a]          
    sub al, '0'         
    
    mov bl, [b]          
    sub bl, '0'         

    mul bl               

    ; Guardar el resultado en memoria
    add al, '0'          ; Convertir la parte baja de AX a carácter ASCII
    mov [resultado], al  

    ; Comprobar si hay una parte alta en AX y almacenarla si es necesario
    mov al, ah           
    add al, '0'          
    mov [resultado + 1], al 

    ; Escribir el mensaje
    mov edx, longitud_mensaje ; Especificar la longitud del mensaje
    mov ecx, mensaje          
    mov ebx, 1                
    mov eax, 4                
    int 0x80                  

    ; Escribir el resultado
    mov ecx, resultado        
    mov edx, 1                ; Longitud del resultado (1 carácter)
    mov ebx, 1                
    mov eax, 4                
    int 0x80                 

    ; Terminar
    mov eax, 1          
    int 0x80   
