.text                 #Comvert a 32-bit number to it's equal but in Gray 
    .globl __start    #codification
start:

    srl $t0, $s0, 1   #By shifting the number one bit right is like you xor each one 
    xor $s0, $s0, $t0 #of his bits with the next one(from right to the left)

    li $v0, 10
    syscall #The end!
.data