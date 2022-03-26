.model small
.stack 100h
.data
arr db 3, 5, 3, 6, 4, 6, 8, 7, 2, 9
len dw 10
min db 99
endmsg db 'Program ended$'
.code
main proc
    mov ax, @data
    mov ds, ax

    lea si, arr
    mov cx, [len]
    mov bl, min

    for:
    mov bh, [si]
    compare:
    cmp bh, bl
    jle assign
    jmp after_compare

    assign:
    mov bl, bh

    after_compare:
    add si, 1
    loop for


    add bl, '0'

    mov ah, 2
    mov dl, bl
    int 21h

    exit:
    mov ah, 4ch
    main endp
end main