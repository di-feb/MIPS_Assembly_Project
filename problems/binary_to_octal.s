# Convert a number from binary to octal
# The program starts by reading an integer from the user.
# It then sets up a loop where it divides the number by 1000 (representing the binary 111 in decimal), 
# which effectively isolates the three least significant bits of the binary number.
# The remainder of this division (which will be a number between 0 and 7) is compared to the binary representations of these numbers (0 to 7).
# Depending on the result of the comparison, the program jumps to a label that prints the corresponding octal digit.
# This process repeats until the input number has been fully processed, at which point the program ends.

    .text
        .globl __start
__start:
    li $v0, 5 # syscall code for read integer
    syscall # read integer from user
    move $s0, $v0 # move input to $s0
    add $t0, 1000 # setup binary 111 for division
    # setup binary representations of 0-7
    add $t1, 0
    add $t2, 1
    add $t3, 10
    add $t4, 11
    add $t5, 100
    add $t6, 101
    add $t7, 110
    add $t8, 111

Loop:
    div $s0, $t0 # divide input by binary 111
    mflo $s0 # move quotient to $s0
    mfhi $s1 # move remainder to $s1
    # compare remainder to binary 0-7 and jump to corresponding label
    beq $s1, $t1, Zero 
    beq $s1, $t2, One 
    beq $s1, $t3, Two
    beq $s1, $t4, Three 
    beq $s1, $t5, Four 
    beq $s1, $t6, Five 
    beq $s1, $t7, Six 
    beq $s1, $t8, Seven 

# Each section prints corresponding octal digit and checks if input is 0
Zero:
    li $v0, 4 # syscall code for print string
    la $a0, zero # load address of string '0'
    syscall # print '0'
    beqz $s0, End # if input is 0, end program
    j Loop # else, continue loop

# Repeat the same process for the remaining octal digits (1-7)
One:
    li $v0, 4
    la $a0, one
    syscall
    beqz $s0, End
    j Loop

Two:
    li $v0, 4
    la $a0, two
    syscall
    beqz $s0, End
    j Loop

Three:
    li $v0, 4
    la $a0, three
    syscall
    beqz $s0, End
    j Loop

Four:
    li $v0, 4
    la $a0, four
    syscall
    beqz $s0, End
    j Loop

Five:
    li $v0, 4
    la $a0, five
    syscall
    beqz $s0, End
    j Loop

Six:
    li $v0, 4
    la $a0, six
    syscall
    beqz $s0, End
    j Loop

Seven:
    li $v0, 4
    la $a0, seven
    syscall
    beqz $s0, End
    j Loop


End:
    li $v0, 10 # syscall code for exit
    syscall # end program

.data
# Define strings for octal digits 0-7
endl: .asciiz "\n"
zero: .asciiz "0"
one: .asciiz "1"
two: .asciiz "2"
tree: .asciiz "3"
four: .asciiz "4"
five: .asciiz "5"
six: .asciiz "6"
seven: .asciiz "7"
