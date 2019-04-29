	.data

bit_paridade: .asciiz "bit­paridade: " #mensangem que indicará o valor de bit necessário para paridade par
saida: .asciiz "\nsaida: " #mensagem que acompanhará o valor final do número
mensagem_erro: .asciiz "entrada incorreta\n" #mensagem de erro caso a entrada seja maior ou igual a 128
quebra_linha: .asciiz "\n" #quebra de linha após última linha

#words que serão os bits do número convertido em binário    
bit0: .word 0
bit1: .word 0
bit2: .word 0
bit3: .word 0
bit4: .word 0
bit5: .word 0
bit6: .word 0
bit7: .word 0

	.text

main:    
	li $v0, 5 #para ler o inteiro
	syscall   #faz a chamada do sistema

	move $s0, $v0

	jal valida_entrada # checa se é maior que 128 ou se é igual a 0

	jal calcula_paridade # faz calculo de paridade
    
 	li $v0, 10 #termina o programa
 	syscall #faz a chamada do sistema

calcula_paridade: 
	addi $t1, $t1, 64 # definindo mascara
	addi $t3, $t3, 2 # divisor para verificar se o número é par ou ímpar
     
        and $t2, $s0, $t1
	add $v0, $t2, $zero 
	sw $v0, bit7 
	srl $t1, $t1, 1 

	and $t2, $s0, $t1 
	add $v0, $t2, $zero 
	sw $v0, bit6 
    	srl $t1, $t1, 1

    	and $t2, $s0, $t1 
    	add $v0, $t2, $zero 
    	sw, $v0 bit5 
    	srl $t1, $t1, 1 
    
    	and $t2, $s0, $t1 
    	add $v0, $t2, $zero 
    	sw $v0, bit4 
    	srl $t1, $t1, 1 
    
    	and $t2, $s0, $t1 
    	add $v0, $t2, $zero 
    	sw $v0, bit3 
    	srl $t1, $t1, 1 
    
    	and $t2, $s0, $t1 
    	add $v0, $t2, $zero 
    	sw $v0, bit2 
    	srl $t1, $t1, 1 
    
    	and $t2, $s0, $t1 
    	add $v0, $t2, $zero 
    	sw $v0, bit1 
    	srl $t1, $t1, 1 

    	lw $t0, bit7
    	add $s5, $s5, $t0
    
	lw $t0, bit6
    	add $s5, $s5, $t0
    
    	lw $t0, bit5
    	add $s5, $s5, $t0

    	lw $t0, bit4
    	add $s5, $s5, $t0    

    	lw $t0, bit3
    	add $s5, $s5, $t0

    	lw $t0, bit2
    	add $s5, $s5, $t0

    	lw $t0, bit1
    	add $s5, $s5, $t0

faz_divisao:
        addi $t6, $t6, 1 
        addi $t3, $t3, 8

        div $s5, $t2
        mfhi $t4 
        bge $t6, $t3, faz_divisao
    

	beq $t4, $zero, se_impar #se a quantidade de bits ligados for ímpar, desvia para a rotina que deixa a paridade par
	bne $t4, $zero, se_par #se a quantidade de bits ligados for par, desvia para a rotina que atribui 0 para o bit de paridade

se_par:
        add $s4, $s4, $zero #bit de paridade recebe 0
        jr $ra

se_impar:
	addi $s4, $s4, 1 # bit de paridade recebe 1
	addi $s0, $s0, 128 # liga o o último bit
   
	li $v0, 4 #para imprimir mensagem
	la $a0, bit_paridade #imprime "bit-paridade: "
	syscall #faz a chamada do sistema
	
	li $v0, 1 #para imprimir inteiro
	la $a0, ($s4) #imprime o valor do bit de paridade
	syscall
	
	li $v0, 4 #para imprimir mensagem
	la $a0, saida #imprime "saida: "
	syscall #faz a chamada do sitema
	
	li $v0, 1 #para imprimir inteiro
	la $a0, ($s0) #imprime valor final do número
	syscall	
	
	li $v0, 10 #termina o programa
	syscall #faz a chamada do sistema
	
	li $v0, 4 #para imprimir mensagem
	la $a0, quebra_linha #imprimre "\n"
	syscall #faz a chamada do sitema

        jr $ra
    		
valida_entrada:    
	slti $t0, $s0, 128  #verifica se o argumento é menor que 128
	beq $zero, $s0, se_zero  #desvia para rotina que trata da entrada 0
	beq $t1, $t0, se_invalido #desvia para rotina que faz o tratamento da entrada inválida

    	jr $ra #retorna ao ponto em que foi chamada
    
se_zero:	
	li $v0, 4 #para imprimir mensagem
	la $a0, bit_paridade #imprime "bit-paridade: "
	syscall #faz a chamada do sistema
	
	li $v0, 1 #para imprimir inteiro
	la $a0, ($zero) #imprime valor 0 para o bit de paridade
	syscall
	
	li $v0, 4 #para imprimir mensagem
	la $a0, saida #imprime "saida: "
	syscall #faz a chamada do sitema
	
	li $v0, 1 #para imprimir inteiro
	la $a0, ($zero) #imprime valor 0 para a saida
	syscall	
	
	li $v0, 10 #termina o programa
	syscall #faz a chamada do sistema
		
	li $v0, 4 #para imprimir mensagem
	la $a0, quebra_linha #imprimre "\n"
	syscall #faz a chamada do sitema
	
se_invalido:
	li $v0, 4
	la $a0, mensagem_erro #imprime a mensagem de erro
	syscall #faz a chamada do sistema
	
	li $v0, 10 #termina o programa
	syscall #faz a chamada do sistema
