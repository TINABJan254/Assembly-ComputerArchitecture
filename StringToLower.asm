;Chuyen 1 xau ve in thuong
.MODEL SMALL
.STACK 100
.DATA   
    CRLF DB 13, 10, '$'     
    str DB 'Kien TRuC MAy TiNh$'
     
.CODE
MAIN PROC    
    
    MOV AX, @DATA
    MOV DS, AX     
              
    LEA SI, str
    LAP:       
        
        CMP [SI], '$'
        JE break
    
        CMP [SI], 'A'
        JL continue
        CMP [SI], 'Z'
        JG continue
        
        ADD [SI], 32
        
        continue:   
        
        MOV AH, 2
        MOV DL, [SI]
        INT 21H
        
        INC SI
    JMP LAP
    
    break:
    
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN