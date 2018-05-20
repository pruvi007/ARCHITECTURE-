.data
	mess: .asciiz "testcases:"
	mess2: .asciiz "1.hexadecimal\n"
	mess3:	.asciiz "2.binary\n"
.text
	li $v0,4
	la $a0,mess
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0

	addi $t1,$0,0
	
	
	addi $t2,$0,1
	addi $t3,$0,2
	while:
		bge $t1,$t0,label
		
		li $v0,4
		la $a0,mess2
		syscall
		
		li $v0,4
		la $a0,mess3
		syscall
		
		li $v0,5
		syscall
		move $t4,$v0
		addi $t1,$t1,1
		beq $t4,$t2,hexa
				li $v0,5
				syscall
				move $t5,$v0
				 
				 li $v0,35
				 move $a0,$t5
				 syscall
				 j while
				 
			hexa:	
				li $v0,5
				syscall
				move $t5,$v0
				 
				 li $v0,34
				 move $a0,$t5
				 syscall
				 j while
				 
			
	label:
		li $v0,10
		syscall	