.data
	arr:	.space 80
	msg:	.asciiz "Enter n:"
	msg1:	.asciiz "\nEnter array Elements: "
	msg2:	.asciiz "\nEnter number: "
	msg3:	.asciiz "\nMax is: "
	
	
.text
	main:
		li $v0,4
		la $a0,msg
		syscall
		li $v0,5
		syscall
		move $t0,$v0
		addi $t1,$zero,0
		addi $t2,$zero,0
		
		li $v0,4
		la $a0,msg1
		syscall
		
		while:
			beq $t2,$t0,exit
				li $v0,4
				la $a0,msg2
				syscall
				
				li $v0,5
				syscall
				move $s0,$v0
				sw $s0,arr($t1)
				addi $t1,$t1,4
				
				addi $t2,$t2,1
				j while
		exit:
		addi $t1,$zero,0
		addi $t2,$zero,0
		lw $t3,arr($t1)
		
		while1:
			beq $t2,$t0,exit1
				lw $t4,arr($t1)
				bgt $t4,$t3,move
			forward:
				addi $t2,$t2,1
				addi $t1,$t1,4
				j while1
		move:
					move $t3,$t4
					j forward
					
		exit1:
			li $v0,4
			la $a0,msg3
			syscall
			li $v0,1
			move $a0,$t3
			syscall
			
		
				
		