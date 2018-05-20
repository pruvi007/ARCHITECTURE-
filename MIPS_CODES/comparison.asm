.data
	msg:	.asciiz "Enter two number: "
	msg1:	.asciiz "\nNot Equal"
	msg2:	.asciiz "\nEqual"

.text
	li $v0,4
	la $a0,msg
	syscall
	
	li $v0, 5
	syscall
	
	move $t0,$v0
	
	li $v0,5
	syscall
	
	move $t1,$v0
	
	bne $t1,$t0,not
	
	li $v0,4
	la $a0,msg2
	syscall
	
	li $v0,10
	syscall
	
	not:
	li $v0,4
	la $a0,msg1
	syscall
	