INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 200H  
 
.DATA
 N DB 1
.CODE 
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH,2
    MOV DL,80H ;INTITIAL COUNTER
    
    FOR1:
    CMP N,10
    JG NEWLINE
    INT 21H
    PRINT " " 
    INC DL
    INC N
    CMP DL,0FFh
    JG EXIT
    
    JMP FOR1
    
    NEWLINE:
    PRINTN
    MOV CL,1
    MOV N,CL
    JMP FOR1  
    
    EXIT:
    MOV AH,4CH
    INT 21H  
    MAIN ENDP
ENDP