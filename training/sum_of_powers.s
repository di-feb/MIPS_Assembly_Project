# Διαβάζει συνεχώς σε ένα βρόχο θετικούς ακεραίους αριθμούς και τους εκτυπώνει σαν άθροισμα δυνάμεων του 10.
# Δηλαδή για τον δεκαδικό αριθμό 137 θα εκτυπώσει POWERS-SUM=1*10^2 + 3*10^1 + 7*10^0. 
# Τερματίζεται η εκτέλεση όταν διαβαστεί το 0. Μη κάνετε έλεγχο αρνητικού αριθμού.

    .text
        .globl __start
__start:

Start:
    jal read_int_and_print

    beqz $t0, End
    addi $t1, 10
    addi $t2, 0

Loop1:
    div $t0, $t1
    mfhi $s0
    mflo $s1

    sb $s0, buffer($t2)
    addi $t2, $t2, 1
    move $t0, $s1
    bnez $s1, Loop1

Print1:
    la $a0, prompt 
    jal print_str

Print:
    addi $t2, $t2, -1

    

    li $v0, 1 #syscall for print_int
    lb $a0, buffer($t2)
    syscall

    la $a0, star 
    jal print_str
    la $a0, power 
    jal print_str
    li $v0, 1 #syscall for print_int
    move $a0, $t2
    syscall
    bnez $t2, Plus
    beqz $t2, Start

    
Plus:
    la $a0, plus 
    jal print_str
    j Print

End:
    li $v0, 10
    syscall #The end!

read_int_and_print:
    li $v0, 5 #syscall for read_int
    syscall

    move $a0, $v0
    move $t0, $v0 #save int
    
    li $v0, 1 #syscall for print_int
    syscall

    li $v0, 4 #syscall for print_str
    la $a0, endl 
    syscall
    j $ra

print_str:
    li $v0, 4 #syscall for print_str 
    syscall
    j $ra

.data
prompt:.asciiz "POWERS-SUM = "
endl: .asciiz "\n"
star: .asciiz "*"
power: .asciiz "10^"
plus: .asciiz " + " 
buffer: .asciiz "                          "