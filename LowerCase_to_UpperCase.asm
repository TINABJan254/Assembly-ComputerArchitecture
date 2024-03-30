;Nhap vao 1 ky tu thuong, in ra ky tu in hoa
.MODEL SMALL
.STACK 100
.DATA                   
    CRLF    DB	13, 10, '$'     ;ki tu xuong dong
     
.CODE
MAIN PROC              
    
    MOV AX, @DATA
    MOV DS, AX
    
    ;Read
    MOV AH, 1
    INT 21H
    
    ;Print
    MOV DL, AL
    SUB DL, 32  ;lower_case - 32 = upper_case
    MOV AH, 2
    INT 21H
    
    MOV AH, 4CH
    INT 21H
        
MAIN ENDP
END MAIN