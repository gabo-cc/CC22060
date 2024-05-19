section .data
    ; Declarar variables de 32 bits
    divisor dd '9'  ; Declarar el divisor
    dividendo dd '4'; Declarar el dividendo
    message db "El resultado es: "
    message_len equ $ - message

section .bss
    ; Reservar espacio (32 bits)
    quotient resd 1

section .text
    global _start

_start:
    ; Cargar valor del divisor en eax y convertir de ASCII a valor numérico
    mov eax, [divisor]
    sub eax, '0'

    ; Cargar valor del dividendo en ebx y convertir de ASCII a valor numérico
    mov ebx, [dividendo]
    sub ebx, '0'

    ; Preparar eax para la división extendiendo el signo
    cdq

    ; Dividir edx:eax por ebx
    div ebx

    ; Convertir el cociente a carácter ASCII
    add eax, '0'

    ; Guardar el cociente en la variable quotient
    mov [quotient], eax

    ; Escribir el mensaje
    mov edx, message_len
    mov ecx, message
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Escribir el cociente
    mov ecx, quotient
    mov edx, 1 
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Terminar
    mov eax, 1
    int 0x80
