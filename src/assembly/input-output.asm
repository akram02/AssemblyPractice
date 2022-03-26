;.model small means we have code segment and data segment
;.stack 100h indicates memory size
;.code
main proc ; proc = procedure
    mov ah, 1   ; a function to input integer
    int 21h     ; calling input integer function. input data goes to al
    mov bl, al  ; insert input data to bl

    mov ah, 2   ; display function
    mov dl, bl  ; output data should goes to dl. here we insert data to dl
    int 21h     ; finishing output / execute function

    exit:
    mov ah, 4ch
    int 21h
    main endp
end main
