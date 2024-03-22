# Performs operations on memory addresses with offsets.

.text                 
    .globl __start    
start:

    la $t0, word + 4
    addu $s0, $t0, $t0

    la $t0, word 
    addui $s1, $t0, 1

    la $t0, word + 8
    addi $s2, $t0, -1

    la $t0, word
    add $s3, $t0, $t0

    li $v0, 10
    syscall #The end!
.data

    word: .word 0xffffffff, 0x77777776, 0x01000000

