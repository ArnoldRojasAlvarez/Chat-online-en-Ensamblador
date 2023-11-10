INCLUDE Irvine32.inc
INCLUDE macros.inc

BUFFER_SIZE = 5000

.data

;DATOS PARA EL LOGIN Y EL SINGUP
;-------------------------------------------------------------------------------------------------------------------------------------
welcomeMsg      BYTE  "UwU",0
validarInformacionAccount  DWORD  0
char            DWORD ?                ;	Esta variable contiene numeros para aumentar los buffers o para hacer comparativas
Aumentar        DWORD 60			   ;    Variable para aumentar el buffer
VarMensajito    DWORD  ?                ;    variable para meterle los datos para imprimir un mensaje
CHATACTUAL		DWORD 0

PreguntaCuenta  BYTE "Posee cuenta digite 0 para si y 1 para no: ",0
buffer			BYTE BUFFER_SIZE DUP(?)
bufferTexto	    DWORD 1500 DUP(?)
bufferLoad		BYTE BUFFER_SIZE DUP(?)
filename		BYTE "Registro.txt",0
fileNam			BYTE "Registro.txt",0
fileHandle		HANDLE ?
stringLength	DWORD ?										    ;bloque de variables para crear un archivo
bytesWritten	DWORD ?
str1			BYTE "Cannot create file",0dh,0ah,0
str2			BYTE "Bytes written to file [output.txt]:",0
str3			BYTE "Enter up to 500 characters and press"
BYTE "[Enter]: ",0dh,0ah,0
Error    		BYTE   "Salio mal",0

ContraIngresar  BYTE  "Ingrese una contraseña: ",0
NombreIngresar  BYTE "Ingrese su nombre de usuario",0			;Estos 2 mensajes son para solicitar sea en el login o en el sing up
direccioncontra DWORD ?
direccionnombre DWORD ?
passBuffer      BYTE 31 DUP(?)			;Estos 2 buffers son para escribir el nombre y la contraseña y equiparar sus valores con los datos 
nombreBuffer    BYTE 31 DUP(?)
MoverEsi        DWORD 0                       ;Variable general para mover los buffers
;------------------------------------------------------------------------------------------------------------------------------------

;----------------------------------------------APARTADO MOUSE---------------------------------------------------------------------------------------

hStdIn    dd 0  ;This is the handle to the console input
    nRead     dd 0

    _INPUT_RECORD STRUCT       ;This is the structure for the console input, that contains Mouse Event Records
        EventType   WORD ?
        WORD ?                    ; For alignment
        UNION
            KeyEvent              KEY_EVENT_RECORD          <>
            MouseEvent            MOUSE_EVENT_RECORD        <>
            WindowBufferSizeEvent WINDOW_BUFFER_SIZE_RECORD <>
            MenuEvent             MENU_EVENT_RECORD         <>
            FocusEvent            FOCUS_EVENT_RECORD        <>
          ENDS
    _INPUT_RECORD ENDS

    InputRecord _INPUT_RECORD <>
ConsoleMode dd 0
Vacio BYTE 32,0
clickizquierdo BYTE "IZQ",0
clickderecho BYTE "DER",0
clickcentro BYTE "CEN",0
chat1 BYTE "  ________________________",0dh,0ah
BYTE      "           /                        \",0dh,0ah
BYTE      "          |            01            |",0dh,0ah
BYTE      "           \________________________/",0dh,0ah,0

chat2 BYTE "  ________________________",0dh,0ah
BYTE      "           /                        \",0dh,0ah
BYTE      "          |            02            |",0dh,0ah
BYTE      "           \________________________/",0dh,0ah,0

chat3 BYTE "  ________________________",0dh,0ah
BYTE      "           /                        \",0dh,0ah
BYTE      "          |            03            |",0dh,0ah
BYTE      "           \________________________/",0dh,0ah,0
cuadro BYTE 219,0


CoordX BYTE 22
CoordY BYTE 25 
CoordXCHAT BYTE 22
CoordYCHAT BYTE 3

PrimerChatAbierto DWORD 2
SegundoChatAbierto DWORD 2
CHATABIERTO1 BYTE "          ______________________________________________________________",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE "          ________________________________________________________",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          ________________________________________________________",0dh,0ah,0

CHATABIERTO2 BYTE "          ______________________________________________________________",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE "          ________________________________________________________",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          ________________________________________________________",0dh,0ah,0

CHATABIERTO3 BYTE "          ______________________________________________________________",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE "          ________________________________________________________",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          |                                                           |",0dh,0ah
BYTE      "          ________________________________________________________",0dh,0ah,0

;------------------------TRADUCTOR MORSE--------------------------------------------------------------------------------------------------------
morseLETRAS BYTE BUFFER_SIZE DUP(?),0
MensajesDescargados1 DWORD BUFFER_SIZE DUP(?),0
DescargadosTemporal BYTE 500000 DUP(?)
MensajesDescargados2  DWORD BUFFER_SIZE DUP(?),0
charBuffer BYTE 2 DUP(?)
parteLetra DWORD 65,0 
MorseBuffer BYTE "Morse.txt",0
Text0102   BYTE "0102.txt",0
Text0103   BYTE "0103.txt",0
Text0203   BYTE "0203.txt",0
REINICIARLECTURA DWORD 0
IDCHAT DWORD ?,0
ID DWORD ?,0
ESCRIBIENDO DWORD ?,0
POSFINAL DWORD ?,0
POSBORRAR DWORD ?,0
TEMPORAL DWORD 0,0
CHATBORRAR DWORD 0,0
CHATAUXILIAR DWORD 0,0
ColorFondo   BYTE lightGreen,0
FondoActual DWORD 1,0
ColorMensajePropio   BYTE lightGray,0
MensajePropioActual DWORD 1,0
ColorMensajeAjeno   BYTE lightGray,0
MensajeAjenoActual DWORD 1,0
RecargarChat DWORD 0
.code
;  ESTE ES EL APARTADO PARA LAS MACROS
;-----------------------------------------------------------




Createfield MACRO text
; Create a new text file.
mov edx,OFFSET text
call CreateOutputFile
mov fileHandle,eax

; Check for errors.
cmp eax, INVALID_HANDLE_VALUE ; error found?
jne file_okei ; no: skip

jmp quit1

file_okei:

; Ask the user to input a string.
mov stringLength,eax ; counts chars entered

; Write the buffer to the output file.
mov eax,fileHandle
mov edx,OFFSET bufferLoad
mov ecx,stringLength
call WriteToFile
mov bytesWritten,eax ; save return value
call CloseFile

quit1:
ENDM 



;-----------------------------------------------------------


main PROC
mov eax, lightgray
Call SetTextColor

INICIOSESION:
mov eax, lightgray
Call SetTextColor
call ClrScr
mov edx, OFFSET PreguntaCuenta
call WriteString
call Readint								;Linea para validar informacion dentro o no
cmp eax,1
jg INICIOSESION
mov char,eax


call Crlf
mov edx, OFFSET NombreIngresar
call WriteString
call Crlf

mov edx, OFFSET nombreBuffer						;ESPACIO PARA ESCRIBIR LOS DATOS NECESARIOS PARA COMPROBAR QUE ESTA O NO REGISTRADO
mov ecx, SIZEOF nombreBuffer                        ;Se solicita el nombre de cuenta
call ReadString
mov eax,OFFSET nombreBuffer
call Crlf

cmp char,0
je login
cmp char,1
je singup

singup:

; Open the file for input.
mov edx,OFFSET filename
call OpenInputFile
mov fileHandle,eax

; Check for errors.

cmp eax,INVALID_HANDLE_VALUE						; error opening file?
jne fileok ; no: skip

jmp quit											; and quit

fileok:

; Read the file into a buffer.
mov edx,OFFSET bufferLoad
mov ecx,BUFFER_SIZE
call ReadFromFile
jnc checksize								; error reading?

jmp closfil
checksize:
cmp eax,BUFFER_SIZE									; buffer large enough?
jb bufoki										; yes


jmp quit											; and quit

bufoki:
mov bufferLoad[eax],0								; insert null terminator
									; display file size
cmp eax,0
je noin 
mov validarInformacionAccount,0						;0 Para indicar que el archivo contiene informacion
jmp siin
call Crlf

noin:
mov validarInformacionAccount,1						;1 Para indicar que el archivo no contiene informacion
siin:
call Crlf
; Display the buffer.
call Crlf
closfil:
mov eax,fileHandle
call CloseFile

mWrite <"Ingrese su contraseña: ">

mov edx, OFFSET passBuffer
mov ecx, SIZEOF passBuffer
call ReadString

; Validar si el buffer padre (buffer) tiene datos o está vacío
    cmp validarInformacionAccount, 1
    je buffer_vacio   ; Si validar es 1, el buffer está vacío

    ; Verificar si el espacio 124 del buffer está vacío
    cmp byte ptr [bufferLoad + 124], 0
    je posicion2       ; Si está vacío, es el segundo segmento de memoria

posicion3:
    ; tercer segmento de memoria
    mov byte ptr [bufferLoad + 125], 51 ; Almacena el ID en la posición 125
    mov esi, OFFSET nombreBuffer   ; Puntero al nombre
    mov ecx, 30                    ; Tamaño máximo del nombre
    mov edi, 126          ; Puntero al buffer, empezando en la posición 126

    CICLONOMBRE:
    mov al, [esi]                  ; Carga el byte de nombreBuffer en AL
    cmp al, 0
    je AHORACONTRA3
    mov byte ptr [bufferLoad + edi], al                  ; Almacena el byte en el buffer
    inc esi                        ; Avanza el puntero en nombreBuffer
    inc edi                           ; Avanza el puntero en el buffer
    loop CICLONOMBRE               ; Repite hasta que se copien todos los caracteres del nombre
    
    AHORACONTRA3:
    mov esi, OFFSET passBuffer     ; Puntero a la contraseña
    mov ecx, 30                    ; Tamaño máximo de la contraseña
    mov edi, 156          ; Puntero al buffer, empezando en la posición 156

    CICLOCONTRA:
    mov al, [esi]                  ; Carga el byte de passBuffer en AL
    cmp al, 0
    je PONERFINAL3
    mov byte ptr [bufferLoad + edi], al                  ; Almacena el byte en el buffer
    inc esi                        ; Avanza el puntero en passBuffer
    inc edi                        ; Avanza el puntero en el buffer
    loop CICLOCONTRA
    PONERFINAL3:
    ; Poner el separador ";" al final del primer segmento
    mov esi, 186         ; Carga el índice 62 en el registro ESI
    mov al, 59          ; Carga el valor 59 en el registro AL (o AX si es necesario)
    mov byte ptr [bufferLoad + esi], al
   
    jmp finalizar

posicion2:
    ; segundo segmento de memoria
    mov byte ptr [bufferLoad + 63], 50  ; Almacena el ID en la posición 63
    mov esi, OFFSET nombreBuffer   ; Puntero al nombre
    mov ecx, 30                    ; Tamaño máximo del nombre
    mov edi, 64           ; Puntero al buffer, empezando en la posición 64

    CICLONOMBRE2:
    mov al, [esi]                  ; Carga el byte de nombreBuffer en AL
    cmp al, 0
    je AHORACONTRA2
    mov byte ptr [bufferLoad+edi], al                  ; Almacena el byte en el buffer
    inc esi                        ; Avanza el puntero en nombreBuffer
    inc edi                        ; Avanza el puntero en el buffer
    loop CICLONOMBRE2              ; Repite hasta que se copien todos los caracteres del nombre


    AHORACONTRA2:
    mov esi, OFFSET passBuffer     ; Puntero a la contraseña
    mov ecx, 30                    ; Tamaño máximo de la contraseña
    mov edi, 94           ; Puntero al buffer, empezando en la posición 95

    CICLOCONTRA2:
    mov al, [esi]                  ; Carga el byte de passBuffer en AL
    cmp al, 0
    je PONERFINAL2
    mov byte ptr [bufferLoad+edi], al                  ; Almacena el byte en el buffer
    inc esi                        ; Avanza el puntero en passBuffer
    inc edi                        ; Avanza el puntero en el buffer
    loop CICLOCONTRA2             ; Repite hasta que se copien todos los caracteres de la contraseña

    PONERFINAL2:
    ; Poner el separador ';' al final del primer segmento
    mov esi, 124         ; Carga el índice 62 en el registro ESI
    mov al, 59          ; Carga el valor 59 en el registro AL (o AX si es necesario)
    mov byte ptr [bufferLoad + esi], al

    jmp finalizar


buffer_vacio:
    ; Primer segmento de memoria
    mov byte ptr [bufferLoad], 49       ; Almacena el ID en la posición 0
    mov esi, OFFSET nombreBuffer   ; Puntero al nombre
    mov ecx, 30                    ; Tamaño máximo del nombre
    mov edi, 1     ; Puntero al buffer, empezando en la posición 1

    CICLONOMBRE3:
    mov al, [esi]                  ; Carga el byte de nombreBuffer en AL
     cmp al, 0
    je AHORACONTRA
    mov byte ptr [bufferLoad + edi] , al                  ; Almacena el byte en el buffer
    inc esi                        ; Avanza el puntero en nombreBuffer
    inc edi                        ; Avanza el puntero en el buffer
    loop CICLONOMBRE3              ; Repite hasta que se copien todos los caracteres del nombre

    AHORACONTRA:
    mov esi, OFFSET passBuffer     ; Puntero a la contraseña
    mov ecx, 30                    ; Tamaño máximo de la contraseña
    mov edi, 32    ; Puntero al buffer, empezando en la posición 32

    CICLOCONTRA3:
    mov al, [esi]                  ; Carga el byte de passBuffer en AL
    cmp al, 0
    je PONERFINAL
    mov byte ptr [bufferLoad + edi], al                  ; Almacena el byte en el buffer
    inc esi                        ; Avanza el puntero en passBuffer
    inc edi                        ; Avanza el puntero en el buffer
    loop CICLOCONTRA3             ; Repite hasta que se copien todos los caracteres de la contraseña
    PONERFINAL:
    ; Poner el separador '/' al final del primer segmento
    mov esi, 62         ; Carga el índice 62 en el registro ESI
    mov al, 59          ; Carga el valor 59 en el registro AL (o AX si es necesario)
    mov byte ptr [bufferLoad + esi], al

finalizar:
Createfield filename

jmp INICIOSESION


;---------------------------------------------------------------------
LOGIN:
mov eax, lightgray
Call SetTextColor
; Open the file for input.
mov edx,OFFSET filename
call OpenInputFile
mov fileHandle,eax
; Check for errors.

cmp eax,INVALID_HANDLE_VALUE						; error opening file?
jne fileoklog ; no: skip

jmp quit											; and quit

fileoklog:

; Read the file into a buffer.
mov edx,OFFSET bufferLoad
mov ecx,BUFFER_SIZE
call ReadFromFile
jnc checksizelog								; error reading?

call WriteWindowsMsg
jmp closfillog
checksizelog:
cmp eax,BUFFER_SIZE									; buffer large enough?
jb bufokilog										; yes


jmp quit											; and quit

bufokilog:
mov bufferLoad[eax],0								; insert null terminator
									; display file size
cmp eax,0
je noinlog 
mov validarInformacionAccount,0						;0 Para indicar que el archivo contiene informacion
jmp siinlog
call Crlf

noinlog:
mov validarInformacionAccount,1						;1 Para indicar que el archivo no contiene informacion
siinlog:
call Crlf
; Display the buffer.

mov edx,OFFSET bufferLoad							; display the buffer

call Crlf
closfillog:
mov eax,fileHandle
call CloseFile


; Solicitar contraseña
mov edx, OFFSET ContraIngresar
call WriteString
mov edx, OFFSET passBuffer
mov ecx, 30
call ReadString

; Validar el nombre de usuario y la contraseña
mov esi, OFFSET bufferLoad

mov edi, 1
mov ID, 49
LOGIN_LOOP:
movzx ebx, byte ptr [esi]
cmp ebx, 0 
je USUARIO_NO_ENCONTRADO 


;Comparar el nombre de usuario ingresado con el del buffer
mov eax, OFFSET nombreBuffer
NOMBRE_LOOP:
movzx edx, byte ptr[eax]
movzx ebx, byte ptr[bufferLoad+edi]
cmp edx, ebx
jne VERIFICAR_SALTO
cmp edx, 0; verificar si llegamos al final del nombre de usuario
je VERIFICAR_NOMBRE
inc eax
inc edi
inc char
jmp NOMBRE_LOOP

VERIFICAR_NOMBRE:
cmp ebx, 0
jne VERIFICAR_SALTO
jmp NOMBRE_COINCIDE
VERIFICAR_SALTO:
sub edi, char
cmp edi, 63
jge ULTIMO_USUARIO
jmp SIGUIENTE_USUARIO



NOMBRE_COINCIDE:
; Comparar la contraseña ingresada con la almacenada en el archivo
mov esi, OFFSET passBuffer
cmp ID,50
jge SUMAID2
add edi, 31
sub edi, char
jmp CONTRA_LOOP

SUMAID2:
add edi, 30
sub edi, char
jmp CONTRA_LOOP

CONTRA_LOOP:
movzx edx, byte ptr [esi] 
movzx ebx, byte ptr[bufferLoad+edi]
cmp edx, ebx
jne USUARIO_NO_ENCONTRADO
inc esi
inc edi
cmp edx, 0; verificar si llegamos al final del nombre de usuario
je VERIFICAR_CONTRA
jmp CONTRA_LOOP

VERIFICAR_CONTRA:
cmp ebx, 0
jne USUARIO_NO_ENCONTRADO

CONTRA_COINCIDE:
; Iniciar sersion existosa
mov edx, OFFSET welcomeMsg
call WriteString
jmp quit

SIGUIENTE_USUARIO:
; Mover al siguiente usuario en el archivo
mov ID, 50
mov esi, OFFSET nombreBuffer
mov edi, 64
mov char, 0
jmp login_loop

ULTIMO_USUARIO:
; Mover al siguiente usuario en el archivo
mov ID, 51
mov esi, OFFSET nombreBuffer
mov edi, 126
mov char, 0
jmp login_loop

USUARIO_NO_ENCONTRADO:
;El usuario no se encontró en el archivo
mov edx, OFFSET Error
call WriteString

jmp erro

erro:
mov edx, OFFSET Error
call WriteString
jmp INICIOSESION


;NO ES UN QUIT DE ACABAR PROGRAMA SINO DE SALIDA DE PROCESO LOGIN 
;-----------------------------------------------------------------------------
;COMIENZA APARTADO DE ESPACIOS DE CHATS

quit:
mov eax, lightgray
Call SetTextColor
mov CHATACTUAL, 0
mov ESCRIBIENDO, 0
cmp TEMPORAL, 0
je IGNOREQUIT
inc TEMPORAL
cmp TEMPORAL, 150
jge BORRARTEMPORAL
IGNOREQUIT:
mov parteLetra,65
mov CoordYCHAT, 3
call clrscr
invoke GetStdHandle,STD_INPUT_HANDLE  ;Get the handle to the console input (storaged in hStdIn via eax)
    mov hStdIn, eax

    invoke GetConsoleMode, hStdIn, ADDR ConsoleMode  ;Get the console mode
    mov eax, 0090h          ; ENABLE_MOUSE_INPUT
    invoke SetConsoleMode, hStdIn, eax  ;Set the console mode

    .WHILE InputRecord.KeyEvent.wVirtualKeyCode != VK_ESCAPE
    mov esi, 0
    PUNTERO:
    mov bufferTexto[edi],0
    inc edi
    inc esi
    cmp esi,101
    jne PUNTERO
    ACTUALIZARESCRIBIENDO:
    cmp ID, 50
    jb CHATEO1
    je CHATEO2
    jg CHATEO3


    CHATEO1:

    mov eax, lightgray
    call SetTextColor
        mov esi, 0

        checkClick:

        ; Open the file for inpute.
        mov edx,OFFSET Text0102
        call OpenInputFile
        mov fileHandle,eax
        ; Check for errors.

        cmp eax,INVALID_HANDLE_VALUE						; error opening file?
        jne fileoklog0102 ; no: skip
        
											        ; and quit

        fileoklog0102:

        ; Read the file into a buffer.
        mov edx,OFFSET MensajesDescargados1
        mov ecx,BUFFER_SIZE
        call ReadFromFile
        jnc checksize0102							; error reading?
       
        jmp closfillog0102
        checksize0102:
        cmp eax,BUFFER_SIZE									; buffer large enough?
        jb bufoki0102										; yes										; and quit

        bufoki0102:
        mov MensajesDescargados1[eax],0								; insert null terminator
									; display file size
        cmp eax,0
        je noinlog0102 
        mov validarInformacionAccount,0						;0 Para indicar que el archivo contiene informacion
        jmp siinlog0102

        noinlog0102:
        mov validarInformacionAccount,1						;1 Para indicar que el archivo no contiene informacion
        siinlog0102:
        ; Display the buffer.
        closfillog0102:
        mov eax,fileHandle
        call CloseFile



        ; Open the file for inpute.
        mov edx,OFFSET Text0103
        call OpenInputFile
        mov fileHandle,eax
        ; Check for errors.

        cmp eax,INVALID_HANDLE_VALUE						; error opening file?
        jne fileoklog0103 ; no: skip
        
											        ; and quit

        fileoklog0103:

        ; Read the file into a buffer.
        mov edx,OFFSET MensajesDescargados2
        mov ecx,BUFFER_SIZE
        call ReadFromFile
        jnc checksize0103							; error reading?
       
        jmp closfillog0103
        checksize0103:
        cmp eax,BUFFER_SIZE									; buffer large enough?
        jb bufoki0103										; yes										; and quit

        bufoki0103:
        mov MensajesDescargados2[eax],0								; insert null terminator
									; display file size
        cmp eax,0
        je noinlog0103 
        mov validarInformacionAccount,0						;0 Para indicar que el archivo contiene informacion
        jmp siinlog0103

        noinlog0103:
        mov validarInformacionAccount,1						;1 Para indicar que el archivo no contiene informacion
        siinlog0103:
        ; Display the buffer.
        closfillog0103:
        mov eax,fileHandle
        call CloseFile
        cmp ESCRIBIENDO, 1
        je CICLOESCRIBIENDO
        mov PrimerChatAbierto, 2
        mov SegundoChatAbierto, 3
        cmp CHATACTUAL,1
        je IMPRIMIRCHAT1
        cmp CHATACTUAL,2
        je IMPRIMIRCHAT2
        mov DL, 10
        mov DH, 10
        call Gotoxy
        mov edx, OFFSET chat3
        call WriteString
        mov DL, 10
        mov DH, 5
        call Gotoxy
        mov edx, OFFSET chat2
        call WriteString
        mov DL, 40
        mov DH, 12
        call Gotoxy
        mov edx, OFFSET cuadro
        call WriteString
        mov DL, 40
        mov DH, 7
        call Gotoxy
        mov edx, OFFSET cuadro
        call WriteString
        jmp CARGAR_CHAT

        CHATEO2:
        mov eax, lightgray
        call SetTextColor
        mov esi, 0
        checkClick2:

        ; Open the file for inpute.
        mov edx,OFFSET Text0102
        call OpenInputFile
        mov fileHandle,eax
        ; Check for errors.

        cmp eax,INVALID_HANDLE_VALUE						; error opening file?
        jne fileoklog0201 ; no: skip
        
											        ; and quit

        fileoklog0201:

        ; Read the file into a buffer.
        mov edx,OFFSET MensajesDescargados1
        mov ecx,BUFFER_SIZE
        call ReadFromFile
        jnc checksize0201							; error reading?
       
        jmp closfillog0201
        checksize0201:
        cmp eax,BUFFER_SIZE									; buffer large enough?
        jb bufoki0201										; yes										; and quit

        bufoki0201:
        mov MensajesDescargados1[eax],0								; insert null terminator
									; display file size
        cmp eax,0
        je noinlog0201 
        mov validarInformacionAccount,0						;0 Para indicar que el archivo contiene informacion
        jmp siinlog0201

        noinlog0201:
        mov validarInformacionAccount,1						;1 Para indicar que el archivo no contiene informacion
        siinlog0201:
        ; Display the buffer.
        closfillog0201:
        mov eax,fileHandle
        call CloseFile



        ; Open the file for inpute.
        mov edx,OFFSET Text0203
        call OpenInputFile
        mov fileHandle,eax
        ; Check for errors.

        cmp eax,INVALID_HANDLE_VALUE						; error opening file?
        jne fileoklog0203 ; no: skip
       
											        ; and quit

        fileoklog0203:

        ; Read the file into a buffer.
        mov edx,OFFSET MensajesDescargados2
        mov ecx,BUFFER_SIZE
        call ReadFromFile
        jnc checksize0203							; error reading?
        
        jmp closfillog0203
        checksize0203:
        cmp eax,BUFFER_SIZE									; buffer large enough?
        jb bufoki0203										; yes										; and quit

        bufoki0203:
        mov MensajesDescargados2[eax],0								; insert null terminator
									; display file size
        cmp eax,0
        je noinlog0203 
        mov validarInformacionAccount,0						;0 Para indicar que el archivo contiene informacion
        jmp siinlog0203

        noinlog0203:
        mov validarInformacionAccount,1						;1 Para indicar que el archivo no contiene informacion
        siinlog0203:
        ; Display the buffer.
        closfillog0203:
        mov eax,fileHandle
        call CloseFile
        cmp ESCRIBIENDO, 1
        je CICLOESCRIBIENDO

        mov PrimerChatAbierto, 1
        mov SegundoChatAbierto, 3
        cmp CHATACTUAL,1
        je IMPRIMIRCHAT1
        cmp CHATACTUAL,2
        je IMPRIMIRCHAT2
        mov DL, 10
        mov DH, 10
        call Gotoxy
        mov edx, OFFSET chat3
        call WriteString
        mov DL, 10
        mov DH, 5
        call Gotoxy
        mov edx, OFFSET chat1
        call WriteString
        mov DL, 40
        mov DH, 12
        call Gotoxy
        mov edx, OFFSET cuadro
        call WriteString
        mov DL, 40
        mov DH, 7
        call Gotoxy
        mov edx, OFFSET cuadro
        call WriteString
        jmp CARGAR_CHAT



        CHATEO3:
        mov eax, lightgray
        call SetTextColor
        mov esi, 0
        checkClick3:

        ; Open the file for inpute.
        mov edx,OFFSET Text0103
        call OpenInputFile
        mov fileHandle,eax
        ; Check for errors.

        cmp eax,INVALID_HANDLE_VALUE						; error opening file?
        jne fileoklog0301 ; no: skip
        
											        ; and quit

        fileoklog0301:

        ; Read the file into a buffer.
        mov edx,OFFSET MensajesDescargados1
        mov ecx,BUFFER_SIZE
        call ReadFromFile
        jnc checksize0301							; error reading?
     
        jmp closfillog0301
        checksize0301:
        cmp eax,BUFFER_SIZE									; buffer large enough?
        jb bufoki0301										; yes										; and quit

        bufoki0301:
        mov MensajesDescargados1[eax],0								; insert null terminator
									; display file size
        cmp eax,0
        je noinlog0301 
        mov validarInformacionAccount,0						;0 Para indicar que el archivo contiene informacion
        jmp siinlog0301

        noinlog0301:
        mov validarInformacionAccount,1						;1 Para indicar que el archivo no contiene informacion
        siinlog0301:
        ; Display the buffer.
        closfillog0301:
        mov eax,fileHandle
        call CloseFile



                ; Open the file for inpute.
        mov edx,OFFSET Text0203
        call OpenInputFile
        mov fileHandle,eax
        ; Check for errors.

        cmp eax,INVALID_HANDLE_VALUE						; error opening file?
        jne fileoklog0302 ; no: skip
       
											        ; and quit

        fileoklog0302:

        ; Read the file into a buffer.
        mov edx,OFFSET MensajesDescargados2
        mov ecx,BUFFER_SIZE
        call ReadFromFile
        jnc checksize0302							; error reading?
      
        jmp closfillog0302
        checksize0302:
        cmp eax,BUFFER_SIZE									; buffer large enough?
        jb bufoki0302										; yes										; and quit

        bufoki0302:
        mov MensajesDescargados2[eax],0								; insert null terminator
									; display file size
        cmp eax,0
        je noinlog0302
        mov validarInformacionAccount,0						;0 Para indicar que el archivo contiene informacion
        jmp siinlog0302

        noinlog0302:
        mov validarInformacionAccount,1						;1 Para indicar que el archivo no contiene informacion
        siinlog0302:
        ; Display the buffer.
        closfillog0302:
        mov eax,fileHandle
        call CloseFile
        cmp ESCRIBIENDO, 1
        je CICLOESCRIBIENDO

        mov PrimerChatAbierto, 1
        mov SegundoChatAbierto, 2
        cmp CHATACTUAL,1
        je IMPRIMIRCHAT1
        cmp CHATACTUAL,2
        je IMPRIMIRCHAT2
        mov DL, 10
        mov DH, 10
        call Gotoxy
        mov edx, OFFSET chat2
        call WriteString
        mov DL, 10
        mov DH, 5
        call Gotoxy
        mov edx, OFFSET chat1
        call WriteString
        mov DL, 40
        mov DH, 12
        call Gotoxy
        mov edx, OFFSET cuadro
        call WriteString
        mov DL, 40
        mov DH, 7
        call Gotoxy
        mov edx, OFFSET cuadro
        call WriteString

        CARGAR_CHAT:
        invoke ReadConsoleInput, hStdIn, ADDR InputRecord, 1, ADDR nRead
        movzx  eax, InputRecord.EventType
        cmp InputRecord.MouseEvent.dwButtonState, 0001h ;COMPARES WITH LEFT BUTTON
        je IZQUIERDO
        cmp ID, 50
        jb checkClick
        je checkClick2
        jg checkClick3
       
        IZQUIERDO:

        checkXCoords:
        cmp InputRecord.MouseEvent.dwMousePosition.X, 40
        je checkYCoords
        jmp PUNTERO

        checkYCoords:
       
        cmp InputRecord.MouseEvent.dwMousePosition.Y, 7
        je ABRIRCHAT1
        cmp InputRecord.MouseEvent.dwMousePosition.Y, 12
        je ABRIRCHAT2
        jmp PUNTERO

        
        

                                               ;====Chat1====

        

        SETPUNTERO:
        mov edi, 0 
        cmp ID, 50
        jb SETID1
        je SETID2
        jg SETID3
        SETID1:
        mov bufferTexto[0], 49       ; Almacena el ID en la posición 0
        jmp SET
        SETID2:
        mov bufferTexto[0], 50       ; Almacena el ID en la posición 0
        jmp SET
        SETID3:
        mov bufferTexto[0], 51       ; Almacena el ID en la posición 0

        SET:
        mov edi, 1
        mov CoordX, 22
        mov CoordY, 25
        mov DL, 12
        mov DH, 26
        Call Gotoxy
        mov  eax, Gray
        call SetTextColor
        mWrite <"[*]CLOSE:">
        mov DL, 21
        mov DH, 26
        call Gotoxy
        CICLOESCRIBIENDO:
        cmp TEMPORAL, 0
        je IGNORECICLOESCRIBIENDO
        inc TEMPORAL
        cmp TEMPORAL, 150
        jge BORRARTEMPORAL
        IGNORECICLOESCRIBIENDO:
        mov ESCRIBIENDO, 1
        invoke ReadConsoleInput, hStdIn, ADDR InputRecord, 1, ADDR nRead
        movzx  eax, InputRecord.EventType
        cmp InputRecord.MouseEvent.dwButtonState, 0001h ;COMPARES WITH LEFT BUTTON
        je VerificarCLOSE
        cmp InputRecord.MouseEvent.dwButtonState, 0002h ;COMPARES WITH RIGHT BUTTON
        je ESCRIBIRGUION
        cmp InputRecord.MouseEvent.dwButtonState, 0004h ;COMPARES WITH MIDDLE BUTTON
        je BORRAR
        jmp ACTUALIZARESCRIBIENDO

        VerificarCLOSE:
        cmp InputRecord.MouseEvent.dwMousePosition.Y, 26
        je checkXCoordsClose
        jmp VerificarSEND

        checkXCoordsClose:
        cmp InputRecord.MouseEvent.dwMousePosition.X, 13
        je TOCARCLOSE
        jmp VerificarSEND

        VerificarSEND:
        cmp InputRecord.MouseEvent.dwMousePosition.Y, 26
        je checkXCoordsSend
        jmp VerificarBARRA

        checkXCoordsSend:
        cmp InputRecord.MouseEvent.dwMousePosition.X, 63
        je TOCARSEND
        jmp VerificarBARRA

        VerificarBARRA:
        cmp InputRecord.MouseEvent.dwMousePosition.Y, 27
        je checkXCoordsBarra
        jmp VerificarPUNTOYCOMA

        checkXCoordsBarra:
        cmp InputRecord.MouseEvent.dwMousePosition.X, 16
        je ECRIBIRBARRA
        jmp VerificarPUNTOYCOMA


        VerificarPUNTOYCOMA:
        cmp InputRecord.MouseEvent.dwMousePosition.Y, 27
        je checkXCoordsPUNTOYCOMA
        jmp ESCRIBIRPUNTO

        checkXCoordsPuntoYComa:
        cmp InputRecord.MouseEvent.dwMousePosition.X, 19
        je ESCRIBIRPUNTOYCOMA
        jmp ESCRIBIRPUNTO

        ESCRIBIRPUNTO:
        mov DL, Coordx
        mov DH, Coordy
        call Gotoxy
        mWrite <".">
        inc Coordx
        cmp Coordx, 61
        jge SALTODELINEA
        mov al, "."
        jmp ESCRIBIRENBUFFER


        ECRIBIRBARRA:
        mov DL, Coordx
        mov DH, Coordy
        call Gotoxy
        mWrite <"/">
        inc Coordx
        cmp Coordx, 61
        jge SALTODELINEA
        mov al, "/"
        jmp ESCRIBIRENBUFFER

        ESCRIBIRPUNTOYCOMA:
        mov DL, Coordx
        mov DH, Coordy
        call Gotoxy
        mWrite <";">
        inc Coordx
        cmp Coordx, 61
        jge SALTODELINEA
        mov al, ";"
        jmp ESCRIBIRENBUFFER

        ESCRIBIRGUION:
        mov DL, Coordx
        mov DH, Coordy
        call Gotoxy
        mWrite <"-">
        inc Coordx
        cmp Coordx, 61
        jge SALTODELINEA
        mov al, "-"
        jmp ESCRIBIRENBUFFER

        ESCRIBIRENBUFFER:

        mov byte ptr [bufferTexto+edi], al
        inc edi
        jmp CICLOESCRIBIENDO


        BORRARTEMPORAL:
        mov ESCRIBIENDO,0
        mov edi, POSBORRAR
        mov TEMPORAL, 0
        cmp CHATBORRAR, 1
        je CICLOBORRARBUFFER1
        jmp CICLOBORRARBUFFER2
        CICLOBORRARBUFFER1:
        mov [MensajesDescargados1+edi], 0
        inc edi
        cmp edi, 5000
        je TOCARSENDBORRAR
        jmp CICLOBORRARBUFFER1

        CICLOBORRARBUFFER2:
        mov [MensajesDescargados2+edi], 0
        inc edi
        cmp edi, 5000
        je TOCARSENDBORRAR
        jmp CICLOBORRARBUFFER2

        BORRARENBUFFER:
        dec edi 
        mov edx, 0
        mov bufferTexto[edi], edx
        jmp CICLOESCRIBIENDO

        BORRAR:
        cmp CoordX, 22
        jbe COMPROBARALTURA
        cmp CoordY, 27
        jge COMPROBARX
        BORRADONORMAL:
        dec CoordX
        mov DL, Coordx
        mov DH, Coordy
        call Gotoxy
        mov edx, OFFSET Vacio
        call WriteString
        jmp BORRARENBUFFER

        COMPROBARX:
        cmp CoordX, 60
        jb BORRADONORMAL
        mov DL, Coordx
        mov DH, Coordy
        call Gotoxy
        mov edx, OFFSET Vacio
        call WriteString

        jmp BORRADONORMAL

        COMPROBARALTURA:
        cmp CoordY, 26
        jge VOLVERLINEA
        jmp CICLOESCRIBIENDO

        SALTODELINEA: 
        cmp CoordY, 27
        jge FINCHAT
        inc CoordY
        mov CoordX, 22
        jmp CICLOESCRIBIENDO

        FINCHAT:
        mov CoordX, 60
        jmp CICLOESCRIBIENDO

        VOLVERLINEA:
        dec CoordY
        mov CoordX, 60
        mov DL, Coordx
        mov DH, Coordy
        call Gotoxy
        mov edx, OFFSET Vacio
        call WriteString
        jmp CICLOESCRIBIENDO

        TOCARCLOSE:
        mov ESCRIBIENDO,0
        mov DL, 12
        mov DH, 26
        Call Gotoxy
        mov  eax, Gray
        call SetTextColor
        mWrite <"[*]WRITE:">
        jmp CHATABIERTO

        TOCARSEND:
        mov ESCRIBIENDO, 0
        mov byte ptr [bufferTexto+edi], "\"
        mov edi, 0
        mov esi,0

        mov edx, CHATACTUAL
        mov CHATAUXILIAR, edx
        jmp SEGUIR
        TOCARSENDBORRAR:
        mov edx, CHATBORRAR
        mov CHATAUXILIAR, edx
        mov CHATBORRAR,0
        SEGUIR:

        cmp CHATAUXILIAR,1
        je FINALBUFFER1
        jmp FINALBUFFER2
        
        ;recorrer el buffer hasta que la posición actual sea 0
        FINALBUFFER1:
        
        movzx edx, byte ptr [MensajesDescargados1+edi]
        cmp edx, 0
        je SOBREESCRIBIRBUFFER1
        inc edi
        jmp FINALBUFFER1

        SOBREESCRIBIRBUFFER1:
        movzx edx, byte ptr [bufferTexto+esi]
        cmp edx, 0
        je SUBIRARCHIVO
        mov [MensajesDescargados1+edi], edx
        inc edi
        inc esi
        jmp SOBREESCRIBIRBUFFER1

        FINALBUFFER2:
        
        movzx edx, byte ptr [MensajesDescargados2+edi]
        cmp edx, 0
        je SOBREESCRIBIRBUFFER2
        inc edi
        jmp FINALBUFFER2

        SOBREESCRIBIRBUFFER2:
        movzx edx, byte ptr [bufferTexto+esi]
        cmp edx, 0
        je SUBIRARCHIVO
        mov [MensajesDescargados2+edi], edx
        inc edi
        inc esi
        jmp SOBREESCRIBIRBUFFER2

        SUBIRARCHIVO:
        cmp ID, 50
        jb ENVIOUSUARIO1
        je ENVIOUSUARIO2
        jg ENVIOUSUARIO3


        ENVIOUSUARIO1:
        cmp CHATAUXILIAR, 1
        je SUBIR0102
        jmp SUBIR01032

        ENVIOUSUARIO2:
        cmp CHATAUXILIAR, 1
        je SUBIR0102
        jmp SUBIR0203

        ENVIOUSUARIO3:
        cmp CHATAUXILIAR, 1
        je SUBIR01031
        jmp SUBIR0203

        SUBIR0102:
        ; Create a new text file.
        mov edx,OFFSET Text0102
        call CreateOutputFile
        mov fileHandle,eax

        mov stringLength,eax ; counts chars entered
        ; Write the buffer to the output file.
        mov eax,fileHandle
        mov edx,OFFSET MensajesDescargados1
        mov ecx,stringLength
        call WriteToFile
        mov bytesWritten,eax ; save return value
        call CloseFile
        mov edi,0
        mov esi,0
        jmp PUNTERO
        SUBIR01031:
        ; Create a new text file.
        mov edx,OFFSET Text0103
        call CreateOutputFile
        mov fileHandle,eax

        mov stringLength,eax ; counts chars entered
        ; Write the buffer to the output file.
        mov eax,fileHandle
        mov edx,OFFSET MensajesDescargados1
        mov ecx,stringLength
        call WriteToFile
        mov bytesWritten,eax ; save return value
        call CloseFile
        mov edi,0
        mov esi,0
        jmp PUNTERO

        SUBIR01032:
        ; Create a new text file.
        mov edx,OFFSET Text0103
        call CreateOutputFile
        mov fileHandle,eax

        mov stringLength,eax ; counts chars entered
        ; Write the buffer to the output file.
        mov eax,fileHandle
        mov edx,OFFSET MensajesDescargados2
        mov ecx,stringLength
        call WriteToFile
        mov bytesWritten,eax ; save return value
        call CloseFile
        mov edi,0
        mov esi,0
        jmp PUNTERO

        SUBIR0203:
        ; Create a new text file.
        mov edx,OFFSET Text0203
        call CreateOutputFile
        mov fileHandle,eax

        mov stringLength,eax ; counts chars entered
        ; Write the buffer to the output file.
        mov eax,fileHandle
        mov edx,OFFSET MensajesDescargados2
        mov ecx,stringLength
        call WriteToFile
        mov bytesWritten,eax ; save return value
        call CloseFile
        mov edi,0
        mov esi,0
        jmp PUNTERO
        ;Empezar a escribir el buffer enviado de uno en uno en el buffer del txt hasta haber escrito todo


        VerificarWrite:
        cmp InputRecord.MouseEvent.dwMousePosition.Y, 26
        je checkXCoordsWrite
        jmp VerificarBack

        checkXCoordsWrite:
        cmp InputRecord.MouseEvent.dwMousePosition.X, 13
        je SETPUNTERO
        jmp VerificarBack

        VerificarBack:
        cmp InputRecord.MouseEvent.dwMousePosition.Y, 3
        je checkXCoordsBack
        jmp VerificarColorFondo

        checkXCoordsBack:
        cmp InputRecord.MouseEvent.dwMousePosition.X, 72
        je quit
        jmp VerificarColorFondo

        VerificarColorFondo:
        cmp InputRecord.MouseEvent.dwMousePosition.Y, 4
        je checkXCoordsColorFondo
        jmp VerificarColorTextoPropio

        checkXCoordsColorFondo:
        cmp InputRecord.MouseEvent.dwMousePosition.X, 72
        je CambiarFondo
        jmp VerificarColorTextoPropio

        VerificarColorTextoPropio:
        cmp InputRecord.MouseEvent.dwMousePosition.Y, 25
        je checkXCoordsColorTextoPropio
        jmp VerificarColorTextoAjeno

        checkXCoordsColorTextoPropio:
        cmp InputRecord.MouseEvent.dwMousePosition.X, 72
        je CambiarTextoPropio
        jmp VerificarColorTextoAjeno

        VerificarColorTextoAjeno:
        cmp InputRecord.MouseEvent.dwMousePosition.Y, 25
        je checkXCoordsColorTextoAjeno
        jmp VerificarTemporal

        checkXCoordsColorTextoAjeno:
        cmp InputRecord.MouseEvent.dwMousePosition.X, 8
        je CambiarTextoAjeno
        jmp VerificarTemporal
        
        VerificarTemporal:
        cmp InputRecord.MouseEvent.dwMousePosition.Y, 23
        je checkXCoordsTemporal
        jmp CHATABIERTO

        checkXCoordsTemporal:
        cmp InputRecord.MouseEvent.dwMousePosition.X, 72
        je COMENZARTEMPORAL
        jmp CHATABIERTO


        CambiarFondo:
        cmp FondoActual,4
        jne FONDO1
        mov FondoActual,0

        FONDO1:
        inc FondoActual
        cmp FondoActual,1
        jne FONDO2
        mov ColorFondo, Green
        call Clrscr
        cmp CHATACTUAL, 1
        je ABRIRCHAT1
        jmp ABRIRCHAT2

        FONDO2:
        cmp FondoActual,2
        jne FONDO3
        mov ColorFondo, Blue
        call Clrscr
        cmp CHATACTUAL, 1
        je ABRIRCHAT1
        jmp ABRIRCHAT2

        FONDO3:
        cmp FondoActual,3
        jne FONDO4
        mov ColorFondo, Magenta
        call Clrscr
        cmp CHATACTUAL, 1
        je ABRIRCHAT1
        jmp ABRIRCHAT2

        FONDO4:
        mov ColorFondo, Yellow
        call Clrscr
        cmp CHATACTUAL, 1
        je ABRIRCHAT1
        jmp ABRIRCHAT2

        CambiarTextoPropio:
        cmp MensajePropioActual,7
        jne MensajePropio1
        mov MensajePropioActual,0

        MensajePropio1:
        inc MensajePropioActual
        cmp MensajePropioActual,1
        jne MensajePropio2
        mov ColorMensajePropio, lightgray
        call Clrscr
        cmp CHATACTUAL, 1
        je ABRIRCHAT1
        jmp ABRIRCHAT2

        MensajePropio2:
        cmp MensajePropioActual,2
        jne MensajePropio3
        mov ColorMensajePropio, brown
        call Clrscr
        cmp CHATACTUAL, 1
        je ABRIRCHAT1
        jmp ABRIRCHAT2

        MensajePropio3:
        cmp MensajePropioActual,3
        jne MensajePropio4
        mov ColorMensajePropio, lightBlue
        call Clrscr
        cmp CHATACTUAL, 1
        je ABRIRCHAT1
        jmp ABRIRCHAT2

        MensajePropio4:
        cmp MensajePropioActual,4
        jne MensajePropio5
        mov ColorMensajePropio, lightCyan
        call Clrscr
        cmp CHATACTUAL, 1
        je ABRIRCHAT1
        jmp ABRIRCHAT2

        MensajePropio5:
        cmp MensajePropioActual,5
        jne MensajePropio6
        mov ColorMensajePropio, lightRed
        call Clrscr
        cmp CHATACTUAL, 1
        je ABRIRCHAT1
        jmp ABRIRCHAT2

        MensajePropio6:
        cmp MensajePropioActual,6
        jne MensajePropio7
        mov ColorMensajePropio, lightMagenta
        call Clrscr
        cmp CHATACTUAL, 1
        je ABRIRCHAT1
        jmp ABRIRCHAT2

        MensajePropio7:
        mov ColorMensajePropio, Yellow
        call Clrscr
        cmp CHATACTUAL, 1
        je ABRIRCHAT1
        jmp ABRIRCHAT2




        CambiarTextoAjeno:
        cmp MensajeAjenoActual,7
        jne MensajeAjeno1
        mov MensajeAjenoActual,0

        MensajeAjeno1:
        inc MensajeAjenoActual
        cmp MensajeAjenoActual,1
        jne MensajeAjeno2
        mov ColorMensajeAjeno, lightgray
        call Clrscr
        cmp CHATACTUAL, 1
        je ABRIRCHAT1
        jmp ABRIRCHAT2

        MensajeAjeno2:
        cmp MensajeAjenoActual,2
        jne MensajeAjeno3
        mov ColorMensajeAjeno, brown
        call Clrscr
        cmp CHATACTUAL, 1
        je ABRIRCHAT1
        jmp ABRIRCHAT2

        MensajeAjeno3:
        cmp MensajeAjenoActual,3
        jne MensajeAjeno4
        mov ColorMensajeAjeno, lightBlue
        call Clrscr
        cmp CHATACTUAL, 1
        je ABRIRCHAT1
        jmp ABRIRCHAT2

        MensajeAjeno4:
        cmp MensajeAjenoActual,4
        jne MensajeAjeno5
        mov ColorMensajeAjeno, lightCyan
        call Clrscr
        cmp CHATACTUAL, 1
        je ABRIRCHAT1
        jmp ABRIRCHAT2

        MensajeAjeno5:
        cmp MensajeAjenoActual,5
        jne MensajeAjeno6
        mov ColorMensajeAjeno, lightRed
        call Clrscr
        cmp CHATACTUAL, 1
        je ABRIRCHAT1
        jmp ABRIRCHAT2

        MensajeAjeno6:
        cmp MensajeAjenoActual,6
        jne MensajeAjeno7
        mov ColorMensajeAjeno, lightMagenta
        call Clrscr
        cmp CHATACTUAL, 1
        je ABRIRCHAT1
        jmp ABRIRCHAT2

        MensajeAjeno7:
        mov ColorMensajeAjeno, Yellow
        call Clrscr
        cmp CHATACTUAL, 1
        je ABRIRCHAT1
        jmp ABRIRCHAT2
        


        COMENZARTEMPORAL:

        mov edx, CHATACTUAL
        mov CHATBORRAR, edx
        mov TEMPORAL, 1
        mov edx, POSFINAL
        mov POSBORRAR, edx
        mov edi, 0
        jmp PUNTERO

        CHATABIERTO:
        cmp RecargarChat,10
        jge RECARGACHAT
        cmp TEMPORAL,0
        je IGNORECHATABIERTO
        inc TEMPORAL
        cmp TEMPORAL, 150
        jge BORRARTEMPORAL
        IGNORECHATABIERTO:
        inc RecargarChat
        invoke ReadConsoleInput, hStdIn, ADDR InputRecord, 1, ADDR nRead
        movzx  eax, InputRecord.EventType
        cmp InputRecord.MouseEvent.dwButtonState, 0001h ;COMPARES WITH LEFT BUTTON
        je VerificarWrite
        
        jmp CHATABIERTO

        RECARGACHAT:
        mov RecargarChat,0
        jmp ACTUALIZARESCRIBIENDO

        ABRIRCHAT1:
        mov CHATACTUAL, 1
        call clrscr
        mov DL, 15
        mov DH, 2
        Call Gotoxy
        mov eax, lightgray
        call SetTextColor
        mov eax, PrimerChatAbierto
        call WriteDec
        call crlf
        jmp CARGARPANTALLACHAT


        
        ABRIRCHAT2:                                ;====Chat2====
        mov CHATACTUAL, 2
        call clrscr
        mov DL, 15
        mov DH, 2
        Call Gotoxy
        mov eax, lightgray
        call SetTextColor
        mov eax, SegundoChatAbierto
        call WriteDec
        call crlf
        

       CARGARPANTALLACHAT:
        movzx  eax, ColorFondo
        call SetTextColor
        mov edx, OFFSET CHATABIERTO1
        call WriteString
        mov DL, 71
        mov DH, 3
        Call Gotoxy
        mov  eax,red
        call SetTextColor
        mWrite <"[*]BACK">
        mov DL, 71
        mov DH, 4
        Call Gotoxy
        mov  eax,blue
        call SetTextColor
        mWrite <"[*]Cambiar color marco">
        mov DL, 71
        mov DH, 22
        Call Gotoxy
        mov  eax,Yellow
        call SetTextColor
        mWrite <"[*]TEMP">

        mov DL, 12
        mov DH, 26
        Call Gotoxy
        mov  eax, Gray
        call SetTextColor
        mWrite <"[*]WRITE:">
        mov DL, 15
        mov DH, 27
        Call Gotoxy
        mov  eax, Brown
        call SetTextColor
        mWrite <"[/]">
        mov DL, 18
        mov DH, 27
        Call Gotoxy
        mov  eax, Brown
        call SetTextColor
        mWrite <"[;]">
        mov  eax, lightGray
        call SetTextColor
        mov DL, 2
        mov DH, 25
        Call Gotoxy
        mWrite <"Color[*]">
        mov  eax, lightGray
        call SetTextColor
        mov DL, 71
        mov DH, 25
        Call Gotoxy
        mWrite <"[*]Color">
        mov  eax, Gray
        call SetTextColor
        mov DL, 62
        mov DH, 26
        Call Gotoxy
        mWrite <"[*]SEND">

                ; Open the file for input.
        mov edx,OFFSET MorseBuffer
        call OpenInputFile
        mov fileHandle,eax
        ; Check for errors.

        cmp eax,INVALID_HANDLE_VALUE						; error opening file?
        jne fileoklogmo ; no: skip
											        ; and quit

        fileoklogmo:

        ; Read the file into a buffer.
        mov edx,OFFSET morseLETRAS
        mov ecx,BUFFER_SIZE
        call ReadFromFile
        jnc checksizelogmo								; error reading?
     
        jmp closfillogmo
        checksizelogmo:
        cmp eax,BUFFER_SIZE									; buffer large enough?
        jb bufokilogmo										; yes											; and quit

        bufokilogmo:
        mov morseLETRAS[eax],0								; insert null terminator
									; display file size
        cmp eax,0
        je noinlogmo
        mov validarInformacionAccount,0						;0 Para indicar que el archivo contiene informacion
        jmp siinlogmo
        call Crlf

        noinlogmo:
        mov validarInformacionAccount,1						;1 Para indicar que el archivo no contiene informacion
        siinlogmo:
        call Crlf
        ; Display the buffer.
        call Crlf
        closfillogmo:
        mov eax,fileHandle
        call CloseFile


        cmp CHATACTUAL, 1
        je IMPRIMIRCHAT1
        jmp IMPRIMIRCHAT2

        IMPRIMIRCHAT1:
        
        cmp TEMPORAL,0
        je IGNORAIMPRIMIRCHAT1
        inc TEMPORAL
        IGNORAIMPRIMIRCHAT1:
        mov CoordYCHAT, 3
        mov edi,0
        mov edx, 0
        mov ecx,0
        movzx ebx, byte ptr [MensajesDescargados1+edi] 
        inc edi
        cmp ebx, ID
        je ASIGNARDERINICIAL
        jmp ASIGNARIZQINICIAL
        
        
        VERIFICARMENSAJE1:
        cmp TEMPORAL,0
        je IGNORAVERI1
        inc TEMPORAL
        IGNORAVERI1:
        movzx ebx, byte ptr [MensajesDescargados1+edi] 
        cmp ebx, 0
        je CHATABIERTO
        cmp ebx, 32
        je INCEDI1
        cmp ebx,"/"
        je SALTOLINEA1
        cmp ebx,"\"
        je SALIRLEER1
        movzx eax, byte ptr[morseLETRAS+edx]
        cmp ebx,eax
        jne SIGIGUIENTEPALABRA1
        cmp ebx,";"
        je TRANSFORMARMENSAJE1

        

        cmp eax,0
        je MENSAJEERR1
        inc edi
        inc edx
        inc REINICIARLECTURA
        jmp VERIFICARMENSAJE1

        INCEDI1:
        inc edi
        jmp VERIFICARMENSAJE1


        SIGIGUIENTEPALABRA1:

        sub edi,REINICIARLECTURA
        mov REINICIARLECTURA,0
        movzx eax, morseLETRAS[edx]
        inc edx
        cmp eax,";"
        jne SIGIGUIENTEPALABRA1
        inc parteLetra
        jmp VERIFICARMENSAJE1


        TRANSFORMARMENSAJE1:
        mov REINICIARLECTURA,0
        mov DL, CoordXCHAT
        mov DH, CoordYCHAT
        call Gotoxy
        mov edx, OFFSET parteLetra 
        call WriteString 
        inc CoordXCHAT
        cmp CoordXCHAT, 43
        je SALTOCHATIZQ
        cmp CoordXCHAT, 44
        je SALTOCHATIZQ
        cmp CoordXCHAT, 58
        je SALTOCHATDER
        mov parteLetra,65
        inc edi
        mov edx,0
        jmp VERIFICARMENSAJE1

        SALTOLINEA1:
        inc CoordXCHAT
        mov edx,OFFSET vacio
        call WriteString
        cmp CoordXCHAT, 43
        je SALTOCHATIZQ
        cmp CoordXCHAT, 44
        je SALTOCHATIZQ
        cmp CoordXCHAT, 58
        jge SALTOCHATDER

        mov edx,0
        inc edi
        jmp VERIFICARMENSAJE1

        MENSAJEERR1:
        mWrite <"ERROR">
        jmp SALIDAIMPRESION1

        SALIRLEER1:
        inc edi
        inc CoordYCHAT
        movzx ebx, byte ptr [MensajesDescargados1+edi] 
        jmp ASIGNARPOS
        
        CONTINUARMENSAJE1:
        mov IDCHAT, ebx
        mov edx, OFFSET IDCHAT
        Call WriteString
        mov edx, 0
        inc CoordXChat
        inc edi 
        mov ebx,MensajesDescargados1[edi]
        cmp ebx,0
        je SALIDAIMPRESION1
        mov edx,0
        jmp VERIFICARMENSAJE1
        SALIDAIMPRESION1:
        
        jmp CHATABIERTO


        IMPRIMIRCHAT2:
    
        cmp TEMPORAL,0
        je IGNORAIMPRIMIRCHAT2
        inc TEMPORAL
        IGNORAIMPRIMIRCHAT2:
        mov CoordYCHAT, 3
        mov edi,0
        mov edx, 0
        mov ecx,0
        movzx ebx, byte ptr [MensajesDescargados2+edi] 
        inc edi
        cmp ebx, ID
        je ASIGNARDERINICIAL
        jmp ASIGNARIZQINICIAL

        call crlf
        VERIFICARMENSAJE2:
        cmp TEMPORAL,0
        je IGNORAVERI2
        inc TEMPORAL
        IGNORAVERI2:
        movzx ebx, byte ptr [MensajesDescargados2+edi] 
        cmp ebx, 0
        je CHATABIERTO
        cmp ebx, 32
        je INCEDI2
        cmp ebx,"/"
        je SALTOLINEA2
        cmp ebx,"\"
        je SALIRLEER2
        
        movzx eax, byte ptr[morseLETRAS+edx]
        cmp ebx,eax
        jne SIGIGUIENTEPALABRA2
        cmp ebx,";"
        je TRANSFORMARMENSAJE2

        cmp eax,0
        je MENSAJEERR2
        inc edi
        inc edx
        inc REINICIARLECTURA
        jmp VERIFICARMENSAJE2

        INCEDI2:
        inc edi
        jmp VERIFICARMENSAJE2


        SIGIGUIENTEPALABRA2:

        sub edi,REINICIARLECTURA
        mov REINICIARLECTURA,0
        movzx eax, morseLETRAS[edx]
        inc edx
        cmp eax,";"
        jne SIGIGUIENTEPALABRA2
        inc parteLetra
        jmp VERIFICARMENSAJE2


        TRANSFORMARMENSAJE2:
        mov REINICIARLECTURA,0
        mov DL, CoordXCHAT
        mov DH, CoordYCHAT
        call Gotoxy
        mov edx, OFFSET parteLetra 
        call WriteString 
        inc CoordXCHAT
        cmp CoordXCHAT, 43
        je SALTOCHATIZQ
        cmp CoordXCHAT, 58
        je SALTOCHATDER
        mov parteLetra,65
        inc edi
        mov edx,0
        jmp VERIFICARMENSAJE2

        SALTOLINEA2:
        inc CoordXCHAT
        mov edx,OFFSET vacio
        call WriteString
        cmp CoordXCHAT, 43
        je SALTOCHATIZQ
        cmp CoordXCHAT, 44
        je SALTOCHATIZQ
        cmp CoordXCHAT, 58
        jge SALTOCHATDER

        mov edx,0
        inc edi
        jmp VERIFICARMENSAJE2

        MENSAJEERR2:
        mWrite <"ERROR">
        jmp SALIDAIMPRESION2

        SALIRLEER2:
        inc edi
        inc CoordYCHAT
        movzx ebx, byte ptr [MensajesDescargados2+edi] 
        jmp ASIGNARPOS
        
        CONTINUARMENSAJE2:
        cmp ebx,0
        je SALIDAIMPRESION2
        mov IDCHAT, ebx
        mov edx, OFFSET IDCHAT
        Call WriteString
        mov edx, 0
        inc CoordXChat
        inc edi 
        mov ebx,MensajesDescargados2[edi]
        cmp ebx,0
        je SALIDAIMPRESION2
        mov edx,0
        jmp VERIFICARMENSAJE2
        SALIDAIMPRESION2:
       

        jmp CHATABIERTO
        
        ASIGNARPOS:
        cmp ebx, ID
        je ASIGNARDER
        jmp ASIGNARIZQ

        ASIGNARIZQ:
        mov CoordXCHAT, 12
        mov DL, 12
        mov DH, CoordYCHAT
        call Gotoxy
        movzx  eax, ColorMensajeAjeno
        call SetTextColor 
        mov edx,0
        mov POSFINAL,edi
        cmp CHATACTUAL,1
        je CONTINUARMENSAJE1
        jmp CONTINUARMENSAJE2

        ASIGNARDER:
        mov CoordXCHAT, 45
        mov DL, 45
        mov DH, CoordYCHAT
        call Gotoxy
        movzx  eax, ColorMensajePropio
        call SetTextColor 
        mov edx,0
        mov POSFINAL,edi
        cmp CHATACTUAL,1
        je CONTINUARMENSAJE1
        jmp CONTINUARMENSAJE2
        

        ASIGNARIZQINICIAL:
        mov CoordXCHAT, 12
        mov DL, 12
        mov DH, CoordYCHAT
        call Gotoxy
        movzx  eax, ColorMensajeAjeno
        call SetTextColor
        mov IDCHAT, ebx
        mov edx, OFFSET IDCHAT
        Call WriteString
        mov edx,0
        inc CoordXChat
        cmp CHATACTUAL,1
        je VERIFICARMENSAJE1
        jmp VERIFICARMENSAJE2

        ASIGNARDERINICIAL:
        mov CoordXCHAT, 45
        mov DL, 45
        mov DH, CoordYCHAT
        call Gotoxy
        movzx  eax, ColorMensajePropio
        call SetTextColor
        mov IDCHAT, ebx
        mov edx, OFFSET IDCHAT
        Call WriteString
        mov edx, 0
        inc CoordXChat
        mov edx,0
        cmp CHATACTUAL,1
        je VERIFICARMENSAJE1
        jmp VERIFICARMENSAJE2

        SALTOCHATIZQ:
        inc CoordYCHAT
        mov CoordXCHAT, 12
        mov DL, 12
        mov DH, CoordYCHAT
        call Gotoxy
        mov IDCHAT, ebx
        mov edx, OFFSET IDCHAT
        Call WriteString
        mov edx, 0
        inc CoordXChat
        mov edx,0
        cmp CHATACTUAL,1
        je VERIFICARMENSAJE1
        jmp VERIFICARMENSAJE2

        SALTOCHATDER:
        inc CoordYCHAT
        mov CoordXCHAT, 45
        mov DL, 45
        mov DH, CoordYCHAT
        call Gotoxy
        mov edx,0
        cmp CHATACTUAL,1
        je VERIFICARMENSAJE1
        jmp VERIFICARMENSAJE2
        
.ENDW
ret
exit
main ENDP
END main