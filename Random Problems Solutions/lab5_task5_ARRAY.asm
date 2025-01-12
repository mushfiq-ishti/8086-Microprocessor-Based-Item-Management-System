INCLUDE "EMU8086.INC"  
.MODEL SMALL
.STACK 100H
.DATA
    IP_STRING DB 400 DUP(?)
    COUNTS DB 0
    SEQUENCE_COUNTER DB 400 DUP(0)
    SEQUENCE_COUNT DW 1 
    
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
            
        XOR SI,SI
   
        INPUT:
            MOV AH,1
            INT 21H
            CMP AL,0DH
            JE EXIT_INPUT
            XOR AH,AH
            PUSH AX
            MOV IP_STRING[SI],AL
            INC SI
            INC COUNTS
            JMP INPUT      
        
        EXIT_INPUT:
                          
            XOR SI,SI
            XOR BX,BX
            XOR DI,DI
            
            MOV DL,IP_STRING[SI]
            
            MOV DH,IP_STRING[SI+1]
            SUB DH,1
            
            CMP DL,DH
            JE CONTINUE
            
            
            
            CONTINUE:
                INC SI
                INC SEQUENCE COUNT
            
            MOV AH, 4CH
            INT 21H
            MAIN ENDP
        DEFINE_SCAN_NUM
        DEFINE_PRINT_NUM_UNS
        DEFINE_PRINT_NUM
    
        
    
 ENDP