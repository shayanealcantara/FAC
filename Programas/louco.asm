.LC0:
        .string "Escreva os n\303\272mero: "
.LC1:
        .string "%d"
.LC2:
        .string "deu certo"
.LC3:
        .string "Entrada incorreta"
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     edi, OFFSET FLAT:.LC0
        call    puts
        lea     rax, [rbp-4]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC1
        mov     eax, 0
        call    scanf
        mov     eax, DWORD PTR [rbp-4]
        test    eax, eax
        js      .L2
        mov     eax, DWORD PTR [rbp-4]
        cmp     eax, 127
        jg      .L2
        mov     edi, OFFSET FLAT:.LC2
        mov     eax, 0
        call    printf
        jmp     .L3
.L2:
        mov     edi, OFFSET FLAT:.LC3
        mov     eax, 0
        call    printf
.L3:
        mov     eax, 0
        leave
        ret