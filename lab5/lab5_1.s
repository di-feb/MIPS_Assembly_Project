.text
    .globl __start
__start:

    li $v0, 4 # display "Enter floating point number :"
    la $a0, prompt
    syscall

    li $v0, 6 # read float
    syscall

    mov.s $f12, $f0 # print float
    li $v0, 2
    syscall

    li $v0,10
    syscall # exit

.data
prompt: .asciiz "Enter floating point number :"
endl: .asciiz "\n"