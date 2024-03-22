# Description: This MIPS assembly code performs a 64-bit addition operation on two 64-bit numbers,
# each represented by two 32-bit words. It first adds the least significant 32 bits of each number,
# stores the result, and then adds the most significant 32 bits. 
# It then calculates the carry from the first addition and adds it to the result of the second addition.
# The final 64-bit result is stored in memory. The program ends with a system call.
# The data section contains two 64-bit numbers represented as four 32-bit words

.text                 
    .globl __start    
start:
    
    lw $t0, a_word + 4 #Most-significant 32-bit of a_word.
    lw $t1, b_word + 4 #Most-significant 32-bit of b_word.
    lw $t2, a_word
    lw $t3, b_word 

    addu $s0, $t2, $t3 #Make the sum 0-31,
    sw $s0, a_word + 16 #and store it.

    addu $s1, $t0, $t1 #lost carry from here!!!!!!! 

    srl $t2, $t2, 31 #clear the content of the registers and play with
    srl $t3, $t3, 31 #their list significant bit.
    srl $s0, $s0, 31
    
    not $s0, $s0        
    and $s2, $s0, $t2   #Making Si’Ai + Si’Bi + AiBi.
    and $s3, $s0,  $t3
    and $s4, $t2,  $t3

    or $s5, $s2, $s3
    or $s6, $s5, $s4

    addu $s7, $s1, $s6 #Add the carry from 0-31
    sw $s7, a_word + 20 #store the sum 32-63

    srl $s1, $s1, 31 #clear the content of the registers and play with  
    srl $s6, $s6, 31 #their list significant bit.
    srl $s7, $s7, 31
    
    not $s7, $s7        
    and $s2, $s7, $s1   #Making Si’Ai + Si’Bi + AiBi.
    and $s3, $s7,  $s6
    and $s4, $s1,  $s6

    or $s5, $s2, $s3
    or $s6, $s5, $s4 #Compute the last carry.
    
    li $v0, 10
    syscall #The end!
.data

    a_word: .word 0xffffffff, 0xffffffff
    b_word: .word 0x0, 0x1