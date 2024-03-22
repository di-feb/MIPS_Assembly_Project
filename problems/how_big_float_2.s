# It reads a float, if it's > 1000.0 it displays 'big = the number',
#  if it's <= 1000.0 it displays 'too small', if it's = 0 it exits.

    .text
        .globl __start
__start:
Loop:
    li $v0, 6
    syscall

    l.s $f1, zero
    l.s $f2, bount
    c.eq.s 0, $f1, $f0
    bc1t 0, End

    c.lt.s $f0, $f2
    bc1t Small
    li $v0, 4
    la $a0, big
    syscall
    la $a0, endl
    syscall
    j Loop

Small:
    li $v0, 4
    la $a0, small
    syscall
    la $a0, endl
    syscall
    j Loop


End:
    li $v0, 10
    syscall #The end!

.data
endl: .asciiz "\n"
bount: .float 1000.0
zero: .float 0.0
big:.asciiz "BIG"
small: .asciiz "small"