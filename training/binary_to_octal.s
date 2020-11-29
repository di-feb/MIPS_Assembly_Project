# Μετατρέψτε έναν αριθμό από δυαδικό σε οκταδικο.
    .text
        .globl __start
__start:
    li $v0, 5
    syscall
    move $s0, $v0
    add $t0, 1000
    add $t1, 0
    add $t2, 1
    add $t3, 10
    add $t4, 11
    add $t5, 100
    add $t6, 101
    add $t7, 110
    add $t8, 111

Loop:
    div $s0, $t0
    mflo $s0
    mfhi $s1
    beq $s1, $t1, Zero 
    beq $s1, $t2, One 
    beq $s1, $t3, Two
    beq $s1, $t4, Three 
    beq $s1, $t5, Four 
    beq $s1, $t6, Five 
    beq $s1, $t7, Six 
    beq $s1, $t8, Seven 

Zero:
    li $v0, 4
    la $a0, zero
    syscall
    beqz $s0, End
    j Loop

One:
    li $v0, 4
    la $a0, one
    syscall
    beqz $s0, End
    j Loop

Two:
    li $v0, 4
    la $a0, two
    syscall
    beqz $s0, End
    j Loop

Three:
    li $v0, 4
    la $a0, three
    syscall
    beqz $s0, End
    j Loop

Four:
    li $v0, 4
    la $a0, four
    syscall
    beqz $s0, End
    j Loop

Five:
    li $v0, 4
    la $a0, five
    syscall
    beqz $s0, End
    j Loop

Six:
    li $v0, 4
    la $a0, six
    syscall
    beqz $s0, End
    j Loop

Seven:
    li $v0, 4
    la $a0, seven
    syscall
    beqz $s0, End
    j Loop


End:
    li $v0, 10
    syscall #The end!

.data
endl: .asciiz "\n"
zero: .asciiz "0"
one: .asciiz "1"
two: .asciiz "2"
tree: .asciiz "3"
four: .asciiz "4"
five: .asciiz "5"
six: .asciiz "6"
seven: .asciiz "7"
