.text                   #Read a string and prints 
    .globl __start      #the first five chars from it.
start:


    jal read_string_and_print
    la $a0, string #load adress
    sb $zero 5($a0) #stop at the fifth char
    syscall
    
    li $v0, 0xa
    syscall #End

read_string_and_print:
    li $v0, 8 #syscall for read_str
    la $a0, string #buffer
    li $a1, 11 #length + 1
    syscall

    li $v0, 4 #syscall for print_str
    la $a0, string #load adress 
    syscall

    la $a0, endl 
    syscall
    j $ra

.data
    string: .asciiz "-----------"
    endl: .asciiz "\n"