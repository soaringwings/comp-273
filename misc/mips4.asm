# arithmetic operations

.text

.globl __start

__start:
	# you have to load word into a register from both variables
	lw $t0, first
	lw $t1, second
	add $t2, $t0, $t1
	sw $t2, sum

	li $v0, 4
	la $a0, sum_label
	syscall

	li $v0, 1
	move $a0, $t2
	syscall
	# you have to do addition on the two registers
	# you have to store the result into memory
	# syscall to print the variable to screen

	li $v0, 4
	la $a0, product_label
	syscall

	mul $t2, $t0, $t1
	sw $t2, product

	li $v0, 1
	move $a0, $t2
	syscall

	li $v0, 4
	la $a0, diff_label
	syscall

	sub $t2, $t0, $t1
	sw $t2, diff
	li $v0, 1
	move $a0, $t2
	syscall
	

.data

first:
.word 1

second:
.word 2

sum:
.space 4

product:
.space 4

diff:
.space 4

sum_label:
.asciiz "Sum:\n"

product_label:
.asciiz "\nProduct:\n"

diff_label:
.asciiz "\nDifference:\n"