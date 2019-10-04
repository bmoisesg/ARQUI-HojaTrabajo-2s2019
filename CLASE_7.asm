

;===============SECCION DE MACROS ===========================
include c7_m.asm
;holaaaaaaaaaaaaaaaaaaaaa

;================= DECLARACION TIPO DE EJECUTABLE ============
.model small 
.stack 100h 
.data 
;================ SECCION DE DATOS ========================
encab db  0ah,0dh,'1) cargar archvo',0ah,0dh,'2) tolower',0ah,0dh,'3) toUpper',0ah,0dh,'4) reporte',0ah,0dh,'5) salir',0ah,0dh,'$'

msm1 db 0ah,0dh,'FUNCION CARGAR ARCHIVO',0ah,0dh,'$'
msm2 db 0ah,0dh,'FUNCION TOLOWER',0ah,0dh,'$'
msm3 db 0ah,0dh,'FUNCION TOUPPER',0ah,0dh,'$'
msm4 db 0ah,0dh,'FUNCION REPORTE',0ah,0dh,'$'
msm5 db 0ah,0dh,'encontre una a ',0ah,0dh,'$'
msm6 db 0ah,0dh,'no encontre una a ',0ah,0dh,'$'
msm7 db 0ah,0dh,'debuger',0ah,0dh,'$'


msmError1 db 0ah,0dh,'Error al leer archivo','$'
msmError2 db 0ah,0dh,'Error al leer archivo','$'
msmError3 db 0ah,0dh,'Error al crear archivo','$'
msmError4 db 0ah,0dh,'Error al Escribir archivo','$'

html1 db '<table border="true" align="center" >    <tr>        <th>RESULTADO</th>    </tr>    <tr>        <th>'
html2 db '</th>    </tr></table>'

rutaArchivo db 100 dup('$')
bufferLectura db 100 dup('$')
bufferEscritura db 100 dup('$')


handleFichero dw ?
handle2 dw ?


.code ;segmento de código
;================== SECCION DE CODIGO ===========================
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
			abrirF rutaArchivo,handleFichero
			leerF SIZEOF bufferLectura,bufferLectura,handleFichero
			print bufferLectura
			getChar
			;print handleFichero
			;getChar
			jmp Menu


		CREAR:
			print msm2
			getRuta rutaArchivo
			crearF rutaArchivo, handle2
			
			getTexto bufferEscritura
	
			
			escribirF handle2, SIZEOF bufferEscritura, bufferEscritura
			
			getChar
			jmp Menu

		TOUPPER:
			pasarmayusculas bufferLectura
			print bufferLectura
			jmp Menu
		REPORTE:
			jmp CREAR
		TOLOWER:
			contarElementos bufferLectura
			print bufferLectura
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
		SALIR: 
			MOV ah,4ch 
			int 21h
	main endp
;================ FIN DE SECCION DE CODIGO ========================
end