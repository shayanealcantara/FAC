	.data

crc: .asciiz "CRC16-BUYPASS: 0x"        # String que acompanhará a saída 		
quebra_linha: .asciiz "\n"              # Quebra de linha
buffer: .space 17                       # Para pegar 16 bytes do buffer
tabela_ascii: .word 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70  # Valores em ascii corresponde aos digitos da base 16

	.text
	
main:
	li $v0, 8 			                # Para ler uma string
	la $a0, buffer 			            # Para o buffer
	li $a1, 17 			                # Tamanho máximo da string de entrada
	move $t0, $a0                       # Move o conteúdo de $a0 para $t0
	syscall				                # Faz a chamada do sistema
		
loop:                                   # loop para percorrer a string
	lb $a0, ($t0)			            # $t0 vai percorre a string
	beq $a0, 0, imprime_crc		        # Se $a0 for igual a 0, é porque a string terminou e sai do loop
	
	j crc16                             # Desvia para rotina que calcula o crc

crc16:				                    # Rotina que calcula o crc16
	move $s0, $a0			            # $s0 recebe o caracter que está em $a0
	beq $s0, 10, imprime_crc            # Desvia para rotina de impressão caso o caracter seja "\n", 10 na tabela ascii

    # $s0 = d, caracter da string
    # $t1 = c,  o estado
    # $t2 = r, o valor calculado do crc
    # $t3 = p, $t4 = s, $t5 = t, valores intermediarios	

	srl $t6, $t1, 8			            # $t6 = c >> 8
	xor $t4, $s0, $t6		            # s = d ^ (c >> 8)
	and $t4, $t4, 255                   # s = s and 255, máscara para tamanho máximo que s pode ter
	
	srl $t6, $t4, 4			            # $t6 = s >> 4
	xor $t3, $t4, $t6		            # p = s ^ ( s >> 4)
	and $t3, $t3, 255                   # p = p and 255, máscara para tamanho máximo que p pode ter
	
	srl $t6, $t3, 2			            # $t6 = p >> 2
	xor $t3, $t3, $t6		            # p = p ^ (p >> 2)
	and $t3, $t3, 255                   # p = p and 255, máscara para tamanho máximo que p pode ter
	
	srl $t6, $t3, 1			            # $t6 = p >> 1
	xor $t3, $t3, $t6		            # p = p ^ (p >> 1)
	and $t3, $t3, 255                   # p = p and 255, máscara para tamanho máximo que p pode ter
	
	and $t3, $t3, 1			            # p = p & 1
	and $t3, $t3, 255                   # p = p and 255, máscara para tamanho máximo que p pode ter
	
	sll $t6, $t4, 1		            	# $t6 = s << 1
	or $t5, $t3, $t6	            	# t = p | (s << 1)
	and $t5, $t5, 65535                 # t = t and 65535, máscara para tamanho máximo que t pode ter
	
	sll $t6, $t1, 8		            	# $t6 = c << 8
	sll $t7, $t5, 15	            	# $t7 = t << 15
	sll $t8, $t5, 1		            	# $t8 = t << 1
	
	xor $t9, $t6, $t7	            	# $t9 = (c << 8) ^ (t << 15)
	xor $t2, $t9, $t5	            	# r = (c << 8) ^ (t << 15) ^ t
	xor $t2, $t2, $t8	            	# r = r ^ (t << 1)
	and $t2, $t2, 65535                 # r = r and 65535, máscara para tamanho máximo que r pode ter
		
	move $t1, $t2			            # c = r
	
    add $t0, $t0, 1                     # Incrementando $t0 que percorre a string
	j loop                              # Volta para o loop
	
imprime_crc:                            # Rotina para imprimir o valor do crc convertido em string
	li $v0, 4                           # Para imprimir string
	la $a0, crc                         # Imprime "CRC16-BUYPASS: 0x"
	syscall                             # Faz a chamada do sistema
	
	la $t8, tabela_ascii                # $t8 vai receber o primeiro endereço do tabela_ascii
	and $t6, $t2, 0xf000 		        # $t6 = r & 0xf000, aplica mascára para separar o valor do primeiro dígito do hexa
	srl $t6, $t6, 12		            # $t6 = $t6 >> 12, obter o valor do primeiro dígito do hexa
    mul $t6, $t6, 4                     # $t6 = $t6 * 4, para $t6 corresponder ao valor correto do endereço do array
	add $t8, $t8, $t6                   # $t8 = [(0xf000 & r) >> 12] * 4
	lw $t7, 0($t8)                      # $t7 vai receber o valor de tabela_ascii[$t8]
		
	li $v0, 11                          # Para imprimir um caracter
	la $a0, ($t7) 			            # Imprime o caracter correspondente ao valor de $t7 na tabela ascii
	syscall                             # Faz a chamada de sistema
	
	la $t8, tabela_ascii                # $t8 vai receber o primeiro endereço do tabela_ascii
	and $t6, $t2, 0x0f00                # $t6 = r & 0x0f00, aplica mascára para separar o valor do segundo dígito do hexa  
	srl $t6, $t6, 8		                # $t6 = $t6 >> 8, obter o valor do segundo dígito do hexa         	
	mul $t6, $t6, 4                     # $t6 = $t6 * 4, para $t6 corresponder ao valor correto do endereço do array
	add $t8, $t8, $t6                   # $t8 = [(0x0f00 & r) >> 8] * 4                                    
	lw $t7, 0($t8)                      # $t7 vai receber o valor de tabela_ascii[$t8]                      
		                                                                                                    
	li $v0, 11                          # Para imprimir um caracter                                         
	la $a0, ($t7) 		                # Imprime o caracter correspondente ao valor de $t7 na tabela ascii 	
	syscall                             # Faz a chamada de sistema

	la $t8, tabela_ascii                # $t8 vai receber o primeiro endereço do tabela_ascii
	and $t6, $t2, 0x00f0                # $t6 = r & 0x00f0, aplica mascára para separar o valor do terceiro dígito do hexa  
	srl $t6, $t6, 4		                # $t6 = $t6 >> 4, obter o valor do terceiro dígito do hexa         	
	mul $t6, $t6, 4                     # $t6 = $t6 * 4, para $t6 corresponder ao valor correto do endereço do array
	add $t8, $t8, $t6                   # $t8 = [(0x00f0 & r) >> 4] * 4                                    
	lw $t7, 0($t8)                      # $t7 vai receber o valor de tabela_ascii[$t8]                      
		
	li $v0, 11                          # Para imprimir um caracter
	la $a0, ($t7) 			            # Imprime o caracter correspondente ao valor de $t7 na tabela ascii
	syscall                             # Faz a chamada de sistema

	la $t8, tabela_ascii                # $t8 vai receber o primeiro endereço do tabela_ascii
	and $t6, $t2, 0x000f                # $t6 = r & 0x000f, aplica mascára para separar o valor do quarto dígito do hexa  
	mul $t6, $t6, 4                     # $t6 = $t6 * 4, para $t6 corresponder ao valor correto do endereço do array
	add $t8, $t8, $t6                   # $t8 = [(0x000f & r)] * 4                                    
	lw $t7, 0($t8)                      # $t7 vai receber o valor de tabela_ascii[$t8]                      
		
	li $v0, 11                          # Para imprimir um caracter
	la $a0, ($t7) 			            # Imprime o caracter correspondente ao valor de $t7 na tabela ascii
	syscall                             # Faz a chamada de sistema
	
	li $v0, 4                           # Para imprimir string
	la $a0, quebra_linha                # Imprime "\n"
	syscall                             # Faz a chamada do sistema
		
termina:	                            # Rotina para finalizar o programa
	li $v0, 10		                	# Para finalizar o programa
	syscall				                # Faz a chamada do sistema
