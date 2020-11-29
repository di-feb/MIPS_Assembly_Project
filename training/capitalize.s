# Να γράψετε ένα πρόγραμμα στο οποίο αν θα εισάγουμε τον χαρακτήρα 'a' θα μας εμφανίζει μια συμβολοσειρά (στο τμήμα data), 
# η οποία έχει κεφαλαία ΚΑΙ μικρά μέσα, μόνο με μικρά, ενώ αν εισάγουμε τον χαρακτήρα 'A', θα την εμφανίζει μόνο με κεφαλαία.

    .text
        .globl __start
__start:

Loop:
    li $v0, 8
    la $a0, string
    li $a1, 2
    syscall

    lbu $t0, string($t1)
    addi $s7, $s7, 'Z'
    addi $s0, $s0, 'a'
    addi $s1, $s1, 'A'

    beq $t0, $s0, Case1
    beq $t0, $s1, Case2

    j Loop

Case1: 
    lbu $t2, buffer($t1)
    beqz $t2, End
    blt $t2, $s0, Change1
    addi $t1, $t1, 1
    j Case1

Change1:
    addi $t2, $t2, 32
    sb $t2, buffer($t1)
    j Case1

Case2: 
    lbu $t2, buffer($t1)
    beqz $t2, End
    bgt $t2, $s7, Change2
    addi $t1, $t1, 1
    j Case2

Change2:
    addi $t2, $t2, -32
    sb $t2, buffer($t1)
    j Case2



End:
    li $v0, 4
    la $a0, buffer
    syscall
    li $v0, 10
    syscall #The end!



.data
endl: .asciiz "\n"
string: .asciiz "--"
buffer: .asciiz "AAAaaa"