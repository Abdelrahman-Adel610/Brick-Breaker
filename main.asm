.MODEL SMALL
.STACK 4000
.DATA

    MAX_WIDTH       DW  140H    ;THE WIDTH OF THE WINDOW
    MAX_HIGHT       DW  0C8H    ;THE HIGHT OF THE WINDOW          ; WILL REPLACE IT WITH THE BADLE POSITION

    BALL_POSITION_X DW  0A0H    ;X POSITION OF THE BALL COLUMNNN
    BALL_POSITION_Y DW  64H     ;Y POSITION OF THE BALL ROWWWWWW
    BALL_SIZE       EQU 05H     ;NUMBER OF PIXELS OF THE BALL IN 2D DIRECTION

    PREV_TIME       DB  0       ;USED TO CHECK IF THE TIME HAS CHANGED
    BALL_SPEED      DB  7H      ;TO CONTROLL THE SPEED OF THE BALL

    BALL_SPEED_Y    DW  5H      ;THE SPEED OF THE BALL IN Y DIRECTION
    BALL_SPEED_X    DW  2H

    BALL_COLOR      DB  09H     ;RED COLOR


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                    ;Breaks var
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

BRICK_WIDTH dw 35
BRICK_HEIGHT dw 8
COLOR_MATRIX db 1,2,3,1,2,3,1,2,3,1,2,3,1,2,3,1,2,3,1,2,3,1,2,3
CRNT_BRICK dW 0
ROW dw 4
COL dw 0
BRICKS_PER_ROW EQU 8
TOTAL_ROWS EQU 3
STEP_PER_ROW EQU 40 ;(BRICK_WIDTH+1PX SPACE)
STEP_PER_COL EQU 12 ;(BRICK_WIDTH+1PX SPACE)
.CODE

MAIN PROC FAR

                    MOV  AX, @DATA
                    MOV  DS, AX                 ;MOVING DATA TO DATA SEGNMENT

                    mov ax, 0A000h    ; Video memory segment for mode 13h
                    mov es, ax        ; Set ES to point to video memory 
                    MOV  AH, 00H
                    MOV  AL, 13H                ;CHOOSE THE VIDEO MODE
                    INT  10H


                    CALL CLEARING_SCREEN


    TIME_AGAIN:     MOV  AH, 2CH                ;GET THE SYSTEM TIME
                    INT  21H                    ;CH = HOURS, CL = MINUTES, DH = SECONDS AND DL = 1/100 SECONDS

                    MOV  AL, DL                 ;TO AVOID MEMORY TO MEMORY COMMAND
                    CMP  AL, PREV_TIME          ;COMPARE THE PREVSE TIME WITH THE CURENT
                    JE   TIME_AGAIN


                    MOV  PREV_TIME, DL
                    CALL CLEARING_SCREEN        ;TO CLEAR THE SCREEN
                    CALL DRAW_ALL_BRICKS
                    CALL DRAWING_BALL           ;DRAWING BALL
                    CALL MOVING_BALL
                    CALL HANDLE_COLLISION
                    JMP  TIME_AGAIN


                    RET
MAIN ENDP



CLEARING_SCREEN PROC

                    MOV  AH, 06H                ;SCROLL UP
                    XOR  AL, AL                 ;CLEAR ENTIRE SCREEN
                    XOR  CX, CX                 ;CH = ROW, CL = COLUMN (FROM UPPER LEFT CORNER)
                    MOV  DX, 184FH              ;DH = ROW, DL = COLUMN (TO LOWER RIGHT CORNER)
                    MOV  BH, 00H                ;BLACK COLOR
                    INT  10H                    ;CLEAR THE SCREEN


                    RET
CLEARING_SCREEN ENDP




MOVING_BALL PROC

                    MOV  AX, BALL_SPEED_Y
                    SUB  BALL_POSITION_Y, AX    ;MOVE THE BALL UP

                    CMP  BALL_POSITION_Y, 0     ;CHECK IF Y < 0
                    JL   REVERSE_Y              ;IF Y < 0 REVERSE THE DIRECTION OF MOVING

                    MOV  AX, MAX_HIGHT
                    SUB  AX, BALL_SIZE
                    CMP  BALL_POSITION_Y, AX    ;CHECK IF Y > MAX HIGHT
                    JG   REVERSE_Y              ;IF Y > MAX HIGHT - BALL SIZE REVERSE THE DIRECTION TOO

                    MOV  AX, BALL_SPEED_X
                    ADD  BALL_POSITION_X, AX    ;MOV RIGHT

                    CMP  BALL_POSITION_X, 0     ;CHECK IF X < 0
                    JL   REVERSE_X              ;IF X < 0 REVERSE THE DIRECTION

                    MOV  AX, MAX_WIDTH
                    SUB  AX, BALL_SIZE
                    CMP  BALL_POSITION_X, AX    ;CHECK IF x > MAX WIDTH - BALL SIZE
                    JG   REVERSE_X              ;REVERSE IF GREATER

        RT:            RET

    REVERSE_Y:      NEG  BALL_SPEED_Y           ;REVERSE THE DIRECTION OF SPEED IN Y
                    RET

    REVERSE_X:      NEG  BALL_SPEED_X           ;REVERSE THE DIRECTION OF SPEED IN Y

                    RET
MOVING_BALL ENDP



HANDLE_COLLISION PROC
;WHEN COLLIDE WITH THE UPPER FACE OF BRICK
                    MOV AX,BALL_POSITION_Y
                    ADD AX,BALL_SIZE
                    MOV BX,320
                    MUL BX
                    ADD AX,BALL_POSITION_X
                    MOV SI,AX
                    MOV DL,BALL_COLOR
                    CMP ES:[SI],DL
                    JZ X1
                    CMP ES:[SI], BYTE PTR  0
                    JNZ .REVERSE_Y

                X1: MOV AX,BALL_POSITION_Y
                    SUB AX,BALL_SIZE
                    MOV BX,320
                    MUL BX
                    ADD AX,BALL_POSITION_X
                    MOV SI,AX
                    MOV DL,BALL_COLOR
                    CMP ES:[SI],DL
                    JZ .RT
                    CMP ES:[SI], BYTE PTR  0
                    JNZ .REVERSE_Y  

                .RT:    RET
                .REVERSE_Y:
                      NEG  BALL_SPEED_Y           ;REVERSE THE DIRECTION OF SPEED IN Y
                      CALL DESTROY_BRICK
                    RET
HANDLE_COLLISION ENDP

DESTROY_BRICK PROC

GOUP:
SUB SI,320
CMP ES:[SI], BYTE PTR  0
JNZ GOUP
ADD SI,320

GOLEFT:
SUB SI,1
CMP ES:[SI],BYTE PTR 0
JNZ GOLEFT
INC SI

;DEC COLOR_MATRIX

;MOV CX,0
;CLEAR:
;MOV DL,ES:[SI]
;DEC DL
;MOV ES:[SI],DL
;INC CX
;INC SI
;CMP CX,BRICK_WIDTH
;JL CLEAR
;MOV CX,0
;SUB SI,BRICK_WIDTH
;INC SI
;ADD SI,320
;INC DX
;CMP DX,BRICK_HEIGHT
;JL CLEAR



RET
DESTROY_BRICK ENDP




DRAWING_BALL PROC

                    
                    MOV  CX, BALL_POSITION_X    ;SET THE COLUMN POSITION OF THE PIXEL
                    MOV  DX, BALL_POSITION_Y    ;SET THE ROW POSITION OF THE PIXEL
                    MOV  AL, BALL_COLOR                 ;COLOR OF THE PIXEL IS RED
                    MOV  AH, 0CH                ;DRAW PIXEL COMMMAND
    DRAW_HORIZONTAL:INT  10H
                    INC  CX                     ;INCREMENT THE SIZE IN X DIRECTION
                    MOV  BX, CX                 ;TO PRESERVE THE VALUE IN THE CX
                    SUB  BX, BALL_POSITION_X    ;GET THE DIFFERENCE
                    CMP  BX, BALL_SIZE          ;CMPARE THE DIFFERENCE WITH THE BALL SIZE
                    JL   DRAW_HORIZONTAL


                    INC  DX                     ;INCREMENT THE SIZE IN THE Y DIRECTION
                    MOV  CX, BALL_POSITION_X    ;SET THE X DIRECTION AGAIN
                    MOV  BX, DX
                    SUB  BX, BALL_POSITION_Y    ;GET THE DIFFERENCE
                    CMP  BX, BALL_SIZE
                    JL   DRAW_HORIZONTAL        ;IF THE SIZE IN THE Y DIRECTION NOT COMPLETED WILL GO AGAIN TO DRAW IN THE X DIRECTION
                    RET                         ;ELSE WILL RETURN

DRAWING_BALL ENDP

DRAW_ALL_BRICKS PROC
MOV CRNT_BRICK,0
MOV CX,0
MOV DX,0
DRAWIT:
CALL DRAWBRICK
ADD COL,STEP_PER_ROW
INC CRNT_BRICK
INC CX
CMP CX,BRICKS_PER_ROW
JL DRAWIT
MOV CX,0
INC DX
MOV COL,0
ADD ROW,STEP_PER_COL
mov CRNT_BRICK,0
CMP DX,TOTAL_ROWS
JL DRAWIT
MOV ROW,4
MOV COL,0
RET
DRAW_ALL_BRICKS ENDP



DRAWBRICK PROC
push DX
push CX
PUSH AX
PUSH BX
          mov ax,ROW  ;==>column number
          mov bx,320 ;bx=320
          mul bx     ;ax=ax*bx 
          add ax,COL ;ax==>in now target pixel to draw
          MOV SI,AX
          MOV DI,CRNT_BRICK
          mov bl,[COLOR_MATRIX+DI]
          mov cx,0
 draw:    mov es:[si],bl
          inc si
          inc CX
          cmp cx,BRICK_WIDTH
          jl draw
          add si,320
          sub si, BRICK_WIDTH
          INC DX
          MOV CX,0
          CMP DX,BRICK_HEIGHT
          jl draw            
          tirm:       
POP BX
POP AX
pop CX
pop DX
          ret
DRAWBRICK ENDP




end main