;Nhap vao 1 chuoi ky tu, ket thuc khi nhap dau #
.MODEL SMALL
.STACK 100
.DATA   
    CRLF DB 13, 10, '$'  
    str DB 100 DUP('$')
     
.CODE
MAIN PROC    
    
    MOV AX, @DATA
    MOV DS, AX
    
    ;Nhap xau
    LEA SI, str
    NHAP:
        MOV AH, 1
        INT 21H
              
        CMP AL, '#'
        JE THOAT
              
        MOV [SI], AL
        INC SI
    JMP NHAP
    
    THOAT:
    
    ;Ket thuc chuong trinh
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN