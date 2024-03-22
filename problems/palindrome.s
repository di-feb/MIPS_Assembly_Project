# Read an int, reverse it and see if it ιs palindrome.
# If it is, print "Palindrome", else print "Not a palindrome".

    .text
        .globl __start
__start:

    li $v0, 5
    syscall
    move $t0, $v0

    add $t1, 10
Loop:
    div $t0, $t1
    mflo $t0
    mfhi $t2

    sb $t2, buffer($t3)
    add $t3, 1

    beqz $t0, Break
    j Loop

Break:
    add $t3, -1
    lbu $s0, buffer($t3)
    lbu $s1, buffer($s3)
    add $s3, 1
    bne $s0, $s1, No
    ble $t3, $s3, Palindrome
    j Break

No:
    li $v0, 4
    la $a0, no
    syscall
    j End

Palindrome:
    li $v0, 4
    la $a0, yes
    syscall
End:
    li $v0, 10
    syscall #The end!

.data
endl: .asciiz "\n"
buffer: .asciiz "      "
no: .asciiz "Not a palindrome"
yes:.asciiz "Palindrome"