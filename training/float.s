########################################################
#
# Διαβάζει συνεχώς σε ένα βρόχο πραγματικούς αριθμούς 
# και εκτυπώνει την τιμή του πραγματικού τους εκθέτη 
# (δηλαδή χωρίς την πόλωση) με το μήνυμα EXPONENT=X 
# και συνεχίζει με την ανάγνωση του επόμενου. 
# Αν διαβάσει το μηδέν ολοκληρώνεται η εκτέλεση.
# 
##################################################

.text
    .globl __start
__start:

    li $v0, 4 #display "Give me an float number :"
    la $a0, msg
    syscall

    j Loop1

Loop:
    li $v0, 4 #display "Give me an float number :"
    la $a0, msg1
    syscall

Loop1:
    li $v0, 6   #read float
    syscall

    mov.s $f12, $f0 #print float
    li $v0, 2
    syscall

    mfc1 $t0, $f0

    beqz $t0, End

    li $v0, 4
    la $a0, endl#endl
    syscall

    sll $t0, $t0, 1
    srl $t0, $t0, 24

    addi $t0, $t0, -127

    li $v0, 4 #display "EXPONENT"
    la $a0, prompt
    syscall

    move $a0, $t0 #print int
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, endl#endl
    syscall

    j Loop

End:
    li $v0, 10 # exit
    syscall
.data
endl: .asciiz "\n"
prompt: .asciiz "EXPONENT = "
msg: .asciiz "Give me an float number :"
msg1: .asciiz "Give me the next float number :"
