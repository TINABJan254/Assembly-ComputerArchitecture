;Nhap vao 1 xau, va dem chieu dai cua xau, ket thuc nhap bang phim ENTER
;Len(str) < 10)
.MODEL SMALL
.STACK 100
.DATA   
    CRLF DB 13, 10, '$'  
    str DB 50 DUP('$')
     
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
    
    ;Dem do dai xau
    MOV CX, 0
    LEA SI, str
    LAP2:
        CMP [SI], '$' ;Kiem tra cuoi xau
        JE THOAT2
        
        INC CX
        INC SI
    JMP LAP2
    
    THOAT2:     
    
    ;Enter
    MOV AH, 9
    LEA DX, CRLF
    INT 21H
    
    ;In do dai xau                         
    MOV AH, 2
    MOV DL, CL
    ADD DL, '0'    ;Chuyen so ve dang ky tu
    INT 21H
    
    ;Ket thuc chuong trinh
    MOV AH, 4CH
    INT 21H    
    
    
MAIN ENDP
END MAIN