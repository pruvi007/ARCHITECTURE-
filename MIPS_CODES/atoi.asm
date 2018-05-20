.data
	a: .space 40
	mess: .asciiz "enter the string:"
	
.text
	li $v0,8
	la $a0,a
	li $a1,40
	syscall
	
	addi $t0,$0,0
	addi $t1,$0,0
	
	while:
		lb $t1,a($t0)
		beqz $t1,label
		addi $t1,$t1,1
		addi $t0,$t0,1
		j while
		
		label:
			addi $t1,$0,0
			addi $t0,$t0,-2
			addi $t4,$0,1 	#multiplier
			addi $t5,$0,0	#sum
			while2:
				bgt $t1,$t0,label2
				sub $t2,$t0,$t1
				lb $t3,a($t2)
				addi $t3,$t3,-48
				mul $t6,$t3,$t4
				add $t5,$t5,$t6
				mul $t4,$t4,10
				addi $t1,$t1,1
				j while2
				
				label2:
					li $v0,1
					move $a0,$t5
					syscall
					
					addi $t5,$t5,1
					
					li $v0,1
					move $a0,$t5
					syscall
					
					
					li $v0,10
					syscall
				
				
		
		