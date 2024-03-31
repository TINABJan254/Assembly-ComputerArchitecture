;Nhap vao 1 xau, va dem chieu dai cua xau, ket thuc nhap bang phim ENTER
;Len(str) < 10)
.MODEL SMALL
.STACK 100
.DATA   
    CRLF DB 13, 10, '$'  
    str DB 50DUP('$')
     
.CODE
MAIN PROC    
    
    MOV AX, @DATA
    MOV DS, AX
    
    ;Nhap xau
    LEA SI, str
    LAP:
        MOV AH, 1
        INT 21H
        
        CMP AL, 13 ;Kiem tra phim enter
        JE THOAT
        
        MOV [SI], AL
        INC SI
    
    JMP LAP
    
    THOAT:        
    
    ;Enter
    MOV AH, 9
    LEA DX, CRLF
    INT 21H
    
    MOV AH, 9
    LEA DX, str
    INT 21H
    
    ;Ket thuc chuong trinh
    MOV AH, 4CH
    INT 21H    
    
    
MAIN ENDP
END MAIN