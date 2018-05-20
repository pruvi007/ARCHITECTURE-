.data
	a: .space 80
	msg: .asciiz  "Enter size : "
	msg1:	.asciiz "Array: "
	msg2: .asciiz "Even Numbers: "
	msg3: .asciiz "Odd Number: "
	msg4: .asciiz ", "
.text
	main:
		li $v0,4
		la $a0,msg
		syscall
		li $v0,5
		syscall
		move $a1,$v0
		
		li $v0,4
		la $a0,msg1
		syscall
		li $t0,0
		li $t1,0
		while:
			beq $t0,$a1,next
				li $v0,5
				syscall
				sw $v0,a($t1)
				addi $t0,$t0,1
				addi $t1,$t1,4
				j while
		next:
			li $v0,4
			la $a0,msg2
			syscall
			jal func1
			
			li $v0,10
			syscall
			
			
			
#------------------------------------------------------------------------------------------
func1:
	li $t0,0
	li $t1,0
	addi $sp,$sp,-4
	sw $ra,0($sp)
	loop:
		beq $t0,$a1,next1
			lw $a2,a($t1)
			li $t3,2
			div $a2,$t3
			mfhi $t4
			beq $t4,$0,next2
			addi $t0,$t0,1
			addi $t1,$t1,4
			j loop
		
		next2:
			jal print
			addi $t0,$t0,1
			addi $t1,$t1,4
			j loop
		next1:
			lw $ra,0($sp)
			jr $ra
print:
	li $v0,1
	move $a0,$a2
	syscall
	li $v0,4
	la $a0,msg4
	syscall
	
	jr $ra
	
			
			
			
			
	
