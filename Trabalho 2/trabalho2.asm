.data
	invalida: .asciiz "Entrada invalida.\n"

.text

main:
	li $v0, 5 # numero do usu�rio
	syscall		
	move $a0, $v0 # numero do user para a0
		
	blez $a0, invalid # se $a0 <= 0 ent�o exit
	
	#printar $t2 pra ver se t� passando na fun��o
	move $a0, $t0 #mover o numero para printar em $a0
	li $v0, 1 #carrega print_int em $v0
	syscall

	li $v0, 10
	syscall

invalid:
		li $v0, 4
		la $a0, invalida	
		syscall
	