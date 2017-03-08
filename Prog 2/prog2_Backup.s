.globl prog2

prog2:
	pushl	%ebp
	#implement here
	#Setup Code
	movl	%esp,	%ebp
	#
	pushl	%ebx
	#stores J value in register eax
	movl	32(%esp),	%eax
	#stores I value in register ecx
	movl	36(%esp),	%ecx
	#subtract I from J and store the value in register eax
	subl	%ecx,	%eax

	#finish Code
	popl	%ebx
	popl	%ebp
	ret