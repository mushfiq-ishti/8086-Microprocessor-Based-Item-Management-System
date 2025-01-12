INCLUDE "EMU8086.INC"  
.MODEL SMALL
.STACK 100H
.DATA
    CHAR DB ?
    ONE_COUNT DB 0
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX   
        PRINT "ENTER A CHARACTER:   "
        MOV AH,1
        INT 21H
        MOV CHAR,AL
        PRINTN
    
        PRINT "THE ASCII CODE OF BINARY IS: " 
        MOV BL,CHAR
    
        MOV CX,8
        PRINTING:
        CMP CX,0
        JE EXIT_PRINTING
        DEC CX
        RCL BL,1
        JC OUTPUT_1:
        MOV DL,'0'
        MOV AH,2
        INT 21H
        JMP PRINTING
        
        OUTPUT_1:
            INC ONE_COUNT
            MOV DL,'1'
            MOV AH,2
            INT 21H
            JMP PRINTING
            
    EXIT_PRINTING:
    
    PRINTN
    PRINT "NUMBER OF ONE: "
    MOV DL,ONE_COUNT
    ADD DL,48
    MOV AH,2
    INT 21H
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
 ENDP