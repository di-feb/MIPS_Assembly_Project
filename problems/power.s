# "Calculation of a number to the power, both given by the user."
# "The program should ask the user for the base and the exponent, and then calculate the result."

    .text
        .globl __start
__start:
    li $v0, 5
    syscall

    move $t0, $v0

    li $v0, 5 
    syscall
    
    addi $t1, $t1, 1
    addi $s0, $s0, 1
    
Loop:
    mult $t0, $s0
    mflo $s0
    beq $t1, $v0, Break

    addi $t1, $t1, 1
    j Loop

Break:
    li $v0, 1
    move $a0, $s0
    syscall

    li $v0, 10
    syscall #The end!

.data
endl: .asciiz "\n"