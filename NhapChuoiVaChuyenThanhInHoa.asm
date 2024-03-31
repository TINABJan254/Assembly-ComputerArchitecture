;Nhap vao mot chuoi len(str) < 15, chuyen cac ky tu chu in thuong thanh in hoa
.MODEL SMALL
.STACK 100H
.DATA
    CRLF DB 13, 10, '$'   
    str DB 100 DUP('$')
.CODE

MAIN PROC             
    
    MOV AX, @DATA
    MOV DS, AX
    
    ;Nhap chuoi va chuyen in thuong thanh in hoa
    LEA SI, str
    NHAP:
        
        MOV AH, 1
        INT 21H
        
        CMP AL, 13  ;Gap ENTER thi dung
        JE THOAT
        
        CMP AL, 'a'
        JL continue
        CMP AL, 'z'
        JG continue
        
        ;ToUpper
        SUB AL, 32
        
        continue:                        
            MOV [SI], AL                 
        INC SI
           
    JMP NHAP
    
    THOAT:
    
    ;In chuoi
    MOV AH, 9
    LEA DX, CRLF    ;ENTER
    INT 21H               
    
    LEA DX, str
    INT 21H
    
    ;Ket thuc chuong trinh
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP

END MAIN