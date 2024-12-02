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

    BALL_COLOR      DB  04H     ;RED COLOR

.CODE

MAIN PROC FAR

                    MOV  AX, @DATA
                    MOV  DS, AX                 ;MOVING DATA TO DATA SEGNMENT


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

                    CALL DRAWING_BALL           ;DRAWING BALL
                    CALL MOVING_BALL

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

                    RET

    REVERSE_Y:      NEG  BALL_SPEED_Y           ;REVERSE THE DIRECTION OF SPEED IN Y
                    RET

    REVERSE_X:      NEG  BALL_SPEED_X           ;REVERSE THE DIRECTION OF SPEED IN Y

                    RET
MOVING_BALL ENDP







DRAWING_BALL PROC

                    MOV  CX, BALL_POSITION_X    ;SET THE COLUMN POSITION OF THE PIXEL
                    MOV  DX, BALL_POSITION_Y    ;SET THE ROW POSITION OF THE PIXEL
                    MOV  AL, 4H                 ;COLOR OF THE PIXEL IS RED
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


END MAIN
