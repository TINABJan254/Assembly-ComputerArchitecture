.MODEL SMALL
.STACK 100H
.DATA
    CRLF DB 13, 10, '$'
    X DW 0
    Y DW 0
.CODE

MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    CALL NHAP_SO 
    CALL IN_SO
    
    ;Ket thuc ctrinh
    MOV AH, 4CH
    INT 21H
MAIN ENDP  

NHAP_SO PROC 
    
    MOV BX, 10
    NHAP:
        MOV AH, 1
        INT 21H
        
        CMP AL, 13
        JE THOAT
                                                                    
        SUB AL, '0'     ;Chuyen ki tu ve so vd: '5' -> 5
        MOV AH, 0
        MOV Y, AX
        
        MOV AX, X
        MUL BX  
        ADD AX, Y
        MOV X, AX
        
    JMP NHAP
    
    THOAT:
    MOV AX, X
    RET
NHAP_SO ENDP 

IN_SO PROC
    
    ;Tach chu so          
    MOV CX, 0
    MOV BX, 10
    
    LAP:
        
        MOV DX, 0
        DIV BX
        PUSH DX
        INC CX
        
        CMP AX, 0
        JE THOAT2
    JMP LAP
    
    THOAT2:
    ;ENTER
    MOV AH, 9
    LEA DX, CRLF
    INT 21H
    
    ;Xuat
    XUAT:
        POP DX
        ADD DL, '0'
        MOV AH, 2
        INT 21H
    LOOP XUAT   
    
    RET
IN_SO ENDP

END MAIN