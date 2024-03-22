# It continuously reads integers and finds if they are prime or not.
# It prints a corresponding message. The program ends when 0 is given as a number.

    .text
        .globl __start
__start:

Loop1:
    li $v0, 5
    syscall

    beqz $v0, End

    addi $t0, $t0, 2

    div $v0, $t0
    mflo $s0

Loop2:
    div $v0, $t0
    mfhi $s1
    beqz $s1, Not
    beq $t0, $s0, Prime
    addi $t0, $t0, 1
    j Loop2

Prime:
    li $v0, 4
    la $a0, prime
    syscall
    la $a0, endl
    syscall
    j Loop1

Not:
    li $v0, 4
    la $a0, no
    syscall
    la $a0, endl
    syscall
    j Loop1

End:
    li $v0, 10
    syscall #The end!

.data
endl: .asciiz "\n"
prime: .asciiz "prime"
no: .asciiz "not prime"