 INCLUDE "EMU8086.INC"  
.MODEL SMALL
.STACK 100H
.DATA
    N DW ?
    M DW ?   
    DEC_IP DW 0    
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX   
        
        PRINT "ENTER THE SMALL NUMBER N: "
        CALL SCAN_NUM
        MOV N,CX
        XOR CX,CX
        PRINTN
        
        PRINT "ENTER THE LARGE NUMBER M: "
        CALL SCAN_NUM
        MOV M,CX
        XOR CX,CX
        PRINTN
        
        WHILE1:
            XOR DX,DX
            MOV AX,M
            DIV N
            
            CMP DX,0 ; COMAPERING REMAINDER
            JE END_WHILE1
            
            MOV BX,N ;TEMP
            XCHG M,BX
            MOV N,DX  ; N NOW HAS REMAINDER
            JMP WHILE1
        
        END_WHILE1:
        PRINTN
        PRINT "GCD: "
        MOV AX,N
        CALL PRINT_NUM
       
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
    DEFINE_SCAN_NUM
    DEFINE_PRINT_NUM_UNS
    DEFINE_PRINT_NUM
    
    
 ENDP