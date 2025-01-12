 INCLUDE "EMU8086.INC"  
.MODEL SMALL
.STACK 100H
.DATA
 N DW 7
 FACT DW 1        
                         
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        
        MOV CX,N
        MOV AX,1
        
        TOP:
            MUL CX
        LOOP TOP
        
        PRINTN
        CALL PRINT_NUM 
        MOV AH, 4CH
        INT 21H
        MAIN ENDP
        DEFINE_SCAN_NUM
        DEFINE_PRINT_NUM_UNS
        DEFINE_PRINT_NUM
    
        
    
 ENDP