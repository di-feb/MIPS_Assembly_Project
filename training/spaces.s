# Έχουμε μια συμβολοσειρά στη μνήμη, η οποία έχει χαρακτήρες με ορισμένα κενά ανάμεσα τους, δηλαδή είναι της μορφής "a bcd efg h ij 012 345 6 7 89". 
# Διαβάζουμε από την κονσόλα το χαρακτήρα Space, το αποθηκεύουμε σε έναν καταχωρητή, και:
#     α) διατρέχουμε τη συμβολοσειρά και ψάχνουμε να βρούμε πόσα space υπάρχουν μέσα σε αυτή 
#        και βάζουμε τους υπόλοιπους χαρακτήρες της συμβολοσειράς σε μια νέα χωρίς κενά μεταξύ τους.

#     β)Η συμβολοσειρά που φτιάξαμε από το α,είναι της μορφής "abcdefghij0123456789". 
#       Να πάρουμε τους χαρακτήρες a0, b1, c2... και να τους βάλουμε σε μια νέα συμβολοσεορά, προσθέτοντας ένα κενό ανάμεσα στο κάθε ζευγάρι, 
#       δλδ η νέα συμβολοσειρά θα είναι της μορφής "a0 b1 c2...".


    .text
        .globl __start
__start:
    li $v0, 12
    syscall

    move $t0, $v0
    add $t7, 10
    add $s7, 1
    add $s5, 2
Loop:
    lbu $t1, string($t2)
    beqz $t1, Break
    add $t2, 1
    beq $t1, $t0, Update

    sb $t1, buffer($t3)
    add $t3, 1
    j Loop

Update:
    add $t4, 1
    j Loop

Break:
    lb $t5, buffer($t6)
    add $t6, 1
    lb $t8, buffer($t7)
    add $t7,1
    beqz $t8, End
    sb $t5, buffer2($t9)
    add $t9, 1
    sb $t8, buffer2($s7)
    addi $s7, 1
    sb $t0, buffer2($s5)
    addi $s5, 1
    j Break

End:
    li $v0, 1
    move $a0, $t4
    syscall
    li $v0, 4
    la $a0, endl
    syscall
    la $a0, buffer2
    syscall

    li $v0, 10
    syscall #The end!

.data
endl: .asciiz "\n"
string: .asciiz "a bcd efg h ij 012 345 6 7 89"
buffer: .space 21
buffer2: .space 31