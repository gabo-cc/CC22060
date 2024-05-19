section .data

;Declaraciones de variables de 16 bits
    a dw '6';Variable a con valor inicial '6'
    b dw '1'    ;Variable b con valor inicial '1'
    c dw '1'    ;Variable c con valor inicial '1'
    mensaje db  "El resultado de la resta es: " 
    longitud_mensaje equ $ - mensaje ; Calcular longitud del mensaje

section .bss
    ; Reservar espacio en memoria para el resultado
    resultado resw 1 
    
section .text
    global _start

_start:
    ; Cargar y convertir los valores y Convertir los caracteres ASCII a valor numérico
    mov eax, [a] 
    sub eax, '0'
    
    mov ebx, [b] 
    sub ebx, '0' 
    ;
    mov ecx, [c] 
    sub ecx, '0' 

    ; Realizar las restas: (a - b) - c
    sub eax, ebx ; Calcular a - b
    sub eax, ecx ; Calcular (a - b) - c

    ; Convertir el resultado numérico de vuelta a carácter ASCII
    add eax, '0' ; Convertir valor numérico a carácter ASCII

    ; Guardar el resultado en memoria
    mov [resultado], eax ; Almacenar el resultado en la variable resultado

    ; Escribir el mensaje
    mov edx, longitud_mensaje
    mov ecx, mensaje          
    mov ebx, 1                
    mov eax, 4                
    int 0x80                 

    ; Escribir el resultado
    mov ecx, resultado        
    mov edx, 1               
    mov ebx, 1               
    mov eax, 4               
    int 0x80                  

    ; Terminar el programa
    mov eax, 1               
    int 0x80                 
