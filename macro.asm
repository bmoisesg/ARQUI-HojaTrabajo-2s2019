
print macro cadena 
	LOCAL ETIQUETA 
	ETIQUETA: 
		MOV ah,09h 
		MOV dx,@data 
		MOV ds,dx 
		MOV dx, offset cadena 
		int 21h
endm

getRuta macro buffer
	LOCAL INICIO,FIN
		xor si,si
	INICIO:
		getChar
		cmp al,0dh ;[enter]
		je FIN
		mov buffer[si],al
		inc si
		jmp INICIO
	FIN:
		mov buffer[si],00h
endm

getChar macro
	mov ah,0dh
	int 21h
	mov ah,01h
	int 21h
endm

println macro
	print  salto
endm

;=========================== FICHEROS ===================
abrirF macro ruta,handle
	mov ah,3dh
	mov al,010b
	lea dx,ruta
	int 21h
	mov handle,ax
	jc ErrorAbrir
endm

leerF macro numbytes,buffer,handle
	mov ah,3fh
	mov bx,handle
	mov cx,numbytes
	lea dx,buffer
	int 21h
	jc ErrorLeer
endm

crearF macro ruta, handle
	mov ah,3ch
	mov cx,00h
	lea dx, ruta
	int 21h
	jc ErrorCrear
	mov handle,ax
endm

escribirF macro handle, numBytes, buffer
	mov ah,40h
	mov bx,handle
	mov cx,numBytes
	lea dx,buffer
	int 21h
	jc ErrorEscribir
endm

cerrarF macro handle
	mov ah,3eh
	mov bx,handle
	int 21h
	cmp ax,01h
	jc ErrorCerrarArchivo
endm

;-----------------------------------------------
toMinuscula macro arreglo   ;en di te devuelve el numero de elementos del arreglo en di
	
	LOCAL continuar, finalizar
    xor di,di
    continuar:
		
        cmp arreglo[di],'$'
        je finalizar
        
		cmp arreglo[di],41h
		jge MAYOR
		jmp EXIT

		MAYOR:
			cmp arreglo[di],5ah
			jle MENOR
			jmp EXIT

		MENOR:
			mov al,arreglo[di]
			mov ah, 20h
			add ah,al
			mov arreglo[di],ah
			jmp EXIT
		EXIT:
		inc di
        jmp continuar
    finalizar: 
        dec di
endm

toMayuscula macro arreglo   ;en di te devuelve el numero de elementos del arreglo en di
	
	LOCAL continuar, finalizar,MAYOR,MENOR,EXIT
    xor di,di
    continuar:
		
        cmp arreglo[di],24h;'$'
        je finalizar
        
		cmp arreglo[di],61h
		jge MAYOR
		jmp EXIT

		MAYOR:
			cmp arreglo[di],7ah
			jle MENOR
			jmp EXIT

		MENOR:
			mov al,arreglo[di]
			mov ah, 20h
			sub al,ah
			mov arreglo[di],al
			jmp EXIT	
		EXIT:
		inc di
        jmp continuar
    finalizar: 
        dec di
endm

contarArray macro arreglo
	LOCAL regresar,terminar
	xor si,si
	regresar:
		cmp arreglo[si],'$'
		je terminar
		inc si
		jmp regresar
	terminar:
endm