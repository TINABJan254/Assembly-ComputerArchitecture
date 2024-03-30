;in 2 chuoi
.Model Small ; chung trinh nay chon bo nho small
.Stack 100 ; kich thuoc ngan xep la 100 bytes
.Data ;cac dong duoi data la khai bao 
         message DB "hello$"
	    
.Code
MAIN Proc;thu tuc chinh
		MOV AH, 9
        LEA DX, message
        INT 21H 
        
       
        
        
MAIN Endp
END 		