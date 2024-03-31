;Nhap vao 1 xau, va in xau ra man hinh, ket thuc nhap bang phim ENTER
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
        
        CMP AL, 13
        JE THOAT
        
        MOV [SI], AL
        INC SI
        
    JMP LAP
    
    THOAT: 
    
    ;In xau ra man hinh
    MOV AH, 9   
    
    ;ENTER
    LEA DX, CRLF
    INT 21H
    
    ;In xau
    LEA DX, str
    INT 21H
    
    ;Ket thuc chuong trinh
    MOV AH, 4CH
    INT 21H    
    
    
MAIN ENDP
END MAIN