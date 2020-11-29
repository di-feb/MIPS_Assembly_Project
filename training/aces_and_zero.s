# Nα διαβασετε ενας ιντ και να βρειτε ποσα μηδενικα και ποσους ασους εχει.
    .text
        .globl __start
__start:

    li $v0, 5
    syscall
    move $s7, $v0

    add $s1, 1
    add $s3, 10
Loop:
    div $s7, $s3
    mflo $s7
    mfhi $t7
    beqz $t7, Update1
    beq $t7, $s1, Update2
    j Loop

Update1:
    add $t8, 1
    beqz $s7, End
    j Loop
Update2:
    add $t9, 1
    beqz $s7, End
    j Loop
End:
    li $v0, 4
    la $a0, zero
    syscall
    la $a0, endl
    syscall
    li $v0, 1 
    move $a0, $t8
    syscall
    li $v0, 4
    la $a0, endl
    syscall

    la $a0, ace
    syscall
    la $a0, endl
    syscall
    li $v0, 1 
    move $a0, $t9
    syscall

    li $v0, 10
    syscall #The end!

.data
endl: .asciiz "\n"
buffer: .asciiz "--------------------"
ace: .asciiz "Aces are "
zero: .asciiz "Zeros are "