.globl main
.data
  msgprompt: .word msg_input
  msgres1: .word msgres1_data
  msgres2: .word msgres2_data

  msg_input: .asciiz "Digite um inteiro positivo: "
  msgres1_data: .asciiz "O valor de "
  msgres2_data: .asciiz "! e "

.text
main:
  la      $t0, msgprompt    # carregando mensagem do input
  lw      $a0, 0($t0)       # carregando dados do endereco $t0 para $a0
  li      $v0, 4            # codigo para chamar funcao print_string
  syscall                   # chamada de sistema, print_string

  li      $v0, 5            # codigo para chamar funcao read_int
  syscall                   # chamada de sistema, read_int
  move    $t0, $v0          # armazenar input de $v0 em $t0

  move    $a0, $t0          # movendo input para registrador $a0
  addi    $sp, $sp, -12     # movimenta 3 palabras da pilha
  sw      $t0, 0($sp)       # armazena input no topo da pilha
  sw      $ra, 8($sp)       # armazena o contador no inicio da pilha
  jal     factorial         # chama a funcao fatorial

  lw      $s0, 4($sp)       # carrega o valor retornado em $s0

  la      $t1, msgres1      # carrega msgres1 no endereco $t1
  lw      $a0, 0($t1)       # carrega msgres1_data no registrador $a0
  li      $v0, 4            # codigo para chamar funcao print_string
  syscall                   # chamada de sistema, print_string para msgres1_data

  lw      $a0, 0($sp)       # carrega valor do elemento do input no registrador $a0
  li      $v0, 1            # codigo para chamar funcao print_int
  syscall                   # chamada de sistema, print_int para o elemento do input

  la      $t2, msgres2      # carrega msgres2 no endereco $t1
  lw      $a0, 0($t2)       # carrega msgres2_data no registrador $a0
  li      $v0, 4            # codigo para chamar funcao print_string
  syscall                   # chamada de sistema, print_string para msgres2_data

  move    $a0, $s0          # move o valor retornado de $s0 para $a0
  li      $v0, 1            # codigo para chamar funcao print_int
  syscall                   # chamada de sistema, print_int para o valor calculado

  addi    $sp, $sp, 12      # move o ponteiro da fila novamente ao inicio

  li      $v0, 10           # chamada para retornar 0 e sair do programa
  syscall                   # chamada de sistema para sair



.text
factorial:
  lw      $t0, 0($sp)       # carrega o input para o registrador $t0
  beq     $t0, 0, retornaUm # se $t0 == 0, retorna 1
  addi    $t0, $t0, -1      # subtrai 1 de $t0 se <> 0

  addi    $sp, $sp, -12     # movimenta 3 palavras da pilha
  sw      $t0, 0($sp)       # armazena o numero no topo da pilha
  sw      $ra, 8($sp)       # armazena o contador no inicio da pilha

  jal     factorial         # chamada recursiva para o fatorial

  lw      $ra, 8($sp)       # carrega a chamada de $ra novamente
  lw      $t1, 4($sp)       # carrega o valor retornado em $t1

  lw      $t2, 12($sp)      # carrega o valor inicial do escopo superior em $t2
  mul     $t3, $t1, $t2     # multiplica o valor retornado pelo valor do escopo superior, armazenando em $t3.

  sw      $t3, 16($sp)      # armazena o valor armazenado em $t3 e armazena no escopo superior.

  addi    $sp, $sp, 12      # move o ponteiro da pilha para a chamada da funcao principal

  jr      $ra               # retorna ao escopo superior

.text
retornaUm:
  li      $t0, 1            # insere 1 no registrador $t0
  sw      $t0, 4($sp)       # armazena 1 no retorno principal do registrador
  jr      $ra               # retorna ao escopo superior