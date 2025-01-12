INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 200H  
 
.DATA
 C DB 0
.CODE 
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    START:
    CMP C,3
    JA FAILED
    PRINTN "ENTER BETWEEN 0 - 9 OR A-F"
    
    MOV AH,1
    INT 21H
    PRINTN
    PRINT "OUTPUT: "
    MOV BL,AL
    MOV AH,2
    
    CMP BL,30H
    JL ERROR
    CMP BL,67H
    JG ERROR
    
    IF1:
    CMP BL,39H
    JG IF2
    MOV DL,BL
    INT 21H
    JMP EXIT
    
    IF2:
    CMP BL,41H
    JL ERROR
    CMP BL,46H
    JG IF3
    MOV DL,31H
    INT 21H
    MOV DL,BL
    SUB DL,17
    INT 21H
    JMP EXIT
    
    IF3:
    CMP BL,61H
    JL ERROR
    MOV DL,31H
    INT 21H
    MOV DL,BL
    SUB DL,49
    INT 21H
    JMP EXIT
     
    
    ERROR:
    PRINTN "INPUT IS NOT IN VALID. TRY AGAIN"
    INC C
    JMP START
    
    FAILED:
    PRINTN "YOU FAILED IN 3 ATTEMPTS"
    
    EXIT:
    MOV AH,4CH
    INT 21H  
    MAIN ENDP
ENDP