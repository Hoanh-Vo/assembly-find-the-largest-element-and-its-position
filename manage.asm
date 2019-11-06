;Author: Hoanh Vo
;Author email: hvo123@csu.fullerton.edu
;Program name: Midterm Programming Test

;Purpose: This program is control module
;language: x86-64 assembly



;===== Begin code area ==============================================================================================================
extern printf
extern scanf
extern getData
extern show_array
extern maximumCalculation

global control_management



segment .data
	welcome db " The  X86-64 -control module - has begun executing.", 10,0
	output_message  db  "The largest number in the array is at position %ld. ",10,0
	stringformat db "%s",0
	nextLine db " ",10,0
segment .bss  ; Reserved for uninitialized arrays
	aArray  resq 20		;reserve an quard array of 20 elements 
				
segment .text

control_management:

;===== Backup all the GPRs ========================================================================================================
push rbp                                                    ;Backup the base pointer
mov  rbp,rsp                                                ;Advance the base pointer to start of the current 
push rdi                                                    ;Backup rdi
push rsi                                                    ;Backup rsi
push rdx                                                    ;Backup rdx
push rcx                                                    ;Backup rcx
push r8                                                     ;Backup r8
push r9                                                     ;Backup r9
push r10                                                    ;Backup r10
push r11                                                    ;Backup r11: printf often changes r11
push r12                                                    ;Backup r12
push r13                                                    ;Backup r13
push r14                                                    ;Backup r14
push r15                                                    ;Backup r15
push rbx                                                    ;Backup rbx
pushf                                                       ;Backup rflags
;Registers rax, rip, and rsp are usually not backed up.




;==============================================================================================================
;calling funtion getInput in Fill module to get input for the array
;this function will the return the size of the array back to control module 
	mov rax, 0
	mov rsi, 20		;2nd parameter: size of array
	mov rdi, aArray		;1st parameter: address of array
	call getData

;=======save the real size of array to r12===================and  print next line===========================================================================
	mov r12,rax	; r12 will hold the realsize of the array

;NExt, print out the nextline
	mov rax, 0
	mov rdi, stringformat
	mov rsi, nextLine
	call printf
	

;==============================================================================================================
	
;calling funtion show_array in Dislay module to print out the array 
	mov rax, 0
	mov rsi, r12		;2nd parameter: size of array
	mov rdi, aArray		;1st parameter: address of array
	call show_array

;NExt, print out the nextline
	mov rax, 0
	mov rdi, stringformat
	mov rsi, nextLine
	call printf
	
;=====================================================================================
;calling the findMaximum function in Maximum module	
	
	
	mov rax, 0
	mov rsi, r12		;2nd parameter: size of array (
	mov rdi, aArray		;1st parameter: address of array
	call maximumCalculation
	
	
;=================show the position of the largest number to the screen=============================================================================================
	mov r13,rax	;make a coppy of the position to the r13 before calling printf 
	
	mov rsi, rax
	mov rdi, output_message
	call printf



;=================passing the largest value back to the main() driver=============================================================================================

	mov rax, [aArray +8*r13]
		
			
;===== Restore original values to integer registers ===============================================================================
popf                                                        ;Restore rflags
pop rbx                                                     ;Restore rbx
pop r15                                                     ;Restore r15
pop r14                                                     ;Restore r14
pop r13                                                     ;Restore r13
pop r12                                                     ;Restore r12
pop r11                                                     ;Restore r11
pop r10                                                     ;Restore r10
pop r9                                                      ;Restore r9
pop r8                                                      ;Restore r8
pop rcx                                                     ;Restore rcx
pop rdx                                                     ;Restore rdx
pop rsi                                                     ;Restore rsi
pop rdi                                                     ;Restore rdi
pop rbp                                                     ;Restore rbp

ret


