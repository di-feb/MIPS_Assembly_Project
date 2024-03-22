# It reads a number from the console each time (endlessly),
# and records how many positive numbers have been given so far.
# It should print if 0 is given.

    .text
        .globl __start
__start:

Loop:

    li $v0, 5 #syscall for read_int
    syscall
    
    bgtz $v0, Store
    bge $v0 ,$zero, Print
    j Loop


Store:
    sb $v0, buffer($t2)
    addi $t2, $t2, 1
    move $s0, $t2
    beqz $v0, Print
    j Loop

Print:
    beqz $t2, Restore
    lbu $t0, buffer($t2)

    li $v0, 4 #syscall for print_strint
    la $a0, buffer
    syscall


    la $a0, space
    syscall
    
    addi $t2, $t2, -1
    j Print

Restore:
    move $t2, $s0
    j Loop

    li $v0, 10
    syscall #The end!

.data
endl: .asciiz "\n"
buffer: .asciiz "                                "
space: .asciiz " "