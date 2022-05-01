## here is an example of getting your name and print it out if it is Alphabet or not an alphabet, ## 	
LC0:
	.ascii "Enter your name: \0"
LC1:
	.ascii "%c\0"
LC2:
	.ascii "The input name is: \0"
	.align 4
LC3:
	.ascii "\12 The entered character %c is an alphabet \12\0"
	.align 4
LC4:
	.ascii "\12 The entered character %c is not an alphabet \12\0"

	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef

_main:

	pushl	%ebp
	movl	%esp, %ebp
	
	pushl	%ebx
	
	subl	$32, %esp
		
	movl	$LC0, (%esp)
	call	_printf  			#Enter your name: 
	
	movl	$0, %ebx			# make array index i=0, array[i], I assume an array of 5 elements
	jmp		L2
L3:
	leal	8(%esp,%ebx), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_scanf
	
	addl	$1, %ebx			# scan charachter by character
L2:
	cmpl	$4, %ebx			#I assume an array of 5 elements
	jle		L3
	
	
	movl	$0, %ebx			# initial value of array array[i], i=0
	jmp		L4
L5:
	movsbl	%al, %eax			# input charachter in eax
	movl	%eax, 4(%esp)
	movl	$LC4, (%esp)
	call	_printf       		# The entered character %c is not an alphabet
L6:
	addl	$1, %ebx
L4:
	cmpl	$4, %ebx			# size of array
	jg		Done
	movzbl	8(%esp,%ebx), %eax
	leal	-97(%eax), %edx   	#array[i]>= 97 && array[i]<= 122, 97 is "a" and 122 is "z" so if it is  "a" to "z"
	cmpb	$25, %dl			# -96 to 122 = 25
	
	setbe	%cl				  	# sete mean set 0 or 1
	
	leal	-65(%eax), %edx   	#array[i]>=65 && array[i]<=90, 65 is "A" and 90 is "Z" so if it is "A" to "Z"
	cmpb	$25, %dl			# -65 to 90 = 25
	
	setbe	%dl				  	# sete mean set 0 or 1
	
	orb		%dl, %cl			# (array[i]>= 97 && array[i]<= 122) || (array[i]>=65 && array[i]<=90)
	je		L5
	
	movsbl	%al, %eax			# %al is input charachter
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp) 		# The entered character %c is an alphabet
	call	_printf
	jmp		L6

Done:
	movl	$0, %eax
	
	andl	$32, %esp
	
	leave
	ret
