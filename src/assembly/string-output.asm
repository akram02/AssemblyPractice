.model small ; another large
.stack 100h
.data
m db 'I love Bangladesh $'
.code

main proc
    ; 9-> string output

    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, m    ; lea = load effective address
    int 21h

    exit:
    mov ah, 4ch
    int 21h
    main endp
end main