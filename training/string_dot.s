# Να κάνεις σταδιακά ένα string (πχ aaaaaaaaaa):
# aaaaaaaaaa
# .aaaaaaaaa
# ..aaaaaaaa
# ...aaaaaaa 
# κοκ

    .text
        .globl __start
__start:

    li $t0, '.'

Loop:
    lbu $t2, string($t1)
    beqz $t2, End
    sb $t0, string($t1)
    addi $t1, $t1, 1
    li $v0, 4
    la $a0, string
    syscall
    la $a0, endl
    syscall
    j Loop
    


End:
    li $v0, 10
    syscall #The end!

.data
endl: .asciiz "\n"
string: .asciiz "aaaaaaaaaa"