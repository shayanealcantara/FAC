	.data
		
$soma: .asciiz  "ADD: " #declara variavel soma como 'soma: \n'
$subtracao: .asciiz "\nSUB: " #declara variavel subtracao como 'subtracao: \n'
$and: .asciiz "\nAND: " #declara variavel multiplicacao como 'and: \n'
$or: .asciiz "\nOR: " #declara variavel divisao como 'or: \n'
$xor: .asciiz "\nXOR: " #declara variavel divisao como 'xor: \n'
$sll: .asciiz "\nSLL(3): " #declara variavel multiplicacao como 'multiplicacao: \n'
$srl: .asciiz "\nSRL(1): " #declara variavel divisao como 'divisao: \n'

	.text
	
main:
	li $v0, 5 #le entrada do user
	syscall 
	
	move $s0, $v0 # move conte�do de $v0 para $s0
		
	li $v0, 5 #le input do user
	syscall 
	
	move $s1, $v0 # move conte�do de $v0 para $s1

	jal _soma
	jal _subtracao
	jal _and
	jal _or
	jal _xor
	jal _sll
	jal _srl
	j termina #desvia para "termina"
	
_soma:
	li $v0,4 #print_int
	la $a0, $soma #carrega a soma para ser impressa
	syscall # efetua a chamada ao sistema
	
	add $s2, $s0, $s1 #soma os valores dos registradores $s0 e $s1, registra no $s2
	
	li $v0,1 
	la $a0, ($s2) #coloca o registrador $s2 para ser impresso
	syscall 
	
	
_subtracao:
	li $v0,4 
	la $a0, $subtracao 
	syscall 
	
	sub $s2, $s0, $s1 
	li $v0,1 
	la $a0, ($s2) #coloca o registrador $s2 para ser impresso
	syscall 
	 
	
_and:
	li $v0,4 
	la $a0, $and 
	syscall 

	and $s2, $s0, $s1 
	li $v0,1 
	la $a0, ($s2) #coloca o registrador $s2 para ser impresso
	syscall 
	 
	
_or:
	li $v0,4 
	la $a0, $or 
	syscall 

	or $s2, $s0, $s1
	li $v0,1 
	la $a0, ($s2) #coloca o registrador $s2 para ser impresso
	syscall 
	

_xor:
	li $v0,4 
	la $a0, $xor 
	syscall 

	xor $s2, $s0, $s1
	li $v0,1 
	la $a0, ($s2) #coloca o registrador $s2 para ser impresso
	syscall  
	 
_sll: 
	li $v0, 4
	la $a0, $sll
	syscall
		
	sll $s2, $s0, 3
	li $v0,1 
	la $a0, ($s2) #coloca o registrador $s2 para ser impresso
	syscall
	
_srl:
  	li $v0, 4
	la $a0, $srl
	syscall
		
	srl $s2, $s1, 1
	li $v0,1 
	la $a0, ($s2) #coloca o registrador $s2 para ser impresso
	syscall
	
termina:
		
	li $v0, 10 #exit
	syscall 
