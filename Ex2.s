.data
    vector: 
        .align 2   		
        .space 20			#alocado 5 itens x 4 posicoes = 20 posicoes
          
.text
.globl main
    main:
    	move $t0, $zero		#pos = 0
    	li $t1, 1			#i = 1
    	li $t2, 20			#max_pos = 20
    	li $t3, 2			#fat_mul = 2
         
		seqV:
			beq $t0, $t2, end1		#se pos != max_pos continua, senao end1
			sw $t1, vector($t0)		#armazena i na posicao pos
			addi $t0, $t0, 4		#pos = pos + 4 posicoes
			addi $t1, $t1, 1		#i = i + 1
			j seqV				
		
		end1:	
			move $t0, $zero			#pos = 0 novamente
			li $t1 , 1 				#i = 1 novamente
			lw $v0, vector($t0)		#armazena o vetor em $v0
		
		doubV:
			beq $t0, $t2, end2		#se pos != max_pos continua, senao end2
			lw $t4, vector($t0)		#carrega vetor[pos] em $t4
			mul $t4, $t4, $t3		#$t4 = $t4 * 2 (que é igual a fat_mul)
			sw $t4, vector($t0)		#armazena $t4 na posicao pos
			addi $t0, $t0, 4		#pos = pos + 4 posicoes
			addi $t1, $t1, 1		#i = i + 1
			j doubV				
		
		end2:
			move $t0, $zero			#pos = 0 novamente
			li $t1, 1				#i = 1 novamente
			
		printV:
			beq $t0, $t2, end3		#se pos != max_pos continua, senao end3
			lw $t5, vector($t0)		#carrega vetor[pos] em $t5
			li $v0, 1				
			move $a0, $t5			
			syscall					#chamada de sistema
			addi $t0, $t0, 4		#pos = pos + 4 posicoes
			addi $t1, $t1, 1		#i = i + 1
			j printV
		
		end3: