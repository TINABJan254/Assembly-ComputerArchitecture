;Nhap vao 1 chuoi, in chuoi dao nguoc  
;Using stack, luu vao mot chuoi moi va xuat
.MODEL SMALL
.STACK 100
.DATA
    CRLF DB 13, 10, '$' 
    str DB 50 DUP('$')
    str2 DB 50 DUP('$')

.CODE
MAIN PROC              
    
    MOV AX, @DATA
    MOV DS, AX
       
    ;Nhap xau   
    LEA SI, str
    MOV CX, 0
    NHAP:
        
        MOV AH, 1
        INT 21H
        
        CMP AL, 13
        JE THOAT    
        
        MOV [SI], AL
        MOV AH, 0
        PUSH AX                           
        
        INC SI
        INC CX
    JMP NHAP 
        
    THOAT:
    
    ;Tao xau dao nguoc
    LEA DI, str2
    LAP:
        POP AX
        MOV [DI], AL
        INC DI    
    LOOP LAP
    
    ;Xuat xau dao nguoc
    MOV AH, 9
    LEA DX, CRLF ; ENTER
    INT 21H             
    
    LEA DX, str2
    INT 21H
    
    ;Ket thuc chuong trinh
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN