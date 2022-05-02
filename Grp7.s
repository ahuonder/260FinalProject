# test comments

LC0:
	.ascii "Enter a short sentence \0"
LC1:
	.ascii "%[^\n]\0"     # reads in a string with spaces until it hits an end line, or to read until end of line (\n)	
LC4:
	.ascii "%c\0"
LC2:
	.ascii "The output is %c\12\0"

	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef

_main:

	pushl %ebp 				# \ Standard callee entrance
	movl %esp, %ebp 		# /
	
	subl	$128, %esp		# allocate memory to be used for the stack, stack size is 128 bytes

	movl	$LC0, (%esp)	# moves prompt to the top of the stack
	call	_printf  		# enter the sentence 

	# movl 	$LC1, (%esp)	# moves the read in statement to the top of the stack
	# call 	_scanf			# calls scan to read in the user input

	movl	$0, %esi		# initialize counter to zero

GetInput:
	# push the letters onto the stack
	leal	8(%esp, %esi), %eax		# puts address of where the letter will go into eax
	movl	%eax, 4(%esp)	# puts eax into stack for scanf param
	movl	$LC4, (%esp)	# puts LC4 into stack for scanf param
	call	_scanf
	incl	%esi			# increments counter so mem address will be different and compare statement works
FindNewLine:

	# cmpl	$\n,
LC3:
	cmpl	$10, %esi		# assume max characters is 100 
	jle		GetInput		# jump back to get Input if not at 10 letters yet
	# jmp		TestPrint

FindLower1:
	movl	$0, %esi		# initialize the counter
	movzbl	8(%esp, %esi), %eax	# move letter into eax
	incl	%esi
	cmpl	$97, %eax		# compare 97 (a) with eax value to see if lower case
	jle		TestPrint		# if the value is less than 97, just print
FindLower2:
	# addl	$97, %eax		# resets the value to what it was before first comparison
	cmpl	$122, %eax		# compare 122 (z) with eax value to see if lower case
	jge		TestPrint		# if value is greater than 122, just print
	# addl	$122, %eax		# resets eax value

TestPrint:
	movzbl	8(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf

	movzbl	9(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf

	movzbl	10(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf

	leave
	ret

	