.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem msvcrt.lib, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern printf: proc
extern scanf: proc
extern exit: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; declaring data
.data
msg_welcome db "Welcome to your HealthApp! :D",13,10,0
msg_reminder db "Here is your daily reminder, in order to maintain your healthy lifestyle:", 13, 10,0
msg_advice1 db "1.Do some workout to keep your body healthy and fit.(walking, running, crunching, ropping )",13,10,0
msg_advice2 db "2.Eat high protein, vegetables and avoid fast food.",13,10,0
msg_advice3 db "3.Drink at least 2L water and sleep 8 hours per day.",13,10,0
msg db "Choose between:", 13, 10, "Case 1 = The underweight type (enter 1)", 13, 10, " Case 2 = The normal type (enter 2)", 13, 10," Case 3 = The overweight type (enter 3)", 13, 10, " Case 4 = The obese type (enter 4)", 13, 10, "Your choice..", 0
address_choice db 12 dup(64) ; read until the first enter / space in the memory
						
number_choice db "%d", 0
msg_underweight db "You should choose nutrient-rich foods (whole-grain breads, pastas and cereals). Don't forget to have an occasional treat and make every bite count! ;)", 13, 10,13, 10, 0
msg_normal db "Congrats! Keep up the good work and stay healthy! :) ",  13, 10,13, 10, 0
msg_overweight db "No need to worry! You need to engage in regular physical activity and get enough calcium to regulate body composition. Be patient and you'll see the results. :) ",  13, 10,13, 10, 0
msg_obese db "You have to reduce the number of calories you consume and start tracking everything you eat. Step by step, you should consider adding physical activity after reaching a minimum of 10 percent weight-loss goal. :) ",  13, 10,13, 10, 0
msg_case1 db "Underweight (example)", 13, 10, "BMI= %d < 18.5", 13, 10, "Weight= %d kg", 13, 10,  "Height= %d cm", 13, 10, 0 ; printf requires NULL terminated 
msg_case2 db "Normal (example)", 13, 10, "BMI= %d between (18.5,24.9) ", 13, 10, "Weight= %d kg", 13, 10,  "Height= %d cm", 13, 10, 0 
msg_case3 db "Overweight (example)", 13, 10, "BMI= %d between (25,29.9) ", 13, 10, "Weight= %d kg", 13, 10,  "Height= %d cm", 13, 10, 0 
msg_case4 db "Obesity (example)", 13, 10, "BMI= %d between > 30 ", 13, 10, "Weight= %d kg", 13, 10,  "Height= %d cm", 13, 10, 0 
.code
; start the execution
start: 
     push offset msg_welcome
	call printf
	push 0
	push offset msg_reminder
	call printf
	push 0
	push offset msg_advice1
	call printf
	push 0
	push offset msg_advice2
	call printf
	push 0
	push offset msg_advice3
	call printf
	push 0
	push offset msg
	call printf
	push 0
	
	push offset address_choice 
	push offset number_choice
	call scanf
	add esp, 8
		
	
	mov cl, 0 ; initializing the 8 bit register
	
	;;;;; the 4 cases
	mov cl, address_choice
	cmp cl, 1
	je return_message_case1
	
	mov cl, address_choice
	cmp cl, 2
	je return_message_case2
	
	mov cl, address_choice
	cmp cl, 3
	je return_message_case3
	
	mov cl, address_choice
	cmp cl, 4
	je return_message_case4
	
	;;;;;;;
	
	; initializing the registers mostly used in arithmetic and logic operations 
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0
	mov ax, 172 


	
	; end of the program
	push 0
	call exit
	
	return_message_case1 proc
		mov ecx, 172 ; we consider the height to be 172 cm
		push ecx
		mov eax, 53 ; we consider the weight to be 53 kg
		push eax
		mov eax, 17 ; BMI
		push eax
		push offset msg_case1 ; the arguments of the function are placed in reverse order, on the stack
		call printf  
		push 0
		add esp, 32 ; 8*4
		push offset msg_underweight
		call printf
		push 0
	return_message_case1 endp
	
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0
	mov ax, 165

	push 0
	call exit
	
	return_message_case2 proc
		mov ecx, 165 ; we consider the height to be 165 cm
		push ecx
		mov eax, 56 ; we consider the weight to be 56 kg
		push eax
		mov eax, 20 ; BMI
		push eax
		push offset msg_case2 ; the arguments of the function are placed in reverse order, on the stack
		call printf  
		add esp, 32 ; 8*4
		push offset msg_normal
		call printf
		push 0
	return_message_case2 endp	
    
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0
	mov ax, 180
	

	push 0
	call exit
	
	return_message_case3 proc
		mov ecx, 180 ; we consider the height to be 180 cm
		push ecx
		mov eax, 90 ; we consider the weight to be 90 kg
		push eax
		mov eax, 27 ; BMI
		push eax
		push offset msg_case3 ; the arguments of the function are placed in reverse order, on the stack
		call printf  
		add esp, 32 ; 8*4
		push offset msg_overweight
		call printf
		push 0
	return_message_case3 endp	
		mov eax, 0
	    mov ebx, 0
	    mov ecx, 0
	    mov edx, 0
	    mov ax, 175


	    push 0
	    call exit
		
		return_message_case4 proc
		mov ecx, 175 ; we consider the height to be 175 cm
		push ecx
		mov eax, 95 ; we consider the weight to be 95 kg
		push eax
		mov eax, 31 ; BMI
		push eax
		push offset msg_case4 ; the arguments of the function are placed in reverse order, on the stack
		call printf  
		add esp, 32 ; 8*4
		push offset msg_obese
		call printf
		push 0
	return_message_case4 endp	
	    mov eax, 0
	    mov ebx, 0
	    mov ecx, 0
	    mov edx, 0

	    push 0
	    call exit
	
	
end start