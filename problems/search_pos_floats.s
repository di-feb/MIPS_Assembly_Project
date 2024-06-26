# It reads a float and will print each time it finds a positive one.
# It will terminate when 0 is entered.

    .text
        .globl __start
__start:
Loop:
    li $v0, 6
    syscall

    mfc1 $t0, $f0
    beqz $t0, End
    srl $t0, $t0, 31
    beqz $t0, Print 
    j Loop

Print:
    li $v0, 2
    mov.s $f12, $f0
    syscall

    li $v0, 4
    la $a0, endl
    syscall
    j Loop

End:
    li $v0, 10
    syscall #The end!

.data
endl: .asciiz "\n"