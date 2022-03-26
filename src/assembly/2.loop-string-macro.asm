.model small
.stack 100h
.data
msg db 'This is the message', 10, 13, '$'
.code
write_string macro p1, p2
    mov cx, p2
    mov ah, 9
    lea dx, p1

    print:
    int 21h
    loop print
endm
main proc
    mov ax, @data
    mov ds, ax

    write_string msg, 10

    exit:
    mov ah, 4ch
    int 21h
    main endp
end main