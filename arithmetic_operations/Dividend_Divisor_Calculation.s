# Description: This MIPS assembly code prompts the user to input a dividend and a divisor,
# performs division, and then displays the quotient and remainder.
# It first prompts and reads the dividend, then prompts and reads the divisor.
# It then performs the division operation,
# storing the quotient and remainder in separate registers.
# The quotient and remainder are then displayed to the user.
# The program ends with a system call.
# The data section contains strings used for user prompts and messages.
.text
    .globl __start
__start:

# Input
    la $a0,dividend
    li $v0,4
    syscall # prompt for dividend
    li $v0,5
    syscall # read dividend
    move $t0,$v0 # dividend in $t0
    li $v0,1
    move $a0, $t0  # dividend in $a0
    syscall #print dividend

    la $a0,endl
    li $v0,4
    syscall # newline

    la $a0,divisor
    li $v0,4
    syscall # prompt for divisor
    li $v0,5
    syscall # read divisor
    move $t1,$v0 # divisor in $t1
    li $v0,1
    move $a0, $t1  # divisor in $a0
    syscall #print divisor

    la $a0,endl
    li $v0,4
    syscall # newline

    div $t0, $t1
    mflo $t4
    mfhi $t5

    #Output
    la $a0,quotient
    li $v0,4
    syscall # display "quotient is :"
    move $a0,$t4
    li $v0,1
    syscall # display quotient
    la $a0,endl
    li $v0,4
    syscall # newline 

    la $a0,remainder
    li $v0,4
    syscall # display "remainder is :"
    move $a0,$t5
    li $v0,1
    syscall # display remainder

    li $v0,10
    syscall # exit 

.data
    dividend: .asciiz "Enter dividend:"
    divisor: .asciiz "Enter divisor:"
    endl: .asciiz "\n"
    quotient: .asciiz "quotient is :"
    remainder: .asciiz "remainder is :" 
