# Prints a floating point number
.text
    .globl __start
__start:
    # $f0 has already a value.
    mov.s $f12, $f0 # print float
    li $v0, 2
    syscall

    li $v0,10
    syscall # exit

.data
endl: .asciiz "\n"

## NaN & oo, -oo, print => 0.000