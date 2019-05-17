	.data

invalida: .asciiz "Entrada invalida.\n"  	# Mensagem que será exibida caso a entrada não esteja entre 1 e 32768 
quebra_linha: .asciiz "\n"			# Quebra de linha

	.text

main:
	li $v0, 5 				# Leitura de um inteiro
	syscall  				# Faz a chamada do sistema

	move $s0, $v0  				# Coloca o conteúdo de $v0 em $s0

	slti $t1, $s0, 2 			# Verifica se $s0 é menor que 2 
	bne $t1, $zero, se_invalida  		# Se for menor que 2, desvia para rotina de tratamento de entrada invalida

	bge $s0, 32768, se_invalida  		# Verifica se $s0 é maior ou igual a 32768, se for, desvia para rotina que trata entrada invalida
	
	move $t7, $s0				# $t7 vai ser usado como registrador auxiliar

fatores_2:					# Rotina que verifica se 2 é fator do número, o único primo par
	div $t7, $t7, 2  			# Divide o número por 2
	mfhi $t3         			# Salva o resto da divisão no registrador $t3
	beq $t3, $zero, imprime_2  		# Se o resto for igual 0 então 2 é fator e precisa ser impresso

	add $t4, $t4, 3				# primeiro primo ímpar possível
	add $t5, $t5, 9				# t5 = 3²
	j fatores_impares          		# Se 2 não for mais um fator, desvia para rotina de possíveis fatores ímpares

imprime_2:					# Rotina para imprimir o número 2 como fator
	li $v0, 1   				# Impressão de um inteiro
	la $a0, 2   				# Imprime 2
	syscall     				# Faz a chamada do sistema

	li $v0, 4  				# Impressão de string
	la $a0, quebra_linha 			# Imprime quebra linha a cada 2 impresso
	syscall   				# Faz a chamada do sistema
	
	move $s0, $t7				# Atualiza o valor de $s0
	
	j fatores_2  				# Retorna para fator_2 para verificar se há mais fatores 2 para o número

fatores_impares:				# Veri	fica os possíveis fatores ímpares
	move $t7, $s0				# Atualiza o $t7
	div $t7, $t7, $t4 			# Divide o número pelo primo atual
	mfhi $t3         			# Salva o resto da divisão no registrador $t3
	beq $t3, $zero, imprime_fator_impar  	# Se o resto for igual 0 então $t4 é fator e precisa ser impresso
	
	j proximo_primo				# Se não, calcula o próximo primo
	
imprime_fator_impar:				# Rotina para imprimir o fator ímpar 
	li $v0, 1   				# Impressão de um inteiro
	la $a0, ($t4)   			# Imprime o primo atual
	syscall     				# Faz a chamada do sistema

	li $v0, 4  				# Impressão de string
	la $a0, quebra_linha 			# Imprime quebra de linha a cada fator impresso 
	syscall   				# Faz a chamada do sistema
	
	div $s0, $s0, $t4			# Divide $s0 pelo primo atual para ser atualizado
	
	ble $t5, $s0, fatores_impares		# Se $s0 ainda for menor que o primo ao quadrado, faz a verificação novamente

proximo_primo:					# Rotina que calcula o próximo primo
	addi $t4, $t4, 2			# Como os próximos primos sempre serão ímpares, $t4 pula de 2 em 2
	mul $t5, $t4, $t4			# Atualiza $t5 de acordo com o novo primo
	
	ble $t5, $s0, fatores_impares		# Se $s0 ainda for menor que o primo ao quadrado, faz a verificação novamente
		
se_primo:					# Se o número atual for primo, ele é impresso como fator
	ble $s0,1, termina_programa		# Se o número for menor ou igual a 1, termina o programa
	
	li $v0, 1   				# Impressão de um inteiro
	la $a0, ($s0)   			# Imprime o número 
	syscall     				# Faz a chamada do sistema

	li $v0, 4  				# Impressão de string
	la $a0, quebra_linha 			# Imprime quebra de linha
	syscall   				# Faz a chamada do sistema
	
	j termina_programa 			# Após a impressão, o programa pode ser finalizado

se_invalida:					# Rotina que trata as entrandas inválidas
	li $v0, 4 				# Impressão de string
	la $a0, invalida 			# Imprime "Entrada invalida.\n"
	syscall   				# Faz a chamada do sistema
	
termina_programa:				# Rotina para finalizar o programa
	li $v0, 10  				# Finaliza o programa
	syscall  				# Faz a chamada do sistema
	
