.data
$soma: .asciiz  "soma: \n" #declara variavel soma como 'soma: \n'
$subtracao: .asciiz "\nsubtracao: \n" #declara variavel subtracao como 'subtracao: \n'
$and: .asciiz "\nand: \n" #declara variavel multiplicacao como 'and: \n'
$or: .asciiz "\nor: \n" #declara variavel divisao como 'or: \n'
$xor: .asciiz "\nxor: \n" #declara variavel divisao como 'xor: \n'

$message1: .asciiz "\nInsira o primeiro valor:\n"
$message2: .asciiz "\nInsira o segundo valor:\n"
$message3: .asciiz "\nEscolha a operação:\n1-Soma\n2-Subtracao\n3-And\n4-Or\n5-Xor\n"

.text
main:
	li $v0,4 #comando de impressão de inteiro na tela
	la $a0, $message1 #coloca o texto soma para ser impresso
	syscall # efetua a chamada ao sistema
	
	li $v0, 5 #le entrada do usuário
	syscall #faz chamada ao sistema
	
	move $s0, $v0 # move conteúdo de $v0 para $s0
	
	li $v0,4 #comando de impressão de inteiro na tela
	la $a0, $message2 #coloca o texto soma para ser impresso
	syscall # efetua a chamada ao sistema
	
	li $v0, 5 #le entrada do usuário
	syscall # efetua a chamada ao sistema
	
	move $s1, $v0 # move conteúdo de $v0 para $s1
	
	li $v0,4 #comando de impressão de inteiro na tela
	la $a0, $message3 #coloca o texto soma para ser impresso
	syscall # efetua a chamada ao sistema
	
	li $v0, 5 #le entrada do usuário
	syscall # efetua a chamada ao sistema
	
	move $s2, $v0 # move conteúdo de $v0 para $s2
	
	call _soma
	
	j termina #desvia para termina
	
_soma:
	li $v0,4 #comando de impressão de inteiro na tela
	la $a0, $soma #coloca o texto soma para ser impresso
	syscall # efetua a chamada ao sistema
	
	add $s2, $s0, $s1 #soma os valores dos registradores $s0 e $s1 e insere o resultado no registrador $s2
	j termina #desvia para termina
	
_subtracao:
	li $v0,4 #comando de impressão de inteiro na tela
	la $a0, $subtracao #coloca o texto subtração para ser impresso
	syscall # efetua a chamada ao sistema

	sub $s2, $s0, $s1 #subtrai os valores dos registradores $s0 e $s1 e insere o resultado no registrador $s2
	j termina #desvia para termina
	
_and:
	li $v0,4 #comando de impressão de inteiro na tela
	la $a0, $and #coloca o texto multiplicacao para ser impresso
	syscall # efetua a chamada ao sistema

	and $s2, $s0, $s1 #multiplica os valores dos registradores $s0 e $s1 e insere o resultado no registrador $s2
	j termina #desvia para termina
	
_or:
	li $v0,4 #comando de impressão de inteiro na tela
	la $a0, $or #coloca o texto divisao para ser impresso
	syscall # efetua a chamada ao sistema

	or $s2, $s0, $s1 #divide os valores dos registradores $s0 e $s1 e insere o resultado no registrador $s2
	j termina #desvia para termina

_xor:
	li $v0,4 #comando de impressão de inteiro na tela
	la $a0, $xor #coloca o texto divisao para ser impresso
	syscall # efetua a chamada ao sistema

	xor $s2, $s0, $s1 #divide os valores dos registradores $s0 e $s1 e insere o resultado no registrador $s2
	j termina #desvia para termina
	
termina:

	li $v0,1 #comando de impressão de inteiro na tela
	la $a0, ($s2) #coloca o registrador $s2 para ser impresso
	syscall # efetua a chamada ao sistema
	
	li $v0, 10 # comando de exit
	syscall # efetua a chamada ao sistem