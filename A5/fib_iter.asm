# Fibonacci Iterative Version (MIPS)
# This program reads n and prints the nth Fibonacci number using a loop.

.data
prompt:     .asciiz "Enter n for Fibonacci(n): "
result:     .asciiz "Fibonacci(n) = "

.text
.globl main

main:
    # Print prompt
    li $v0, 4
    la $a0, prompt
    syscall

    # Read integer n
    li $v0, 5
    syscall
    move $t0, $v0         # n in $t0

    # Handle n==0 and n==1 directly
    blez $t0, fib_zero
    li $t1, 1
    beq $t0, $t1, fib_one

    # Set up initial values for the loop
    li $t2, 0             # fib0 = 0
    li $t3, 1             # fib1 = 1
    li $t4, 2             # i = 2

fib_loop:
    bgt $t4, $t0, print_fib
    add $t5, $t2, $t3     # fib_next = fib0 + fib1
    move $t2, $t3         # fib0 = fib1
    move $t3, $t5         # fib1 = fib_next
    addi $t4, $t4, 1      # i++
    j fib_loop

print_fib:
    # Print result
    li $v0, 4
    la $a0, result
    syscall

    move $a0, $t3         # $t3 has result
    li $v0, 1
    syscall
    j exit

fib_zero:
    # n == 0 case
    li $v0, 4
    la $a0, result
    syscall
    li $a0, 0
    li $v0, 1
    syscall
    j exit

fib_one:
    # n == 1 case
    li $v0, 4
    la $a0, result
    syscall
    li $a0, 1
    li $v0, 1
    syscall
    j exit

exit:
    li $v0, 10
    syscall

