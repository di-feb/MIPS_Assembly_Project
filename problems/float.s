########################################################
#
#  It continuously reads real numbers in a loop
#  and prints the value of their real exponent 
#  (i.e., without the sign) with the message EXPONENT=X 
#  and continues with the reading of the next one.
#  If it reads zero, the execution is completed.
# 
#########################################################

.text
    .globl __start
__start:

    li $v0, 4 #display "Give me an float number :"
    la $a0, msg
    syscall

    j Loop1

Loop:
    li $v0, 4 #display "Give me an float number :"
    la $a0, msg1
    syscall

Loop1:
    li $v0, 6   #read float
    syscall

    mov.s $f12, $f0 #print float
    li $v0, 2
    syscall

    mfc1 $t0, $f0

    beqz $t0, End

    li $v0, 4
    la $a0, endl#endl
    syscall

    sll $t0, $t0, 1
    srl $t0, $t0, 24

    addi $t0, $t0, -127

    li $v0, 4 #display "EXPONENT"
    la $a0, prompt
    syscall

    move $a0, $t0 #print int
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, endl#endl
    syscall

    j Loop

End:
    li $v0, 10 # exit
    syscall
.data
endl: .asciiz "\n"
prompt: .asciiz "EXPONENT = "
msg: .asciiz "Give me an float number :"
msg1: .asciiz "Give me the next float number :"
