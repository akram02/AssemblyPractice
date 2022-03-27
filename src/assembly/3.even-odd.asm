.model small
.stack 100h
.data
msg_even db 10, 13, 'Number is even$'
msg_odd db 10, 13, 'Number is odd$'
.code
print macro msg
    mov ah, 9
    lea dx, msg
    int 21h
endm

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
    print msg_even
    jmp exit

    odd:
    print msg_odd
    jmp exit

    exit:
    mov ah, 4ch
    int 21h
    main endp
end main