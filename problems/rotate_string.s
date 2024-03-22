# This MIPS assembly code rotates a string stored in the buffer.
# The string is "abcd". 
# The rotation is done by shifting the characters in the string one position to the left in a loop.
# After each rotation, the string is printed to the console. 
# The rotation continues indefinitely because there is no termination condition in the loop.
# The program ends with a syscall to exit the program, but this line is never reached due to the infinite loop.

    .text
        .globl __start
__start:

    li $v0, 4 #syscall for print_str
    la $a0, buffer #load adress 
    syscall

    addi $s4 ,$s4, -1
    addi $t0, $t0, 0
    addi $t1, $t1, 1
    addi $t2, $t2, 2
    addi $t3, $t3, 3
Loop:
    lbu $s0, buffer($t0)
    lbu $s1, buffer($t1)
    lbu $s2, buffer($t2)
    lbu $s3, buffer($t3)

    addi $t0, $t0, -1
    addi $t1, $t1, -1
    addi $t2, $t2, -1
    addi $t3, $t3, -1

    beq $t0, $s4, T0
    beq $t1, $s4, T1
    beq $t2, $s4, T2
    beq $t3, $s4, T3
    
T0:
    addi $t0, $t0, 4
    j store
T1:
    addi $t1, $t1, 4
    j store
T2:
    addi $t2, $t2, 4
    j store
T3:
    addi $t3, $t3, 4
    j store

store:
    sb $s0, buffer($t0)
    sb $s1, buffer($t1)
    sb $s2, buffer($t2)
    sb $s3, buffer($t3)

    li $v0, 4 #syscall for print_str
    la $a0, endl
    syscall
    la $a0, buffer #load adress 
    syscall

j Loop





    li $v0, 10
    syscall #The end!

.data
endl: .asciiz "\n"
buffer: .asciiz "abcd"