.data
    array: .word 4,3,9,5,2,1
    separador: .asciiz " | "

.text
    li $t7, 1

ordenar:
    bgt $t7, 5, sair

    li $t1, 0
    li $t2, 0
    li $t3, 4

while:
    bgt $t1, 4, prox_volta

    lw $t4, array($t2)
    lw $t5, array($t3)

    ble $t4, $t5, nao_troca

    sw $t4, array($t3)
    sw $t5, array($t2)

nao_troca:
    addi $t1, $t1, 1
    addi $t2, $t2, 4
    addi $t3, $t3, 4
    j while

prox_volta:
    addi $t7, $t7, 1
    j ordenar

sair:
    li $t6, 0

imprime:
    bgt $t6, 20, fim

    lw $a0, array($t6)
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, separador
    syscall

    addi $t6, $t6, 4
    j imprime

fim:
    li $v0, 10
    syscall
