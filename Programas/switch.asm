.data
jTable: .word L0,L1,L2,L3     
 
.text
 
# Definindo as variáveis
li  $s1, 15                               # g = $s1 = 15
li  $s2, 20                               # h = $s2 = 20
li  $s3, 10                               # i = $s3 = 10
li  $s4, 5                                # j = $s4 = 5
li  $s5, -1                               # k = $s5 = 2
la  $t4, jTable                           # $t4 = base address of the jump table
 
# Verificando os limites de K
slt  $t3, $s5, $zero                 
bne  $t3, $zero, EXIT            
slti $t3, $s5, 4            
beq  $t3, $zero, EXIT
 
# Calculando o endereço correto do Label
sll $t1, $s5, 2                         
add $t1, $t1, $t4                    
lw  $t0, 0($t1)           
 
# Seleção do Label    
jr $t0                          
 
# Casos          
L0:      add $s0, $s3, $s4       
j EXIT                                   
L1:      add $s0, $s1, $s2       
j EXIT                                   
L2:      sub $s0, $s1, $s2       
j EXIT                                   
L3:      sub $s0, $s3, $s4       
EXIT:
#FIM