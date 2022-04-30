LC0:
	.ascii " Enter the x, y, and z numbers \0"
LC1:
	.ascii "%d %d %d\0"
	
LC2:
	.ascii "The output is %d \12\0"

	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef

_main:

	pushl %ebp 				# \ Standard callee entrance
	movl %esp, %ebp 		# /
	
	subl	$32, %esp		# allocate memory to be used for the stack, stack size is 32 bytes