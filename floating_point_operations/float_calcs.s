# Performs a series of calculations involving floating point numbers,
# including special cases like zero, positive infinity, negative infinity,
# and NaN (Not a Number). 
# After each calculation, it prints the result and a newline.
.text
    .globl __start
__start:

    l.s $f0, x #Make the 1st calculation
    l.s $f1, y
    mul.s $f2, $f1, $f0

    mov.s $f12, $f2 #print it
    li $v0,2
    syscall 

    li $v0, 4 # print endl
    la $a0, Endl
    syscall

    l.s $f0, x #Make the 2nd calculation
    l.s $f1, m_inf
    mul.s $f2, $f1, $f0

    mov.s $f12, $f2 #print it
    li $v0,2
    syscall 

    li $v0, 4 # print endl
    la $a0, Endl
    syscall

    l.s $f0, y #Make the 3rd calculation
    l.s $f1, zer_f
    div.s $f2, $f0, $f1

    mov.s $f12, $f2 #print it
    li $v0,2
    syscall 

    li $v0, 4 # print endl
    la $a0, Endl
    syscall

    l.s $f0, zer_f #Make the 4rth calculation
    l.s $f1, zer_f
    div.s $f2, $f1, $f0

    mov.s $f12, $f2 #print it
    li $v0,2
    syscall 

    li $v0, 4 # print endl
    la $a0, Endl
    syscall

    l.s $f0, zer_f #Make the 5th calculation
    l.s $f1, p_inf
    mul.s $f2, $f1, $f0

    mov.s $f12, $f2 #print it
    li $v0,2
    syscall 

    li $v0, 4 # print endl
    la $a0, Endl
    syscall

    l.s $f0, p_inf #Make the 6th calculation
    l.s $f1, m_inf
    div.s $f2, $f1, $f0

    mov.s $f12, $f2 #print it
    li $v0,2
    syscall 

    li $v0, 4 # print endl
    la $a0, Endl
    syscall

    l.s $f0, p_inf #Make the 7th calculation
    l.s $f1, m_inf
    add.s $f2, $f1, $f0

    mov.s $f12, $f2 #print it
    li $v0,2
    syscall 

    li $v0, 4 # print endl
    la $a0, Endl
    syscall

    l.s $f0, x #Make the 8th calculation
    l.s $f1, nan
    add.s $f2, $f1, $f0

    mov.s $f12, $f2 #print it
    li $v0,2
    syscall 

    li $v0,10
    syscall # exit
.data
.data
zer_f:   .float 0.0
m_inf:   .word 0xff800000
p_inf:   .word 0x7f800000
nan:     .word 0x7fffffff
x:       .float 55.0
y:       .float -55.0
Endl: .asciiz "\n"
