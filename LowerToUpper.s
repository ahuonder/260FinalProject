# test comments

LC0:
	.ascii "Enter a short sentence \0"
LC1:
	.ascii "%[^\n]\0"     # reads in a string with spaces until it hits an end line, or to read until end of line (\n)	
LC2:
	.ascii "The output is %[^\n] \12\0"

	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef

_main:

	pushl %ebp 				# \ Standard callee entrance
	movl %esp, %ebp 		# /
	
	subl	$32, %esp		# allocate memory to be used for the stack, stack size is 32 bytes

	movl	$LC0, (%esp)
	call	_printf  		# enter the sentence 

	movl 	$LC1, (%esp)
	call 	_scanf
