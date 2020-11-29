# Να διαβάζει από την κονσόλα έναν αριθμό κάθε φορά (ατέρμονα), 
# και να εκτυπώνει τον αντίστοιχο χαρακτήρα ενός string 20 χαρακτήρων που έχεις αποθηκευμένο στο .data. 
# πχ αν έχω το abcdefghijklmnopqrst, και μου δοθεί το 5, εκτυπώνεται το "e". 
# Aν δοθεί το 0 το πρόγραμμα να τερματίζει.

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