.text                 
    .globl __start    
start:
    
    li $s0, 0x12345678 #Initiallize register $s0

    andi $t2, $s0, 0xff00 #Take the two least-significant bytes 
    sll $t2, $t2, 8 

    andi $t3, $s0, 0xff
    sll $t3, $t3, 24

    li $s1, 0xff000000 #Take the two most-significant bytes
    and $t0, $s0, $s1 #Shift them to put them in the right place
    srl $t0, $t0, 24

    li $s2, 0xff0000
    and $t1, $s0, $s2
    srl $t1, $t1, 8

    or $t4, $t0, $t1
    or $t5, $t2, $t3
    or $t7, $t4, $t5


    li $v0, 10
    syscall #The end!
.data
    

