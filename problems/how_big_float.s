# It reads a float, if it's > 1000.0 it displays 'big = the number',
#  if it's <= 1000.0 it displays 'too small', if it's = 0 it exits.
    .text
        .globl __start
__start:
Loop:
    li $v0, 6
    syscall


    l.s $f1, limit

    cvt.w.s $f0, $f0
    mfc1 $t0, $f0
    beqz $t0, End

    cvt.w.s $f1, $f1
    mfc1 $t1, $f1

    bgt $t0, $t1, Big
    li $v0, 4
    la $a0, small
    syscall
    la $a0, endl
    syscall
    j Loop

Big:
    li $v0, 4
    la $a0, big
    syscall
    la $a0, endl
    syscall
    j Loop

End:
    li $v0, 10
    syscall #The end!

.data
endl: .asciiz "\n"
limit: .float 1000.0
small: .asciiz "too small"
big: .asciiz "BIG"