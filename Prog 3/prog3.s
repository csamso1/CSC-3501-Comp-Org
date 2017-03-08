.global check_cache

check_cache:
	pushl   %ebp				#Push base pointer to the stack
    movl    %esp,   %ebp		#Move the stack pointer to the base pointer
    pushl 	%ebx				#Push the register ebx to the stack

	#Decoding address data
	movb	12(%ebp),	%bl		#Stores memory address in register %bl
	movb	%bl,	%bh			#Copies memory address to register %bh
	andb	$3,	%bh				#Extracts block offset bits and stores them in register %bh
	movb	%bl,	%dl			#Copies memory address to register %dl
	andb	$12,	%dl			#Extracts set index bits and stores in register %dl
	movb	%bl,	%dh			#Copies memory address to register %dh
	shrb	$4,	%dh				#Righ shift %dh by 4 bits, extracting the tag bits and storing them in register %dh
	movl	8(%ebp),	%edx	#Make %edx a pointer to the struct line array
	movb	(%edx),	%cl			#Copies valid bit to register %cl
	cmp	$0,	%cl					#Comparison between register %cl value and 0
	je	miss 					#Jump to miss code if valid bit is 0
	addl	$1,	%edx			#Moves register %edx to refrence tag bits
	movb	(%edx), %ch 		#Copies tag bits to register %ch
	cmp		%dh,	%ch 		#Comparison of tag bits
	jne 	miss				#Jump to miss code if the tag bits do not match
	addl	$1,	%edx			#Moves register %edx to refrence the block array
	cmp 	$0,	%bh				#Comparison of block offset bits and 0
	je	offset0					#Jump to offset0 code if block offset bits are equal to 0
	cmp		$1,	%bh				#Comparison of block offset bits and 2
	je	offset1					#Jump to offset1 code if block offset bits are equal to 1
	cmp 	$2,	%bh				#Comparison of block offset bits and 2
	je	offset2					#Jump to offset2 code if block offset bits are equal to 1
	cmp 	$3,	%bh				#Comparison of block offset bits and 2
	je	offset3					#Jump to offset3 code if block offset bits are equal to 1

miss:
	movb	$0xFF,	%al			#Sets return value as a cashe miss
	jmp 	finish				#Jump to finish code

offset0:
	movb	(%edx), %al 		#Store entire cashe block as return value
	jmp	finish
offset1:
	addl	$1,	%edx			#Moves block offset pointer to exclude the first bit
	movb	(%edx), %al 		#Stores designated block bits as return value
	jmp 	finish				#Jump to finish code
offset2:
	addl	$2,	%edx			#Moves block offset pointer to exclude the first two bits
	movb	(%edx), %al 		#Stores designated block bits as return value
	jmp 	finish				#Jump to finish code
offset3:
	addl	$3,	%edx			#Moves block offset pointer to exclude the first three bits
	movb	(%edx), %al 		#Stores designated block bits as return value
	jmp 	finish				#Jump to finish code

finish:
	#Finish code
	popl	%ebx				#Remove ebx from stack
	popl    %ebp				#Remove base pointer from stack
    ret 						#Return