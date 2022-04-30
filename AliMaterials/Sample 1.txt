# this program print out BZCk 
# so to print out a sentence you can put it on top of the stack then use _putchar and you can use for loop 
#if you don't know the size of the sentence, and eahc time put of the top of the stack then call function of _putchart


	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef  # define the main 
_main:


	pushl %ebp 					# \ Standard callee entrance
	movl %esp, %ebp 			# /
	
	pushl	%ebp					# save value of esp inside the stack
	
	
	andl	$-24, %esp		# allocate memory 
	
	movl	$66, (%esp) 	# ascii code of 66 is Capital B move to top of the stack
	call	_putchar		# print out top of the stack, similar to printf function
	movl	$90, (%esp)		# ascii code of 90 is Z move to top of the stack
	call	_putchar		# print out top of the stack, similar to printf function 
	movl	$67, (%esp)		# ascii code of 67 is Capital C mov to top of the stack 
	call	_putchar		# print out top of the stack, similar to printf function
	movl	$107, (%esp)	# ascii code of 107 is k move to top of the stack
	call	_putchar		# print out top of the stack, similar to printf function
	movl	$0, %eax		# make eax as 0 
	
	subl	$24, %esp		# deallocate memory 
	leave
	ret