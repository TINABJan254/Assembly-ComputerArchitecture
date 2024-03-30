;Nhap vao 1 ky tu, in ra ky tu o dang in thuong      
;A -> a
;a -> a
.MODEL SMALL
.STACK 100
.DATA   
    CRLF DB 13, 10, '$'
    tmp DB ?
.CODE
MAIN PROC              
    
    MOV AX, @DATA
    MOV DS, AX
    
    ;Read
    MOV AH, 1      
    INT 21H  
    MOV tmp, AL
    
    ;Enter
    LEA DX, CRLF
    MOV AH, 9
    INT 21H  
    
    ;Solve
    MOV AL, tmp 
    CMP AL, 'A'
    JL continue
    CMP AL, 'Z'
    JG continue
    
    ;Convert to lowercase
    ADD AL, 32
    
    continue:
        MOV AH, 2
        MOV DL, AL  
        INT 21H
    
    
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN