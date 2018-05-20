.data

.text
	addi $t0,$zero,10
	addi $t1,$zero,104
	
	mul $t2,$t1,$t0		# multiplying using mul
	
	li $v0,1
	move $a0,$t2
	syscall
	
	mult $t1,$t0		# multiplying using mult		
	mflo $t2
	
	li $v0,1
	move $a0,$t2
	syscall