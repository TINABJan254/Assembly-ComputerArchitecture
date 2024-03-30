;Nhap vao 1 ky tu thuong, in ra ky tu in hoa
.MODEL SMALL
.STACK 100
.DATA                   
    CRLF DB	13, 10, '$'     ;ki tu xuong dong
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
    
    ;Convert and print
    MOV DL, tmp
    SUB DL, 32  ;lower_case - 32 = upper_case
    MOV AH, 2
    INT 21H
    
    MOV AH, 4CH
    INT 21H
        
MAIN ENDP
END MAIN