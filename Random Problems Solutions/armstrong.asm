INCLUDE "EMU8086.INC"  
.MODEL SMALL
.STACK 100H
.DATA
    IP_NUM  DW 0
    DIGITS DB 5 DUP(?) ;MAX 5 DIG NUM
    DIGIT_COUNT DW 0
    CUBE_ARRAY DW 5 DUP(?)      
                         
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        
        PRINT "ENTER A NUM:     "
        CALL SCAN_NUM
        MOV IP_NUM, CX ;
        
        ;DIGIT SPLITTING
        MOV BL,10
        MOV AX,IP_NUM
        XOR SI,SI
        
        WHILE1:
            DIV BL ;
            INC DIGIT_COUNT
            MOV DIGITS[SI],AH ; LAST DIGITS
            CMP AL,0
            JE END_WHILE1
            
            INC SI
            XOR AH,AH  ; CLEARING PREVIOUS REMAINDER
            
            JMP WHILE1
            
        END_WHILE1:
         
        XOR SI,SI;FOR DIGITS ARRAY
        XOR DI,DI; FOR CUBE ARRAY
        MOV CX,DIGIT_COUNT
        
        FOR1:
            MOV AL,DIGITS[SI]
            CALL CUBE 
            MOV CUBE_ARRAY[DI],AX
            INC SI
            ADD DI,2
       
       LOOP FOR1
        
       
     ;ADDING
     XOR SI,SI
     XOR DI,DI
     XOR CX,CX
     MOV CX,DIGIT_COUNT
     XOR BX,BX
     
     FOR2:
       ADD BX,CUBE_ARRAY[SI]
       ADD SI,2
    LOOP FOR2       
         
    CMP BX,IP_NUM
    JE ARMSTRONG
    PRINTN
    PRINT "NOT ARMSTRONG"
    JMP EXIT
    
    ARMSTRONG:
        PRINTN
        PRINT "ARMSTRONG NUM"
        
        
    
    EXIT:    
        MOV AH, 4CH
        INT 21H
        MAIN ENDP
        DEFINE_SCAN_NUM
        DEFINE_PRINT_NUM_UNS
        DEFINE_PRINT_NUM
    
        CUBE PROC
        MOV BL,AL 
       MUL AL
       XOR AH,AH ; ASUUMING NUMBER IS IN AL. SQUARE IS IN AX
       MUL BL ;NUM IS IN AX
       RET

    
 ENDP