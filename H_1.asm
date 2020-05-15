include console.inc

.data
    N dd ?

.code
Start:
    ClrScr
    ConsoleTitle 'Mikhelson German, 112 group, task1(block1) "degree three"'
    inintln N,'Insert the number: '
    mov EBX, 3   ; 3
    mov SI, 0    ; K
    mov ECX, N
    sub EDX, EDX   ; остаток после деление(т.е. потом проверяется нацело 
                 ;поделилось на 3 или нет,
                 ;т.е. осуществляется проверка на степень 3)
step1: 
    cmp ECX, 1   ; если 1,то выход иначе продолжаем
    jE fin
    mov EAX, ECX ; подготовка к делению
    div EBX      ; (EDX, EAX) / EBX => EAX := div, EDX := mod
    cmp EDX, 0   ; EDX ?= 0
    jNE ng       ; Если остаток не целый,то число не степень 3 и 
                 ; переходим к метке ng
    inc SI       ; K := K + 1;
    mov ECX, EAX
    jmp step1
  
ng: mov SI, -1   ; K := - 1
    jmp fin
  
fin: 
    outintln SI
    
    pause 'Press Enter'
    exit
end Start