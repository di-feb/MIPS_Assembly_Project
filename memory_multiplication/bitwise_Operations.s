# Description: This MIPS assembly code performs a series of bitwise operations on two words loaded from memory.
.text                 
    .globl __start    
start:
    
    lw $t0, my_word
    lw $t1, my_word + 4
    addu $s0, $t0, $t1

    srl $t0, $t0, 31 #clear the content of the registers and play with
    srl $t1, $t1, 31 #their list significant bit.
    srl $s0, $s0, 31
    
    not $s0, $s0        
    and $s1, $s0, $t0   #Making Si’Ai + Si’Bi + AiBi.
    and $s2, $s0,  $t1
    and $s3, $t0,  $t1

    or $s4, $s1, $s2
    or $s5, $s4, $s3


    li $v0, 10
    syscall #The end!
.data

    my_word: .word 0x11111111, 0x22222222


    