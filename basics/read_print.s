.text                       #Read an integer and print its value
    .globl __start
start:

    li $v0, 5 #syscall for read_int
    syscall

    move $a0, $v0
    
    li $v0, 1 #syscall for print_int
    syscall

    li $v0, 10
    syscall #The end!
    
.data

