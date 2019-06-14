	# Trabalho 4 - FAC
# Shayane Alcântara - 16/0144949
# Sara Silva - 16/0144752

	.data

$crc: .asciiz "CRC16­BUYPASS: " # String que acompanhará a saída 		
$quebra_linha: .asciiz "\n"  # Variável para quebrar a linha após a saída
buffer: .space 16 # Para pegar 16 bytes do buffer
espaco: .asciiz " "

	.text
	
main:
	li $v0, 8 			# Para ler uma string
	la $a0, buffer 			# Para o buffer
	li $a1, 16 			# Tamanho máximo da string de entrada
	move $t0, $a0  #		# Move o conteúdo de $a0 para $t0
	syscall				# Faz a chamada do sistema
		
loop:
	lb $a0, ($t0)			#$ $t0 vai percorre a string
	beq $a0, 10, termina		# Se $a0 for igual a 0, é porque a string terminou
	
	j crc16

crc16:				
	move $s0, $a0			# $s0 = d
	
	#li $v0, 1
	#la $a0, ($s0) 			#print pra testar $s0
#	syscall
		
# c = $t1 eh o estado
# r = $t2 eh o valor calculado
# p = $t3, s = $t4, t = $t5 sao valores intermediarios	
#	add $t1, $t1, 0
	srl $t6, $t1, 8			# t6 = c >> 8
	
	#########################################################
	li $v0, 11
	la $a0, ($s0) 			#print pra testar $t4(s)
	syscall

	li $v0, 4
	la $a0, espaco 			#print pra testar $t4(s)
	syscall
	
	xor $t4, $s0, $t6		# s = d ^ (c >> 8)
	
	
	srl $t6, $t4, 4			# t6 = s >> 4
	xor $t3, $t4, $t6		# p = s ^ ( s >> 4)
	
	srl $t6, $t3, 2			# t6 = p >> 2
	xor $t3, $t3, $t6		# p = p ^ (p >> 2)
	
	srl $t6, $t3, 1			# t6 = p >> 1
	xor $t3, $t3, $t6		# p = p ^ (p >> 1)
	
	and $t3, $t3, 1			# p = p & 1
	
	sll $t6, $t4, 1			# t6 = s << 1
	or $t5, $t3, $t6		# t = p | (s << 1)
	
	sll $t6, $t1, 8			# t6 = c << 8
	sll $t7, $t5, 15		# t7 = t << 15
	sll $t8, $t5, 1			# t8 = t << 1
	
	xor $t9, $t6, $t7		# t9 = (c << 8) ^ (t << 15)
	xor $t2, $t9, $t5		# r = (c << 8) ^ (t << 15) ^ t
	xor $t2, $t2, $t8		# r = r ^ (t << 1)
	
	add $t1, $t1, $t2			# c = r
	#li $v0, 1
	#la $a0, ($t4) 			#print pra testar $t4(s)
	#syscall
	
	add $t0, $t0, 1  
	j loop
	
termina: 
	#li $v0, 1
	#la $a0, ($t1) 			#print pra testar $t4(s)
	#syscall
	
	
	li $v0, 10			# Para finalizar o programa
	syscall				# Faz a chamada do sistema