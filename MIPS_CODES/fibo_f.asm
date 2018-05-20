.data
	msg: .asciiz "Enter Initial terms: "
	msg1: .asciiz "Enter nth term: "
	msg0: .asciiz "The series is : "
	msg2: .asciiz ", "
.text
	main:
		li $v0,4
		la $a0,msg
		syscall
		li $v0,5
		syscall
		move $a2,$v0
		li $v0,5
		syscall
		move $a3,$v0
		li $v0,4
		la $a0,msg1
		syscall
		li $v0,5
		syscall
		move $a1,$v0
		sub $a1,$a1,3
		
		jal fibo
		
		li $v0,10
		syscall
			
			fibo:
				addi $t0,$zero,0
				li $v0,1
				move $a0,$a2
				syscall
				li $v0,4
				la $a0,msg2
				syscall
				li $v0,1
				move $a0,$a3
				syscall
				li $v0,4
				la $a0,msg2
				syscall
				
				while:
					bgt $t0,$a1,exit
						add $v1,$a3,$a2
						
						li $v0,1
						move $a0,$v1
						syscall
						li $v0,4
						la $a0,msg2
						syscall
						
						move $a2,$a3
						move $a3,$v1
						addi $t0,$t0,1
						
						j while
				exit:
					jr $ra
				