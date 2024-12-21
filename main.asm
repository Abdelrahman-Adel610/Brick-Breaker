.MODEL SMALL
.STACK 4000
.DATA

    MAX_WIDTH                 DW  140H                                    ;THE WIDTH OF THE WINDOW
    MAX_HIGHT                 DW  0C8H                                    ;THE HIGHT OF THE WINDOW          ; WILL REPLACE IT WITH THE BADLE POSITION

    BALL_POSITION_X           DW  0A0H                                    ;X POSITION OF THE BALL COLUMNNN
    BALL_POSITION_Y           DW  64H                                     ;Y POSITION OF THE BALL ROWWWWWW
    BALL_SIZE                 EQU 05H                                     ;NUMBER OF PIXELS OF THE BALL IN 2D DIRECTION

    PREV_TIME                 DB  0                                       ;USED TO CHECK IF THE TIME HAS CHANGED
    BALL_SPEED                DB  7H                                      ;TO CONTROLL THE SPEED OF THE BALL

    BALL_SPEED_Y              DW  5H                                      ;THE SPEED OF THE BALL IN Y DIRECTION
    BALL_SPEED_X              DW  2H

    BALL_COLOR                DB  0FH                                     ;RED COLOR  CHANGED TO WHITE TO HANDLE THE COLLISIONS
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;Paddle var
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    width_Paddle              DW  50d
    height_Paddle             DW  4d

    Paddle_Color              DB  0FH
    Paddle_Speed              DW  6

    Paddle_X                  DW  135D
    Paddle_Y                  DW  196D

    LeftBoundry               DW  265
    RightBoundry              DW  6
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;PowerUp var
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    PowerUpWidth              DW  10d
    PowerUpHeight             DW  10d

    PowerUP_Speed             DW  1

    PowerUp_X                 DW  135D
    PowerUp_Y                 DW  155D

    IsPowerUp                 DW  0
    IsPowerUp_pre             DW  0
    Points                    DB  0
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;PowerDown var
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    PowerDownWidth            DW  10d
    PowerDownHeight           DW  10d

 
    PowerDown_Speed           DW  1

    PowerDown_X               DW  135D
    PowerDown_Y               DW  155D
    IsPowerDown               DW  0
    IsPowerDown_pre           DW  0

    POWERUP_CLR               EQU 9
    POWERDOWN_CLR             EQU 4
    SAVEBRICKSPOS_X           DW  0
    SAVEBRICKSPOS_Y           DW  0
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;Breaks var
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;size for each brick
    BRICK_WIDTH               EQU 35
    BRICK_HEIGHT              EQU 8

    ;STARTING POINT TO DRAW BREAKS
    FIRST_ROW_POS             EQU 14
    FIRST_COL_POS             EQU 1

    BRICKS_PER_ROW            EQU 8                                       ; NUMBER OF BRICKS IN EACH ROW
    TOTAL_ROWS                EQU 4                                       ; NUMBER OF ROWS

    STEP_PER_ROW              EQU 40                                      ;(BRICK_WIDTH+1PX SPACE)
    STEP_PER_COL              EQU 12                                      ;(BRICK_WIDTH+1PX SPACE)

    COLOR_MATRIX              db  11 dup (1,2,3,4,2,9)                          ; EACH Brick must have certain color here
    
    GNCLR_MATRIX              db  11 dup (1,2,3,4,2,9)  

    ;VARIABLES USED TO DRAW ALL BRICKS (NOT CONFIGURATIONS)
    ROW                       dw  FIRST_ROW_POS
    COL                       dw  FIRST_COL_POS
    CRNT_BRICK                dW  0                                       ;counter used to draw each brick with its coressponding color
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;Stats var
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    TEXT_GAME_OVER_PLAY_AGAIN db  'GAME OVER! PLAY AGAIN? (Y/N)','$'
    TEXT_SCORE                db  'SCORE: $'
    TEXT_LIVES                db  'LIVES: $'
    SCORE                     db  0
    LIVES                     db  3
    SCORE_CURSOR_X            db  8
    SCORE_MAX_WIDTH           db  3
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;WELCOME PAGE VARIABLES
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    WELCOME                   DB  'WELCOME TO BRICK BREAKER GAME', '$'
    WELCOME_OPTION_CHAT       DB  'CHAT','$'
    WELCOME_OPTION_PLAY       DB  'PLAY','$'
    WELCOME_ARROW             DB  '>','$'
    WELCOME_EXIT              DB  'EXIT','$'
    SELECTOR                  DB  1
    ARROW_COLOR               DB  09H
    ARROW_ROW                 DB  09H

.CODE

MAIN PROC FAR

                              MOV  AX, @DATA
                              MOV  DS, AX                     ;MOVING DATA TO DATA SEGNMENT

                              mov  ax, 0A000h                 ; Video memory segment for mode 13h
                              mov  es, ax                     ; Set ES to point to video memory
                              MOV  AH, 00H
                              MOV  AL, 13H                    ;CHOOSE THE VIDEO MODE
                              INT  10H

                              CALL CLEARING_SCREEN
                              CALL DRAW_WELCOME_SCREEN

                              MOV  AL, 3
                              CMP  SELECTOR, AL
                              JE   EXIT

                              MOV  AL, 1
                              CMP  SELECTOR, AL
                              JE   GAME

    EXIT:                     MOV  AH, 4CH
                              INT  21H


    GAME:                     

                              CALL CLEARING_SCREEN            ;TO CLEAR THE SCREEN
    ; CALL Move_Paddle

    TIME_AGAIN:               MOV  AH, 2CH                    ;GET THE SYSTEM TIME
                              INT  21H                        ;CH = HOURS, CL = MINUTES, DH = SECONDS AND DL = 1/100 SECONDS

                              MOV  AL, DL                     ;TO AVOID MEMORY TO MEMORY COMMAND
                              CMP  AL, PREV_TIME              ;COMPARE THE PREVSE TIME WITH THE CURENT
                              JE   TIME_AGAIN


                              MOV  PREV_TIME, DL
    ;   CALL CLEARING_SCREEN           ;TO CLEAR THE SCREEN


                              CMP  IsPowerUp,0                        ; CHECK IF THERE IS A POWERUP
                              JE   CHWCK_POWERDOWN
                              CMP  IsPowerUp_pre,0                    ; CHECK IF THERE IS A POWERUP
                              JE   CHECK_PRE_UP
                              CALL Clear_PowerUp
                              CALL Clear_UP_ARROW
                              CALL Move_Power_UP
                              CALL Draw_PowerUp
                              CALL DRAW_UP_ARROW
                              JMP  CHWCK_POWERDOWN

    CHECK_PRE_UP:             
                              CALL Clear_PowerUp
                              CALL Clear_UP_ARROW
                              MOV  IsPowerUp,0


    CHWCK_POWERDOWN:          
                              CMP  IsPowerDown,0              ; CHECK IF THERE IS A POWERDOWN
                              JE   CONT
                              CMP  IsPowerDown_pre,0          ; CHECK IF THERE IS A POWERD   OWN
                              JE   CHECK_PRE_DOWN
                              CALL Clear_PowerDown
                              CALL Clear_DOWN_ARROW
                              CALL Move_Power_Down
                              CALL Draw_PowerDown
                              CALL DRAW_DOWN_ARROW
                              JMP  CONT

    CHECK_PRE_DOWN:           
                              CALL Clear_PowerDown
                              CALL Clear_DOWN_ARROW
                              MOV  IsPowerDown,0


    CONT:                     
    ;CALL CLEARING_SCREEN           ;TO CLEAR THE SCREEN
                              CALL DRAW_ALL_BRICKS            ;DRAW ALL BRICKS ACCORDING TO CONFIGS
                              MOV  BALL_COLOR, 00H
                              CALL DRAWING_BALL
                              MOV  BALL_COLOR, 0FH
                              CALL DISPLAY_STATS              ;DISPLAY STATS
                              CALL DRAW_WHITE_LINE            ;DRAW WHITE LINE TO SEPARATE THE STATS FROM THE GAME
                              CALL clear_Paddle
                              CALL Move_Paddle
                              CALL Draw_Paddle
                              CALL MOVING_BALL
                              CALL DRAWING_BALL               ;DRAWING BALL
                              CALL HANDLE_COLLISION           ;HANDLE COLLISIONS WITH BRICK


    ;    CALL Duplicate_Paddle_Velocity    ;Power up
    ;    CALL Halv_Paddle_Velocity         ;Power down
    ;    CALL Duplicate_Paddle_Size        ;Power up
    ;    CALL Halv_Paddle_Size             ;Power down

                              JMP  TIME_AGAIN



                              RET
MAIN ENDP



CLEARING_SCREEN PROC

                              MOV  AH, 06H                    ;SCROLL UP
                              XOR  AL, AL                     ;CLEAR ENTIRE SCREEN
                              XOR  CX, CX                     ;CH = ROW, CL = COLUMN (FROM UPPER LEFT CORNER)
                              MOV  DX, 184FH                  ;DH = ROW, DL = COLUMN (TO LOWER RIGHT CORNER)
                              MOV  BH, 00H                    ;BLACK COLOR
                              INT  10H                        ;CLEAR THE SCREEN


                              RET
CLEARING_SCREEN ENDP

DRAW_WELCOME_ARROW PROC


                              MOV  AH, 02H                    ;SET CURSOR POSITION
                              MOV  BH, 00                     ;PAGE NUMBER
                              MOV  DH, ARROW_ROW              ;ROW
                              MOV  DL, 10H                    ;COLUMN
                              INT  10H                        ;EXECUTE

                              MOV  AH, 09H
                              MOV  BH, 00
                              MOV  BL, ARROW_COLOR
                              MOV  CX, 1
                              MOV  AL, WELCOME_ARROW
                              INT  10h


                              RET
DRAW_WELCOME_ARROW ENDP


MOVE_WELCOME_ARROW PROC


    MOVE:                     
                              MOV  AH, 00
                              INT  16H                        ; GET KEY PRESSED

                              CMP  AH, 48H                    ; IF UP
                              JE   UP_PRESS

                              CMP  AH, 50H                    ; IF DOWN
                              JE   DOWN_PRESS

                              CMP  AH, 0DH                    ; IF ENTER
                              RET



    UP_PRESS:                 
                              DEC  SELECTOR
                              MOV  AL, 1
                              CMP  SELECTOR, AL
                              JAE  UP_ARROW

                              INC  SELECTOR
                              JMP  MOVE

    UP_ARROW:                 
    ;IF SELECTOR IS 0   ===> 09
                              MOV  AL, 1
                              CMP  SELECTOR, AL
                              JE   FIRST_ROW                  ; CLEAR SECOND AND DRAW FIRST
                              MOV  AL, 2
                              CMP  SELECTOR, AL
                              JE   SECOND_ROW                 ; CLEAR THIRD AND DRAW SECOND

    FIRST_ROW:                
                              MOV  AL, 00                     ; COLOR BLACK TO THE ARROW IN SECOND ROW
                              MOV  ARROW_COLOR, AL
                              MOV  AL, 0CH
                              MOV  ARROW_ROW, AL              ; THE SECOND ROW
                              CALL DRAW_WELCOME_ARROW

                              MOV  AL, 09                     ; COLOR BLUE TO THE ARROW IN FIRST ROW
                              MOV  ARROW_COLOR, AL
                              MOV  AL, 09H
                              MOV  ARROW_ROW, AL              ; THE FIRST ROW
                              CALL DRAW_WELCOME_ARROW
                              JMP  MOVE


    SECOND_ROW:               
                              MOV  AL, 00                     ; COLOR BLACK TO THE ARROW IN SECOND ROW
                              MOV  ARROW_COLOR, AL
                              MOV  AL, 0FH
                              MOV  ARROW_ROW, AL              ; THE SECOND ROW
                              CALL DRAW_WELCOME_ARROW

                              MOV  AL, 09                     ; COLOR BLUE TO THE ARROW IN FIRST ROW
                              MOV  ARROW_COLOR, AL
                              MOV  AL, 0CH
                              MOV  ARROW_ROW, AL              ; THE FIRST ROW
                              CALL DRAW_WELCOME_ARROW
                              JMP  MOVE

    DOWN_PRESS:               

                              INC  SELECTOR
                              MOV  AL, 3
                              CMP  SELECTOR, AL
                              JBE  DOWN_ARROW


                              DEC  SELECTOR
                              JMP  MOVE

    DOWN_ARROW:               
    ; IF SELECTOR == 2 MOVE TO THIRD ROW AND CLEAR THE SECOND
                              MOV  AL, 3
                              CMP  SELECTOR, AL
                              JE   DOWN_THIRD_ROW             ;JUMP TO THERID AND CLEAR THE SECOND

                              MOV  AL, 2
                              CMP  SELECTOR, AL
                              JE   DOWN_SECOND_ROW            ;JUMP TO SECOND AND CLEAR FIRST


    DOWN_SECOND_ROW:          
                              MOV  AL, 09H
                              MOV  ARROW_ROW, AL              ; THE FIRST ROW
                              MOV  AL, 00H
                              MOV  ARROW_COLOR, AL            ; THE BLACK COLOR
                              CALL DRAW_WELCOME_ARROW         ; CLEAR FIRST ROW

                              MOV  AL, 0CH
                              MOV  ARROW_ROW, AL              ; THE SECOND ROW
                              MOV  AL, 09H
                              MOV  ARROW_COLOR, AL            ; THE BLUE COLOR
                              CALL DRAW_WELCOME_ARROW         ; MOVE TO SECOND ROW
                              JMP  MOVE

    DOWN_THIRD_ROW:           
                              MOV  AL, 0CH
                              MOV  ARROW_ROW, AL              ; THE SECOND ROW
                              MOV  AL, 00H
                              MOV  ARROW_COLOR, AL            ; THE BLACK COLOR
                              CALL DRAW_WELCOME_ARROW         ; CLEAR SECOND ROW

                              MOV  AL, 0FH
                              MOV  ARROW_ROW, AL              ; THE THERID ROW
                              MOV  AL, 09H
                              MOV  ARROW_COLOR, AL            ; THE BLUE COLOR
                              CALL DRAW_WELCOME_ARROW         ; MOVE TO THIRD ROW
                              JMP  MOVE



                              RET
MOVE_WELCOME_ARROW ENDP

DRAW_WELCOME_SCREEN PROC

    ; PRINT WELCOME

                              MOV  AH, 02H                    ;SET CURSOR POSITION
                              MOV  BH, 00                     ;PAGE NUMBER
                              MOV  DH, 04                     ;ROW
                              MOV  DL, 05                     ;COLUMN
                              INT  10H                        ;EXECUTE


                              LEA  SI, WELCOME                ; Load string address into SI

    PRINT_WELCOME:            MOV  AH, 09H
                              MOV  BL, 09H
                              MOV  AL, BYTE PTR [SI]          ; Load character
                              CMP  AL, '$'                    ; Check for end of string
                              JE   PRINT1                     ; If '$', exit loop
                              MOV  CX, 1                      ; NO OF CHARACTERS
                              INT  10H                        ; EXECUTE
                              INC  SI                         ; Move to next character

                              INC  DL
                              MOV  BH, 00
                              MOV  DH, 04
                              MOV  AH, 02H
                              INT  10H
                              JMP  PRINT_WELCOME              ; Repeat for next character


    ;PRINT GO TO CHAT

    PRINT1:                   


                              CALL DRAW_WELCOME_ARROW


                              MOV  AH, 02H                    ;SET CURSOR POSITION
                              MOV  BH, 00                     ;PAGE NUMBER
                              MOV  DH, 09                     ;ROW
                              MOV  DL, 12H                    ;COLUMN
                              INT  10H                        ;EXECUTE
                              LEA  SI, WELCOME_OPTION_PLAY

    PRINT_PLAY:               MOV  AH, 09H
                              MOV  BL, 0FH
                              MOV  AL, BYTE PTR [SI]          ; Load character
                              CMP  AL, '$'                    ; Check for end of string
                              JE   PRINT2                     ; If '$', exit loop
                              MOV  CX, 1                      ; NO OF CHARACTERS
                              INT  10H                        ; EXECUTE
                              INC  SI                         ; Move to next character

                              INC  DL                         ;INC CURSOR POSITION
                              MOV  BH, 00
                              MOV  DH, 09
                              MOV  AH, 02H
                              INT  10H
                              JMP  PRINT_PLAY                 ; Repeat for next character


    PRINT2:                   

                              MOV  AH, 02H                    ;SET CURSOR POSITION
                              MOV  BH, 00                     ;PAGE NUMBER
                              MOV  DH, 0CH                    ;ROW
                              MOV  DL, 12H                    ;COLUMN
                              INT  10H                        ;EXECUTE
                              LEA  SI, WELCOME_OPTION_CHAT
   
    PRINT_CHAT:               MOV  AH, 09H
                              MOV  BL, 0FH
                              MOV  AL, BYTE PTR [SI]          ; Load character
                              CMP  AL, '$'                    ; Check for end of string
                              JE   PRINT4                     ; If '$', exit loop
                              MOV  CX, 1                      ; NO OF CHARACTERS
                              INT  10H                        ; EXECUTE
                              INC  SI                         ; Move to next character

                              INC  DL                         ;INC CURSOR POSITION
                              MOV  BH, 00
                              MOV  DH, 0CH
                              MOV  AH, 02H
                              INT  10H
                              JMP  PRINT_CHAT                 ; Repeat for next character


    PRINT4:                   

                              MOV  AH, 02H                    ;SET CURSOR POSITION
                              MOV  BH, 00                     ;PAGE NUMBER
                              MOV  DH, 0FH                    ;ROW
                              MOV  DL, 12H                    ;COLUMN
                              INT  10H                        ;EXECUTE
                              LEA  SI, WELCOME_EXIT
   
    PRINT_EXIT:               MOV  AH, 09H
                              MOV  BL, 0FH
                              MOV  AL, BYTE PTR [SI]          ; Load character
                              CMP  AL, '$'                    ; Check for end of string
                              JE   DORET                      ; If '$', exit loop
                              MOV  CX, 1                      ; NO OF CHARACTERS
                              INT  10H                        ; EXECUTE
                              INC  SI                         ; Move to next character

                              INC  DL                         ;INC CURSOR POSITION
                              MOV  BH, 00
                              MOV  DH, 0FH
                              MOV  AH, 02H
                              INT  10H
                              JMP  PRINT_EXIT                 ; Repeat for next character



    DORET:                    

                              MOV  AH, 01H
                              INT  16H                        ;CHECK FOR KEY PRESS
                              JNZ  MOVE_WA                    ; MOVE WELCOME ARROW

    MOVE_WA:                  
                              CALL MOVE_WELCOME_ARROW


                              RET
DRAW_WELCOME_SCREEN ENDP



MOVING_BALL PROC
                              PUSH AX
                              MOV  AX, BALL_SPEED_Y
                              SUB  BALL_POSITION_Y, AX        ;MOVE THE BALL UP

                              CMP  BALL_POSITION_Y, 15        ;CHECK IF Y < 15 (THE HIGHT OF THE WINDOW)
                              JL   REVERSE_Y                  ;IF Y < 15 REVERSE THE DIRECTION OF MOVING

                              MOV  AX, MAX_HIGHT
                              SUB  AX, BALL_SIZE
                              SUB  AX, BALL_SIZE
                              CMP  BALL_POSITION_Y, AX        ;CHECK IF Y > MAX HIGHT
                              JG   HANDEL_LOSE_LIFE           ;IF Y > MAX HIGHT - BALL SIZE REVERSE THE DIRECTION TOO
                              

                              MOV  AX, BALL_SPEED_X
                              ADD  BALL_POSITION_X, AX        ;MOV RIGHT

                              MOV  AX, BALL_POSITION_X
                              CMP  AX, 6                      ;CHECK IF X < 6
                              JL   REVERSE_X                  ;IF X < 0 REVERSE THE DIRECTION

                              MOV  AX, MAX_WIDTH
                              SUB  AX, BALL_SIZE
                              SUB  AX, BALL_SIZE
                              CMP  BALL_POSITION_X, AX        ;CHECK IF x > MAX WIDTH - BALL SIZE
                              JG   REVERSE_X                  ;REVERSE IF GREATER


    ;;;;;;;;;;;;;;;; Check Ball-Paddle collision

                              MOV  AX,Paddle_X
                              SUB  AX, BALL_SIZE
                              ADD  AX,BALL_SPEED_X
                              CMP  BALL_POSITION_X,AX         ;; Check x -->Start
                              JB   NOT_COLLIDE

                              ADD  AX,width_Paddle
                              SUB  AX, BALL_SIZE
                              ADD  AX,BALL_SPEED_X
                              CMP  BALL_POSITION_X,AX         ;; Check x -->End
                              JG   NOT_COLLIDE

    CHECK_Y:                  

                              MOV  AX, Paddle_Y
                              SUB  AX, BALL_SIZE
                              ADD  AX,BALL_SPEED_Y
                              CMP  BALL_POSITION_Y, AX        ;CHECK IF Y > MAX HIGHT
                              JGE  REVERSE_Y

    NOT_COLLIDE:              
    ;;;;;;;;;;;;;;;;


    RT:                       POP  AX
                              RET

    REVERSE_Y:                NEG  BALL_SPEED_Y
                              POP  AX                         ;REVERSE THE DIRECTION OF SPEED IN Y
                              RET

    REVERSE_X:                NEG  BALL_SPEED_X               ;REVERSE THE DIRECTION OF SPEED IN Y
                              POP  AX
                              RET
    HANDEL_LOSE_LIFE:         CALL Lose_Life
                              jmp  REVERSE_Y
                              RET
MOVING_BALL ENDP



HANDLE_COLLISION PROC
    ;WHEN COLLIDE WITH THE UPPER FACE OF BRICK
                              MOV  AX,BALL_POSITION_Y
                              ADD  AX,BALL_SIZE
                              MOV  BX,320
                              MUL  BX
                              ADD  AX,BALL_POSITION_X                 ;AX=ROWS*320+COLS
                              MOV  SI,AX
                              MOV  DL,BALL_COLOR
                              CMP  ES:[SI],DL                         ; CHECK IF SI IS COLORED AS SAME AS THE BALL (INSIDE THE BALL)
                              JZ   X1
                              CMP  ES:[SI], BYTE PTR  0               ; CHECK IF COLIDED WITH DIFFERENT COLOR THAN BLACK OR BALL_COLOR (COLLISION WITH BRICK)
                              JNZ  .REVERSE_Y

    ;WHEN COLLIDE WITH THE LOWER FACE OF BRICK
    X1:                       MOV  AX,BALL_POSITION_Y
                              SUB  AX,BALL_SIZE
                              MOV  BX,320
                              MUL  BX
                              ADD  AX,BALL_POSITION_X
                              MOV  SI,AX
                              MOV  DL,BALL_COLOR
                              CMP  ES:[SI],DL                         ; CHECK IF SI IS COLORED AS SAME AS THE BALL (INSIDE THE BALL)
                              JZ   X2
                              CMP  ES:[SI], BYTE PTR  0               ; CHECK IF COLIDED WITH DIFFERENT COLOR THAN BLACK OR BALL_COLOR (COLLISION WITH BRICK)
                              JA  .REVERSE_Y

    ;WHEN COLLIDE WITH THE LOWER FACE OF BRICK
    X2:                       MOV  AX,BALL_POSITION_Y
                              MOV  BX,320
                              MUL  BX
                              ADD  AX,BALL_POSITION_X
                              ADD  AX,BALL_SIZE
                              MOV  SI,AX
                              MOV  DL,BALL_COLOR
                              CMP  ES:[SI],DL                         ; CHECK IF SI IS COLORED AS SAME AS THE BALL (INSIDE THE BALL)
                              JZ   X3
                              CMP  ES:[SI], BYTE PTR  0               ; CHECK IF COLIDED WITH DIFFERENT COLOR THAN BLACK OR BALL_COLOR (COLLISION WITH BRICK)
                              JA  .REVERSE_Y
    X3:                       MOV  AX,BALL_POSITION_Y
                              MOV  BX,320
                              MUL  BX
                              ADD  AX,BALL_POSITION_X
                              SUB  AX,BALL_SIZE
                              MOV  SI,AX
                              MOV  DL,BALL_COLOR
                              CMP  ES:[SI],DL                         ; CHECK IF SI IS COLORED AS SAME AS THE BALL (INSIDE THE BALL)
                              JZ   .RT
                              CMP  ES:[SI], BYTE PTR  0               ; CHECK IF COLIDED WITH DIFFERENT COLOR THAN BLACK OR BALL_COLOR (COLLISION WITH BRICK)
                              JA  .REVERSE_Y

.RT: RET

.REVERSE_Y:
                              NEG  BALL_SPEED_Y                       ;REVERSE THE DIRECTION OF SPEED IN Y
                              CALL DESTROY_BRICK                      ;DESTROY THE BRICK I COLLIDED WITH
                              RET
HANDLE_COLLISION ENDP

DESTROY_BRICK PROC
                              PUSH AX
                              PUSH BX
                              PUSH DX
                              PUSH CX
                              PUSH DI
    ;;;;;;;;;;;;;;;;;;;MATHEMATICAL OPERATIONS TO DETERMINE WHICH BRICK I COLIDED WITH;;;;;;;;;;;;;;;;;;;
                              MOV  DX,0
                              MOV  AX,SI
                              MOV  BX,320
                              DIV  BX                                 ;AX=>NUMBER OF ROWS     ;DX=>MODULS<320
    ;;;;;;;;;;;;;;;;;;

                              PUSH AX
                              INC  Points

                              MOV  SAVEBRICKSPOS_X,DX
                              MOV  SAVEBRICKSPOS_Y,AX

                              
    CNT:                      
                              POP  AX
    ;;;;;;;;;;;;;;;;;;
                              MOV  CX,DX
                              MOV  DX,0
                              MOV  BX,STEP_PER_COL
                              SUB  AX,FIRST_ROW_POS
                              DIV  BX
                              MOV  BP,AX                              ;;;;;;;;;;;;;;;;;;;;;;;;;;BP IS THE ACTUAL ROW

                              MOV  DX,0
                              MOV  AX,CX
                              SUB  AX,FIRST_COL_POS
                              MOV  BX,STEP_PER_ROW
                              DIV  BX
                              MOV  CX,AX                              ;;;;;;;;;;;;;;;;;;;;;;;;;;;CX IS THE ACTUAL COL
                              MOV  AX,BP
                              MOV  BX,BRICKS_PER_ROW
                              MUL  BX
                              ADD  AX,CX
                              MOV  DI,AX                              ;;;;;;;;;;;;;;;;;;;;;;;;;;;DI IS THE ACTUAL BRICK

                             CMP  [COLOR_MATRIX+DI],POWERDOWN_CLR
                             JNZ  C1
                             mov  [COLOR_MATRIX+DI],1
                             CMP  IsPowerDown,1
                             JZ   C2
                             MOV  IsPowerDown,1
                             MOV  IsPowerDown_pre,1
                             MOV  DX, SAVEBRICKSPOS_X
                             MOV  AX, SAVEBRICKSPOS_Y
                             MOV  PowerDown_X,100D
                             MOV  PowerDown_Y,100D
                                CALL Draw_PowerDown
                                CALL DRAW_DOWN_ARROW
                                jmp  C2

      C1:                       
                             CMP  [COLOR_MATRIX+DI],POWERUP_CLR
                             JNZ  C2
                             mov  [COLOR_MATRIX+DI],1
                             CMP  IsPowerUp,1
                              JZ   C2
                              MOV  IsPowerUp,1
                              MOV  IsPowerUp_pre,1
                              MOV  DX, SAVEBRICKSPOS_X
                              MOV  AX, SAVEBRICKSPOS_Y
                               MOV  PowerUp_X,135D
                               MOV  PowerUp_Y,100D
                              CALL Draw_PowerUp
                              CALL DRAW_UP_ARROW
                              

    C2:                       DEC  [COLOR_MATRIX+DI]
                              cmp  [COLOR_MATRIX+DI],0
                              JNZ  Continue
                              INC  SCORE
    Continue:                 POP  DI
                              POP  CX
                              POP  DX
                              POP  BX
                              POP  AX
                              RET
DESTROY_BRICK ENDP




DRAWING_BALL PROC

                    
                              MOV  CX, BALL_POSITION_X        ;SET THE COLUMN POSITION OF THE PIXEL
                              MOV  DX, BALL_POSITION_Y        ;SET THE ROW POSITION OF THE PIXEL
                              MOV  AL, BALL_COLOR             ;COLOR OF THE PIXEL IS RED
                              MOV  AH, 0CH                    ;DRAW PIXEL COMMMAND
    DRAW_HORIZONTAL:          INT  10H
                              INC  CX                         ;INCREMENT THE SIZE IN X DIRECTION
                              MOV  BX, CX                     ;TO PRESERVE THE VALUE IN THE CX
                              SUB  BX, BALL_POSITION_X        ;GET THE DIFFERENCE
                              CMP  BX, BALL_SIZE              ;CMPARE THE DIFFERENCE WITH THE BALL SIZE
                              JL   DRAW_HORIZONTAL


                              INC  DX                         ;INCREMENT THE SIZE IN THE Y DIRECTION
                              MOV  CX, BALL_POSITION_X        ;SET THE X DIRECTION AGAIN
                              MOV  BX, DX
                              SUB  BX, BALL_POSITION_Y        ;GET THE DIFFERENCE
                              CMP  BX, BALL_SIZE
                              JL   DRAW_HORIZONTAL            ;IF THE SIZE IN THE Y DIRECTION NOT COMPLETED WILL GO AGAIN TO DRAW IN THE X DIRECTION
                              RET                             ;ELSE WILL RETURN

DRAWING_BALL ENDP

DRAW_ALL_BRICKS PROC
                              MOV  CRNT_BRICK,0               ;INITIALIZE THE BIRCKS COUNTER
                              MOV  CX,0                       ;INITIALIZE THE COLUMNS COUNTER
                              MOV  DX,0                       ;INITIALIZE THE ROWS COUNTER
    DRAWIT:                   
                              CALL DRAWBRICK
                              ADD  COL,STEP_PER_ROW
                              INC  CRNT_BRICK
                              INC  CX
                              CMP  CX,BRICKS_PER_ROW
                              JL   DRAWIT                     ;(IF CX >= BRICKS_PER_ROW ) BREAK
                              MOV  CX,0                       ;REINITIALIZE THE COLUMNS COUNTER
                              INC  DX
                              MOV  COL,FIRST_COL_POS          ;MOVE TO THE NEXT POSITION TO DRAW THE NEXT BRICK (MOVE TO THE NEXT ROW)
                              ADD  ROW,STEP_PER_COL
                              CMP  DX,TOTAL_ROWS
                              JL   DRAWIT                     ;(IF DX >= BRICKS_PER_COL ) BREAK
                              MOV  ROW,FIRST_ROW_POS          ;RESET ROWS & COL TO ITS INITIAL POSITION
                              MOV  COL,FIRST_COL_POS
                              RET
DRAW_ALL_BRICKS ENDP



DRAWBRICK PROC
                              push DX
                              push CX
                              PUSH AX
                              PUSH BX
                              mov  ax,ROW                     ;==>column number
                              mov  bx,320                     ;bx=320
                              mul  bx                         ;ax=ax*bx
                              add  ax,COL                     ;ax==>in now target pixel to draw
                              MOV  SI,AX                      ; CALC THE POSITION OF THE FIRST PIXEL IN THE VIDEO MEMORY
                              MOV  DI,CRNT_BRICK
                              mov  bl,[COLOR_MATRIX+DI]       ;STORE THE COLOR OF THE CRNT BRICK
                              mov  cx,0                       ;INITIALIZE COLUMNS COUNTER (COUNTER FOR NUMBER OF PIXELS PER ROW PRE BRICK)
                              mov  dx,0                       ;INITIALIZE ROWS COUNTER (COUNTER FOR NUMBER OF ROWS PRE BRICK)
    draw:                     mov  es:[si],bl                 ;COLOR THIS PIXEL
                              inc  si                         ;GO RIGHT
                              inc  CX
                              cmp  cx,BRICK_WIDTH
                              jl   draw                       ;(IF CX >= BRICKS_WIDTH ) BREAK
                              add  si,320                     ;GO DOWN (GO TO THE NEXT ROW)
                              sub  si, BRICK_WIDTH            ;GO TO BACK TO THE START OF THE BRICK
                              INC  DX
                              MOV  CX,0                       ;RESET COLUMNS COUNTER
                              CMP  DX,BRICK_HEIGHT
                              jl   draw                       ;(IF DX >= BRICK_HEIGHT ) BREAK
                              POP  BX
                              POP  AX
                              pop  CX
                              pop  DX
                              ret
DRAWBRICK ENDP

Move_Paddle PROC
                              push DX
                              push CX
                              PUSH AX
                              PUSH BX

                              MOV  AH, 01h                    ; Function to check if a key is pressed
                              INT  16h                        ; Call BIOS interrupt
                              JZ   NoKey                      ; Jump if no key is pressed (ZF = 1)
    ; Code to handle key press
                              JMP  Done

    NoKey:                    
                              JMP  rett

    Done:                     

    ; Read the key
                              MOV  AH, 00h
                              INT  16h
           
    ; Check for left arrow (E0 4B)
                              CMP  AH, 4Bh                    ; Compare scancode (AL contains scancode without E0 prefix)
                              JE   left_pressed               ; Jump if Left Arrow
                  
    ; Check for right arrow (E0 4D)
                              CMP  AH, 4Dh                    ; Compare scancode (AL contains scancode without E0 prefix)
                              JE   right_pressed              ; Jump if Right Arrow
                   
                              JMP  rett                       ; Return to polling
                        
    left_pressed:             
                   
    ; Check for the boundries
                              MOV  BX,Paddle_Speed
                              SUB  Paddle_X,BX
                              MOV  AX,RightBoundry
                              CMP  Paddle_X,AX
                              JB   Maintain_Right_Boundry
                              JMP  rett                       ; Return to polling
                   
    right_pressed:            
                              MOV  BX,Paddle_Speed
                              ADD  Paddle_X,BX
                              MOV  AX,LeftBoundry
                              CMP  Paddle_X,AX
                              JA   Maintain_Left_Boundry
                              JMP  rett                       ; Return to polling
     
     	                 
    Maintain_Right_Boundry:   
                              MOV  AX,RightBoundry
                              MOV  Paddle_X,AX
                              JMP  rett
	                   
    Maintain_Left_Boundry:    
                              MOV  AX,LeftBoundry
                              MOV  Paddle_X,AX
                              JMP  rett


    rett:                     
                              POP  BX
                              POP  AX
                              pop  CX
                              pop  DX
                              RET

Move_Paddle endp
    
    
                  
           
clear_Paddle PROC
                              push DX
                              push CX
                              PUSH AX
                              PUSH BX
               

    ; the coordinates of the paddle
	                 
                              MOV  CX,Paddle_X
                              MOV  DX,Paddle_Y
	                 	                 
		
    clear_Paddle_hori:        
                              MOV  BX,width_Paddle
	                 
 	
    clear_Paddle_ver:         
    ; AL = Color, BH = Page Number, CX = x, DX = y
                              MOV  AH,0CH
                              MOV  AL,00
                              PUSH BX
                              MOV  BH,00
                              INT  10h
                              INC  CX
                              POP  BX
                              DEC  BL
                              JNZ  clear_Paddle_ver
                              MOV  CX,Paddle_X
                              INC  DX
                              CMP  DX,199
                              JNZ  clear_Paddle_hori
	    
                              POP  BX
                              POP  AX
                              pop  CX
                              pop  DX
                           
                              RET
clear_Paddle endp

Draw_Paddle PROC
                              push DX
                              push CX
                              PUSH AX
                              PUSH BX
               

    ; the coordinates of the paddle
	                 
                              MOV  CX,Paddle_X
                              MOV  DX,Paddle_Y
	                 	                 
		
    draw_Paddle_hori:         
                              MOV  BX,width_Paddle
	                 
 	
    draw_Paddle_ver:          
    ; AL = Color, BH = Page Number, CX = x, DX = y
                              MOV  AH,0CH
                              MOV  AL,Paddle_Color
                              PUSH BX
                              MOV  BH,00
                              INT  10h
                              INC  CX
                              POP  BX
                              DEC  BL
                              JNZ  draw_Paddle_ver
                              MOV  CX,Paddle_X
                              INC  DX
                              CMP  DX,199
                              JNZ  draw_Paddle_hori
	    
                              POP  BX
                              POP  AX
                              pop  CX
                              pop  DX
                           
                              RET
Draw_Paddle endp




    ;;;;;;;;;;;; PowerUp's & Down's
Duplicate_Paddle_Velocity PROC
                              PUSH AX
                              MOV  AX,Paddle_Speed
                              ADD  Paddle_Speed,AX
                              POP  AX
                              RET
Duplicate_Paddle_Velocity endp

Halv_Paddle_Velocity PROC
                              PUSH AX
                              MOV  AX,Paddle_Speed
                              SHR  AX,1
                              MOV  Paddle_Speed,AX
                              POP  AX
                              RET
Halv_Paddle_Velocity endp

Duplicate_Paddle_Size PROC
                              PUSH AX
                              MOV  AX,width_Paddle
                              ADD  width_Paddle,AX
                              MOV  Paddle_X,160D
                              SUB  Paddle_X,AX
                              POP  AX
                              RET
Duplicate_Paddle_Size endp

    ; Halv_Paddle_Size PROC
    ;                               PUSH AX
    ;                               MOV  AX,width_Paddle
    ;                               SHR  AX,1
    ;                               MOV  width_Paddle,AX
    ;                               SHR  AX,1
    ;                               MOV  Paddle_X,160-AX
    ;                               POP  AX
    ;                               RET
    ; Halv_Paddle_Size endp

    ;;;;;;;;;;;;;;;;;;;

    ;;;;;;
Move_Power_UP PROC
    
                              PUSH AX
    ;;;;;;;;;;;;;;;; Check PowerUP-Paddle collision


                              MOV  AX,Paddle_Y
                              SUB  AX, PowerUpHeight          ; check for y-axis
                              CMP  PowerUp_Y,AX
                              JB   StillAbove

                              MOV  AX,Paddle_X                ; check for x-axis
                              CMP  PowerUp_X,AX
                              JB   NOT_COLLIDE_POWERUP
                              ADD  AX,width_Paddle
                              CMP  PowerUp_X,AX
                              JBE  COLLIDE_POWERUP
                              JMP  NOT_COLLIDE_POWERUP


    StillAbove:                                               ; the powerUp is above the paddle
                              MOV  AX,PowerUp_Speed
                              ADD  PowerUp_Y,AX
                              POP  AX
                              RET

    NOT_COLLIDE_POWERUP:      
                              MOV  IsPowerUp_pre,0
                              POP  AX
                              RET
    COLLIDE_POWERUP:          
                              MOV  IsPowerUp_pre,0
                              CALL Duplicate_Paddle_Size      ;Power up
                              POP  AX
                              RET

Move_Power_UP endp

Move_Power_Down PROC
    
                              PUSH AX
    ;;;;;;;;;;;;;;;; Check PowerDOWN-Paddle collision


                              MOV  AX,Paddle_Y
                              SUB  AX, PowerDownHeight        ; check for y-axis
                              CMP  PowerDown_Y,AX
                              JB   StillAbove_Down

                              MOV  AX,Paddle_X                ; check for x-axis
                              CMP  PowerDown_X,AX
                              JB   NOT_COLLIDE_POWERDOWN
                              ADD  AX,width_Paddle
                              CMP  PowerDown_X,AX
                              JBE  COLLIDE_POWERDOWN
                              JMP  NOT_COLLIDE_POWERDOWN


    StillAbove_Down:                                          ; the powerDown is above the paddle
                              MOV  AX,PowerDown_Speed
                              ADD  PowerDown_Y,AX
                              POP  AX
                              RET

    NOT_COLLIDE_POWERDOWN:    
                              MOV  IsPowerDown_pre,0
                              POP  AX
                              RET
    COLLIDE_POWERDOWN:        
                              MOV  IsPowerDown_pre,0
                              CALL Duplicate_Paddle_Size      ;Power up
                              POP  AX
                              RET

Move_Power_Down endp
    ;;;;;;;

    
Clear_PowerUp PROC
    
                              push DX
                              push CX
                              PUSH AX
                              PUSH BX


                              MOV  CX,PowerUp_X
                              MOV  DX,PowerUp_Y
    
    ClearUP_hori:             
                              MOV  BX,PowerUpWidth
	                      
 	
    ClearUP_ver:              
    ; AL = Color, BH = Page Number, CX = x, DX = y
                              MOV  AH,0CH
                              MOV  AL,00H                     ; Green Shape
                              PUSH BX
                              MOV  BH,00
                              INT  10h
                              INC  CX
                              POP  BX
                              DEC  BX
                              JNZ  ClearUP_ver
                              MOV  CX,PowerUp_X
                              INC  DX
                              MOV  AX,PowerUp_Y
                              ADD  AX,PowerUpHeight
                              CMP  DX,AX
                              JNZ  ClearUP_hori

                              POP  BX
                              POP  AX
                              pop  CX
                              pop  DX

                              RET
Clear_PowerUp ENDP



Draw_PowerUp PROC
    
                              push DX
                              push CX
                              PUSH AX
                              PUSH BX


                              MOV  CX,PowerUp_X
                              MOV  DX,PowerUp_Y
    
    drawUP_hori:              
                              MOV  BX,PowerUpWidth
	                      
 	
    drawUP_ver:               
    ; AL = Color, BH = Page Number, CX = x, DX = y
                              MOV  AH,0CH
                              MOV  AL,02H                     ; Green Shape
                              PUSH BX
                              MOV  BH,00
                              INT  10h
                              INC  CX
                              POP  BX
                              DEC  BX
                              JNZ  drawUP_ver
                              MOV  CX,PowerUp_X
                              INC  DX
                              MOV  AX,PowerUp_Y
                              ADD  AX,PowerUpHeight
                              CMP  DX,AX
                              JNZ  drawUP_hori

                              POP  BX
                              POP  AX
                              pop  CX
                              pop  DX

                              RET
Draw_PowerUp ENDP

    
Clear_PowerDown PROC
                              push DX
                              push CX
                              PUSH AX
                              PUSH BX


                              MOV  CX,PowerDown_X
                              MOV  DX,PowerDown_Y
    
    ClearDown_hori:           
                              MOV  BX,PowerDownWidth
	                      
 	
    ClearDown_ver:            
    ; AL = Color, BH = Page Number, CX = x, DX = y
                              MOV  AH,0CH
                              MOV  AL,00H                     ; Black Shape
                              PUSH BX
                              MOV  BH,00
                              INT  10h
                              INC  CX
                              POP  BX
                              DEC  BX
                              JNZ  ClearDown_ver
                              MOV  CX,PowerDown_X
                              INC  DX
                              MOV  AX,PowerDown_Y
                              ADD  AX,PowerDownHeight
                              CMP  DX,AX
                              JNZ  ClearDown_hori


                              POP  BX
                              POP  AX
                              pop  CX
                              pop  DX

                              RET
Clear_PowerDown ENDP


Draw_PowerDown PROC
                              push DX
                              push CX
                              PUSH AX
                              PUSH BX


                              MOV  CX,PowerDown_X
                              MOV  DX,PowerDown_Y
    
    drawDown_hori:            
                              MOV  BX,PowerDownWidth
	                      
 	
    drawDown_ver:             
    ; AL = Color, BH = Page Number, CX = x, DX = y
                              MOV  AH,0CH
                              MOV  AL,04H                     ; Red Shape
                              PUSH BX
                              MOV  BH,00
                              INT  10h
                              INC  CX
                              POP  BX
                              DEC  BX
                              JNZ  drawDown_ver
                              MOV  CX,PowerDown_X
                              INC  DX
                              MOV  AX,PowerDown_Y
                              ADD  AX,PowerDownHeight
                              CMP  DX,AX
                              JNZ  drawDown_hori


                              POP  BX
                              POP  AX
                              pop  CX
                              pop  DX

                              RET
Draw_PowerDown ENDP


Clear_UP_ARROW PROC
                              push DX
                              push CX
                              PUSH AX
                              PUSH BX
                              
                              MOV  CX,PowerUp_X               ; Set X position to the vertex of the arrow
                              MOV  DX,PowerUpWidth
                              SHR  DX,1
                              ADD  CX,DX
                              MOV  DX,PowerUp_Y               ; Set Y position to the vertex of the arrow
                              ADD  DX,2
    
    loopUp_Clear:                                             ; Clear the first line in the first arrow
    ; AL = Color, BH = Page Number, CX = x, DX = y
                              MOV  AH,0CH
                              MOV  AL,00H
                              MOV  BH,00
                              INT  10h
                              INC  CX
                              INC  DX
                              MOV  AX, PowerUp_Y
                              ADD  AX,PowerUpHeight
                              SUB  AX, 3
                              CMP  DX,AX
                              JB   loopUp_Clear
                            
                            
                            
                                    
                              MOV  CX,PowerUp_X               ; Set X position to the vertex of the arrow
                              MOV  DX,PowerUpWidth
                              SHR  DX,1
                              ADD  CX,DX
                              MOV  DX,PowerUp_Y               ; Set Y position to the vertex of the arrow
                              ADD  DX,2
    
    loopUpInv_Clear:                                          ; Clear the second line in the first arrow
    ; AL = Color, BH = Page Number, CX = x, DX = y
                              MOV  AH,0CH
                              MOV  AL,00H
                              MOV  BH,00
                              INT  10h
                              DEC  CX
                              INC  DX
                              MOV  AX, PowerUp_Y
                              ADD  AX,PowerUpHeight
                              SUB  AX, 3
                              CMP  DX,AX
                              JB   loopUpInv_Clear
                           
                           
                           
     
                              MOV  CX,PowerUp_X               ; Set X position to the vertex of the arrow
                              MOV  DX,PowerUpWidth
                              SHR  DX,1
                              ADD  CX,DX
                              MOV  DX,PowerUp_Y               ; Set  Y position to the vertex of the arrow
                              ADD  DX,4
    
    loopUp2_Clear:                                            ; Clear the first line in the second arrow
    ; AL = Color, BH = Page Number, CX = x, DX = y
                              MOV  AH,0CH
                              MOV  AL,00H
                              MOV  BH,00
                              INT  10h
                              INC  CX
                              INC  DX
                              MOV  AX, PowerUp_Y
                              ADD  AX,PowerUpHeight
                              SUB  AX, 5
                              CMP  DX,AX
                              JB   loopUp2_Clear
                            
                            
                            
   
                              MOV  CX,PowerUp_X               ; Set X position to the vertex of the arrow
                              MOV  DX,PowerUpWidth
                              SHR  DX,1
                              ADD  CX,DX
                              MOV  DX,PowerUp_Y               ; Set Y position to the vertex of the arrow
                              ADD  DX,4
    
    loopUpInv2_Clear:                                         ; Clear the second line in the second arrow
    ; AL = Color, BH = Page Number, CX = x, DX = y
                              MOV  AH,0CH
                              MOV  AL,00H
                              MOV  BH,00
                              INT  10h
                              DEC  CX
                              INC  DX
                              MOV  AX, PowerUp_Y
                              ADD  AX,PowerUpHeight
                              SUB  AX, 5
                              CMP  DX,AX
                              JB   loopUpInv2_Clear
                           
                              POP  BX
                              POP  AX
                              pop  CX
                              pop  DX
        
                              RET
Clear_UP_ARROW ENDP



DRAW_UP_ARROW PROC
                              push DX
                              push CX
                              PUSH AX
                              PUSH BX
                              
                              MOV  CX,PowerUp_X               ; Set X position to the vertex of the arrow
                              MOV  DX,PowerUpWidth
                              SHR  DX,1
                              ADD  CX,DX
                              MOV  DX,PowerUp_Y               ; Set Y position to the vertex of the arrow
                              ADD  DX,2
    
    loopUp_:                                                  ; Draw the first line in the first arrow
    ; AL = Color, BH = Page Number, CX = x, DX = y
                              MOV  AH,0CH
                              MOV  AL,0fH
                              MOV  BH,00
                              INT  10h
                              INC  CX
                              INC  DX
                              MOV  AX, PowerUp_Y
                              ADD  AX,PowerUpHeight
                              SUB  AX, 3
                              CMP  DX,AX
                              JB   loopUp_
                            
                            
                            
                                    
                              MOV  CX,PowerUp_X               ; Set X position to the vertex of the arrow
                              MOV  DX,PowerUpWidth
                              SHR  DX,1
                              ADD  CX,DX
                              MOV  DX,PowerUp_Y               ; Set Y position to the vertex of the arrow
                              ADD  DX,2
    
    loopUpInv_:                                               ; Draw the second line in the first arrow
    ; AL = Color, BH = Page Number, CX = x, DX = y
                              MOV  AH,0CH
                              MOV  AL,0fH
                              MOV  BH,00
                              INT  10h
                              DEC  CX
                              INC  DX
                              MOV  AX, PowerUp_Y
                              ADD  AX,PowerUpHeight
                              SUB  AX, 3
                              CMP  DX,AX
                              JB   loopUpInv_
                           
                           
                           
     
                              MOV  CX,PowerUp_X               ; Set X position to the vertex of the arrow
                              MOV  DX,PowerUpWidth
                              SHR  DX,1
                              ADD  CX,DX
                              MOV  DX,PowerUp_Y               ; Set  Y position to the vertex of the arrow
                              ADD  DX,4
    
    loopUp2_:                                                 ; Draw the first line in the second arrow
    ; AL = Color, BH = Page Number, CX = x, DX = y
                              MOV  AH,0CH
                              MOV  AL,0fH
                              MOV  BH,00
                              INT  10h
                              INC  CX
                              INC  DX
                              MOV  AX, PowerUp_Y
                              ADD  AX,PowerUpHeight
                              SUB  AX, 5
                              CMP  DX,AX
                              JB   loopUp2_
                            
                            
                            
   
                              MOV  CX,PowerUp_X               ; Set X position to the vertex of the arrow
                              MOV  DX,PowerUpWidth
                              SHR  DX,1
                              ADD  CX,DX
                              MOV  DX,PowerUp_Y               ; Set Y position to the vertex of the arrow
                              ADD  DX,4
    
    loopUpInv2_:                                              ; Draw the second line in the second arrow
    ; AL = Color, BH = Page Number, CX = x, DX = y
                              MOV  AH,0CH
                              MOV  AL,0fH
                              MOV  BH,00
                              INT  10h
                              DEC  CX
                              INC  DX
                              MOV  AX, PowerUp_Y
                              ADD  AX,PowerUpHeight
                              SUB  AX, 5
                              CMP  DX,AX
                              JB   loopUpInv2_
                           
                              POP  BX
                              POP  AX
                              pop  CX
                              pop  DX
        
                              RET
DRAW_UP_ARROW ENDP
  
 
Clear_DOWN_ARROW PROC
    
                              push DX
                              push CX
                              PUSH AX
                              PUSH BX
    
                              MOV  CX,PowerDown_X             ; Set X position to the vertex of the arrow
                              MOV  DX,PowerDownHeight
                              SHR  DX,1
                              ADD  CX,DX
                              MOV  DX,PowerDown_Y             ; Set Y position to the vertex of the arrow
                              MOV  AX,PowerDownHeight
                              SUB  AX,2
                              ADD  DX,AX
    
    loopDown_Clear:                                           ; Clear the first line in the first arrow
    ; AL = Color, BH = Page Number, CX = x, DX = y
                              MOV  AH,0CH
                              MOV  AL,00H
                              MOV  BH,00
                              INT  10h
                              INC  CX
                              DEC  DX
                              MOV  AX, PowerDown_Y
                              ADD  AX, 3
                              CMP  DX,AX
                              JG   loopDown_Clear
                            
                            
                            
                            
                            
                            
                              MOV  CX,PowerDown_X             ; Set X position to the vertex of the arrow
                              MOV  DX,PowerDownWidth
                              SHR  DX,1
                              ADD  CX,DX
                              MOV  DX,PowerDown_Y             ; Set Y position to the vertex of the arrow
                              MOV  AX,PowerDownHeight
                              SUB  AX,2
                              ADD  DX,AX
    
    loopDownInv_Clear:                                        ; Clear the second line in the first arrow
    ; AL = Color, BH = Page Number, CX = x, DX = y
                              MOV  AH,0CH
                              MOV  AL,00H
                              MOV  BH,00
                              INT  10h
                              DEC  CX
                              DEC  DX
                              MOV  AX, PowerDown_Y
                              ADD  AX, 3
                              CMP  DX,AX
                              JG   loopDownInv_Clear
                     
              
                 
                              MOV  CX,PowerDown_X             ; Set X position to the vertex of the arrow
                              MOV  DX,PowerDownWidth
                              SHR  DX,1
                              ADD  CX,DX
                              MOV  DX,PowerDown_Y             ; Set Y position to the vertex of the arrow
                              MOV  AX,PowerDownHeight
                              SUB  AX,4
                              ADD  DX,AX
                     
                           
                           
    loopDown2_Clear:                                          ; Clear the first line in the second arrow
    ; AL = Color, BH = Page Number, CX = x, DX = y
                              MOV  AH,0CH
                              MOV  AL,00H
                              MOV  BH,00
                              INT  10h
                              INC  CX
                              DEC  DX
                              MOV  AX, PowerDown_Y
                              ADD  AX, 4
                              CMP  DX,AX
                              JG   loopDown2_Clear
                            
                            
                              MOV  CX,PowerDown_X             ; Set X position to the vertex of the arrow
                              MOV  DX,PowerDownWidth
                              SHR  DX,1
                              ADD  CX,DX
                              MOV  DX,PowerDown_Y             ; Set Y position to the vertex of the arrow
                              MOV  AX,PowerDownHeight
                              SUB  AX,4
                              ADD  DX,AX
    
    loopDownInv2_Clear:                                       ; Clear the second line in the second arrow
    ; AL = Color, BH = Page Number, CX = x, DX = y
                              MOV  AH,0CH
                              MOV  AL,00H
                              MOV  BH,00
                              INT  10h
                              DEC  CX
                              DEC  DX
                              MOV  AX, PowerDown_Y
                              ADD  AX, 4
                              CMP  DX,AX
                              JG   loopDownInv2_Clear
                           
                              POP  BX
                              POP  AX
                              pop  CX
                              pop  DX

                              RET
       
Clear_DOWN_ARROW ENDP
 
 
DRAW_DOWN_ARROW PROC
    
                              push DX
                              push CX
                              PUSH AX
                              PUSH BX
    
                              MOV  CX,PowerDown_X             ; Set X position to the vertex of the arrow
                              MOV  DX,PowerDownHeight
                              SHR  DX,1
                              ADD  CX,DX
                              MOV  DX,PowerDown_Y             ; Set Y position to the vertex of the arrow
                              MOV  AX,PowerDownHeight
                              SUB  AX,2
                              ADD  DX,AX
    
    loopDown_:                                                ; Draw the first line in the first arrow
    ; AL = Color, BH = Page Number, CX = x, DX = y
                              MOV  AH,0CH
                              MOV  AL,0fH
                              MOV  BH,00
                              INT  10h
                              INC  CX
                              DEC  DX
                              MOV  AX, PowerDown_Y
                              ADD  AX, 3
                              CMP  DX,AX
                              JG   loopDown_
                            
                            
                            
                            
                            
                            
                              MOV  CX,PowerDown_X             ; Set X position to the vertex of the arrow
                              MOV  DX,PowerDownWidth
                              SHR  DX,1
                              ADD  CX,DX
                              MOV  DX,PowerDown_Y             ; Set Y position to the vertex of the arrow
                              MOV  AX,PowerDownHeight
                              SUB  AX,2
                              ADD  DX,AX
    
    loopDownInv_:                                             ; Draw the second line in the first arrow
    ; AL = Color, BH = Page Number, CX = x, DX = y
                              MOV  AH,0CH
                              MOV  AL,0fH
                              MOV  BH,00
                              INT  10h
                              DEC  CX
                              DEC  DX
                              MOV  AX, PowerDown_Y
                              ADD  AX, 3
                              CMP  DX,AX
                              JG   loopDownInv_
                     
              
                 
                              MOV  CX,PowerDown_X             ; Set X position to the vertex of the arrow
                              MOV  DX,PowerDownWidth
                              SHR  DX,1
                              ADD  CX,DX
                              MOV  DX,PowerDown_Y             ; Set Y position to the vertex of the arrow
                              MOV  AX,PowerDownHeight
                              SUB  AX,4
                              ADD  DX,AX
                     
                           
                           
    loopDown2_:                                               ; Draw the first line in the second arrow
    ; AL = Color, BH = Page Number, CX = x, DX = y
                              MOV  AH,0CH
                              MOV  AL,0fH
                              MOV  BH,00
                              INT  10h
                              INC  CX
                              DEC  DX
                              MOV  AX, PowerDown_Y
                              ADD  AX, 4
                              CMP  DX,AX
                              JG   loopDown2_
                            
                            
                              MOV  CX,PowerDown_X             ; Set X position to the vertex of the arrow
                              MOV  DX,PowerDownWidth
                              SHR  DX,1
                              ADD  CX,DX
                              MOV  DX,PowerDown_Y             ; Set Y position to the vertex of the arrow
                              MOV  AX,PowerDownHeight
                              SUB  AX,4
                              ADD  DX,AX
    
    loopDownInv2_:                                            ; Draw the second line in the second arrow
    ; AL = Color, BH = Page Number, CX = x, DX = y
                              MOV  AH,0CH
                              MOV  AL,0fH
                              MOV  BH,00
                              INT  10h
                              DEC  CX
                              DEC  DX
                              MOV  AX, PowerDown_Y
                              ADD  AX, 4
                              CMP  DX,AX
                              JG   loopDownInv2_
                           
                              POP  BX
                              POP  AX
                              pop  CX
                              pop  DX

                              RET
       
DRAW_DOWN_ARROW ENDP
 
DISPLAY_STATS PROC

                              push ax
                              push bx
                              push cx
                              push dx

    ;       Shows the score text
                              MOV  AH,02h                     ;set cursor position
                              MOV  BH,00h                     ;set page number
                              MOV  DH,0h                      ;set row
                              MOV  DL,1h                      ;set column
                              INT  10h

                              MOV  AH,09h                     ;WRITE STRING
                              LEA  DX, TEXT_SCORE             ;give DX a pointer
                              INT  21h                        ;print the string

                              MOV  AH,02h                     ;set cursor position
                              MOV  BH,00h                     ;set page number
                              MOV  DH,0h                      ;set row
                              MOV  DL,8h                      ;set column
                              INT  10h

    ;Display Score Value
                              MOV  AL, SCORE
                              MOV  AH,0
                              CALL PRINT_NUMBER

    ;       Shows the lives text
                              MOV  AH,02h                     ;set cursor position
                              MOV  BH,00h                     ;set page number
                              MOV  DH,0h                      ;set row
                              MOV  DL,20h                     ;set column
                              INT  10h
                            
                              MOV  AH,09h                     ;WRITE STRING
                              LEA  DX, TEXT_LIVES             ;give DX a pointer
                              INT  21h                        ;print the string

                              MOV  AH,02h                     ;set cursor position
                              MOV  BH,00h                     ;set page number
                              MOV  DH,0h                      ;set row
                              MOV  DL,27h                     ;set column
                              INT  10h

    ;Display Lives Value
                              MOV  AL, LIVES
                              MOV  AH,0
                              CALL PRINT_NUMBER



                              pop  dx
                              pop  cx
                              pop  bx
                              pop  ax
                              RET
DISPLAY_STATS ENDP

PRINT_NUMBER PROC
                              PUSH AX
                              PUSH BX
                              PUSH CX
                              PUSH DX

                              MOV  CX,0                       ; Clear CX (digit counter)
    CONVERT_LOOP:             
                              MOV  DX,0                       ; Clear DX (remainder)
                              MOV  BX, 10                     ; Base 10
                              DIV  BX                         ; Divide AX by 10
                              PUSH DX                         ; Push remainder (digit)
                              INC  CX                         ; Increment digit counter
                              ADD  AX, 0                      ; Check if quotient is 0
                              JNZ  CONVERT_LOOP               ; Repeat if not

    PRINT_DIGITS:             
                              POP  DX                         ; Get next digit
                              ADD  DL, '0'                    ; Convert to ASCII
                              MOV  AH, 02h                    ; Function to print character
                              INT  21h                        ; Print digit
                              LOOP PRINT_DIGITS               ; Repeat for all digits

                              POP  DX
                              POP  CX
                              POP  BX
                              POP  AX
                              RET
PRINT_NUMBER ENDP

DRAW_WHITE_LINE PROC
                              push AX
                              push BX
                              push CX
                              push DX

    ; Draw a horizontal white line
                              MOV  CX, 320                    ; Number of pixels in a row
                              MOV  DX, 10                     ; Row position (y-coordinate)
                              MOV  AL, 15                     ; Color (white)
                              MOV  AH, 0Ch                    ; Function to write pixel

    DRAW_LINE_LOOP:           
                              MOV  BX, CX                     ; Set column position (x-coordinate)
                              INT  10h                        ; Draw pixel
                              DEC  CX
                              JNZ  DRAW_LINE_LOOP

                              pop  DX
                              pop  CX
                              pop  BX
                              pop  AX
                              RET
DRAW_WHITE_LINE ENDP
Lose_Life PROC
                              CMP  LIVES,0
                              JNE  DEC_LIVES
                              RET
    DEC_LIVES:                
                            ;   DEC  LIVES
                              CALL RESET_GAME
                              RET
Lose_Life ENDP
RESET_GAME PROC
    MOV BALL_POSITION_X  ,      160D                                 
    MOV BALL_POSITION_Y  ,      190D   
    MOV BALL_SPEED_Y     ,       5H                                      ;THE SPEED OF THE BALL IN Y DIRECTION
    MOV BALL_SPEED_X      ,      2H
    MOV width_Paddle     ,      50d
    MOV height_Paddle    ,      4d
    MOV Paddle_Speed     ,      6
    CALL clear_Paddle
    MOV Paddle_X         ,      135D
    MOV Paddle_Y         ,      196D
    CALL Draw_Paddle

    ;RESET_CLR_MATRIX
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    MOV DI,0
    RESET_CLR_MTRX:
    MOV AL,[GNCLR_MATRIX+DI]
    MOV [COLOR_MATRIX+DI],AL
    INC DI
    CMP DI,33
    JNZ RESET_CLR_MTRX
    DEC LIVES
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   RET
RESET_GAME ENDP

end main
