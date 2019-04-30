.data
var1: .word 40
var2: .word -50
res: .space 1
.text
main: lw $t8,var1($0)
lw $t9,var2($0)
and $t0,$t0,$0
and $t1,$t1,$0
beq $t8,$0,igual
ori $t0,$0,1
igual: beq $t9,$0,fim
ori $t1,$0,1
fim: and $t0,$t0,$t1
sb $t0,res($0)
