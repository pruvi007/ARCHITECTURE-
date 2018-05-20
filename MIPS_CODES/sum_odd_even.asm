.data
	a: .space 40
	mess: .asciiz "enter n:"
	mess2: .asciiz "enter no:"
	mess3: .asciiz "even sum:"
	mess4: .asciiz "odd sum:"
	line:.asciiz "\n"
.text
	li $v0,4
	la $a0,mess
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0
	
	addi $t1,$0,0
	addi $t2,$0,0
	
	li $v0,4
	la $a0,mess2
	syscall
	
	while:
		bge $t1,$t0,label
		li $v0,5
		syscall
		move $s0,$v0
		
		sw $s0,a($t2)
		addi $t1,$t1,1
		addi $t2,$t2,4
		j while
	label:
		addi $t1,$0,0
		addi $t2,$0,0
		addi $t3,$0,2
		addi $t5,$0,0
		addi $t6,$0,0
		while2:
			bge $t1,$t0,label2
			rem $t4,$t1,$t3
			beq $t4,$0,even
					lw $t7,a($t2)
					add $t6,$t6,$t7
					addi $t1,$t1,1
					addi $t2,$t2,4
					j while2
				even:	
					lw $t7,a($t2)
					add $t5,$t5,$t7
					addi $t1,$t1,1
					addi $t2,$t2,4
					j while2
			label2:
			li $v0,4
			la $a0,mess3
			syscall
			
				li $v0,1
				move $a0,$t5
				syscall
				
				li $v0,4
				la $a0,line
				syscall
				
				
				li $v0,4
				la $a0,mess4
				syscall
				
				li $v0,1
				move $a0,$t6
				syscall
			
				li $v0,10
				syscall