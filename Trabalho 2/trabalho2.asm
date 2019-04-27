.data
	numero1: .asciiz "Digite um número: \n"
	mensagem: .asciiz "Entrada invalida.\n"

.text

main:
	li   $v0, 4 #print_string
	la   $a0, numero1
	syscall
	
	li $v0, 5 # numero do usuario
	syscall		
	move $a0, $v0 # numero do user para a0	
	
	 
	bltz $a0, invalid # se $a0 <= 0 entao invalida
	#blez $a0, invalid # se $a0 <= 0 entao invalida
	
	#printar $t2 pra ver se ta passando na funcao
	li $v0, 1 #carrega print_int em $v0
	syscall
	
	li $v0, 10
	syscall

invalid:
		li $v0, 4
		la $a0, mensagem	
		syscall