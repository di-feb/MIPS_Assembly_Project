#################################################
# #
# lab5_3a.s #
# Integer factorial #
# #
#################################################
 .text
 .globl __start
__start:
    la $a0,n
    lw $t0,0($a0) # $t0 = n
    li $t2,1 # $t2 index i=1..n
    li $t1,1 # $t1 contains i!

    mtc1 $t1, $f1 # move number from int reg to float reg
    cvt.s.w $f1, $f1 # convert int to float
    
loop:  
    mtc1 $t2, $f2
    cvt.s.w $f2, $f2

    mul.s $f1, $f1, $f2

    move $a0, $t2
    li $v0,1
    syscall # display i

    la $a0, msg1
    li $v0, 4
    syscall # display "! is :"


    mov.s $f12, $f1
    li $v0, 2
    syscall # display i!

    la $a0, endl
    li $v0, 4
    syscall # print end of line

    addi $t2, $t2, 1 # i=i+1
    ble $t2, $t0, loop # repeat if i<=n
    
    li $v0, 10 # exit
    syscall
    .data
n: .word 25
msg1: .asciiz "! is :"
endl: .asciiz "\n"
#################################################
# #
# End of program #
# #
#################################################