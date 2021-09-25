.text


main:
	move $s0, $zero					#a = 0 armazenado em $s0
	move $s1, $zero					#b = 0 armazenado em $s1
	add $s2, $zero, 5				#c = 5 armazenado em $s2
	
	pred: 	slt $t0, $s0, $s2		#$t0 = a < c
			beq $t0, $zero, Exit	#se a = c, Exit , senao Cons
	
	cons:	add $s0, $s0, 1			#a = a + 1
			add $s1, $s1, $s2		#b = b + c
			j pred					#reexecuta pred
	
	j Exit
	
	Exit:
		li $v0, 10
		syscall 