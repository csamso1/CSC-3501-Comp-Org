.globl prog2

prog2:
#Setup
        pushl %ebp              #Pushes base pointer on the stack
        movl %esp, %ebp         #Moves the stack pointer to the base pointer
        pushl %ebx              #Pushes the ebx register to stack
        
#Multiplying *k
        movl 16(%ebp), %ebx     #Moves address of pointer's value to ebx register
        movl (%ebx), %edx       #Moves k's value to edx register
        sall $2, %edx           #Left shifts k twice, effectively multiplying by 4
        addl (%ebx), %edx       #Adds original value of k to k*4, resulting in k*5 stored in edx
        movl %edx, (%ebx)       #Moves calculated k value to where k points

#Subtracting j-i
        movl 12(%ebp), %eax     #moves j value to eax
        movl 8(%ebp), %ecx      #moves i value to ecx
        subl %ecx, %eax         #Subtracts ecx from eax, j-i, storing in eax (j)


#Finishing Up
        popl %ebx               #Removes ebx from stack
        popl %ebp               #Removes base pointer from stack
        ret                     #Returns int value