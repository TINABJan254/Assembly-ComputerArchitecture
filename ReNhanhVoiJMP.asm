.MODEL SMALL
.STACK 100
.DATA   
    CRLF DB 13, 10, '$'
     
.CODE
MAIN PROC    
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AX, -4
    
    CMP AX, 0
    JG Greater
    JE Equal
    JL Less
    
    Greater:
        MOV CX, 1
        JMP RA
    Equal:
        MOV CX, 0
        JMP RA
    Less:
        MOV CX, -1
        JMP RA
    RA:
    
    MOV AH, 4CH
    INT 21H
    
    
MAIN ENDP
END MAIN