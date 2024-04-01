;In KTMT 2024
.MODEL SMALL
.STACK 100
.DATA   
    CRLF DB 13, 10, '$'  
    str DB 'KTMT_2024$'
     
.CODE
MAIN PROC    
    
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, str
    INT 21H
    
    ;Ket thuc chuong trinh
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN