;Nhap vao 1 chuoi, in chuoi dao nguoc
.MODEL SMALL
.STACK 100
.DATA
    CRLF DB 13, 10, '$' 
    str DB DUP('$')

.CODE
MAIN PROC              
    
    MOV AX, @DATA
    MOV DS, AX
       
    ;Nhap xau   
    MOV CX, 0
    LEA SI, str  
    LAP:     
        ;Nhap 1 ky tu
        MOV AH, 1
        INT 21H
        
        CMP AL, 13   ;Kiem tra co bang ENTER
        JE THOAT
        
        MOV [SI], AL ;Gan vao [SI]      
        MOV AH, 0    ;Vi ta PUSH AX, ma AX gom ca AH va AL, ta chi can lay moi gia tri AL thoi, nen de AH = 0 cho chac
        PUSH AX
        
        INC SI                    
        INC CX
    JMP LAP  
    
    THOAT:   
    ;Enter
    MOV AH, 9
    LEA DX, CRLF
    INT 21H
    
    ;In dao nguoc
    XUAT:      
    
        POP DX
        MOV AH, 2
        INT 21H
    LOOP XUAT
        

    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN