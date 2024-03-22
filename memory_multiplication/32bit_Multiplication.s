# Description: This MIPS assembly code performs both signed and unsigned
# multiplication on two 32-bit numbers loaded from memory.
# It first performs signed multiplication and stores the lower and higher 32 bits of the result in memory.
# It then performs unsigned multiplication and stores the lower and higher 32 bits of the result in memory.
# The program ends with a system call. The data section contains two words to be multiplied.
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
