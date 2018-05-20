.data
	input:	.space 80
	msg0:	.asciiz "Enter last number:"
	msg:	.asciiz "Enter number: "
	
	put:	.asciiz ", "
.text
main:
	li $v0,4
	la $a0,msg0
	syscall
	
	li $v0,5
	syscall
	move $t2,$v0
	
	addi $t1,$zero,0
	addi $t0,$zero,0
	
	while:
	bgt $t0,$t2,exit
		li $v0,4
		la $a0,msg
		syscall
		
		li $v0,5
		syscall
		move $t3,$v0
		
		sw $t3, input($t1)
		addi $t0,$t0,1
		addi $t1,$t1,4
		j while
		
	exit:
	addi $t0,$zero,0
	addi $t1,$zero,0
	while1:
	bgt $t0,$t2,exit1
		li $v0,1
		lw $a0,input($t1)
		syscall
		li $v0,4
		la $a0,put
		syscall
		addi $t0,$t0,1
		addi $t1,$t1,4
		
		j while1
	
	exit1:
	li $v0,10
	syscall
		
		
	
		
