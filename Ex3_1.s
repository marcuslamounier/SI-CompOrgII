.data

	msg1: .asciiz "a = "
	msg2: .asciiz "b = "

.text
main:
	reaad_A:
		li $v0, 4 
		la $a0, msg1 
		syscall
		
		li $v0, 5 
		syscall
		
		move $s0, $v0		#a armazenado em $s0
		
	read_B:
		li $v0, 4 
		la $a0, msg2 
		syscall
		
		li $v0, 5 
		syscall
		
		move $s1, $v0		#b armazenado em $s1
	
	
	

	beq $s0, $s1, True		#se a==b executa True senao prossegue
	add $s1, $s1, 1			#b = b + 1
	j Exit
	
	True: add $s0, $s0, 1	#a = a + 1
	
	Exit:
		li $v0, 10
		syscall 