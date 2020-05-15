include console.inc

.data
    S db "Not Prime", 0
    Q db "Prime", 0
.code
Start:
    ClrScr
    ConsoleTitle 'Mikhelson German, 112 group, task2(block1) "Prime"'
    inint EAX,'Insert the number: '
    mov EBX, 2    ; на каждом шаге цикла будем делить 
                  ; на это число и после деления увеличивать на 1
    mov ECX, EAX  ; ECX = EAX
    mov ESI, EAX  ; ESI = EAX, так как значение в EAX может менятся
    sub EDX, EDX  ; EDX = 0
    div EBX       ; (EDX, EAX) / EBX => EAX = div, EDX = mod
    mov EDX, 0
    xchg EAX, ECX ; EAX = N, а ECX = N div 2
    mov EDI, offset Q 
cycle:
    cmp EBX, ECX  ; EBX ?= ECX
    jA fin        ; если EBX > N/2, то заканчиваем
    mov EAX, ESI  ; EAX = ESI
    div EBX       ; (EDX, EAX) / EBX => EAX = div, EDX = mod
    cmp EDX, 0    ; Т.е. если остаток ноль, то число автоматом не простое
    jE ng
    mov EDX, 0    ; после проверки,каждый раз остаток обнуляем
    inc EBX
    jmp cycle

ng:
    mov EDI, offset S 

fin: outstrln EDI

    pause 'Press Enter'
    exit
end Start