.data
	msg1: .asciiz "Enter n: "
	msg2: .asciiz "The factorial is; "
.text
	main:
		li $v0,4
		la $a0,msg1
		syscall
		li $v0,5
		syscall
		move $a1,$v0
		
		li $v0,4
		la $a0,msg2
		syscall
	
		jal fact
		
		
		li $v0,1
		move $a0,$v1
		syscall
		
		li $v0,10
		syscall
#---------------------------------------------------------------------------		
fact:
	subu $sp,$sp,8
	sw $ra,($sp)
	sw $s0,4($sp)
	
	li $v1,1
	beq $a1,0,done
	
	move $s0,$a1
	sub $a1,$a1,1
	
	jal fact
	
	mul $v1,$s0,$v1
	done:	
		lw $ra,0($sp)
		lw $s0,4($sp)
		addi $sp,$sp,8
		jr $ra
		
		
	
