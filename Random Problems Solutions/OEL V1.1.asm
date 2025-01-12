INCLUDE "EMU8086.INC"  
.MODEL SMALL
.STACK 100H
.DATA
    IP_NUM DB ?
    IP_CHAR DB 400 DUP(?)
    CHAR_COUNT DB 0
    REV_CHAR DB 400 DUP(?)
    DEC_NUM DW ?   
    
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        
        PRINTN "MY NAME IS ISHTI. AND ID IS 200021125"
        
        CHECKING_ODDEVEN:
        PRINT "ENTER A SINGLE DIGIT:    "
        MOV AH,1
        INT 21H
        SUB AL,48
        MOV IP_NUM,AL
        
        
        MOV BL, 1
        MOV BH,IP_NUM
        AND BH,BL
        CMP BH,0
        JE EVEN
        PRINTN
        PRINTN "THE NUMBER IS ODD" 
        JMP EXIT_EVENODD
        EVEN:
            PRINTN
            PRINTN "THE NUMBER IS EVEN"
            
        EXIT_EVENODD:
        ;TESTING AGAIN FOR EVEN ODD TEST
        PRINTN "DO YOU WANT TO TRY AGAIN (Y/N)?"
        MOV AH,1
        INT 21H
        CMP AL,'Y'
        JE  CHECKING_ODDEVEN 
        
        ;INPUTTING CHARACTER
        PRINTN
        MASTER_CHAR_IP:
        PRINTN
        PRINT "ENTER SOME CHARACTERS: " 
        
        XOR SI,SI
        XOR BX,BX
        MOV CHAR_COUNT,BL
        IP_CHAR_LOOP:
            MOV AH,1
            INT 21H
            CMP AL,0DH
            JE EXIT_IP_CHAR
            MOV IP_CHAR[SI],AL
            INC CHAR_COUNT
            INC SI
            XOR AH,AH
            PUSH AX
            JMP IP_CHAR_LOOP
            
        EXIT_IP_CHAR:
        
        XOR SI,SI
        MOV CL,CHAR_COUNT
        XOR CH,CH
        
        REV_CHAR_PREP:
            POP AX
            XOR AH,AH
            MOV REV_CHAR[SI],AL
            INC SI
        LOOP REV_CHAR_PREP
        
        XOR SI,SI
        MOV CL,CHAR_COUNT
        XOR CH,CH
        
        PRINTN
        PRINTN "THE CHARACTERS IN REVERSE ARE:"
        PRINT_REV_CHARS:
            MOV AH,2
            MOV DL,REV_CHAR[SI]
            INT 21H
            INC SI
        LOOP PRINT_REV_CHARS
        
        ANOTHER_CHECK:
            PRINTN
            PRINT "DO YOU WANT TO TEST AGAIN (Y/N)?: "
            MOV AH,1
            INT 21H
            CMP AL,'Y'
            JE  MASTER_CHAR_IP
            PRINTN ; EXITING CHAR THING
            
            
        ;ENTERING 4 DIGIT DEC NUM
        PRINTN
        PRINT "ENTER A 4 DIGIT NUMBER: "
        CALL SCAN_NUM
        MOV DEC_NUM,CX
        
        PRINTN
        PRINTN "THE ENTERED NUMBER IN DECIMAL IS: "
        MOV AX,DEC_NUM
        CALL PRINT_NUM
        
        ;PRINTING IN BINARY
        PRINTN
        PRINTN "THE ENTERED NUMBER IN BINARY IS: "
        MOV BX,DEC_NUM
        MOV AH,2
        MOV CL,16
        XOR CH,CH
        FOR:
            RCL BX,1
            JC OUTPUT_ONE
            MOV DL,'0'
            INT 21H
            JMP EXIT_FOR
            
            OUTPUT_ONE:
                MOV DL,'1'
                INT 21H
        EXIT_FOR:
        LOOP FOR
            
            MOV AH, 4CH
            INT 21H
            MAIN ENDP
        DEFINE_SCAN_NUM
        DEFINE_PRINT_NUM_UNS
        DEFINE_PRINT_NUM
    
        
    
 ENDP