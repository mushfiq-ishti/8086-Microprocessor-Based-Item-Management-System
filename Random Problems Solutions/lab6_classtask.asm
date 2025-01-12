INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 200H  
 
.DATA
 
 
.CODE 
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV DH, 0FFH
    MOV DL, 00H
    SHL DH, 1
    PUSH DX
    
    MOV DH, 0FFH
    MOV DL, 00H
    SHR DH, 1
    PUSH DX
    
    MOV DH, 0FFH
    MOV DL, 00H
    SAL DH, 1
    PUSH DX
    
    MOV DH, 0FFH
    MOV DL, 00H
    SAR DH, 1
    PUSH DX
    
    MOV DH, 0FFH
    MOV DL, 00H
    ROL DH, 1
    PUSH DX
    
    MOV DH, 0FFH
    MOV DL, 00H
    ROR DH, 1
    PUSH DX
    
    MOV DH, 0FFH
    MOV DL, 00H
    RCL DH, 1
    PUSH DX
    
    MOV DH, 0FFH
    MOV DL, 00H
    RCR DH, 1
    PUSH DX
    

    
    POP BX
    POP BX
    POP BX
    POP BX
    POP BX
    POP BX
    POP BX
    POP BX
   
    
    MOV AH,4CH
    INT 21H  
    MAIN ENDP
ENDP