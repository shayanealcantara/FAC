# Trabalho 1 - FAC
# Shayane Alcântara - 16/0144949
# Sara Silva - 16/0144752
	
	.data
		
$soma: .asciiz  "ADD: " #variável para indicar a operação de soma entre os dois números
$subtracao: .asciiz "\nSUB: " #variável para indicar a operação de subtração entre os dois números
$and: .asciiz "\nAND: " #variável para indicar a operação AND entre os dois números
$or: .asciiz "\nOR: " #variável para indicar a operação OR entre os dois números
$xor: .asciiz "\nXOR: " #variável para indicar a operação XOR entre os dois números
$sll: .asciiz "\nSLL(3): " #variável para indicar deslocamento de 3 bits à esquerda do primeiro número (shift left logical)
$srl: .asciiz "\nSRL(1): " #variável para indicar deslocamento de 1 bit à direita do segundo número (shift right logical)
$quebra_linha: .asciiz "\n"  #variável para quebrar a linha após a última saída

	.text
	
main:
	li $v0, 5 #lê o primeiro número a partir do terminal
	syscall #faz a syscall
	
	move $s0, $v0 #move conteúdo de $v0 para $s0
		
	li $v0, 5 #lê o primeiro número a partir do terminaluser
	syscall #faz a syscall
	
	move $s1, $v0 #move conteúdo de $v0 para $s1

	#chamada das rotinas
	jal _soma
	jal _subtracao
	jal _and
	jal _or
	jal _xor
	jal _sll
	jal _srl	

	li $v0, 10 #exit
	syscall #faz a syscall
	
	
_soma:  #realiza a soma entre os dois números
	li $v0,4 #print_string syscall 
	la $a0, $soma #imprime "ADD: "
	syscall #faz a syscall
	
	add $s2, $s0, $s1 #soma os valores dos registradores $s0 e $s1 e registra no $s2
	
	li $v0,1 #carrega syscall print_int em $v0
	la $a0, ($s2) #imprime o registrador $s2
	syscall #faz a syscall
	
	
_subtracao:  #realiza a subtração entre os dois números
	li $v0,4 #print_string syscall
	la $a0, $subtracao #imprime "\nSUB: "
	syscall #faz a syscall
	
	sub $s2, $s0, $s1 #subtrai os valores dos registradores $s0 e $s1 e registra no $s2
	
	li $v0,1 #carrega syscall print_int em $v0
	la $a0, ($s2) #imprime o registrador $s2
	syscall #faz a syscall 
	
	  
_and:   #realiza a operação and entre os dois números
	li $v0,4 #print_string syscall
	la $a0, $and #imprime "\nAND: "
	syscall #faz a syscall

	and $s2, $s0, $s1 #faz o and entre os valores dos registradores $s0 e $s1 e registra no $s2
	
	li $v0,1 #carrega syscall print_int em $v0
	la $a0, ($s2) #imprime o registrador $s2
	syscall #faz a syscall
	
			
_or:    #realiza a operação or entre os dois números
	li $v0,4 #print_string syscall
	la $a0, $or  #imprime "\nOR: "
	syscall #faz a syscall

	or $s2, $s0, $s1 #faz o or entre os valores dos registradores $s0 e $s1 e registra no $s2
	
	li $v0,1 #carrega syscall print_int em $v0
	la $a0, ($s2) #imprime o registrador $s2
	syscall #faz a syscall
	

_xor:   #realiza a operação xor entre os dois números
	li $v0,4 #print_string syscall
	la $a0, $xor #imprime "\nXOR: " 
	syscall #faz a syscall

	xor $s2, $s0, $s1 #faz o xor entre os valores dos registradores $s0 e $s1 e registra no $s2
	
	li $v0,1 #carrega syscall print_int em $v0
	la $a0, ($s2) #imprime o registrador $s2
	syscall #faz a syscall
	 
	 
_sll:   #realiza deslocamento de 3 bits à esquerda do primeiro número(shift left logical)
	li $v0, 4 #print_string syscall
	la $a0, $sll #imprime "\nSLL: "
	syscall #faz a syscall
		
	sll $s2, $s0, 3 #faz o sll de 3 bits no registrador $s0 e registra no $s2
	
	li $v0,1 #carrega syscall print_int em $v0
	la $a0, ($s2)  #imprime o registrador $s2
	syscall #faz a syscall
	
	
_srl:   #realiza deslocamento de 1 bit à direita do segundo número(shift right logical)
  	li $v0, 4 #print_string syscall
	la $a0, $srl  #imprime "\nSRL: "
	syscall #faz a syscall
		
	srl $s2, $s1, 1  #faz o srl de 3 bits no registrador $s1 e registra no $s2
	
	li $v0,1 #carrega syscall print_int em $v0
	la $a0, ($s2)  #imprime o registrador $s2
	syscall #faz a syscall
	
	li $v0, 4 #print_string syscall
	la $a0, $quebra_linha #imprime um '\n' no final
	syscall #faz a syscall
