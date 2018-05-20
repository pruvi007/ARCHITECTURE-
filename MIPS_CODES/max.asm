.data
	msg:	.asciiz "Enter two number: "
	msg2:	.asciiz "Greater is:"
	
.text
	li $v0,4
	la $a0,msg
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	li $v0,5
	syscall
	move $t1,$v0
	
	slt $t2,$t0,$t1
	beq $t2,$zero,great
	
	li $v0,4
	la $a0,msg2
	syscall
	li $v0,1
	move $a0,$t1
	syscall
	
	li $v0,10
	syscall
	
	great:
	li $v0,4
	la $a0,msg2
	syscall
	li $v0,1
	move $a0,$t0
	syscall
