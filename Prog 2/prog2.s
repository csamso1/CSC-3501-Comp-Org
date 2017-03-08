.globl prog2

prog2:
#Setup Code
        pushl %ebp              #Push base pointer to the stack
        movl %esp, %ebp         #Move the stack pointer to the base pointer
        pushl %ebx              #Push the register ebx to the stack

#Multiplying *k
        movl 16(%ebp), %ebx     #Store k in register ebx
        movl (%ebx), %edx       #Store pointer *k in register edx
        sall $2, %edx           #Left shift value *k points to by 2, which is equivalent to multiply by 4
        addl (%ebx), %edx       #Add value *k points to *k * 4 we computed earlier, which is equivalent to 4K+K
        movl %edx, (%ebx)       #Store the value we just computed in register edx

#Summing a[]
        movl 24(%ebp), %ecx     #Store value L in register ecx l
        movl 20(%ebp), %edx     #Store the value at a[0] in register edx
        movl $0, %edi           #Store 0 in register edi
        addl (%edx), %edi       #Add value a[0] to value in register edi
        addl $4, %edx           #Store pointer to a[1] in register ecx
        addl (%edx), %edi       #Add value a[1] to value in register edi
        addl $4, %edx           #Store pointer to a[2] in register ecx
        addl (%edx), %edi       #Add value a[2] to value in register edi
        addl $4, %edx           #Store pointer to a[3] in register ecx
        addl (%edx), %edi       #Add value a[3] to value in register edi
        addl $4, %edx           #Store pointer to a[4] in register ecx
        addl (%edx), %edi       #Add value a[4] to value in register edi
        movl %edi, (%ecx)       #Store the value we just computed in register ecx


#Subtracting j-i
        movl 12(%ebp), %eax     #Store value j in register eax
        movl 8(%ebp), %ecx      #Store value i in register ecx
        subl %ecx, %eax         #Computes j - i and stores the value in register eax

#Finishing Up
        popl %ebx               #Remove ebx from stack
        popl %ebp               #Remove base pointer from stack
        ret                     #Return integer value