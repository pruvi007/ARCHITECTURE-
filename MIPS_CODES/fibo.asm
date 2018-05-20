.data
	msg0:	.asciiz "Enter n: "
	msg:	.asciiz "Enter initial terms of Fibonacci: "
	put:	.asciiz ", "
.text
	li $v0,4
	la $a0,msg0
	syscall
	li $v0,5
	syscall
	move $t2,$v0
	li $v0,4
	la $a0,msg
	syscall
	li $v0,5
	syscall
	move $t0,$v0
	li $v0,5
	syscall
	move $t1,$v0
	addi $t3,$zero,3
	li $v0,1
	move $a0,$t0
	syscall
	li $v0,4
	la $a0,put
	syscall
	
	li $v0,1
	move $a0,$t1
	syscall
	li $v0,4
	la $a0,put
	syscall
	while:
		bgt $t3,$t2,exit
			add $t4,$t0,$t1
			move $t0,$t1
			move $t1,$t4
			li $v0,1
			move $a0,$t4
			syscall
			li $v0,4
			la $a0,put
			syscall
			addi $t3,$t3,1
			
			j while
	exit:
		li $v0,10
		syscall
	