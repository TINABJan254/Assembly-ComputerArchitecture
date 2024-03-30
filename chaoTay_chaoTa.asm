.MODEL SMALL
.STACK 100
.DATA   
    CRLF DB 13, 10, '$'    
    chaoTay DB 'Hello$'
    chaoTa  DB 'Xin chao$'
     
.CODE
MAIN PROC              
    
    MOV AX, @DATA
    MOV DS, AX           
    
    ;chao tay
    MOV AH, 9
    LEA DX, chaoTay
    INT 21H
    
    ;Enter
    LEA DX, CRLF
    INT 21H
    
    ;chao ta
    LEA DX, chaoTa
    INT 21H
    
    MOV AH, 4CH
    INT 21H  
    
MAIN ENDP
END MAIN