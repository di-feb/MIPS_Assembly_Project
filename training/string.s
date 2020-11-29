# Διαβάζει έναν 4-ψήφιο οκταδικό αριθμό ως συμβολοσειρά (string) 
# και τον εκτυπώνει ως δυαδικό αριθμό στην κονσόλα. 
# Να κάνετε έλεγχο αν οι χαρακτήρες που δίνονται είναι σωστοί!!.
# Το πρόγραμμα ολοκληρώνεται όταν εισαχθεί η τιμή 0000.


.text
    .globl __start
__start:

    li $v0, 8 #read string
    la $a0, buffer
    li $a1, 5
    syscall

    li $v0 4 #print string
    syscall

    la $a0, endl #endl
    syscall

    li $t0, '0' #Make the upper/lower bounds.
    li $t1, '1'
    li $t2, '2'
    li $t3, '3'
    li $t4, '4'
    li $t5, '5'
    li $t6, '6'
    li $t7, '7'

Loop:
    lbu $s0, buffer($s6)

    beq $s3, 4, Check
    add $s3, $s3, $s0


    blt $s0, $t0, End
    bgt $s0, $t7, End

    beq $s0, $t0, print0
    beq $s0, $t1, print1
    beq $s0, $t2, print2
    beq $s0, $t3, print3
    beq $s0, $t4, print4
    beq $s0, $t5, print5
    beq $s0, $t6, print6
    beq $s0, $t7, print7

    add $s6, $s6, 1
print0:
    li, $v0, 1
    li, $a0, 000
    syscall

    j Loop

print1:
    li, $v0, 1
    li, $a0, 001
    syscall

    j Loop

print2:
    li, $v0, 1
    li, $a0, 010
    syscall

    j Loop

print3:

    li, $v0, 1
    li, $a0, 011
    syscall

    j Loop

print4:
    li, $v0, 1
    li, $a0, 100
    syscall

    j Loop



print5:

    li, $v0, 1
    li, $a0, 101
    syscall


    j Loop
print6:

    li, $v0, 1
    li, $a0, 110
    syscall

    j Loop
print7:

    li, $v0, 1
    li, $a0, 111
    syscall

    j Loop

Check: 
    add $s5, $s5, 192
    beq $s2, $s5, End

End:
    li $v0 4 #display "Invalid character"
    la $a0, Msg
    syscall

    li $v0, 10 # exit
    syscall
.data

endl: .asciiz "\n"
buffer: .asciiz "----"
Msg: .asciiz "Invalid character"