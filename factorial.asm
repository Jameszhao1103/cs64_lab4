# Factorial.asm program
#

# Assembly (NON-RECURSIVE) version of:
#   int n, fn=1;
#   cout << "Enter a number:\n";
#   cin >> n;
#   for (int x = 2; x <= n; x++) {
#       fn = fn * x;
#   }
#   cout << "Factorial of " << x << " is:\n" << fn << "\n";
#
.data
	Ask: .asciiz "Enter a number:\n"
	Factorial: .asciiz "Factorial of "
	Is: .asciiz " is:\n"
	Newline: .asciiz "\n"

#Text Area (i.e. instructions)
.text
main:
	li $v0 4
	la $a0 Ask
	syscall

	li $v0, 5
	syscall	

	move $t0, $v0
	#let fn = 1
	li   $t1, 1
	#let x  = 2
	li   $t2, 2

loop:
	bgt $t2, $t0, print
	mult $t1 $t2
	mflo $t1
	addi $t2, $t2, 1
	j loop

print:
	li $v0 4
	la $a0 Factorial
	syscall
	
	li $v0 1
	move $a0 $t0
	syscall

	li $v0 4
	la $a0 Is
	syscall

	li $v0 1
	move $a0 $t1
	syscall

	li $v0 4
	la $a0 Newline
	syscall

exit:
	li $v0 10
	syscall
