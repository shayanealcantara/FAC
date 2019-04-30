# O trabalho 2 constitue em Implementar um programa em assembly MIPS que através do terminal do MARS 
# seja possível ler dois números inteiros positivos e maiores que 1 e deve apresentar distintos resultados de MDC E MMC.

.data
	valor1: .asciiz "Digite o primeiro valor: "
	valor2: .asciiz "DIgite o segundo valor: "
	pulaLinha: .asciiz "========================="
	resultadoMMC: .asciiz "\nMMC: "
	resultadoMDC: .asciiz "\nMDC: "
	msg: .asciiz "\n Entrada Invalida"

.text

main:

	li   $v0, 4 #print_string
	la   $a0, valor1
	syscall
	
	li   $v0, 5 #read_int
	syscall
	
	#atribui o primeiro valor digitado pelo usuário ao registrador $s1
	move $s1, $v0
	
	li   $v0, 5 #read_int
	syscall
	
	move $s1, $v0
	#########################################################
	li   $v0, 4
	la   $a0, valor2
	syscall
	
	li   $v0, 5
	syscall
	
	#atribui o segundo valor digitado pelo usuário ao registrador $s2 
	move $s2, $v0 
	
	##########################################################
	
	#Verifica se o primeiro valor digitado pelo usuário é menor que 1 e armazena o resultado no registrador $t1
	slti $t1, $s1, 1	
	#Verifica se o segundo valor digitado pelo usuário é menor que 1 e armazena o resultado no registrador $t2
	slti $t2, $s2, 1
	#verifica se os dois são igualmente verdadeiros
	or $t3, $t1, $t2
	
	#verificar igualdade valor1 == 1, valor2 == 1
	slti $t1, $s1, 2
	slti $t2, $s2, 2
	or $t4, $t1, $t2
	#verifica o conjunto da condição valor1 <= 1, valor2 <= 1
	or $t5, $t3, $t4 
	
	#Se o $t5 for falso, vai ser redirecionado para o Else
	beq  $t5, $zero,Else
	
	#Se o $t5 for falso vai mostrar mensagem de digito inválido
	#imprime msg
	li   $v0, 4
	la   $a0, msg
	syscall
	#li   $v0, 4
	#syscall
	#parar de executar o programa se o digito for inválido
	li   $v0, 10
	syscall
	
	
	Else:
	
		move $s3, $s1 #a=valor1
		move $s4, $s2 #b=valor2
		
		Loop: 
		      beq $s4, $zero,Exit #compara b com zero, se fo verdadeiro vai sair do loop.
		      move $t2, $s3 #temp = a
		      move $s3, $s4 #a=b
		      div  $t2, $s4 #temp % b
		      mfhi $t6 #temporario para o modulo de temp%b
		      move $s4, $t6 # b = temp % b 
		      j Loop

Exit:
			            	      
       move $s4, $s3 #mdc = a
       div  $t1, $s2, $s3 # $t1 = valor2/a
       mult $s1, $t1 #valor1 * $t1
       mflo $t2 #armazena o valor da multiplicação
       move $s5, $t2 #mdc = $t2
       ble 
       bne
       beq
       #imprimir os resultados das operações
       li $v0, 4
       la $a0, resultadoMDC
       syscall
       li $v0, 1
       la $a0, ($s4)
       syscall
       
       #imprimir os resultados das operações
       li $v0, 4
       la $a0, resultadoMMC
       syscall
       li $v0, 1
       la $a0, ($s5)
       syscall