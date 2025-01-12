INCLUDE "EMU8086.INC"  
.MODEL SMALL
.STACK 100H
.DATA
    NUM_ARRAY DB 40 DUP(?)
    N DW 10   
        
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        
        MOV SI,0
        MOV NUM_ARRAY[SI],1
        INC SI
        MOV NUM_ARRAY[SI],1
        
        FOR1:
            MOV BL,NUM_ARRAY[SI-1]
            MOV BH,NUM_ARRAY[SI]
            ADD BH,BL
            INC SI
            MOV NUM_ARRAY[SI],BH
            
            CMP SI,N
            JE EXIT_FOR1:
            JMP FOR1
            
        EXIT_FOR1:
        
        PRINTN
        PRINT "OUTPUT: "  
        
        XOR SI,SI
        PRINTING:
            MOV BX,SI
            CMP BX,N
            JE END_PRINTING
            MOV AL,NUM_ARRAY[SI]
            XOR AH,AH
            CALL PRINT_NUM_UNS
            PRINT " "
            INC SI
            JMP PRINTING
            
            
        END_PRINTING:    
        
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
    DEFINE_SCAN_NUM
    DEFINE_PRINT_NUM_UNS
    DEFINE_PRINT_NUM
    
    
 ENDP