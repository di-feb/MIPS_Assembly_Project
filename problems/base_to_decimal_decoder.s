# Decoding a number from a given base to decimal number
# The program takes a base and a number in that base and decodes it to a decimal number
# The program checks if the base is between 2 and 10 and if the number is a 5-digit number
# If the base is wrong, the program asks for a new base
# If the number is wrong, the program asks for a new number
# The program uses the formula: 1x6^4 + 2x 6^3 + 2 x 6^2 + 4 x 6^1 + 5 x 6^0

    .text
        .globl __start
__start:
Loop0:
    li $v0, 4 #display "Give base:"
    la $a0, base
    syscall

    la $a0, endl #display endl
    syscall

Loop:
    li $v0, 5 #read base 
    syscall
    move $a0, $v0
    move $t0, $v0 #save base
    li $v0, 1 #print base
    syscall

    addi $t3, $t0, -1 #make the upper bount for base

    li $v0, 4
    la $a0, endl
    syscall

    beqz $t0, End 

    li $t1, 2 # make the upper and lower bounds
    li $t2, 10

    bgt $t0, $t2, Wrong1
    blt $t0, $t1, Wrong1

    li $v0, 4 #display: ""Give 5-digit number in base"
    la $a0, give
    syscall
    li $v0, 1 #print base
    move $a0, $t0
    syscall
    li $v0, 4#display ":"
    la $a0, anw
    syscall

    la $a0, endl
    syscall

Loop2:
    la $v0, 5
    syscall
    move $s0, $v0 #save number'
    move $s3, $v0 #save number, we will need it later, when we will do computations to find the equal decimal number

    li $v0, 1   #print number
    move $a0, $s0
    syscall

    li $v0, 4
    la $a0, endl
    syscall

    li $t9, 10
    li $t6, 5
Check:
    div $s0, $t9 #take each digit of the number and check it 
    mflo $s0 #if he give a wrong num read a new mumber again till he give it right
    mfhi $s1

    add $s6, 1
    bgt $s6, $t6, Wrong2
    
    beqz $s0, Break


    bgt $s1, $t3, Wrong2
    blt $s1, $zero, Wrong2 
    j Check

Wrong2: #He gave wrong number
    li $v0, 4
    la $a0, wrong_num
    syscall
    la $a0, endl
    syscall
    move $s6, $zero
    j Loop2
    

Wrong1: # He gave wrong base
    li $v0, 4
    la $a0, wrong
    syscall
    la $a0, endl
    syscall
    j Loop

Break:
    li $v0, 4 
    la $a0, decimal
    syscall
    la $a0, endl
    syscall

    add $t7, 1
# if base == 6 and we have an number like 12245, we can decode it like 1x6^4 + 2x 6^3 + 2 x 6^2 + 4 x 6^1 + 5 x 6^0

    div $s3, $t9 #take each digit of the number
    mflo $s3 
    mfhi $s4 # the nubmer we need for mult
    mfhi $t8 # save it again, we will need it to do the last calculation (add) for the 5 x 6^0
Loop3:
    div $s3, $t9 #take each digit of the number
    mflo $s3 
    mfhi $s4 # the nubmer we need for mult

    mult $t0, $t7
    mflo $t7
    
    mult $t7, $s4
    mflo $t5

    add $t4, $t4, $t5
    add $s7, 1
    beq $s7, $t6, Print
    j Loop3

Print:
    add $t4, $t8, $t4

    li $v0, 1 
    move $a0, $t4
    syscall
    li $v0, 4
    la $a0, endl
    syscall
    move $t0, $zero #clear all registers
    move $t1, $zero
    move $t2, $zero
    move $t3, $zero
    move $t4, $zero
    move $t5, $zero
    move $t6, $zero
    move $t7, $zero
    move $t8, $zero
    move $t9, $zero
    move $s0, $zero
    move $s1, $zero
    move $s2, $zero
    move $s3, $zero
    move $s4, $zero
    move $s5, $zero
    move $s6, $zero
    move $s7, $zero
    j Loop0

End:
    li $v0, 10
    syscall #The end!

.data
endl: .asciiz "\n"
buffer: .space 11
base: .asciiz "Give base:"
wrong: .asciiz "Wrong base; give again:"
give: .asciiz "Give 5-digit number in base "
anw: .asciiz ":"
decimal: .asciiz "Number in decimal is:"
wrong_num: .asciiz "Wrong number; give again:"