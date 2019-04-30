main: 
	#Pegar numero 1 do usuario
	li $v0, 5 #read_int no $v0
	syscall
	move $t0, $v0 #mover o numero lido para $t0
	
	#printar $t2
	move $a0, $t0 #mover o numero para printar em $a0
	li $v0, 1 #carrega print_int em $v0
	syscall
	
	li $v0, 10 #sair do programa
	syscall
	
	
