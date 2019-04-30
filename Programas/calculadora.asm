.data
$soma: .asciiz  "soma: \n" #declara variavel soma como 'soma: \n'
$subtracao: .asciiz "\nsubtracao: \n" #declara variavel subtracao como 'subtracao: \n'
$multiplicacao: .asciiz "\nmultiplicacao: \n" #declara variavel multiplicacao como 'multiplicacao: \n'
$divisao: .asciiz "\ndivisao: \n" #declara variavel divisao como 'divisao: \n'

$message1: .asciiz "\nInsira o primeiro valor:\n"
$message2: .asciiz "\nInsira o segundo valor:\n"
$message3: .asciiz "\nEscolha a operação:\n1-Soma\n2-Subtracao\n3-Multiplicacao\n4-Divisao\n"

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
	
	beq $s2,1,somaOp #verifica se $s2 é igual a 1 se for desvia para somaOP
	beq $s2,2,subtracaoOp #verifica se $s2 é igual a 2 se for desvia para subtracaoOP
	beq $s2,3,multiplicacaoOp #verifica se $s2 é igual a 3 se for desvia para multiplicacaoOP
	beq $s2,4,divisaoOp #verifica se $s2 é igual a 4 se for desvia para divisaoOP
	j termina #desvia para termina
	
somaOp:
	li $v0,4 #comando de impressão de inteiro na tela
	la $a0, $soma #coloca o texto soma para ser impresso
	syscall # efetua a chamada ao sistema
	
	add $s2, $s0, $s1 #soma os valores dos registradores $s0 e $s1 e insere o resultado no registrador $s2
	j termina #desvia para termina
	
subtracaoOp:
	li $v0,4 #comando de impressão de inteiro na tela
	la $a0, $subtracao #coloca o texto subtração para ser impresso
	syscall # efetua a chamada ao sistema

	sub $s2, $s0, $s1 #subtrai os valores dos registradores $s0 e $s1 e insere o resultado no registrador $s2
	j termina #desvia para termina
	
multiplicacaoOp:
	li $v0,4 #comando de impressão de inteiro na tela
	la $a0, $multiplicacao #coloca o texto multiplicacao para ser impresso
	syscall # efetua a chamada ao sistema

	mul $s2, $s0, $s1 #multiplica os valores dos registradores $s0 e $s1 e insere o resultado no registrador $s2
	j termina #desvia para termina
	
divisaoOp:
	li $v0,4 #comando de impressão de inteiro na tela
	la $a0, $divisao #coloca o texto divisao para ser impresso
	syscall # efetua a chamada ao sistema

	div $s2, $s0, $s1 #divide os valores dos registradores $s0 e $s1 e insere o resultado no registrador $s2
	j termina #desvia para termina
	
termina:

	li $v0,1 #comando de impressão de inteiro na tela
	la $a0, ($s2) #coloca o registrador $s2 para ser impresso
	syscall # efetua a chamada ao sistema
	
	li $v0, 10 # comando de exit
	syscall # efetua a chamada ao sistem