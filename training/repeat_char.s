# Να έχεις ένα string στο τμήμα data (πχ abcdefghij) 
# και να βαζεις σαν input έναν αριθμό (1-4) 
# και να σου βγάζει output 
# πχ για 2:aabbccdd..., για 3:aaabbbcccddd... κλπ, 
# χωρίς κάποια συνθήκη για να τερματίζει, δλδ ατέρμονα loop

    .text
        .globl __start
__start:
    li $v0, 5
    syscall

    add $t1, 1
    add $t2, 2
    add $t3, 3
    add $t4, 4

    beq $v0, $t1, Case1
    beq $v0, $t2, Case2
    beq $v0, $t3, Case3
    beq $v0, $t4, Case4

Case1:
    li $v0, 4
    la $a0, string
    syscall
    j End

Case2:
    lbu $s0, string($t5)
    beqz $s0, Print
    sb $s0, buffer($t7)
    addi $t6, $t7, 1
    sb $s0, buffer($t6)
    addi $t7, $t7, 2
    addi $t5, $t5, 1
    j Case2

Case3:
    lbu $s0, string($t5)
    beqz $s0, Print
    sb $s0, buffer($t7)
    addi $t6, $t7, 1
    sb $s0, buffer($t6)
    addi $t8, $t6, 1
    sb $s0, buffer($t8)
    addi $t7, $t7, 3
    addi $t5, $t5, 1
    j Case3

Case4:
    lbu $s0, string($t5)
    beqz $s0, Print
    sb $s0, buffer($t7)
    addi $t6, $t7, 1
    sb $s0, buffer($t6)
    addi $t8, $t6, 1
    sb $s0, buffer($t8)
    addi $t9, $t8, 1
    sb $s0, buffer($t9)
    addi $t7, $t7, 4
    addi $t5, $t5, 1
    j Case4

Print:
    li $v0, 4
    la $a0, buffer
    syscall



End:
    li $v0, 10
    syscall #The end!

.data
endl: .asciiz "\n"
string: .asciiz "abcdefghij"
buffer: .asciiz "           "


