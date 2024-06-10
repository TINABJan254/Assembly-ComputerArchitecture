;Tao hieu ung led tu trai sang phai bat dau tu D5, nhay cach nhau 550 chu ki NOP
.MODEL SMALL
.STACK 100
.DATA
    CRLF DB 13, 10, '$'    
    port equ 2C0H
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
                          
    start:       
        MOV AL, 11110111B     
        MOV DX, port
        
        L1:
            OUT DX, AL
               
            MOV CX, 550
            L2:    
                NOP
            LOOP L2        
            
            ROR AL, 1; dich phai 1 bit 
        JMP L1
        
        
    JMP start
    
    ;Ket thuc chuong trinh
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
