.model small
.stack 100h
main proc
    mov cx, 26
    mov ah, 2
    mov dl, 'A'

    level1:
    int 21h
    inc dl
    loop level1

    exit:
    mov ah, 4ch
    main endp
end main