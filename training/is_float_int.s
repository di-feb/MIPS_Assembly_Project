# Να διαβαζει συνεχώς floats ... 
# Οταν ο float ειναι μηδεν να σταματαει
# Να εκτυπωνει αν ειναι ακέραιος ή οχι

    .text
        .globl __start
__start:
Loop:
    li $v0, 6
    syscall

    l.s $f1, zero
    c.eq.s 0, $f0, $f1
    bc1t 0, End


    cvt.w.s $f2, $f0
    mfc1 $t0, $f2

    mtc1 $t0, $f3
    cvt.s.w $f3, $f3

    c.eq.s $f0, $f3
    bc1t 0, Yes 
    li $v0, 4
    la $a0, is_not_int
    syscall
    la $a0, endl
    syscall
    j Loop


Yes:
    li $v0, 4
    la $a0, is_int
    syscall
    la $a0, endl
    syscall
    j Loop


End:
    li $v0, 10
    syscall #The end!

.data
endl: .asciiz "\n"
zero: .float 0.0
is_int: .asciiz "Is int"
is_not_int: .asciiz "Is not int"