.MODEL SMALL
.STACK 100
.DATA   
    CRLF DB 13, 10, '$'  
    hi DB 'hello$'
     
.CODE
MAIN PROC    
    
    MOV AX, @DATA
    MOV DS, AX     
              
    MOV CX, 1
	LAP:        
	
	    CMP CX, 5 
	    JG RA
	
		MOV AH, 9
		LEA DX, hi
		INT 21H

		LEA DX, CRLF
		INT 21h         
		
		INC CX
		
	JMP LAP  
	
	RA:
    
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN