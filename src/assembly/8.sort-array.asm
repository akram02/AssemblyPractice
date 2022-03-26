.model small
.stack 100h
.data
arr db 3, 5, 1, 6, 4, 6, 8, 1, 2, 9
len dw 10
endmsg db 'Program ended$'
.code
main proc
    mov ax, @data
    mov ds, ax

    mov cx, [len]
    outerfor:
    push cx
    mov dx, [len]
    sub dx, 1
    mov cx, dx
    lea si, arr
    mov bl, [si]
    add si, 1
    innerfor:
    mov bh, [si]

    cmp bl, bh
    jg swap
    jmp next

    swap:
    mov dh, bl
    mov bl, bh
    mov bh, dh
    mov [si], bh
    sub si, 1
    mov [si], bl
    add si, 1


    next:
    mov bl, [si]
    add si, 1
    loop innerfor

    pop cx
    loop outerfor


    mov cx, [len]
    lea si, arr
    print:
    mov bh, [si]
    add bh, '0'
    mov ah, 2
    mov dl, bh
    int 21h
    add si, 1
    loop print

    exit:
    mov ah, 4ch
    int 21h
    main endp
end main