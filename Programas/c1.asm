# Trabalho 1 - FAC
# Shayane Alc�ntara - 16/0144949
# Sara Silva - 16/0144752
	
	.data
	.word
		
$soma: .asciiz  "ADD: " #vari�vel para indicar a opera��o de soma entre os dois n�meros
$subtracao: .asciiz "\nSUB: " #vari�vel para indicar a opera��o de subtra��o entre os dois n�meros
$and: .asciiz "\nAND: " #vari�vel para indicar a opera��o AND entre os dois n�meros
$or: .asciiz "\nOR: " #vari�vel para indicar a opera��o OR entre os dois n�meros
$xor: .asciiz "\nXOR: " #vari�vel para indicar a opera��o XOR entre os dois n�meros
$sll: .asciiz "\nSLL(3): " #vari�vel para indicar deslocamento de 3 bits � esquerda do primeiro n�mero (shift left logical)
$srl: .asciiz "\nSRL(1): " #vari�vel para indicar deslocamento de 1 bit � direita do segundo n�mero (shift right logical)
$quebra_linha: .asciiz "\n"  #vari�vel para quebrar a linha ap�s a �ltima sa�da

	.text
	
main:
	li $v0, 5 #l� o primeiro n�mero inteiro a partir do terminal
	syscall 
	
	move $s0, $v0 #move conte�do de $v0 para $s0
		
	li $v0, 5 #l� o primeiro n�mero inteiro a partir do terminal
	syscall 
	
	move $s1, $v0 #move conte�do de $v0 para $s1

	#chamada das rotinas
	jal _soma
	jal _subtracao
	jal _and
	jal _or
	jal _xor
	jal _sll
	jal _srl	

	li $v0, 10 # exit
	syscall # faz a syscall
	
	
_soma:  #realiza a soma entre os dois n�meros
	li $v0,4 #l� string, armazena em $v0 
	la $a0, $soma #imprime "ADD: "
	syscall # faz a syscall
	
	add $s2, $s0, $s1 #soma os valores dos registradores $s0 e $s1 e registra no $s2
	
	li $v0,1 #l� int, armazena em $v0 
	la $a0, ($s2) #imprime o registrador $s2
	syscall # faz a syscall
	
	
_subtracao:  #realiza a subtra��o entre os dois n�meros
	li $v0,4 
	la $a0, $subtracao #imprime "\nSUB: "
	syscall 
	
	sub $s2, $s0, $s1 #subtrai os valores dos registradores $s0 e $s1 e registra no $s2
	
	li $v0,1 #l� int, armazena em $v0 
	la $a0, ($s2) #imprime o registrador $s2
	syscall # faz a syscall
	
	  
_and:   #realiza a opera��o and entre os dois n�meros
	li $v0,4 #l� string, armazena em $v0
	la $a0, $and #imprime "\nAND: "
	syscall # faz a syscall

	and $s2, $s0, $s1 #faz o and entre os valores dos registradores $s0 e $s1 e registra no $s2
	
	li $v0,1 #l� int, armazena em $v0
	la $a0, ($s2) #imprime o registrador $s2
	syscall # faz a syscall
	
			
_or:    #realiza a opera��o or entre os dois n�meros
	li $v0,4 #l� string, armazena em $v0
	la $a0, $or  #imprime "\nOR: "
	syscall # faz a syscall

	or $s2, $s0, $s1 #faz o or entre os valores dos registradores $s0 e $s1 e registra no $s2
	
	li $v0,1 #l� int, armazena em $v0
	la $a0, ($s2) #imprime o registrador $s2
	syscall # faz a syscall
	

_xor:   #realiza a opera��o xor entre os dois n�meros
	li $v0,4 #l� string, armazena em $v0
	la $a0, $xor #imprime "\nXOR: " 
	syscall # faz a syscall

	xor $s2, $s0, $s1 #faz o xor entre os valores dos registradores $s0 e $s1 e registra no $s2
	
	li $v0,1 #l� int, armazena em $v0 
	la $a0, ($s2) #imprime o registrador $s2
	syscall  # faz a syscall
	 
	 
_sll:   #realiza deslocamento de 3 bits � esquerda do primeiro n�mero(shift left logical)
	li $v0, 4 #l� string, armazena em $v0
	la $a0, $sll #imprime "\nSLL: "
	syscall # faz a syscall
		
	sll $s2, $s0, 3 #faz o sll de 3 bits no registrador $s0 e registra no $s2
	
	li $v0,1 #l� int, armazena em $v0 
	la $a0, ($s2)  #imprime o registrador $s2
	syscall # faz a syscall
	
	
_srl:   #realiza deslocamento de 1 bit � esquerda do segundo n�mero(shift right logical)
  	li $v0, 4 #l� string, armazena em $v0
	la $a0, $srl  #imprime "\nSRL: "
	syscall # faz a syscall
		
	srl $s2, $s1, 1  #faz o srl de 3 bits no registrador $s1 e registra no $s2
	
	li $v0,1 #l� int, armazena em $v0 
	la $a0, ($s2)  #imprime o registrador $s2
	syscall # faz a syscall
	
	li $v0, 4 #l� string, armazena em $v0
	la $a0, $quebra_linha #imprime um '\n' no final
	syscall # faz a syscall