.text                       #Load words, half, and bytes in different registers
    .globl __start          #unsigned or not and watch the outcome in QtSpim
__start:
    lbu $t0, array_of_bytes + 0
    lhu $t1, array_of_bytes + 0
    lw	$t2, array_of_bytes + 0

    lbu $t3, array_of_bytes + 4
    lhu $t4, array_of_bytes + 4
    lw $t5, array_of_bytes + 4

    lb $t0, array_of_bytes + 0
    lh $t1, array_of_bytes + 0
    lw $t2, array_of_bytes + 0

    lb $t3, array_of_bytes + 4
    lh $t4, array_of_bytes + 4
    lw $t5, array_of_bytes + 4 

    lbu $t6, array_of_bytes + 4
    sb $t6, array_of_bytes + 16 
    li $v0, 0xa
    syscall

.data

array_of_bytes: .byte 0x01, 0x02, 0x03, 0x04, 0x81, 0x82, 0x83, 0x84

         words: .word 0x12345678, 0x87654321

