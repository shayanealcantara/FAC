#computes the sum of 2 input numbers and displays on the screen.
#we need 2 registers to hold these 2 numbers $t0 and $t1
#we need 1 register to hold the result $t2
#print the sum
#exit using syscall $v0

#Autor
#description of what the program does
#registers used and its functions

# syscall 5 used to read an integer into register $v0. Leaves the result in v0
# it's a problem, since we want to put the 1 number into $t0 and 2 into $t1
#solution: move instruction. It's not good to keep date in $v0
# syscall 1 used to print out the integer stored in $a0
.data
	num1: .byte 8
	num2: .byte 8

.text
	main:
	
	add $v0, num1, num2
	
	move $a0, $t2 #move the number to print into $a0
	li $v0, 1 #load syscall print_int into $v0
	syscall #make the syscall
	
	# Get 1 number from user, put into $t0
	li $v0, 5 #load syscall read_int into $v0
	syscall   #make the syscall
	move $t0, $v0 #move the number read into $t0 
	
	# Get 2 number from user, put into $t1
	li $v0, 5 #load syscall read_int into $v0
	syscall #make the syscall
	move $t1, $v0 #move the number read into $t1
	
	and $t2, $t0, $t1 #make the sum
	
	#Print $t2
	move $a0, $t2 #move the number to print into $a0
	li $v0, 1 #load syscall print_int into $v0
	syscall #make the syscall	
	
	#li $v0, 10 #syscall code 10 to exit
	#syscall #make the syscall
	
#end of add2.asm