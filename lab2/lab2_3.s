.text                 
    .globl __start    
start:

    la $t0, word + 4
    addu $s0, $t0, $t0

    la $t0, word 
    addui $s1, $t0, 1

    la $t0, word + 8
    addi $s2, $t0, -1

    la $t0, word
    add $s3, $t0, $t0

    li $v0, 10
    syscall #The end!
.data

    word: .word 0xffffffff, 0x77777776, 0x01000000


# .text
# .globl __start
# __start:
# 	la $a0, n1
# 	lw $t0, ($a0)
# 	lw $t1, 4($a0)
# print_nums:
# 	li $v0, 1
# 	move $a0, $t0
# 	syscall
# 	jal println
# 	li $v0, 1
# 	move $a0, $t1
# 	syscall
# 	jal println
# addition_signed:
# 	add $s0, $t0, $t1
# 	move $a0, $s0
# 	li $v0, 1
# 	syscall
# 	jal println
# addition_unsigned:
# 	addu $s1, $t0, $t1
# 	move $a0, $s1
# 	li $v0, 1
# 	syscall
# exit:
# 	li $v0, 10
# 	syscall				#au revoir...
# println:					#pirnt new line function
# 	la $a0, endl
# 	li $v0, 4
# 	syscall
# 	j $ra

# #################################################
# #				data segment								#
# #################################################
# .data
# n1: .word 1073741823, 0x3fffffff
# n2: .word 2147483647, 1
# n3: .word -2147483647, -1
# n4: .word -1, -1
# endl: .asciiz "\n"
