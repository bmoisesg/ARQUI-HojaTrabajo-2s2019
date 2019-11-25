include macro.asm
.model small 

.stack 100h ;segmento de pila

.data ;segmento de dato
include data.asm

.code ;segmento de código
	main proc 
		Menu:
			print encab
			getChar
			cmp al,'1'
			je CARGARARCHIVO
			cmp al,'2'
			je TOLOWER
			cmp al,'3'
			je TOUPPER
			cmp al,'4'
			je REPORTE
			cmp al, '5'
			je SALIR
			jmp Menu

		CARGARARCHIVO:
			print msm1
			getRuta rutaArchivo
			abrirF rutaArchivo , handleFichero
			leerF SIZEOF bufferLectura,bufferLectura,handleFichero
			;print bufferLectura
			print msm5
			getChar
			jmp Menu
		TOUPPER:
			toMayuscula bufferLectura
			println
			print bufferLectura
			getChar
			jmp Menu
		TOLOWER:
			toMinuscula bufferLectura
			println
			print bufferLectura
			getChar
			jmp Menu
		REPORTE:
			crearF rutaReporte,handle2
			contarArray html1
			escribirF handle2, si, html1
			contarArray bufferLectura
			escribirF handle2, si, bufferLectura
			contarArray html2
			escribirF handle2, si, html2
			cerrarF handle2
			print msm6
			getChar
			jmp Menu

		;----------------------------------------------------------------------
	    ErrorAbrir:
	    	print msmError1
	    	getChar
	    	jmp Menu
	    ErrorLeer:
	    	print msmError2
	    	getChar
	    	jmp Menu
	    ErrorCrear:
	    	print msmError3
	    	getChar
	    	jmp Menu
	    ErrorEscribir:
	    	print msmError4
	    	getChar
	    	jmp Menu
		ErrorCerrarArchivo:
			print msmError5
			getChar
			jmp Menu
		SALIR: 
			MOV ah,4ch 
			int 21h
	main endp
end