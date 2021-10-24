# maximum.asm program
#

.data
	Ask: .asciiz "Enter the next number:\n"
	Maxword: .asciiz "Maximum: "
    Newline: .asciiz "\n"

#Text Area (i.e. instructions)
.text

main:
	#take first input
	li $v0 4
	la $a0 Ask
	syscall

	li $v0, 5
	syscall	

	#take second input
	move $t1, $v0
	li $v0 4
	la $a0 Ask
	syscall

	li $v0, 5
	syscall	

	#take the third
	move $t2, $v0
	li $v0 4
	la $a0 Ask
	syscall

	li $v0, 5
	syscall

	move $t3, $v0
	move $t0, $t1
	bge $t2, $t1 max1 
	j after_branches 

max1:
	move $t0 $t2
	j after_branches
	
after_branches:
	bge $t3, $t0 max2
	j after_branches1

max2:
	move $t0 $t3
	j after_branches1

after_branches1:
	li $v0 4
	la $a0 Maxword
	syscall
	
	li $v0 1
	move $a0 $t0
	syscall	

	li $v0 4
	la $a0 Newline
	syscall	

exit:
	li $v0 10
	syscall

