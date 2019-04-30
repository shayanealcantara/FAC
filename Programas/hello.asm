#text is the executable part of the program
#data
#everything between a .data and the next .text is to put into the data segment.
#allocate space for and define a null-terminated string. This can be done with the 
#.asciiz directive.
#For a string that is not null-terminated, the .ascii can be used

#A "hello world" program
#registers used?
	# $v0 - syscall parameter and return value
	# $a0 - syscall parameter -- the string to print
	
.text

main:
	la $a0, hello_msg #load the address of hello_msg into $a0
	li $v0, 10 #4 is to print_string syscall
	syscall #do the syscall
	
	li $v0, 10 #10 is to exit syscall
	syscall #do the syscall
	
#Data for the program
	.data
	hello_msg: .asciiz "Hello, World\n"
	
#End hello.asm