# It continuously reads a number from the console,
# and prints the corresponding character of a 20-character string that you have stored in .data.
# For example, if I have 'abcdefghijklmnopqrst', and 5 is given, it prints 'e'.
# If 0 is given, the program terminates.

    .text
        .globl __start
__start:

Loop:
    li $v0, 5 #syscall for read_int
    syscall

    beqz $v0, End

    addi $v0, $v0, -1
    lbu $t0, string($v0)
    li $v0, 11
    move $a0, $t0
    syscall

    li $v0, 4 #syscall for print_str
    la $a0, endl #load adress 
    syscall

    j Loop


End:
    li $v0, 10
    syscall #The end!

.data
endl: .asciiz "\n"
string: .asciiz "abcdefghijklmnopqrst"