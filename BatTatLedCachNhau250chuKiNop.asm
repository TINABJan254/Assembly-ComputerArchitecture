.MODEL SMALL
.STACK 100
.DATA
    CRLF DB 13, 10, '$'
    port equ 2C0H
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    start:
        MOV AL, 00000000B
        MOV DX, port
        OUT DX, AL
        
        MOV CX, 250
        L1:
            NOP
        LOOP L1    
        
        MOV AL, 11111111B
        OUT DX, AL
        
        MOV CX, 250
        L2:    
            NOP
        LOOP L2
        
    JMP start
    
    ;Ket thuc chuong trinh
    MOV AH, 4CH
    INT 21H
         
MAIN ENDP
END MAIN
