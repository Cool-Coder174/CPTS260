# Reads n and prints Fibonacci(n) using recursion.

.data
prompt:     .asciiz "Enter n for Recursive Fibonacci(n): "
result:     .asciiz "Fibonacci(n) = "

.text
.globl main

main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $a0, $v0

    # Call recursive function
    jal fib_rec

    # Print result
    li $v0, 4
    la $a0, result
    syscall

    move $a0, $v0      # Return value from function in $v0
    li $v0, 1
    syscall

    # Exit
    li $v0, 10
    syscall

# fib_rec(n): returns Fibonacci(n) in $v0
fib_rec:
    # Base cases
    li $t0, 1
    blez $a0, fib_rec_zero
    beq $a0, $t0, fib_rec_one

    # Recursive case: fib(n-1) + fib(n-2)
    addi $sp, $sp, -8      # Make room for 2 items on stack
    sw $ra, 4($sp)         # Save return address
    sw $a0, 0($sp)         # Save n

    addi $a0, $a0, -1
    jal fib_rec
    move $t1, $v0          # fib(n-1) result in $t1

    lw $a0, 0($sp)         # Restore n
    addi $a0, $a0, -2
    jal fib_rec
    add $v0, $t1, $v0      # fib(n-1) + fib(n-2)

    lw $ra, 4($sp)         # Restore return address
    addi $sp, $sp, 8       # Pop stack
    jr $ra

fib_rec_zero:
    li $v0, 0
    jr $ra

fib_rec_one:
    li $v0, 1
    jr $ra

