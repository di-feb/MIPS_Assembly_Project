.text                 #Read two integers, print them, and then print their 
    .globl __start    #sum and their difference.
start:
    add $t0, $t0, $zero

rw: move $a1, $a0
    li $v0, 5 #syscall for read_int
    syscall
    move $a0, $v0  
    move $s3, $v0 #keep the first value 
    li $v0, 1 #syscall for print_int
    syscall
    li $v0, 4
    la $a0, endl #print \n
    syscall
    move $a0, $s3 #return it here
    addi $t0, $t0, 1 #update the counter

    bne	$t0, 2, rw	# if $t0 != $t1 then go to rw
    add $s0, $a1, $a0
    sub $s1, $a1, $a0

    li $v0, 1
    move $a0, $s0
    syscall

    li $v0, 4
    la $a0, endl #print \n
    syscall

    li $v0, 1
    move $a0, $s1
    syscall

    li $v0, 10
    syscall #The end!

.data
    endl: .asciiz "\n"  
    
