# Adam Huonder, Michael Bernard
# CPSC 260
# May 3rd, 2022
# Final Project

LC0:
	.ascii "Enter a short sentence \0" # user prompt
LC1:
	.ascii "%[^\n]\0"     # reads in a string with spaces until it hits an end line, or to read until end of line (\n)	

	.globl	_main										# initial setup
	.def	_main;	.scl	2;	.type	32;	.endef

_main:

	pushl %ebp 				# \ Standard callee entrance
	movl %esp, %ebp 		# / preparing the stack
	
	subl	$128, %esp		# allocate memory to be used for the stack, stack size is 128 bytes

	movl	$LC0, (%esp)	# moves prompt to the top of the stack
	call	_printf  		# print the prompt 

	movl	$0, %esi		# initialize counter to zero

GetInput: 				# push the letters onto the stack
	leal	8(%esp), %eax	# puts address of where the letters will go into eax
	movl	%eax, 4(%esp)	# puts eax into stack for scanf param
	movl	$LC1, (%esp)	# puts LC1 into stack for scanf param
	call	_scanf			# scan user input

InitialLowerLoop:		# prepare to loop through user input
	movl	$0, %esi		# initialize the counter
FindLower1:				# checks lower bound of character
	movb	8(%esp, %esi), %al	# move letter into eax
	cmpb	$97, %al		# compare 97 (a) with eax value to see if lower case
	jl		EndOfLoop		# if the value is less than 97, skip body and go to loop control
FindLower2:				# checks upper bound of character, and changes if lower case
	cmpb	$122, %al		# compare 122 (z) with eax value to see if lower case
	jg		EndOfLoop		# if value is greater than 122, skip body and go to loop control
	subb	$32, %al		# turn to upper case
	movb	%al, 8(%esp, %esi)	# move modified letter in 'a' register back to stack
EndOfLoop:				# loop control for FindLower1 and 2
	incl	%esi			# increment loop counter
	cmpb	$0, %al			# loop control comparison
	jne		FindLower1		# jump to top of loop

	movl	$0, %esi		# reset/initialize loop counter
PrintOutput:			# prints the string in all capital letters
	movb	8(%esp, %esi), %al	# move character into al
	movb	%al, (%esp)		# move char in al to the top of the stack
	call	_putchar		# print char at top of the stack
	incl	%esi			# increment loop counter
	cmpb	$0, %al			# loop control comparison
	jne		PrintOutput		# jump to top of print loop

	leave					# end program
	ret

	