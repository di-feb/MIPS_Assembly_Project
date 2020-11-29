.text
    .globl __start
__start:

        li $v0, 5 #Read int.
        syscall
        move $a0, $v0 #Print int.
        li $v0, 1
        syscall

        move $s0, $a0 #Save the integer.

        la $a0, endl #Print endl.
        li $v0, 4
        syscall

        add $s2, $s2, $zero #Make a counter.
        addi $s3, $s3, 3 #Make the upperbount.

start:  li $v0, 5 #Read the divisor and print it.
        syscall
        move $a0, $v0 #Print int.
        li $v0, 1
        syscall
        move $t0, $a0 #Save the divisor.

        

        la $a0, endl #Print endl.
        li $v0, 4
        syscall

        div $s0, $t0
        mfhi $t1
        bne $t1, $zero, start

        la $a0, divided #Print the message!
        li $v0, 4
        syscall

        move $a0, $t0 #Print the divisor.
        li $v0, 1
        syscall

        li $v0, 10
        syscall #The end!

.data
endl: .asciiz "\n"
divided: .asciiz "divided by "