INCLUDE "EMU8086.INC"  
.MODEL SMALL
.STACK 100H
.DATA
    SECONDS DW 0
    HOURS DW 0
    MINUTES DW 0 
    
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
            
            PRINT "ENTER NUMBER OF SECONDS: "
            CALL SCAN_NUM
            MOV SECONDS,CX
            PRINTN
            
            ;CHECKING HOURS
            MOV AX,SECONDS
            MOV BX,3600
            
            XOR DX,DX
            DIV BX
            MOV HOURS,AX
            MOV SECONDS,DX
            
            ;CHECKING MINUTES
            MOV AX,SECONDS
            MOV BX,60
            
            XOR DX,DX
            DIV BX
            MOV MINUTES,AX
            MOV SECONDS,DX
            
            ;PRINTING:
            PRINT "HOURS: "
            MOV AX,HOURS
            CALL PRINT_NUM
            PRINTN
            
            PRINT "MINUTES: "
            MOV AX,MINUTES
            CALL PRINT_NUM
            PRINTN
            
            PRINT "SECONDS: "
            MOV AX,SECONDS
            CALL PRINT_NUM                
       
            MOV AH, 4CH
            INT 21H
            MAIN ENDP
        DEFINE_SCAN_NUM
        DEFINE_PRINT_NUM_UNS
        DEFINE_PRINT_NUM
    
        
    
 ENDP