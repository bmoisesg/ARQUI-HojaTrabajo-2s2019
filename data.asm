
encab db 0ah,0dh,'   ******************************',0ah,0dh,'   **                          **',0ah,0dh,'   **    1) cargar archvo      **',0ah,0dh,'   **    2) tolower            **',0ah,0dh,'   **    3) toUpper            **',0ah,0dh,'   **    4) reporte            **',0ah,0dh,'   **    5) salir              **',0ah,0dh,'   **                201602907 **',0ah,0dh,'   ******************************','$'
msm1 db 0ah,0dh,'-----FUNCION CARGAR ARCHIVO-----',0ah,0dh,'$'
msm2 db 0ah,0dh,'-----FUNCION TOLOWER',0ah,0dh,'$'
msm3 db 0ah,0dh,'-----FUNCION TOUPPER',0ah,0dh,'$'
msm4 db 0ah,0dh,'-----FUNCION REPORTE',0ah,0dh,'$'
msm5 db 0ah,0dh,'>> Cargado con exito',0ah,0dh,'$'
msm6 db 0ah,0dh,'>> Creado con exito',0ah,0dh,'$'

msmError1 db 0ah,0dh,'Error al abrir archivo','$'
msmError2 db 0ah,0dh,'Error al leer archivo','$'
msmError3 db 0ah,0dh,'Error al crear archivo','$'
msmError4 db 0ah,0dh,'Error al escribir archivo','$'
msmError5 db 0ah,0dh,'Error al cerrar archivo','$'
salto db  0ah,0dh,'$'

rutaReporte        db 'reporte.html',0

rutaArchivo db 100 dup('$')
bufferLectura db 100 dup('$')

handleFichero dw ?
handle2 dw ?
html1 db '<!DOCTYPE html><html lang="en"><head><title>Reporte 201602907</title></head><body><table align="center" border="1"><tr><th>Salida</th><th>','$'
html2 db '</th></tr></table></body></html>','$'