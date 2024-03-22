# Indefinitely, 2 numbers are given by the user.
# If either of the 2 is not a 4-digit number, an error message is displayed.
# Otherwise, the number of common digits they have in the same position is printed

    .text
        .globl __start
__start:
    li $v0, 5
    syscall
    move $s0, $v0

    li $v0, 5
    syscall
    move $s2, $v0

    add $t0, 10
    add $s1, 4
    add $s7, 8
    add $s4, -1
    add $s6, -2
Loop:
    beqz $s0, Test1
    div $s0, $t0
    mflo $s0
    mfhi $s3
    sb $s3, buffer($t1)
    addi $t1, $t1, 1
    j Loop

Test1:
    beq $t1, $s1, Loop2
    li $v0, 4
    la $a0, wrong_input
    j End

Loop2:
    beqz $s2, Test2
    div $s2, $t0
    mflo $s2
    mfhi $s3
    sb $s3, buffer1($t4)
    addi $t4, $t4, 1
    j Loop2

Test2:
    beq $t4, $s1, Calc
    li $v0, 4
    la $a0, wrong_input
    j End

Calc:
    addi $t1, $t1, -1
    addi $t4, $t4, -1


Calc1:
    lbu $t9, buffer($t1)
    lbu $t8, buffer1($t4)
    addi $t1, $t1, -1
    addi $t4, $t4, -1
    beq $t9, $t8, Update
    beq $t1, $s4 Print
    j Calc1

Update:

    beq $t1, $s6 Print
    addi $s5, $s5, 1
    j Calc1

Print:
    li $v0, 1
    move $a0, $s5
    syscall
    j End

End:
    li $v0, 10
    syscall #The end!

.data
endl: .asciiz "\n"
wrong_input: .asciiz "You did not enter a Four digit number"
buffer: .asciiz "     "
buffer1: .asciiz "     "