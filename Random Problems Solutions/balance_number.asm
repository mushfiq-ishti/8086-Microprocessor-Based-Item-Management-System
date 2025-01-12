INCLUDE "EMU8086.INC"  
.MODEL SMALL
.STACK 100H
.DATA
    IP_NUM DB 10 DUP(?)
    COUNT_DIGITS DB 0
    FORWARD_SUM DB 0
    BACKWARD_SUM DB 0
    TRAVERSE_MAX_INDEX DB 0
    
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        
        PRINT "GIVE A NUMBER: "
        XOR SI,SI
        INPUT:
            MOV AH,1
            INT 21H
            CMP AL,0DH
            JE EXIT_INPUT
            SUB AL,48
            MOV IP_NUM[SI],AL
            INC SI
            INC COUNT_DIGITS
            JMP INPUT
            
        EXIT_INPUT:
        PRINTN
        MOV AL,COUNT_DIGITS
        XOR AH,AH
        MOV BL,2
        DIV BL
        MOV TRAVERSE_MAX_INDEX,AL
        
        XOR SI,SI
        
        XOR DI,DI
        MOV DL,COUNT_DIGITS
        XOR DH,DH
        MOV DI,DX
        DEC DI
        
        MOV CL,TRAVERSE_MAX_INDEX
        XOR CH,CH
        
        SUMMING:
            MOV BL,IP_NUM[SI]
            ADD FORWARD_SUM,BL
            
            MOV BH,IP_NUM[DI]
            ADD BACKWARD_SUM,BH
            
            INC SI
            DEC DI
            
        LOOP SUMMING
        
        XOR BX,BX
        
        MOV BL,BACKWARD_SUM
        CMP FORWARD_SUM,BL
        JE BALANCE
        PRINT "NOT BALANCE NUMBER"
        JMP EXIT
             
        BALANCE:
            PRINT "BALANCE NUMBER"
        
        EXIT:
            MOV AH, 4CH
            INT 21H
            MAIN ENDP
        DEFINE_SCAN_NUM
        DEFINE_PRINT_NUM_UNS
        DEFINE_PRINT_NUM
    
        
    
 ENDP