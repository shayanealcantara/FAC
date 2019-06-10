# Trabalho 1 - FAC
# Shayane Alcântara - 16/0144949
# Sara Silva - 16/0144752

	.data

$crc: .asciiz "CRC16­BUYPASS: " # String que acompanhará a saída 		
$quebra_linha: .asciiz "\n"  # Variável para quebrar a linha após a saída
buffer: .space 16 # Para pegar 16 bytres do buffer

	.text
	
main:
	li $v0, 8 			# Para ler uma string
	la $a0, buffer 			# Para o buffer
	li $a1, 16 			# Tamanho máximo da string de entrada
	move $t0, $a0  #		# Move o conteúdo de $a0 para $s0
	syscall				# Faz a chamada do sistema
	
	li $v0, 4			# Print para testar a string de entrada
	la $a0, ($t0)
	syscall
	
loop:
	lb $a0, ($t0)			#$ $t0 vai percorre a string
	beq $a0, 0, termina		# Se $a0 for igual a 0, é porque a string terminou
	j crc16
	
crc16:			
	li $v0, 4			# print para testar o contador do loop ta adando
	la $a0, ($t0)
	syscall
	
	add $t0, $t0, 1 
	j loop
	
termina: 
	li $v0, 10			# Para finalizar o programa
	syscall				# Faz a chamada do sistema
