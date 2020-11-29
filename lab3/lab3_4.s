.text
    .globl __start
__start:

        li $v0, 8 #Read string and print it.
        la $a0, buffer
        li $a1, 21 
        syscall
        li $v0, 4 
        syscall

        li $t0, 'a' #Make the upper/lower bounds.
        li $t1, 'z'

loop:   lbu $s0, buffer($t2)
        beqz $s0, end #if we read 0, the end.

        slt $t3, $s0, $t1 #Check if we are out of bounds.
        blt $s0, $t0, store
        bgt $s0, $t1, store

        addi $s0, $s0, -32 #if not, sub ascii code by 32.

store:  sb $s0, caps($t2)#Store the char
        addi $t2, $t2, 1#Update the counter
        j loop#Repeat!
        
end:    la $a0, caps
        syscall
        la $a0, endl #Print endl.
        syscall
        li $v0, 10
        syscall #The end!

.data
endl: .asciiz "\n"
buffer: .asciiz "---------------------"
caps: .asciiz "---------------------"