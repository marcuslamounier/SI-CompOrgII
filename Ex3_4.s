.text


main:
	init:	move $s0, $zero			#a = 0 armazenado em $s0
			move $s1, $zero			#b = 0 armazenado em $s1
			
			move $s2, $zero			#i = 0 armazenado em $s2
			add $s3, $zero, 5		#max_i = 5 armazenado em $s3
			
	pred:	slt $t0, $s2, $s3		#$t0 = i < max_i
			beq $t0, $zero, Exit	#se i = max_i, Exit, senao Cons
			
	cons:	add $s2, $s2, 1			#i = i + 1
			add $s0, $s0, 1			#a = a + 1
			add $s1, $s1, 2			#b = b + 2
			j pred					#reexecuta pred
	
	j Exit
	
	Exit:
		li $v0, 10
		syscall 