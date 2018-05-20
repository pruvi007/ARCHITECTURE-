.data 
	string: .space 48
	input: .asciiz "\nEnter the string:"
	output: .asciiz "\nYES, It is a pallindrome."
	output1: .asciiz "\nNO, It is not a pallindrome."
.text

main:
li $v0, 4
la $a0, input
syscall

li $v0, 8
la $a0, string
la $a1, 48
syscall


li $t0, 0
li $t1, -2
loop:
lb $s0, string($t0)
beq $s0, $zero, exit
addi $t1, $t1, 1
addi $t0, $t0, 1
j loop

exit:
li $v0, 1
addi $a0, $t1, 0
syscall

li $t0, 0
loop2:
lb $s0, string($t0)
lb $s1, string($t1)
bne $s0, $s1, exit1
beq $t1, $t0, exit2
addi $t0, $t0, 1
addi $t1, $t1, -1
blt $t0, $t1, loop2

exit2:
li $v0, 4
la $a0, output
syscall
j return

exit1:
li $v0, 4
la $a0, output1
syscall

return:
li $v0, 10
syscall
