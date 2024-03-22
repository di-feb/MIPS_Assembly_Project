# It finds for an integer greater than zero, which you will read from the keyboard
#  if it is a multiple of 16, without using the MIPS division operation.

    .text
        .globl __start
__start:

    li $v0, 4
    la $a0, prompt
    syscall

Loop:
    li $v0, 5 #syscall for read_int
    syscall

    bgtz $v0, Break

    li $v0, 4 #syscall for print_str
    la $a0, endl 
    syscall
    

    li $v0, 4 #syscall for print_str
    la $a0, wrong_input 
    syscall

    li $v0, 4 #syscall for print_str
    la $a0, endl 
    syscall

    j Loop


Break:

addi $t0, $t0, 16
addi $s0, $s0, 16

Check:
    beq $t0, $v0, Multiple
    slt $t5, $v0, $t0
    bnez $t5, Not

    add $t0, $t0, $s0
    j Check


Multiple:
    li $v0, 4
    la $a0, endl
    syscall
    la $a0, mult1
    syscall
    j End

Not:
    li $v0, 4
    la $a0, endl
    syscall
    la $a0, not_mult
    syscall
    
End:
    li $v0, 10
    syscall #The end! 



.data
endl: .asciiz "\n"
wrong_input: .asciiz "Enter a POSITIVE integer"
prompt: .asciiz "Enter a positive integer"
mult1: .asciiz "multiple"
not_mult: .asciiz "not multiple"