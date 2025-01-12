INCLUDE "EMU8086.INC"  
.MODEL SMALL
.STACK 100H
.DATA
    COUNT DB 0
    BIN_IP DW 0    
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX   
        
        XOR BX,BX
        PRINT "TAKE INPUT: "
        MOV AH,1
   
        FOR1:
            INT 21H
            CMP AL,0DH
            JE END_FOR1
            SUB AL,48
            SHL BX,1
            OR BL,AL
            INC COUNT
            JMP FOR1
   
        END_FOR1:
        MOV BIN_IP,BX
        PRINTN
        PRINTN "OUTPUT: "
        
        MOV CL,4
        XOR CH,CH
        MOV AH,2
        
        FOR2:
            MOV DL,BH
            SHR DL,4
            SHL BX,4
            
            CMP DL,10
            JGE LETTER
            
            ADD DL,48
            INT 21H
            JMP END_FOR2
            
            LETTER:
                ADD DL,55
                INT 21H
       END_FOR2:
       LOOP FOR2
       
    
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
 ENDP