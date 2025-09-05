.data
    AnoPedro: .word 2006              
    AnoAbilio: .word 2006                
    msg: .asciiz "Resultado: "  

.text
.globl main
main:

    lw $t0, AnoPedro
    lw $t1, AnoAbilio

    add $t2, $t0, $t1

    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 11
    li $a0, 10
    syscall

    li $v0, 10
    syscall