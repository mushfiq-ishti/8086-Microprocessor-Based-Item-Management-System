 INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 200H  
 
.DATA

.CODE 
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH,2
    MOV DL,'?'
    INT 21H
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    INT 21H
    MOV BH,AL
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    CMP BH,BL
    JL IF
    MOV DL,BL
    INT 21H
    MOV DL,BH
    INT 21H
    JMP EXIT
    
    IF:
    MOV DL,BH
    INT 21H
    MOV DL,BL
    INT 21H
    
    EXIT:
    MOV AH,4CH
    INT 21H  
    MAIN ENDP
ENDP