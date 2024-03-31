;Nhap vao mot chuoi, va in ra cac chu so
.MODEL SMALL
.STACK 100H
.DATA
    CRLF DB 13, 10, '$'   
    str DB 100 DUP('$')
.CODE

MAIN PROC             
    
    MOV AX, @DATA
    MOV DS, AX
    
    ;Nhap chuoi
    MOV AH, 10
    LEA DX, str
    INT 21H    
           
    ;ENTER cho de doc
    MOV AH, 9
    LEA DX, CRLF
    INT 21H
    
    ;In ra cac chu so
    LEA SI, str
    ADD SI, 2
    LAP:          
    
        CMP [SI], '$' ;Het chuoi
        JE THOAT
        
        CMP [SI], '0'
        JL continue
        CMP [SI], '9'
        JG continue
        
        ;In chu so
        MOV AH, 2
        MOV DL, [SI]
        INT 21H
        
        continue:
        INC SI
        
    JMP LAP
    
    THOAT:
    
    ;Ket thuc chuong trinh
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP

END MAIN