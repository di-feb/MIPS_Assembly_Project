# Υπολογισμός αθροίσματος 10 ακεραίων που δίνονταν από τον χρήστη

    .text
        .globl __start
__start:

    addi $t2, $t2, 10
Loop:
    beq $t2, $t1, Break 
    li $v0, 5
    syscall

    
    add $t0, $t0, $v0
    addi $t1, $t1, 1
    j Loop
Break:
    li $v0, 1
    move $a0, $t0
    syscall

End:
    li $v0, 10
    syscall #The end!

.data
endl: .asciiz "\n"
buffer: .asciiz "----------"