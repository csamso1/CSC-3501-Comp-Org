.global check_cache

check_cache:
	pushl   %ebp
    movl    %esp,   %ebp		#Move the stack pointer to the base pointer
    #
    #movl	%esp,	%ebp		
    #
    pushl 	%ebx				#Push the register ebx to the stack

	#implement here
	movb	12(%ebp),	%bl		#Stores memory address in register %bl
	movb	%bl,	%bh			#Copies memory address to register %bh
	andb	$3,	%bh				#Extracts tag bits and stores in register %bl
	movb	%bh,	%al			#Copies block offset bits to register %al to test

	#
	popl	%ebx
	popl    %ebp
    ret