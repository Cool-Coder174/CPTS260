# Binary Search (MIPS)
# User enters a sorted array of 10 numbers, then a key to search for.
# Prints the index if found, else not found message.

.data
prompt:     .asciiz "Enter 10 sorted integers:\n"
inp_msg:    .asciiz "Enter value to search for: "
found_msg:  .asciiz "Value found at index: "
notfound:   .asciiz "Value not found.\n"
array:      .space 40     # 10 words * 4 bytes

.text
.globl main

main:
    # Prompt for array
    li $v0, 4
    la $a0, prompt
    syscall

    # Read 10 integers into array
    la $t0, array
    li $t1, 0
read_loop:
    bge $t1, 10, read_done
    li $v0, 5
    syscall
    sw $v0, 0($t0)
    addi $t0, $t0, 4
    addi $t1, $t1, 1
    j read_loop

read_done:
    # Prompt for value to search
    li $v0, 4
    la $a0, inp_msg
    syscall

    li $v0, 5
    syscall
    move $t5, $v0      # key

    # Set up pointers/indices
    li $t0, 0          # left = 0
    li $t1, 9          # right = 9

    la $t2, array      # base pointer

search_loop:
    bgt $t0, $t1, not_found
    add $t3, $t0, $t1      # t3 = left + right
    sra $t3, $t3, 1        # mid = (left + right)/2

    mul $t4, $t3, 4        # offset = mid * 4
    add $t4, $t4, $t2      # address = array + offset
    lw $t6, 0($t4)         # arr[mid]

    beq $t6, $t5, found
    blt $t5, $t6, search_left

    # Go right (key > arr[mid])
    addi $t0, $t3, 1
    j search_loop

search_left:
    # Go left (key < arr[mid])
    addi $t1, $t3, -1
    j search_loop

found:
    li $v0, 4
    la $a0, found_msg
    syscall

    move $a0, $t3      # mid index
    li $v0, 1
    syscall
    j exit

not_found:
    li $v0, 4
    la $a0, notfound
    syscall

exit:
    li $v0, 10
    syscall

