	# Trabalho 4 - FAC
# Shayane Alcântara - 16/0144949
# Sara Silva - 16/0144752

	.data

$crc: .asciiz "CRC16­BUYPASS: " # String que acompanhará a saída 		
$quebra_linha: .asciiz "\n"  # Variável para quebrar a linha após a saída
buffer: .space 16 # Para pegar 16 bytes do buffer

	.text
	
main:
	li $v0, 8 			# Para ler uma string
	la $a0, buffer 			# Para o buffer
	li $a1, 16 			# Tamanho máximo da string de entrada
	move $t0, $a0  #		# Move o conteúdo de $a0 para $t0
	syscall				# Faz a chamada do sistema
		
loop:
	lb $a0, ($t0)			#$ $t0 vai percorre a string
	beq $a0, 0, termina		# Se $a0 for igual a 0, é porque a string terminou
	
	j crc16

crc16:				
	move $s0, $a0			# $s0 = d
	
	li $v0, 1
	la $a0, ($s0) 			#print pra testar $s0
	syscall
		
# c = $t1 eh o estado
# r = $t2 eh o valor calculado
# d = $t3 eh o dado
# s = $t4, p = $t5, t = $t6 sao valores intermediarios	
	
	srl $t1, $t1, 8			# c = c >> 8
	xor $t4, $s0, $t1		# s = d ^ (c >> 8)
	
	srl $t4, $t4, 4 		# s = s >> 4
	xor $t5, $t4, $t4		# p = s ^ (s >> 4)
	srl $t5, $t5, 2			# p = p >> 2
	xor $t5, $t5, $t5		# p = p ^ (p >> 1);
	and $t5, $t5, 1			# p = p & 1
	sll $t4, $t4, 1			# s = s << 1
	or $t6, $t5, $t4		# t = p | (s << 1)
	
	sll $t1, $t1, 8			# c = c << 8
	sll $t6, $t6, 15		# t = t << 15
	
	
	#li $v0, 1
	#la $a0, ($t4) 			#print pra testar $t4(s)
	#syscall
	
	add $t0, $t0, 1  
	j loop
	
termina: 
	li $v0, 10			# Para finalizar o programa
	syscall				# Faz a chamada do sistema
