INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
    MSG DB 0AH,0DH,'THE LONGEST CONSECUTIVELY INCREASING STRING IS: $'
.CODE
    MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    PRINT "ENTER A STRING OF CAPITAL LETTERS: "
    
    MOV CL,0D ;Local Instant Counter
    INPUT1:
        MOV AH,1
        INT 21H
        CMP AL,0DH
        JE ENTER
        MOV CL,1
        MOV BL,AL
        MOV DH,AL
   INPUT2:
        INT 21H
        CMP AL,0DH
        JE ENTER
        INC BL
        CMP BL,AL
        JNE RESET
        INC CL
        JMP INPUT2
    RESET:
        CMP CH,CL
        JL UPDATE
        MOV CL,1
        MOV BL,AL
        MOV DH,AL
        JMP INPUT2
    UPDATE:
        MOV CH,CL ;CH is the max Counter
        MOV BH,DH
        MOV CL,1
        MOV BL,AL
        MOV DH,AL
        JMP INPUT2
    ENTER:
        CMP CH,CL
        JL MAX
        JMP OP
    MAX:
        MOV CH,CL
        MOV BH,DH
        JMP OP
    OP:
       LEA DX,MSG
       MOV AH,9
       INT 21H
       MOV AH,2
      MOV DL,BH
   SEQUENCE:
     CMP CH,0
     JE EXIT
     DEC CH
     INT 21H
     INC DL
     JMP SEQUENCE
    EXIT:
        MOV AH,4CH
        INT 21H
        MAIN ENDP
END MAIN