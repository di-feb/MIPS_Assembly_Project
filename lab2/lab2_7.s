.text                 
    .globl __start    
start:
    
    lw $t0, a_word
    lw $t1, a_word + 4

    mult $t0, $t1
    mflo $s0
    sw $s0, a_word + 16

    mfhi $s1
    sw $s1, a_word + 12
    
    multu $t0, $t1
    sw $s0, a_word + 12

    mfhi $s1
    sw $s1, a_word + 16

    li $v0, 10
    syscall #The end!
.data

    a_word: .word 0xffffffff, 0x2 
    endl: .asciiz "\n"
