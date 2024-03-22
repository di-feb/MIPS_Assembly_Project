#################################################
# This MIPS assembly code is a recursive program that reads an integer from the user,
# prints it, and then calls a function func.
# The function func checks if the number is less than 1.
# If it is, the function returns.
# If it's not, the function subtracts 1 from the number and calls itself.
# This continues until the number is less than 1.
# After each recursive call, the number is incremented by 1 and printed.
# This results in a backtrace of the recursive calls.
#################################################
.text
    .globl __start
__start:
# start of main program
        la $a0,prompt
        li $v0,4
        syscall # display "Enter integer number :"
        li $v0,5
        syscall # read integer
        move $t0,$v0 #save it 
        li $v0, 1
        move $a0, $t0 #print integer
        syscall
        jal func
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
        bne $t0, $zero, end

        addi $a0, $a0, -1 # reduce by 1
        jal func

end:    lw $ra, 0($sp) # restore return address
        addi $sp, $sp, 4 # pop one item from stack
        li $v0, 1
        syscall
        addi $a0, $a0, 1 # increase a0 by 1 for backtrace!
        jr $ra 
# end of procedure
 .data
prompt: .asciiz "Enter integer number :"
endl: .asciiz "\n"
#################################################
# #
# End of program #
# #
#################################################