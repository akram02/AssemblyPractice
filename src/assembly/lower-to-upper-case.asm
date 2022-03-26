.model small
.stack 100h
.data
a db 'Lower form $'
b db 10, 13, 'Upper form $'
.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, a
    int 21h

    mov ah, 1
    int 21h
    mov bh, al

    sub bh, 'a'
    mov bl, 'A'
    add bl, bh

    mov ah, 9
    lea dx, b
    int 21h

    mov ah, 2
    mov dl, bl
    int 21h

    exit:
    mov ah, 4ch
    int 21h
    main endp
end main