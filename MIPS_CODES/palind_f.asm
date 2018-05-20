.data
	s: .space 50
	msg: .asciiz "Enter string: "
	p: .asciiz "PALINDROME"
	np: .asciiz "NOT PALINDROME"
.text
	main:
		li $v0,4
		la $a0,msg
		syscall
		
		li $v0,8	# Getting String from User
		la $a0,s
		la $a1,50
		syscall
		
		jal check_Pal
		
		li $v0,10
		syscall
		
#--------------------------------------------------------------------------------------
check_Pal:
	li $t0,-2
	li $t1,0
	while:
		lb $s0,s($t1)
		beqz $s0,next
		addi $t0,$t0,1
		addi $t1,$t1,1
		j while
	next:
		
		add $t7,$t0,$0
		addi $t7,$t7,1
		li $t4,0
		li $t1,0
		while2:
		 lb $t2,s($t1)
		 beqz $t2,exit
			lb $t3,s($t0)
			beq $t2,$t3,next2
			addi $t1,$t1,1
			addi $t0,$t0,-1
			j while2
		next2:
			addi $t4,$t4,1
			addi $t1,$t1,1
			addi $t0,$t0,-1
			j while2
		exit:
			
			beq $t7,$t4,answer
			li $v0,4
			la $a0,np
			syscall
			j return
		answer:
			li $v0,4
			la $a0,p
			syscall
		return:
			li $v0,1
			move $a0,$t7
			syscall
			li $v0,1
			move $a0,$t4
			syscall
			jr $ra
		
			
			
			
