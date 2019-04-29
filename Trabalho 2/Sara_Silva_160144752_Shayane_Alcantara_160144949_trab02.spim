	.data

bit_paridade: .asciiz "bit-paridade: " # Mensangem que indicará o valor de bit necessário para paridade par
saida: .asciiz "\nsaida: " # Mensagem que acompanhará o valor final do número
mensagem_erro: .asciiz "entrada incorreta\n" # Mensagem de erro caso a entrada seja maior ou igual a 128
quebra_linha: .asciiz "\n" # Quebra de linha após última linha

	.text
	
main:
	li $v0, 5 				# Para ler o inteiro
	syscall 				# Faz a chamada de sistema
		
	move $t2, $v0 				# Move o valor de entrada no registrador $t2
	
	beq $v0, 0, imprime_resultado 		# Se a entrada for 0, desvia para a rotina de impressão do resultado 
	bge $v0, 128, se_invalida 		# Se a entrada for igual ou maior que 128, desvia para a rotina de tratamento de entrada invalida 
	ble $v0, -1, se_invalida		# Se a entrada for negativa, desvia para a rotina de impressão do resultado 
	
	move $t4, $t2 				# Move o valor de entrada no registrador $t4
			 
faz_divisao: 	# Rotina que faz a divisão sucessiva do número de entrada em				
	div $t2, $t2, 2				# faz a divisão do inteiro pror 2
	mfhi $t3				# Salva o resto da divisão no registrador $t3
	beq $t3, 1, faz_icremento		# Se o resto for 1, desvia para rotina que faz o icremento
	j faz_divisao				# Retorna ao inicio da rotina para fazer o loop

faz_icremento:	# Rotina que soma a quantidade de restos 1 da divisão
	add $t1, $t1, 1				# Soma 1 no registrador $t1
	beq $t2, 0, calcula_paridade		# Se o $t2 chegou em zero, desvia para rotina que calcula a paridade
	j faz_divisao				# Vai para a rotina que faz a divisão do número
	
calcula_paridade: # Rotina para verificar a paridade é par ou ímpar
	beq $t1, 1, paridade_par		# Se a quantidade for 1, desvia para rotina que transfomar em par
	div $t1, $t1, 2				# Faz a divisão da quantidade de bits ligados por 2, para verificar se é par ou impar
	mfhi $t3				# Salva o resto da divisão no registrador $t3

	beq $t3, 0, imprime_resultado		# Se for 0, desvia para rotina que imprime o resultado
	beq $t3, 1, paridade_par		# Se for 1, desvia para rotina que transfomar faz a paridade par
    	
paridade_par:	# Rotina para ligar o bit mais significativo do número por meio da adiçã de 128
	add $t4, $t4, 128			# Adiciona o 128 para que o número de bits ligados seja ímpar
	j imprime_resultado
	    	
imprime_resultado: # Rotina que imprime os resultados
	li $v0, 4				# Para imprimir mensagem
	la $a0, bit_paridade			# Imprime "bit-paridade: "
	syscall					# Faz a chamada do sistema
	
	li $v0, 1				# Para imprimir inteiro
	move $a0, $t3				# Imprime o valor do bit de paridade
	syscall					# Faz a chamada do sistema

	li $v0, 4				# Para imprimir mensagem
	la $a0, saida				# Imprime "saida: "
	syscall					# Faz a chamada do sistema
	
	li $v0, 1				# Para imprimir inteiro
	move $a0, $t4				# Imprime valor final do número
	syscall					# Faz a chamada do sistema
	
	li $v0, 4				# Para imprimir mensagem
	la $a0, quebra_linha			# Imprimre "\n"
	syscall					# Faz a chamada do sistema
	
	li $v0, 10 				# termina o programa
    	syscall					# Faz a chamada do sistema

se_invalida: 	# Rotina que trata a entrada incorreta
	li $v0, 4				# Para imprimir mensagem
	la $a0, mensagem_erro			# imprime a mensagem de erro
	syscall					# Faz a chamada do sistema
		
	li $v0, 10 				# Termina o programa
    	syscall					# Faz a chamada do sistema
	
    	
    	
