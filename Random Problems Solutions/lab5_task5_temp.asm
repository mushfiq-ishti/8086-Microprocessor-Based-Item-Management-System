INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 200H

.DATA
    MAX_REP DB 0
    MAX_LETTER DB ?
    TEMP_COUNTER DB 0
    TEMP_LETTER DB ?

.CODE
    MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    PRINTN "ENTER A STRING OF CAPITAL LETTERS: "
    
    TAKING_IP:
        XOR BX,BX
        MOV TEMP_COUNTER,BL ;TEMP_COUNTER=0
        MOV AH,1
        INT 21H ; TAKING SEQUENCE OF CHARACTERS
        CMP AL,0DH
        JE EXIT_NEXT_LETTERS
        MOV TEMP_LETTER,AL ;HAVING THE FIRST LETTER
        
        NEXT_LETTERS:
            MOV AH,1
            INT 21H ; TAKING THE 2ND LETTER
            CMP AL,0DH
            JE EXIT_NEXT_LETTERS
            
            INC TEMP_COUNTER
            SUB AL,TEMP_COUNTER
            CMP AL,TEMP_LETTER
            JE NEXT_LETTERS
            
            MOV BL,MAX_REP
            CMP TEMP_COUNTER,BL 
            JG NEW_SEQUENCE
            JMP TAKING_IP
            
            NEW_SEQUENCE:
                MOV BL,TEMP_COUNTER
                MOV MAX_REP,BL
                MOV BL,TEMP_LETTER
                MOV MAX_LETTER,BL
                JMP NEXT_LETTERS
                            
    EXIT_NEXT_LETTERS:
        PRINTN
        MOV CL,MAX_REP
        XOR CH,CH
        MOV DL,MAX_LETTER
        MOV AH,2
        PRINTING:
            INT 21H
            INC DL
       LOOP PRINTING
               
    MOV AH,4CH
    INT 21H
    MAIN ENDP
ENDP