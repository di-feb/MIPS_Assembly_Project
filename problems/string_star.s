# Takes a string (from the console or data), let's say 'abcd',
# and prints the following: bcd acd abd abc

    .text
        .globl __start
__start:
    li $v0, 4 #syscall for print_str
    la $a0, string #load adress 
    syscall

    move $t0, $a0
    move $t1, $a0
    la $s0, star

    la $a0, endl
    syscall

Loop:   
    move $a0, $t1
    lb $t2, 0($t0)          # get str[i]
    beqz $t2, End           # if char == '\0' stop

    sb $s0, 0($t0)          # place '*' at str[i]
    move $a0, $t1           # print the new string
    syscall

    la $a0, endl
    syscall

    sb $t2, 0($t0)          # put str[i] back to its place

    addi $t0, $t0, 1        # update the counter
    j Loop

End:
    li $v0, 10
    syscall #The end!

.data
endl: .asciiz "\n"
string: .asciiz "abcd"
star: .asciiz "*"