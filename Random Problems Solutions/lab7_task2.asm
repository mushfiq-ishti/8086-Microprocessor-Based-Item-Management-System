INCLUDE "EMU8086.INC"  
.MODEL SMALL
.STACK 100H
.DATA
    CENTS DW 0
    HALF_DOLLARS DB 0
    QUARTERS DB 0
    DIMES DB 0
    NICKELS DB 0   
    
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
            
            PRINT "ENTER NUMBER OF CENTS: "
            CALL SCAN_NUM
            MOV CENTS,CX
            PRINTN
            
            ;CHECKING HALF DOLLARS
            MOV AX,CENTS
            MOV BL,50
            
            DIV BL
            MOV HALF_DOLLARS,AL
            MOV BL,AH
            XOR  BH,BH
            MOV CENTS,BX
            
            ;CHECKING QUARTERS
            MOV AX,CENTS
            MOV BL,25
            
            DIV BL
            MOV QUARTERS,AL
            MOV BL,AH
            XOR  BH,BH
            MOV CENTS,BX
            
            ;CHECKING DIMES
            MOV AX,CENTS
            MOV BL,10
            
            DIV BL
            MOV DIMES,AL
            MOV BL,AH
            XOR  BH,BH
            MOV CENTS,BX
            
            ;CHECKING HALF DOLLARS
            MOV AX,CENTS
            MOV BL,5
            
            DIV BL
            MOV NICKELS,AL
            MOV BL,AH
            XOR  BH,BH
            MOV CENTS,BX
            
            ;PRINTING:
            PRINT "HALF DOLLARS: "
            MOV AL, HALF_DOLLARS
            XOR AH,AH
            CALL PRINT_NUM
            PRINTN
            
            PRINT "QUARTERS: "
            MOV AL, QUARTERS
            XOR AH,AH
            CALL PRINT_NUM
            PRINTN
            
            PRINT "DIMES: "
            MOV AL, DIMES
            XOR AH,AH
            CALL PRINT_NUM
            PRINTN
            
            PRINT "NICKELS: "
            MOV AL, NICKELS
            XOR AH,AH
            CALL PRINT_NUM
            PRINTN
            
            PRINT "CENTS: "
            MOV AX, CENTS
            CALL PRINT_NUM
            PRINTN                    
       
            MOV AH, 4CH
            INT 21H
            MAIN ENDP
        DEFINE_SCAN_NUM
        DEFINE_PRINT_NUM_UNS
        DEFINE_PRINT_NUM
    
        
    
 ENDP