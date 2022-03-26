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

    check_lower:
    cmp al, '0'
    jge check_upper
    jmp exit

    check_upper:
    cmp al, '9'
    jle print:
    jmp exit

    print:
    mov ah, 2
    lea dl, al
    int 21h
    jmp exit

    exit:
    mov ah, 4ch
    int 21h
    main endp
end main