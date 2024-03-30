.MODEL SMALL
.STACK 100
.DATA   

     
.CODE
MAIN PROC              
    MOV AX, 0
    MOV BX, 0
    MOV CX, 255
    LAP
        INC AX
        ADD BX, AX
    LOOP LAP
    
    
MAIN ENDP
END MAIN