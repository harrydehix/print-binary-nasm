%include "io.inc"

; PRINT_BINARY size, value
%macro PRINT_BINARY 2
    push eax
    push ebx
    push ecx
    %if %1 = 4
        mov ebx, %2
    %elif %1 = 2
        mov bx, %2
        shl ebx, 16
    %elif %1 = 1
        mov bl, %2
        shl ebx, 24
    %else
        %error Unsupported size!
    %endif
    mov dl, %1
    
    
    jmp outer_condition
    outer:
        rol ebx, 8
        dec dl
        print_bl:
        mov dh, 0
        jmp condition1
        print_bit:
            mov cl, dh
            mov al, bl
            shl al, cl
            shr al, cl
            
            mov ch, 8
            sub ch, cl
            dec ch
            mov cl, ch
            shr al, cl
            PRINT_DEC 1, al
        increment_counter:
            inc dh
        condition1:
            cmp dh, 8
            jl print_bit
    outer_condition:
        cmp dl, 1
        jge outer

    pop ecx
    pop ebx
    pop eax
%endmacro
