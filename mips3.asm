.text

.globl __start

__start: 
	
	li $v0, 4 # set up for a write syscall
	la $a0, msg # specify address of the string
	syscall
	
	li $v0, 10
	syscall
	
	li $v0, 1 # $v0 is the syscall variable?
	
	li $a0, 100 # $a0 is the first argument
	syscall

.data

msg:
.asciiz "Hello World!\n"
