.model small
.stack 100h
.data
msg_even db 10, 13, 'Number is even$'
msg_odd db 10, 13, 'Number is odd$'
.code

main proc
    mov ax, @data
    mov ds, ax

    mov ah, 1
    int 21h


    mov bl, 2
    div bl

    mov al, ah

    cmp al, 0
    jg odd

    even:
    mov ah, 9
    lea dx, msg_even
    int 21h
    jmp exit

    odd:
    mov ah, 9
    lea dx, msg_odd
    int 21h
    jmp exit

    exit:
    mov ah, 4ch
    int 21h
    main endp
end main