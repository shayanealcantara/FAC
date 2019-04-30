.data #data for the program
	hello_msg: .asciiz "Hello World\n"
	
.text 

main: 
	la $a0, hello_msg #load the address of hello_msg into $a0
	li $v0, 4 #4 is the print_string syscall
	syscall #do the syscall
	
	li $v0, 10 #10 is the exit syscall
	syscall #do the syscall
	
#end hello.asm