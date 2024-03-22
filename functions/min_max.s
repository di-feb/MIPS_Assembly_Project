#################################################
# This MIPS assembly code is a program that finds the minimum and maximum of four numbers.
# The numbers are initialized in the registers $a0, $a1, $a2, and $a3. 
# The program then calls a function find_minmax which calculates the minimum and maximum of these four numbers.
# The find_minmax function works by first initializing the minimum and maximum values to the value in $a0.
# It then compares these values with the values in $a1, $a2, and $a3,
# updating the minimum and maximum values as necessary.
# The minimum and maximum values are then moved to the $v0 and $v1 registers respectively.
# After the find_minmax function is called, the main program prints the maximum and minimum values. The program then exits.
#################################################
.text
.globl __start
__start:
    # start of main program
    li $a0,-10 # Initialize a variables
    li $a1,-30 #
    li $a2,120 #
    li $a3,200 #

    li $s0,1 # Initialize s variables
    li $s1,2 #
    li $s2,3 #
    li $s3,4 #

    jal find_minmax
    move $t0,$v0
    move $t1,$v1
    la $a0,max
    li $v0,4
    syscall # display "Max is :"
    move $a0,$t0
    li $v0,1
    syscall # display max
    la $a0,endl
    li $v0,4
    syscall # display end of line
    la $a0,min
    li $v0,4
    syscall # display "Min is :"
    move $a0,$t1
    li $v0,1
    syscall # display min
    la $a0,endl
    li $v0,4
    syscall # display end of line
    li $v0,10
    syscall # exit
# end of main program

# start of procedure
find_minmax:
            addi $sp, $sp, -8
            sw $s0, 0($sp) #min
            sw $s1, 4($sp) #max
            move $s0, $a0 #Initiallize min

            ble $s0, $a1, sec_cmp_min #First compare
            move $s0, $a1

sec_cmp_min:
            ble $s0, $a2, third_cmp_max #Sec compare
            move $s0, $a2

third_cmp_min:
            ble $s0, $a3, find_max #Third compare
            move $s0, $a3

find_max:        
            move $s1, $a0 #Initiallize max
            bge $s1, $a1, sec_cmp_max
            move $s1, $a1

sec_cmp_max:
            bge $s1, $a2, third_cmp_max
            move $s1, $a2

third_cmp_max:
            bge $s1, $a3, loop7
            move $s1, $a3

loop7:      
            move $v0, $s1 #move the min to $v0
            move $v1, $s0 #move the max to $v1
            lw $s0, 0($sp) 
            lw $s1, 4($sp)
            addi $sp, $sp, 8
            jr $ra
# end of procedure
 .data
max: .asciiz "Max is : "
min: .asciiz "Min is : "
endl: .asciiz "\n"
#################################################
# #
# End of program #
# #
#################################################