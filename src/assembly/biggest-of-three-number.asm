.model small
.stack 100h
.code
main proc
    mov ah, 1

    int 21h
    mov bh, al

    int 21h
    mov bl, al

    int 21h
    mov cl, al

    cmp bh, bl
    jge bh_or_cl
    jmp bl_or_cl

    bh_or_cl:
    cmp bh, cl
    jge ans_bh
    jmp ans_cl

    bl_or_cl:
    cmp bl, cl
    jge ans_bl
    jmp ans_cl

    ans_bh:
    mov ah, 2
    mov dl, bh
    int 21h
    jmp exit

    ans_bl:
    mov ah, 2
    mov dl, bl
    int 21h
    jmp exit

    ans_cl:
    mov ah, 2
    mov dl, cl
    int 21h
    jmp exit

    exit:
    mov ah, 4ch
    int 21h
    main endp
end main