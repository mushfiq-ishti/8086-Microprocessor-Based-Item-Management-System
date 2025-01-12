 INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 200H  
 
.DATA

.CODE 
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH,2
    MOV DL,63
    INT 21H
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    INT 21H
    MOV BH,AL
    
    SUB BL,48
    SUB BH,48
    
    ADD BL,BH
    
    MOV DL,BL
    ADD DL,48
    MOV BL,DL
    MOV DL,0DH
    
    MOV AH,2
    INT 21H
    MOV DL,0AH
    INT 21H
    PRINT "THEIR SUM IS "
    MOV DL,BL
    INT 21H
    
    MOV AH,4CH
    INT 21H  
    MAIN ENDP
ENDP