    .text
        .globl __start
__start:

End:
    add $t1, 2
    sub $t0, $t1, $t1
    li $v0, 10
    syscall #The end!

.data
endl: .asciiz "\n"