.data
	msg: .asciiz "Enter the Number: "
	msg1: .asciiz "Factorial is: "
.text
	main:
		li $v0,4
		la $a0,msg
		syscall
		li $v0,5
		syscall
		move $a2,$v0
		
		jal fact
		
		li $v0,4
		la $a0,msg1
		syscall
		
		li $v0,1
		move $a0,$v1
		syscall
		
		li $v0,10
		syscall
			
			fact:
			addi $v1,$0,1
			while:
				beq $a2,$0,exit
					mul $v1,$v1,$a2
					subi $a2,$a2,1
					j while
			exit:
				jr $ra