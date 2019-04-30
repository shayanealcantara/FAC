# criando o array save
.data
save: .word 0, 0, 0, 0, 0, 1
 
# atribuído valores e endereços para i, k e save
.text
li $s5, 0       # k = $s5 = 0
li $s3, 0       # i = $s3 = 0
la $s6, save    # carregando o endereço de save no registrador $s6
 
# criando o LOOP
LOOP: sll $t1, $s3, 2        # $t1 = 4 * i (4 * $s3)
      add $t1, $t1, $s6      # save[i] = (4*i + $s6)
      lw  $t0, 0($t1)        # $t0 = save[i]
      beq $t0, $s5, EXIT     # vá para EXIT se save[i] diferente de k
      addi $s3, $s3, 1       # $s3 = $s3 + 1           (ou i = i + 1)
      j LOOP                 # volta para o LOOP
EXIT: