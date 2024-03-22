# This MIPS assembly code is a recursive program that reads an integer from the user,
# prints it, and then calls a function func.
# The function func checks if the number is less than 1.
# If it is, the function returns.
# If it's not, the function subtracts 1 from the number and calls itself.
# This continues until the number is less than 1.
# After each recursive call, the number is incremented by 1 and printed.
# This results in a backtrace of the recursive calls.
# The program also calculates the amount of memory used by the stack during the recursive calls.
# It does this by saving the value of the stack pointer before and after the recursive calls,
# and then subtracting the two values.
# The result is then printed.


.text
    .globl __start
__start:
# start of main program
        la $a0,prompt
        li $v0,4
        syscall # display "Enter integer number :"

        li $v0,5
        syscall # read integer

        move $a0, $v0 # save integer

        li $v0, 1 #print integer
        syscall

        move $t1, $a0 #save $a0

        la $a0, endl #print endl
        li $v0, 4
        syscall

        move $a0, $t1 #restore $a0

        move $v1, $sp 

        jal func #step into function

        sub $t1, $sp, $v1

        la $a0,answer
        li $v0,4
        syscall # display "We have use"

        li $v0, 1
        move $a0, $t1 #print the result
        syscall

        la $a0,answer2
        li $v0,4
        syscall # display "bytes of memory for the stack "

        la $a0,endl
        li $v0,4
        syscall # display end of line 

        move $a0,$t0 
        li $v0,10
        syscall # exit

# end of main program
# start of procedure
func:
        addi $sp, $sp, -4 # adjust stack for an item
        sw $ra, 0($sp) # save return address

        slti $t0, $a0, 1 #check if number is < 1
        bne $t0, $zero, L1

        addi $a0, $a0, -1 # reduce by 1
        jal func

L1:     
        move $t0, $sp
        ble $v1, $t0, End
        move $v1, $sp

End:    
        li $v0, 1 #print $a0
        syscall

        move $t2, $a0

        la $a0, endl #print endl
        li $v0, 4
        syscall

        lw $ra, 0($sp) # restore return address
        addi $sp, $sp, 4 # pop one item from stack

        move $a0, $t2

        addi $a0, $a0, 1 # increase a0 by 1 for backtrace!
        jr $ra 
# end of procedure
 .data
prompt: .asciiz "Enter integer number :"
endl: .asciiz "\n"
answer: .asciiz "We have use "
answer2: .asciiz " bytes of memory for the stack"
#################################################
# #
# End of program #
# #
#################################################