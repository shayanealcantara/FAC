.data
	numero1: .asciiz "Digite um número: \n"
	mensagem: .asciiz "Entrada invalida.\n"
	$bit_paridade: .asciiz "bit-paridade: 0\n"
	$saida: .asciiz "saida: \n"

.text

main:
	li   $v0, 4 #print_string
	la   $a0, numero1
	syscall #faz a chamada do sistema
	
	li $v0, 5 # numero do usuario
	syscall	#faz a chamada do sistema	
	move $t0, $v0 # copia numero do usuário para t0	
	
	slti $t1, $t0, 128  #(arg < 128) -> retorna true ou false
	beq $t2, $t1, invalid #se t2 for true retorna, se false error 
	
	bltz $t0, invalid # se $t0 <= 0 entao vai pra invalid
	
	#resolver problema bit-paridade
	andi $t3, $t0, 1
	beq $t4, $t3, par
	#bc1f par
	
	#printar $t2 pra ver se ta passando na funcao
	#li $v0, 1 #carrega print_int em $v0
	#syscall #faz a chamada do sistema
	
	li $v0, 10 #termina o programa
	syscall #faz a chamada do sistema

invalid:
	li $v0, 4
	la $a0, mensagem	
	syscall

par:
	li $v0, 4
	la $a0, $bit_paridade	
	syscall
	
	li $v0, 4 #print_string syscall
	la $a0, $saida #imprime a saída
	syscall #faz a syscall