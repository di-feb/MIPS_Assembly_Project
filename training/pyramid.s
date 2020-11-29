# Να έχεις ένα string 10 χαρακτήρων στο data (πχ abcdefghijk) και να πρεπει να εκτυπώνει τον πρώτο με τον τελευταίο, 
# μετά δέυτερο με τον προτελευταίο κοκ, με κενά ανάμεσα τους, δηλαδη να σχιματίζει κατι σαν πυραμίδα, και μετά το αντίστροφο 
# (δλδ και την αναποδη πυραμίδα)
# a         k 
#  b       j 
#   c     i 
#    d   h
#     e g
#      f 
#      f 
#     e g 
#    d   h 
#   c     i 
#  b        j 
# a          k 
    .text
        .globl __start
__start:
    la $s0, string

    addi $t9, $t9, ' '
    addi $t0, $t0, 10
    addi $t2, $t2, 1
    addi $t3, $t3, 10
    addi $t4, $t4, 6
    addi $s5, $s5, 12

Loop:
    beq $t2, $t3, Print
    sb $t9, string($t2)
    addi $t2, $t2, 1
    j Loop

Print: 
    li $v0, 4 
    la $a0, string
    syscall
    la $a0, endl
    syscall
    addi $s1, $s1, 1
    j Restore

Check:
    bge $s1, $t4, Update
    bge $s1, $s5, End
    addi $t1, $t1, 1
    addi $t2, $t1, 1
    addi $t3, $t3, -1
    j Loop

Update:
    addi $t1, $t1, -1
    addi $t3, $t3, 1
    addi $t2, $t1, 1
    j Loop2

Loop2:
    beq $t2, $t3, Print
    sb $t9, string($t2)
    addi $t2, $t2, 1
    j Loop2

Restore:
    beq $s7, $t3, Check
    lbu $s6, buffer($s7)
    sb $s6, buffer($s7)
    addi $s7, $s7, 1
    j Restore
End:
    li $v0, 10
    syscall #The end!

.data
endl: .asciiz "\n"
string: .asciiz "abcdefghijk"
buffer: .asciiz "abcdefghijk"