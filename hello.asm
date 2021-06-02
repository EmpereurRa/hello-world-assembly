section .data
        text db "Hello World!", 10

section .text 
        global _start

_start:
        mov rax, 1
	mov rdi, 1
	mov rsi, text
	mov rdx, 14
	syscall

	mov rax, 60
	mov rdi, 0
	syscall

/*
so how does this work?
let's start at the top, we have a .data section where
all the data is defined before the compilation in which 
we are defining the bytes saying "Hello World!" with a newline
character after, then in .text you put your code and here 
we link with global the adress of the start label declaring
start as global as start is required for the code to work properly
/*
now, inside the start label, we have are "mov"ing the id value 1 
into the 64 bit rax register modifying the first 8 bits, then we
have mov rdi, 1 which means we are making this be an output thing
which is what 1 stands for, now we are moving into rsi the adress
of text, and into rdx the size of this, then we have a syscall
requesting this from the kernel

Then we have mov rax, 60, 60 is the id for the sys_exit syscall
and we have mov rdi, 0 which is like return 0, we have no error.
/*
