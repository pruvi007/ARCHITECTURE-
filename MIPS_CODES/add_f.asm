.data
	msg1: .asciiz "Enter Numbers: "
.text
	main:
	li $v0,4
	la $a0,msg1
	syscall
	
	li $v0,5
	syscall
	move $a2,$v0
	li $v0,5
	syscall
	move $a3,$v0
	
	jal add
	
	li $v0,1
	move $a0,$v1
	syscall
	
	li $v0,10
	syscall
	
	add:
	add $v1,$a2,$a3
	jr $ra
	
	