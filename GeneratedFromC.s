	.file	"LowerToUpper.c"
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "Enter a sentence:\0"
LC1:
	.ascii "%[^\12]s\0"
LC2:
	.ascii "Output : %s\0"
LC3:
	.ascii "UPPER CASE: %s\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB12:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	andl	$-16, %esp
	addl	$-128, %esp
	call	___main
	movl	$LC0, (%esp)
	call	_puts
	leal	28(%esp), %ebx
	movl	%ebx, 4(%esp)
	movl	$LC1, (%esp)
	call	_scanf
	movl	%ebx, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	movl	$0, %eax
	jmp	L2
L3:
	addl	$1, %eax
L2:
	cmpl	$99, %eax
	jg	L6
	movzbl	28(%esp,%eax), %edx
	leal	-97(%edx), %ecx
	cmpb	$25, %cl
	ja	L3
	subl	$32, %edx
	movb	%dl, 28(%esp,%eax)
	jmp	L3
L6:
	leal	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	movl	$0, %eax
	movl	-4(%ebp), %ebx
	leave
	ret
