;Tinh tong tu 0-150, xuat ket qua ra man hinh
.MODEL SMALL
.STACK 100H
.DATA
    CRLF DB 13, 10, '$'
    
.CODE

MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    ;Tinh tong 0-150         
    MOV AX, 0             
    MOV CX, 150
    
    TONG:    
        ADD AX, CX
    LOOP TONG
    
    CALL XUAT_TONG
    
    ;Ket thuc ctrinh
    MOV AH, 4CH
    INT 21H
MAIN ENDP  

XUAT_TONG PROC
    
    ;Tach chu so
    MOV BX, 10
    MOV CX, 0
   
    CHIA:
        MOV DX, 0
        DIV BX
        PUSH DX
        INC CX
        
        CMP AX, 0
        JE XUAT
    JMP CHIA    
    
    ;Xuat tung chu so
    XUAT:
        
        POP DX
        ADD DL, '0'
        MOV AH, 2
        INT 21H        
    LOOP XUAT
    
    RET
XUAT_TONG ENDP

END MAIN