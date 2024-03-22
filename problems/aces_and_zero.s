    # This is a simple program that takes a number from the user and then divides it by 10 until it reaches 0.
    # It then counts the number of times the number was divisible by 10 and the number of times it was divisible by 1.
    # It then prints out the results.
.text   
        .globl  __start
__start:

    li      $v0,    5                   # Read integer
    syscall 
    move    $s7,    $v0                 # Store input

    add     $s1,    1                   # Set divisor for 1
    add     $s3,    10                  # Set divisor for 10
Loop:   
    div     $s7,    $s3                 # Divide input by 10
    mflo    $s7                         # Store quotient
    mfhi    $t7                         # Store remainder
    beqz    $t7,    Update1             # Check if divisible by 10
    beq     $t7,    $s1,        Update2 # Check if divisible by 1
    j       Loop                        # Repeat

Update1:
    add     $t8,    1                   # Increment count for 10
    beqz    $s7,    End                 # Check if input is 0
    j       Loop                        # Repeat
Update2:
    add     $t9,    1                   # Increment count for 1
    beqz    $s7,    End                 # Check if input is 0
    j       Loop                        # Repeat
End:    
    # Print results
    li      $v0,    4
    la      $a0,    zero
    syscall 
    la      $a0,    endl
    syscall 
    li      $v0,    1
    move    $a0,    $t8
    syscall 
    li      $v0,    4
    la      $a0,    endl
    syscall 

    la      $a0,    ace
    syscall 
    la      $a0,    endl
    syscall 
    li      $v0,    1
    move    $a0,    $t9
    syscall 

    li      $v0,    10
    syscall                             #The end!

.data   
endl:   .asciiz "\n"
buffer: .asciiz "--------------------"
ace:    .asciiz "Aces are "
zero:   .asciiz "Zeros are "