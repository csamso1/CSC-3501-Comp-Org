.globl prog2

prog2:
#Setup
        pushl %ebp              #Pushes base pointer on the stack
        movl %esp, %ebp         #Moves the stack pointer to the base pointer
        pushl %ebx              #Pushes the ebx register to stack

#Multiplying *k
        movl 16(%ebp), %ebx     #k=ebx
        movl (%ebx), %edx       #*k=edx
        sall $2, %edx           #*k >> 2 (*k*4)
        addl (%ebx), %edx       #edx(*k)=edx(*k*4) + val of ebx(*k)
        movl %edx, (%ebx)       #val of ebx = edx(*k)

#Summation of a[]
        movl 24(%ebp), %ecx     #ecx=l
        movl 20(%ebp), %edx     #edx=a[0]
        movl $0, %edi  		#edi=0
        addl (%edx), %edi       #edi=edi+a[0]
        addl $4, %edx  		#ecx is now the pointer to a[1]
        addl (%edx), %edi       #edi=edi+a[1]
        addl $4, %edx   	#ecx is now the pointer to a[2]
        addl (%edx), %edi       #edi=edi+a[2]
        addl $4, %edx   	#ecx is now the pointer to a[3]
        addl (%edx), %edi       #edi=edi+a[3]
        addl $4, %edx   	#ecx is now the pointer to a[4]
        addl (%edx), %edi       #edi=edi+a[4]
        movl %edi, (%ecx)       #val of ecx(*l) = edi


#Subtracting j-i
        movl 12(%ebp), %eax     #j = eax
        movl 8(%ebp), %ecx      #i = ecx
        subl %ecx, %eax         #eax = eax(j) - ecx(i)

#Finishing Up
        popl %ebx               #Removes ebx from stack
        popl %ebp               #Removes base pointer from stack
        ret                     #Returns int value
