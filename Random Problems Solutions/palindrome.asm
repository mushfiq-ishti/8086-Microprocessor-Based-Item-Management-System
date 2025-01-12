INCLUDE 'EMU8086.INC'
.MODEL SMALL
.DATA
    IP_STRING DB 20 DUP(?)
    REV_STRING 20 DUP(?)    
    COUNT DB 0  

.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
    PRINTN "ENTER SEQUENCE OF CHARACTERS"
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
        INC COUNT
        JMP INPUT      
        
    EXIT_INPUT:
    
    XOR BX,BX
    XOR SI,SI
    MOV CL,COUNT
    XOR CH,CH
    
    REV_IP:
        POP BX
        MOV REV_STRING[SI],BL
        INC SI        
    LOOP REV_IP
    
    XOR SI,SI
    XOR BX,BX
    XOR CX,CX
    MOV CL,COUNT
    
    CHECK_LOOP:
        MOV BL,IP_STRING[SI]
        MOV BH,REV_STRING [SI]
        
        CMP BL,BH
        JNE NOT_PALINDROME
    
    LOOP CHECK_LOOP
    
    PRINTN
    PRINT "PALINDROME"
    JMP EXIT 
       
    NOT_PALINDROME:
        PRINTN
        PRINT "NOT PALINDROME"
        JMP EXIT
        
        EXIT:
        MOV AH,4CH
        INT 21H
        MAIN ENDP
    END MAIN