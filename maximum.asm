;Author: Hoanh Vo
;Author email: hvo123@csu.fullerton.edu
;Program name: Midterm Programming Test

;Purpose: This program calculates the total of the array's elements; the array is received from control module.
;language: x86-64 assembly



;===== Begin code area ==============================================================================================================

extern printf
extern control_management

global maximumCalculation

segment .data

	welcome db "Funtion maximumcalculation in maximum module, written in Assembly, has begun execution. ", 10,0
	
	stringformat db "%s",0

	
segment .bss  ; Reserved for uninitialized arrays
	;Empty
segment .text

maximumCalculation:



;===== Backup all the GPRs ========================================================================================================
push rbp                                                    ;Backup the base pointer
mov  rbp,rsp                                                ;Advance the base pointer to start of the current 
push rdi                                                    ;Backup rdi
push rsi                                                    ;Backup rsi
push rdx                                                    ;next;Backup rdx
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


;=====  Array's address and size was passed from Control module to  ====================================================================================================
	
	

	
		mov r12,rsi	;r12 hold the size of of the array
		mov r13,rdi     ;r13 hold the address of the array



	

;===== Loop to find the largest element's position  ====================================================================================================
	
	mov r15,0	; r15 is the counter
	mov r9,0	;
	
	mov r10, [r13]		;the first value of the array, r10 hold the largest value
loop:
	cmp r15,r12		;compare to the r12 == size
	jge next				;exit the loop when counter >= array's
	
	cmp r10,[r13 +(8*r15)]		;comparing
	jl change
	
	inc r15				; increase r15 by 1
	jmp loop			;repeat the loop 


change:
mov r10, [r13 +(8*r15)]		;change r10 if <
mov r9,r15		;save the position of the largest number 
jmp loop

next:


;=====  Return the sum back to the caller ====================================================================================================
	

	
	mov rax, r9


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


