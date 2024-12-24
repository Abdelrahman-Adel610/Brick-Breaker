.MODEL SMALL
.STACK 4000
.DATA

    MAX_WIDTH            DW  140H                                    ;THE WIDTH OF THE WINDOW
    MAX_HIGHT            DW  0C8H                                    ;THE HIGHT OF THE WINDOW          ; WILL REPLACE IT WITH THE BADLE POSITION

    BALL_POSITION_X      DW  0A0H                                    ;X POSITION OF THE BALL COLUMNNN
    BALL_POSITION_Y      DW  64H                                     ;Y POSITION OF THE BALL ROWWWWWW
    BALL_SIZE            EQU 05H                                     ;NUMBER OF PIXELS OF THE BALL IN 2D DIRECTION

    PREV_TIME            DB  0                                       ;USED TO CHECK IF THE TIME HAS CHANGED
    BALL_SPEED           DB  7H                                      ;TO CONTROLL THE SPEED OF THE BALL

    BALL_SPEED_Y         DW  3H                                      ;THE SPEED OF THE BALL IN Y DIRECTION
    BALL_SPEED_X         DW  1H

    BALL_COLOR           DB  0FH                                     ;RED COLOR  CHANGED TO WHITE TO HANDLE THE COLLISIONS
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;Paddle var
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    width_Paddle         DW  50d
    height_Paddle        DW  4d

    Paddle_Color         DB  0FH
    Paddle_Speed         DW  6

    Paddle_X             DW  135D
    Paddle_Y             DW  196D

    LeftBoundry          DW  314D
    RightBoundry         DW  6D

    Max_size             DW  100
    Min_size             DW  25

    Amount               DW  20
    
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;multiplayer vars
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    sendChar             dw  ?
    recChar              dw  ?
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;Paddle2 var
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    width_Paddle2        DW  50d
    height_Paddle2       DW  4d

    Paddle_Color2        DB  0FH
    Paddle_Speed2        DW  6

    Paddle_X2            DW  135D
    Paddle_Y2            DW  196D
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;Pause var
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    Pause_height         DW  120d
    Pause_width          DW  100d

    Pause_X              DW  60
    Pause_Y              DW  50

    TEXT_RESTART         db  'PRESS S FOR RESTART','$'
    TEXT_RESUME          db  'PRESS R FOR RESUME','$'

    is_P_pressed         db  0
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;PowerUp var
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    PowerUpWidth         DW  10d
    PowerUpHeight        DW  10d

    PowerUP_Speed        DW  1

    PowerUp_X            DW  135D
    PowerUp_Y            DW  155D

    IsPowerUp            DW  0
    IsPowerUp_pre        DW  0
    Points               DB  0
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;PowerDown var
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    PowerDownWidth       DW  10d
    PowerDownHeight      DW  10d

 
    PowerDown_Speed      DW  1

    PowerDown_X          DW  135D
    PowerDown_Y          DW  155D
    IsPowerDown          DW  0
    IsPowerDown_pre      DW  0

    POWERUP_CLR          EQU 9
    POWERDOWN_CLR        EQU 4
    SAVEBRICKSPOS_X      DW  0
    SAVEBRICKSPOS_Y      DW  0
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;Breaks var
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;size for each brick
    BRICK_WIDTH          EQU 35
    BRICK_HEIGHT         EQU 8

    ;STARTING POINT TO DRAW BREAKS
    FIRST_ROW_POS        EQU 14
    FIRST_COL_POS        EQU 1

    BRICKS_PER_ROW       EQU 8                                       ; NUMBER OF BRICKS IN EACH ROW
    TOTAL_ROWS           EQU 4                                       ; NUMBER OF ROWS

    STEP_PER_ROW         EQU 40                                      ;(BRICK_WIDTH+1PX SPACE)
    STEP_PER_COL         EQU 12                                      ;(BRICK_WIDTH+1PX SPACE)

    COLOR_MATRIX         db  11 dup (4,9,9,9)                        ; EACH Brick must have certain color here
    
    GNCLR_MATRIX         db  11 dup (4,9,9,9)

    ;VARIABLES USED TO DRAW ALL BRICKS (NOT CONFIGURATIONS)
    ROW                  dw  FIRST_ROW_POS
    COL                  dw  FIRST_COL_POS
    CRNT_BRICK           dW  0                                       ;counter used to draw each brick with its coressponding color
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;Stats var
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    TEXT_SCORE           db  'SCORE: $'
    TEXT_LIVES           db  'LIVES: $'
    SCORE                db  0
    LIVES_CONST          EQU 1
    LIVES                db  LIVES_CONST
    SCORE_CURSOR_X       db  8
    SCORE_MAX_WIDTH      db  3
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;WELCOME PAGE VARIABLES
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    WELCOME              DB  'WELCOME TO BRICK BREAKER GAME', '$'
    WELCOME_OPTION_CHAT  DB  'CHAT','$'
    WELCOME_OPTION_PLAY1 DB  '1 PLAYER','$'
    WELCOME_OPTION_PLAY2 DB  '2 PLAYERS','$'
    WELCOME_ARROW        DB  '>','$'
    WELCOME_EXIT         DB  'EXIT','$'
    SELECTOR             DB  1
    ARROW_COLOR          DB  09H
    ARROW_ROW            DB  09H
    ARROW_COLUMN         DB  10H


    STRING_COLOR         DB  00H
    ROW_CURSOR           DB  04H
    COLOUM_CURSOR        DB  00H

    ;;;;;;;;;;;;;;;;;;;;;
    SOUND_FREQ           DW  1193

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    LEVEL1               DB  ' LEVEL 1', '$'
    LEVEL2               DB  ' LEVEL 2', '$'
    LEVEL3               DB  ' LEVEL 3', '$'
    HIGH_POSITION_Y      DW  186
    LOW_POSITION_X       DW  11
    HIGH_POSITION_X      DW  86
    LOW_POSITION_Y       DW  172
    BORDER_COLOR         DB  12
        
    READY1               DB  0
    READY2               DB  0

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;END GAME;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    CONGRATULATIONS      DB  'CONGRATULATIONS ', '$'
    HARD_LUCK            DB  'HARD LUCK ', '$'
    SAD_FACE             DB  ':($'
    PLAY_AGAIN           DB  'PLAY AGAIN ?', '$'
    Y_CHAR               DB  'Y $'
    N_CHAR               DB  ' N$'
    O_BRACKET            DB  '($'
    C_BRACKET            DB  ')$'
    SLASH_CHAR           DB  '/$'
    LOSE_OR_WIN          DB  2

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;INSTRUCTIONS&INFORMATIONS;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    INST_INFO            DB  'INSTRUCTIONS & INFORMATIONS:$'
    FIRST_INST           DB  'PRESS "P" TO PAUSE THE GAME $'
    SECOND_INST          DB  'THE GAME HAS DIFFERENT LEVELS $'
    SECOND_INST2         DB  'OF BALL SPEED $'

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;Chat variables;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    value                db  ?                                       ;value which will be sent or received by user
    yposS                db  0                                       ;y position of sending initial will be 0
    xposS                db  0                                       ;x position of sending init will be 0
    xposR                db  0                                       ;x position of receiving initial will be 0
    yposR                db  0Dh                                     ;y position of receiving initial wil be D because of lower part of screen
    LowerScreen          db  0, 13, 79, 24                           ;this is the lower part of the screen
    UpperScreen          db  0, 0, 79, 12                            ;this is the upper part of the screen
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;SINGLE & MULT;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    IS_MULTI             DB  0

.CODE

START_COO PROC


    AG:                        
                               CMP         READY1,1
                               JZ          V1

                               MOV         AH,1
                               INT         16h
                               JZ          AG
                               MOV         READY1,1
                               mov         dx , 3F8H
                               mov         al,1
                               out         dx , al

    V1:                        
                               mov         dx , 3FDH                          ; Line Status Register
                               in          al , dx
                               test        al , 1
                               jz          AG

                               mov         dx , 03F8H
                               in          al , dx
                               MOV         READY2,1

                               RET

START_COO ENDP

MAIN PROC FAR

                               MOV         AX, @DATA
                               MOV         DS, AX                             ;MOVING DATA TO DATA SEGNMENT

                               mov         ax, 0A000h                         ; Video memory segment for mode 13h
                               mov         es, ax                             ; Set ES to point to video memory
    MAIN_MENU:                 MOV         AH, 00H
                               MOV         AL, 13H                            ;CHOOSE THE VIDEO MODE
                               INT         10H
                               CALL        initializingUART
                               CALL        CLEARING_SCREEN
                               CALL        DRAW_WELCOME_SCREEN


                               MOV         IS_MULTI,0
                               CMP         SELECTOR, 1                        ; 1 PLAYER
                               JE          GAME

                               MOV         IS_MULTI,1
                               CMP         SELECTOR, 2                        ; 2 PLAYERS
                               JE          GAME
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

                               MOV         IS_MULTI,0
                               CMP         SELECTOR, 3
                               JE          START_CHAT

                               MOV         AH, 4CH                            ; SELECTOR = 4 ==> EXIT
                               INT         21H


    START_CHAT:                
                               call        SendReceive
                               JMP         MAIN_MENU


    GAME:                      
                               CALL        CLEARING_SCREEN                    ;TO CLEAR THE SCREEN

                               CALL        DRAW_INSTRUCTIONS
    GET_KEY:                   
                               MOV         AH, 00
                               INT         16H                                ; GET KEY PRESSED
                               JNZ         GET_KEY

    ;RESET_CLR_MATRIX
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                               MOV         DI,0
                               mov         ROW      ,       FIRST_ROW_POS
                               mov         COL        ,     FIRST_COL_POS
                               mov         CRNT_BRICK ,     0
    RESET_CLR_MTRX3:           
                               MOV         AL,[GNCLR_MATRIX+DI]
                               MOV         [COLOR_MATRIX+DI],AL
                               INC         DI
                               CMP         DI,33
                               JNZ         RESET_CLR_MTRX3
    ;     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                               MOV         SCORE,0
                               MOV         LIVES,LIVES_CONST
    ;    CALL START_COO
                               CALL        CLEARING_SCREEN
                               CALL        DRAW_ALL_BRICKS
                               CALL        DRAW_WHITE_LINE
                               CALL        RESET_GAME
                             
    ; CALL Move_Paddle

    TIME_AGAIN:                MOV         AH, 2CH                            ;GET THE SYSTEM TIME
                               INT         21H                                ;CH = HOURS, CL = MINUTES, DH = SECONDS AND DL = 1/100 SECONDS

                               MOV         AL, DL                             ;TO AVOID MEMORY TO MEMORY COMMAND
                               CMP         AL, PREV_TIME                      ;COMPARE THE PREVSE TIME WITH THE CURENT
                               JE          TIME_AGAIN


                               MOV         PREV_TIME, DL
    ;   CALL CLEARING_SCREEN           ;TO CLEAR THE SCREEN


                               CMP         IsPowerUp,0                        ; CHECK IF THERE IS A POWERUP
                               JE          CHWCK_POWERDOWN
                               CMP         IsPowerUp_pre,0                    ; CHECK IF THERE IS A POWERUP
                               JE          CHECK_PRE_UP
                               CALL        Clear_PowerUp
                               CALL        Clear_UP_ARROW
                               CALL        Move_Power_UP
                               CALL        Draw_PowerUp
                               CALL        DRAW_UP_ARROW
                               JMP         CHWCK_POWERDOWN

    CHECK_PRE_UP:              
                               CALL        Clear_PowerUp
                               CALL        Clear_UP_ARROW
                               MOV         IsPowerUp,0


    CHWCK_POWERDOWN:           
                               CMP         IsPowerDown,0                      ; CHECK IF THERE IS A POWERDOWN
                               JE          CONT
                               CMP         IsPowerDown_pre,0                  ; CHECK IF THERE IS A POWERD   OWN
                               JE          CHECK_PRE_DOWN
                               CALL        Clear_PowerDown
                               CALL        Clear_DOWN_ARROW
                               CALL        Move_Power_Down
                               CALL        Draw_PowerDown
                               CALL        DRAW_DOWN_ARROW
                               JMP         CONT
    TIME_AGAIN_:               
                               JMP         TIME_AGAIN

    CHECK_PRE_DOWN:            
                               CALL        Clear_PowerDown
                               CALL        Clear_DOWN_ARROW
                               MOV         IsPowerDown,0
                               JMP         CONT


    CONT:                      
                               CALL        DRAW_ALL_BRICKS                    ;DRAW ALL BRICKS ACCORDING TO CONFIGS
                               MOV         BALL_COLOR, 00H
                               CALL        DRAWING_BALL
                               MOV         BALL_COLOR, 0FH
                               CALL        DISPLAY_STATS                      ;DISPLAY STATS
                               CALL        DRAW_WHITE_LINE                    ;DRAW WHITE LINE TO SEPARATE THE STATS FROM THE GAME
                               CALL        clear_Paddle
                               JMP         CONNECTION
    GAME_:                     
                               CALL        Clear_Pause
                               mov         is_P_pressed,0
                               JMP         GAME

    CONNECTION:                
                               CMP         IS_MULTI,0
                               JE          SINGLE1
                               CALL        clear_Paddle2
    SINGLE1:                   CALL        Move_Paddle
                               CMP         IS_MULTI,0
                               JE          SINGLE2
                               CALL        Move_Paddle2
    SINGLE2:                   CALL        Draw_Paddle
                               CMP         IS_MULTI,0
                               JE          SINGLE3
                               CALL        Draw_Paddle2


    SINGLE3:                   CALL        MOVING_BALL
                               CMP         LOSE_OR_WIN, 0
                               JE          PRESS_SCREEN
                               CALL        DRAWING_BALL                       ;DRAWING BALL
                               CALL        HANDLE_COLLISION                   ;HANDLE COLLISIONS WITH BRICK
                               CMP         LOSE_OR_WIN, 1
                               JE          PRESS_SCREEN



    check_pause:               
                               cmp         is_P_pressed,0
                               JZ          TIME_AGAIN_
    P_pressed:                 
    ;TO CLEAR THE SCREEN
                               CALL        Draw_pause
                               JMP         Done__

    TIME_AGAIN__:                                                             ; Just a connection between the two labels
                             
                               CALL        Clear_Pause
                               mov         is_P_pressed,0
                               JMP         TIME_AGAIN_

                            
    Done__:                                                                   ; Read the key
                               MOV         AH, 00h
                               INT         16h
                               CMP         AH, 13h                            ; check if it is 'r'
                               JZ          TIME_AGAIN__                       ; i want to jmp to 'TIME_AGAIN' label but it is far :(
                               CMP         AH, 1Fh                            ; check if it is 's'
                               JZ          GAME_
                               JMP         P_pressed


    PRESS_SCREEN:              

                                
                               MOV         AH, 00
                               INT         16H                                ; GET KEY PRESSED
                               CMP         AH, 15h                            ; PRESS Y
                               JNE         CHECK_N
                               MOV         LIVES, LIVES_CONST
                               MOV         SCORE, 0
                               MOV         LOSE_OR_WIN, 2
                               CALL        CLEARING_SCREEN                    ;TO CLEAR THE SCREEN
    ;RESET_CLR_MATRIX
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                               MOV         DI,0
                               mov         ROW      ,       FIRST_ROW_POS
                               mov         COL        ,     FIRST_COL_POS
                               mov         CRNT_BRICK ,     0
    RESET_CLR_MTRX:            
                               MOV         AL,[GNCLR_MATRIX+DI]
                               MOV         [COLOR_MATRIX+DI],AL
                               INC         DI
                               CMP         DI,33
                               JNZ         RESET_CLR_MTRX
    ;     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                               CALL        DRAW_ALL_BRICKS
                               CALL        DRAW_WHITE_LINE
                               CALL        RESET_GAME
                               JMP         TIME_AGAIN

    CHECK_N:                   
                               CMP         AH, 31h                            ; PRESS Y
                               JNE         PRESS_SCREEN
                               MOV         LOSE_OR_WIN,2
                               JMP         MAIN_MENU

    RETURNGAME:                
                               MOV         AH, 4CH
                               INT         21H
                               RET

MAIN ENDP



CLEARING_SCREEN PROC

                               MOV         AH, 06H                            ;SCROLL UP
                               XOR         AL, AL                             ;CLEAR ENTIRE SCREEN
                               XOR         CX, CX                             ;CH = ROW, CL = COLUMN (FROM UPPER LEFT CORNER)
                               MOV         DX, 184FH                          ;DH = ROW, DL = COLUMN (TO LOWER RIGHT CORNER)
                               MOV         BH, 00H                            ;BLACK COLOR
                               INT         10H                                ;CLEAR THE SCREEN


                               RET
CLEARING_SCREEN ENDP

DRAW_WELCOME_ARROW PROC


                               MOV         AH, 02H                            ;SET CURSOR POSITION
                               MOV         BH, 00                             ;PAGE NUMBER
                               MOV         DH, ARROW_ROW                      ;ROW
                               MOV         DL, ARROW_COLUMN                   ;COLUMN
                               INT         10H                                ;EXECUTE

                               MOV         AH, 09H
                               MOV         BH, 00
                               MOV         BL, ARROW_COLOR
                               MOV         CX, 1
                               MOV         AL, WELCOME_ARROW
                               INT         10h


                               RET
DRAW_WELCOME_ARROW ENDP


DRAW_INSTRUCTIONS PROC
                               MOV         AH, 02H                            ;SET CURSOR POSITION
                               MOV         BH, 00                             ;PAGE NUMBER
                               MOV         DH, 02                             ;ROW
                               MOV         DL, 02H                            ;COLUMN
                               INT         10H                                ;EXECUTE
                               LEA         SI, INST_INFO                      ; Load string address into SI
                               PUSH        SI
                               MOV         AH, 12
                               MOV         STRING_COLOR, AH
                               MOV         ROW_CURSOR, DH
                               MOV         COLOUM_CURSOR, DL
                               CALL        PRINT_STRING

                               MOV         ARROW_ROW, 06H
                               MOV         ARROW_COLUMN, 02h
                               MOV         ARROW_COLOR, 12
                               CALL        DRAW_WELCOME_ARROW

                               MOV         AH, 02H                            ;SET CURSOR POSITION
                               MOV         BH, 00                             ;PAGE NUMBER
                               MOV         DH, 06                             ;ROW
                               MOV         DL, 04H                            ;COLUMN
                               INT         10H                                ;EXECUTE
                               LEA         SI, FIRST_INST                     ; Load string address into SI
                               PUSH        SI
                               MOV         AH, 0FH
                               MOV         STRING_COLOR, AH
                               MOV         ROW_CURSOR, DH
                               MOV         COLOUM_CURSOR, DL
                               CALL        PRINT_STRING

                               MOV         ARROW_ROW, 0AH
                               MOV         ARROW_COLUMN, 02h
                               MOV         ARROW_COLOR, 12
                               CALL        DRAW_WELCOME_ARROW

                               MOV         AH, 02H                            ;SET CURSOR POSITION
                               MOV         BH, 00                             ;PAGE NUMBER
                               MOV         DH, 0AH                            ;ROW
                               MOV         DL, 04H                            ;COLUMN
                               INT         10H                                ;EXECUTE
                               LEA         SI, SECOND_INST                    ; Load string address into SI
                               PUSH        SI
                               MOV         AH, 0FH
                               MOV         STRING_COLOR, AH
                               MOV         ROW_CURSOR, DH
                               MOV         COLOUM_CURSOR, DL
                               CALL        PRINT_STRING

                               MOV         AH, 02H                            ;SET CURSOR POSITION
                               MOV         BH, 00                             ;PAGE NUMBER
                               MOV         DH, 0CH                            ;ROW
                               MOV         DL, 04H                            ;COLUMN
                               INT         10H                                ;EXECUTE
                               LEA         SI, SECOND_INST2                   ; Load string address into SI
                               PUSH        SI
                               MOV         AH, 0FH
                               MOV         STRING_COLOR, AH
                               MOV         ROW_CURSOR, DH
                               MOV         COLOUM_CURSOR, DL
                               CALL        PRINT_STRING

                               RET
DRAW_INSTRUCTIONS ENDP


MOVE_WELCOME_ARROW PROC


    MOVE:                      
                               MOV         AH, 00
                               INT         16H                                ; GET KEY PRESSED

                               CMP         AH, 48H                            ; IF UP
                               JE          UP_PRESS

                               CMP         AH, 50H                            ; IF DOWN
                               JE          DOWN_PRESS_

                               CMP         AH, 0DH                            ; IF ENTER
                               RET

    UP_PRESS:                  
                               DEC         SELECTOR
                               MOV         AL, 1
                               CMP         SELECTOR, AL
                               JAE         UP_ARROW

                               INC         SELECTOR
                               JMP         MOVE

    UP_ARROW:                  
    ;IF SELECTOR IS 0   ===> 09
                               MOV         AL, 1
                               CMP         SELECTOR, AL
                               JE          FIRST_ROW                          ; CLEAR SECOND AND DRAW FIRST
                               MOV         AL, 2
                               CMP         SELECTOR, AL
                               JE          SECOND_ROW                         ; CLEAR THIRD AND DRAW SECOND
                               CMP         SELECTOR, 3                        ; CLEAR FOURTH ROW AND DRAW THIRD
                               JE          THIRD_ROW_UP

    FIRST_ROW:                 
                               MOV         AL, 00                             ; COLOR BLACK TO THE ARROW IN SECOND ROW
                               MOV         ARROW_COLOR, AL
                               MOV         AL, 0CH
                               MOV         ARROW_ROW, AL                      ; THE SECOND ROW
                               MOV         AL, 0DH
                               MOV         ARROW_COLUMN, AL
                               CALL        DRAW_WELCOME_ARROW

                               MOV         AL, 09                             ; COLOR BLUE TO THE ARROW IN FIRST ROW
                               MOV         ARROW_COLOR, AL
                               MOV         AL, 09H
                               MOV         ARROW_ROW, AL                      ; THE FIRST ROW
                               MOV         AL, 0DH
                               MOV         ARROW_COLUMN, AL
                               CALL        DRAW_WELCOME_ARROW
                               JMP         MOVE

    DOWN_PRESS_:               
                               JMP         DOWN_PRESS

    SECOND_ROW:                
                               MOV         AL, 00                             ; COLOR BLACK TO THE ARROW IN SECOND ROW
                               MOV         ARROW_COLOR, AL
                               MOV         AL, 0FH
                               MOV         ARROW_ROW, AL                      ; THE SECOND ROW
                               MOV         AL, 0DH
                               MOV         ARROW_COLUMN, AL
                               CALL        DRAW_WELCOME_ARROW

                               MOV         AL, 09                             ; COLOR BLUE TO THE ARROW IN FIRST ROW
                               MOV         ARROW_COLOR, AL
                               MOV         AL, 0CH
                               MOV         ARROW_ROW, AL                      ; THE FIRST ROW
                               MOV         AL, 0DH
                               MOV         ARROW_COLUMN, AL
                               CALL        DRAW_WELCOME_ARROW
                               JMP         MOVE

    THIRD_ROW_UP:              
                               MOV         AL, 00                             ; COLOR BLACK TO THE ARROW IN 4
                               MOV         ARROW_COLOR, AL
                               MOV         AL, 12H
                               MOV         ARROW_ROW, AL                      ; THE 4
                               MOV         AL, 0DH
                               MOV         ARROW_COLUMN, AL
                               CALL        DRAW_WELCOME_ARROW

                               MOV         AL, 09                             ; COLOR BLUE TO THE ARROW IN FIRST ROW
                               MOV         ARROW_COLOR, AL
                               MOV         AL, 0FH
                               MOV         ARROW_ROW, AL                      ; THE FIRST ROW
                               MOV         AL, 0DH
                               MOV         ARROW_COLUMN, AL
                               CALL        DRAW_WELCOME_ARROW
                               JMP         MOVE

    DOWN_PRESS:                

                               INC         SELECTOR
                               MOV         AL, 4
                               CMP         SELECTOR, AL
                               JBE         DOWN_ARROW


                               DEC         SELECTOR
                               JMP         MOVE

    MOVE_:                     
                               JMP         MOVE

    DOWN_ARROW:                
    ; IF SELECTOR == 2 MOVE TO THIRD ROW AND CLEAR THE SECOND
                               MOV         AL, 4
                               CMP         SELECTOR, AL
                               JE          DOWN_FOURTH_ROW                    ;JUMP TO THERID AND CLEAR THE SECOND

                               MOV         AL, 3
                               CMP         SELECTOR, AL
                               JE          DOWN_THIRD_ROW                     ;JUMP TO THERID AND CLEAR THE SECOND

                               MOV         AL, 2
                               CMP         SELECTOR, AL
                               JE          DOWN_SECOND_ROW                    ;JUMP TO SECOND AND CLEAR FIRST


    DOWN_SECOND_ROW:           
                               MOV         AL, 09H
                               MOV         ARROW_ROW, AL                      ; THE FIRST ROW
                               MOV         AL, 00H
                               MOV         ARROW_COLOR, AL                    ; THE BLACK COLOR
                               MOV         AL, 0DH
                               MOV         ARROW_COLUMN, AL
                               CALL        DRAW_WELCOME_ARROW                 ; CLEAR FIRST ROW

                               MOV         AL, 0CH
                               MOV         ARROW_ROW, AL                      ; THE SECOND ROW
                               MOV         AL, 09H
                               MOV         ARROW_COLOR, AL                    ; THE BLUE COLOR
                               MOV         AL, 0DH
                               MOV         ARROW_COLUMN, AL
                               CALL        DRAW_WELCOME_ARROW                 ; MOVE TO SECOND ROW
                               JMP         MOVE_

    DOWN_THIRD_ROW:            
                               MOV         AL, 0CH
                               MOV         ARROW_ROW, AL                      ; THE SECOND ROW
                               MOV         AL, 00H
                               MOV         ARROW_COLOR, AL                    ; THE BLACK COLOR
                               MOV         AL, 0DH
                               MOV         ARROW_COLUMN, AL
                               CALL        DRAW_WELCOME_ARROW                 ; CLEAR SECOND ROW

                               MOV         AL, 0FH
                               MOV         ARROW_ROW, AL                      ; THE THERID ROW
                               MOV         AL, 09H
                               MOV         ARROW_COLOR, AL                    ; THE BLUE COLOR
                               MOV         AL, 0DH
                               MOV         ARROW_COLUMN, AL
                               CALL        DRAW_WELCOME_ARROW                 ; MOVE TO THIRD ROW
                               JMP         MOVE_

    DOWN_FOURTH_ROW:           
                               MOV         AL, 0FH
                               MOV         ARROW_ROW, AL                      ; THE SECOND ROW
                               MOV         AL, 00H
                               MOV         ARROW_COLOR, AL                    ; THE BLACK COLOR
                               MOV         AL, 0DH
                               MOV         ARROW_COLUMN, AL
                               CALL        DRAW_WELCOME_ARROW                 ; CLEAR SECOND ROW

                               MOV         AL, 12H
                               MOV         ARROW_ROW, AL                      ; THE THERID ROW
                               MOV         AL, 09H
                               MOV         ARROW_COLOR, AL                    ; THE BLUE COLOR
                               MOV         AL, 0DH
                               MOV         ARROW_COLUMN, AL
                               CALL        DRAW_WELCOME_ARROW                 ; MOVE TO THIRD ROW
                               JMP         MOVE_


                               RET
MOVE_WELCOME_ARROW ENDP

PRINT_STRING PROC

                               POP         DI
                               POP         SI
    PRINT_S:                   MOV         AH, 09H
                               MOV         BL, STRING_COLOR
                               MOV         AL, BYTE PTR [SI]                  ; Load character
                               CMP         AL, '$'                            ; Check for end of string
                               JE          RETURN_STRING                      ; If '$', exit loop
                               MOV         CX, 1                              ; NO OF CHARACTERS
                               INT         10H                                ; EXECUTE
                               INC         SI                                 ; Move to next character

                               INC         COLOUM_CURSOR                      ;INC CURSOR POSITION
                               MOV         DL, COLOUM_CURSOR
                               MOV         BH, 00
                               MOV         DH, ROW_CURSOR
                               MOV         AH, 02H
                               INT         10H
                               JMP         PRINT_S                            ; Repeat for next character

    RETURN_STRING:             
                               PUSH        DI
                               RET
PRINT_STRING ENDP


DRAW_WELCOME_SCREEN PROC

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;SET CURSOR POSITION AND PRINT WELCOME
                               MOV         AH, 02H                            ;SET CURSOR POSITION
                               MOV         BH, 00                             ;PAGE NUMBER
                               MOV         DH, 04                             ;ROW
                               MOV         DL, 05                             ;COLUMN
                               INT         10H                                ;EXECUTE
                               LEA         SI, WELCOME                        ; Load string address into SI
                               PUSH        SI
                               MOV         AH, 09h
                               MOV         STRING_COLOR, AH
                               MOV         ROW_CURSOR, DH
                               MOV         COLOUM_CURSOR, DL
                               CALL        PRINT_STRING
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;DRAW ARROW
                               CMP         SELECTOR, 1
                               JE          SET_FIRST_ROW
                               CMP         SELECTOR, 2
                               JE          SET_SECOND_ROW
                               CMP         SELECTOR, 3
                               JE          SET_THIRD_ROW
                               MOV         ARROW_ROW, 12H
    SET_FIRST_ROW:             
                               MOV         ARROW_ROW, 09H
                               JMP         C_D
    SET_SECOND_ROW:            
                               MOV         ARROW_ROW, 0CH
                               JMP         C_D
    SET_THIRD_ROW:             
                               MOV         ARROW_ROW, 0FH
                               JMP         C_D
    C_D:                       
                               MOV         ARROW_COLOR, 09H
                               MOV         ARROW_COLUMN, 0DH
                               CALL        DRAW_WELCOME_ARROW
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;SET CURSOR POSITION AND PRINT 1 PLAYER
                               MOV         AH, 02H                            ;SET CURSOR POSITION
                               MOV         BH, 00                             ;PAGE NUMBER
                               MOV         DH, 09                             ;ROW
                               MOV         DL, 0FH                            ;COLUMN
                               INT         10H                                ;EXECUTE
                               LEA         SI, WELCOME_OPTION_PLAY1
                               PUSH        SI
                               MOV         AH, 0FH
                               MOV         STRING_COLOR, AH
                               MOV         ROW_CURSOR, DH
                               MOV         COLOUM_CURSOR, DL
                               CALL        PRINT_STRING
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;SET CURSOR POSITION AND PRINT 2 PLAYERS
                               MOV         AH, 02H                            ;SET CURSOR POSITION
                               MOV         BH, 00                             ;PAGE NUMBER
                               MOV         DH, 0CH                            ;ROW
                               MOV         DL, 0FH                            ;COLUMN
                               INT         10H                                ;EXECUTE
                               LEA         SI, WELCOME_OPTION_PLAY2
                               PUSH        SI
                               MOV         AH, 0FH
                               MOV         STRING_COLOR, AH
                               MOV         ROW_CURSOR, DH
                               MOV         COLOUM_CURSOR, DL
                               CALL        PRINT_STRING
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;SET CURSOR POSITION AND PRINT CHAT
                               MOV         AH, 02H                            ;SET CURSOR POSITION
                               MOV         BH, 00                             ;PAGE NUMBER
                               MOV         DH, 0FH                            ;ROW
                               MOV         DL, 0FH                            ;COLUMN
                               INT         10H                                ;EXECUTE
                               LEA         SI, WELCOME_OPTION_CHAT
                               PUSH        SI
                               MOV         AH, 0FH
                               MOV         STRING_COLOR, AH
                               MOV         ROW_CURSOR, DH
                               MOV         COLOUM_CURSOR, DL
                               CALL        PRINT_STRING
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;SET CURSOR POSITION AND PRINT CHAT
                               MOV         AH, 02H                            ;SET CURSOR POSITION
                               MOV         BH, 00                             ;PAGE NUMBER
                               MOV         DH, 12H                            ;ROW
                               MOV         DL, 0FH                            ;COLUMN
                               INT         10H                                ;EXECUTE
                               LEA         SI, WELCOME_EXIT
                               PUSH        SI
                               MOV         AH, 0FH
                               MOV         STRING_COLOR, AH
                               MOV         ROW_CURSOR, DH
                               MOV         COLOUM_CURSOR, DL
                               CALL        PRINT_STRING


                               MOV         AH, 01H
                               INT         16H                                ;CHECK FOR KEY PRESS
                               JNZ         MOVE_WA                            ; MOVE WELCOME ARROW

    MOVE_WA:                   
                               CALL        MOVE_WELCOME_ARROW


                               RET
DRAW_WELCOME_SCREEN ENDP



MOVING_BALL PROC
                               PUSH        AX
                               MOV         AX, BALL_SPEED_Y
                               SUB         BALL_POSITION_Y, AX                ;MOVE THE BALL UP

                               CMP         BALL_POSITION_Y, 15                ;CHECK IF Y < 15 (THE HIGHT OF THE WINDOW)
                               JGE         check_max_hight
                               jmp         REVERSE_Y                          ;IF Y < 15 REVERSE THE DIRECTION OF MOVING
    check_max_hight:           
                               MOV         AX, MAX_HIGHT
                               SUB         AX, BALL_SIZE
                               SUB         AX, BALL_SIZE
                               CMP         BALL_POSITION_Y, AX                ;CHECK IF Y > MAX HIGHT8
                               JLE         moveBall
                               jmp         HANDEL_LOSE_LIFE                   ;IF Y > MAX HIGHT - BALL SIZE REVERSE THE DIRECTION TOO
    moveBall:                  
                               MOV         AX, BALL_SPEED_X
                               ADD         BALL_POSITION_X, AX                ;MOV RIGHT

                               MOV         AX, BALL_POSITION_X
                               CMP         AX, 6                              ;CHECK IF X < 6
                               JGE         checkLeft
                               JMP         REVERSE_X                          ;IF X < 0 REVERSE THE DIRECTION
    checkLeft:                 
                               MOV         AX, MAX_WIDTH
                               SUB         AX, BALL_SIZE
                               SUB         AX, BALL_SIZE
                               CMP         BALL_POSITION_X, AX                ;CHECK IF x > MAX WIDTH - BALL SIZE
                               JG          REVERSE_X                          ;REVERSE IF GREATER


    ;;;;;;;;;;;;;;;; Check Ball-Paddle collision
    checkPaddleX:              
                               MOV         AX,Paddle_X
    ;   SUB  AX, BALL_SIZE
    ;  ADD  AX,BALL_SPEED_X
                               CMP         BALL_POSITION_X,AX                 ;; Check x -->Start
                               JB          checkPaddleX2

                               ADD         AX,width_Paddle
    ;    SUB  AX, BALL_SIZE
    ;    ADD  AX,BALL_SPEED_X
                               CMP         BALL_POSITION_X,AX                 ;; Check x -->End
                               JG          checkPaddleX2
                               JMP         checkPaddleY
    ;;;;;;;;;;;;;;;; Check Ball-Paddle2 collision
    checkPaddleX2:             
                               MOV         AX,Paddle_X2
    ; SUB  AX, BALL_SIZE
    ; ADD  AX,BALL_SPEED_X
                               CMP         BALL_POSITION_X,AX                 ;; Check x -->Start
                               JB          NOT_COLLIDE

                               ADD         AX,width_Paddle2
    ;    SUB  AX, BALL_SIZE
    ;    ADD  AX,BALL_SPEED_X
                               CMP         BALL_POSITION_X,AX                 ;; Check x -->End
                               JG          NOT_COLLIDE
    ;    JMP  checkPaddleY2


    checkPaddleY:              

                               MOV         AX, Paddle_Y
                               SUB         AX, BALL_SIZE
                               ADD         AX,BALL_SPEED_Y
                               CMP         BALL_POSITION_Y, AX                ;CHECK IF Y > MAX HIGHT
                               JGE         REVERSE_Y
                               JMP         RT

    ; checkPaddleY2:
    ;                            MOV  AX, Paddle_Y2
    ;                            SUB  AX, BALL_SIZE
    ;                            ADD  AX,BALL_SPEED_Y
    ;                            CMP  BALL_POSITION_Y, AX                ;CHECK IF Y > MAX HIGHT
    ;                            JGE  REVERSE_Y


    NOT_COLLIDE:               
    ;;;;;;;;;;;;;;;;


    RT:                        POP         AX
                               RET

    REVERSE_Y:                 NEG         BALL_SPEED_Y
                               POP         AX                                 ;REVERSE THE DIRECTION OF SPEED IN Y
                               RET

    REVERSE_X:                 NEG         BALL_SPEED_X                       ;REVERSE THE DIRECTION OF SPEED IN Y
                               POP         AX
                               RET
    HANDEL_LOSE_LIFE:          CALL        Lose_Life
                               jmp         REVERSE_Y
                               RET
MOVING_BALL ENDP



HANDLE_COLLISION PROC
    ;WHEN COLLIDE WITH THE UPPER FACE OF BRICK
                               MOV         AX,BALL_POSITION_Y
                               ADD         AX,BALL_SIZE
                               MOV         BX,320
                               MUL         BX
                               ADD         AX,BALL_POSITION_X                 ;AX=ROWS*320+COLS
                               MOV         SI,AX
                               MOV         DL,BALL_COLOR
                               CMP         ES:[SI],DL                         ; CHECK IF SI IS COLORED AS SAME AS THE BALL (INSIDE THE BALL)
                               JZ          X1
                               CMP         ES:[SI], BYTE PTR  0               ; CHECK IF COLIDED WITH DIFFERENT COLOR THAN BLACK OR BALL_COLOR (COLLISION WITH BRICK)
                               JNZ         .REVERSE_Y

    ;WHEN COLLIDE WITH THE LOWER FACE OF BRICK
    X1:                        MOV         AX,BALL_POSITION_Y
                               SUB         AX,BALL_SIZE
                               MOV         BX,320
                               MUL         BX
                               ADD         AX,BALL_POSITION_X
                               MOV         SI,AX
                               MOV         DL,BALL_COLOR
                               CMP         ES:[SI],DL                         ; CHECK IF SI IS COLORED AS SAME AS THE BALL (INSIDE THE BALL)
                               JZ          X2
                               CMP         ES:[SI], BYTE PTR  0               ; CHECK IF COLIDED WITH DIFFERENT COLOR THAN BLACK OR BALL_COLOR (COLLISION WITH BRICK)
                               JA          .REVERSE_Y

    ;WHEN COLLIDE WITH THE LOWER FACE OF BRICK
    X2:                        MOV         AX,BALL_POSITION_Y
                               MOV         BX,320
                               MUL         BX
                               ADD         AX,BALL_POSITION_X
                               ADD         AX,BALL_SIZE
                               MOV         SI,AX
                               MOV         DL,BALL_COLOR
                               CMP         ES:[SI],DL                         ; CHECK IF SI IS COLORED AS SAME AS THE BALL (INSIDE THE BALL)
                               JZ          X3
                               CMP         ES:[SI], BYTE PTR  0               ; CHECK IF COLIDED WITH DIFFERENT COLOR THAN BLACK OR BALL_COLOR (COLLISION WITH BRICK)
                               JA          .REVERSE_Y
    X3:                        MOV         AX,BALL_POSITION_Y
                               MOV         BX,320
                               MUL         BX
                               ADD         AX,BALL_POSITION_X
                               SUB         AX,BALL_SIZE
                               MOV         SI,AX
                               MOV         DL,BALL_COLOR
                               CMP         ES:[SI],DL                         ; CHECK IF SI IS COLORED AS SAME AS THE BALL (INSIDE THE BALL)
                               JZ          .RT
                               CMP         ES:[SI], BYTE PTR  0               ; CHECK IF COLIDED WITH DIFFERENT COLOR THAN BLACK OR BALL_COLOR (COLLISION WITH BRICK)
                               JA          .REVERSE_Y

.RT: RET

.REVERSE_Y:

                               CMP         BALL_POSITION_Y,60d                ; Check if it is not brick
                               JG          RET_

    NOT_COLLIDE_Ball_PowerDown:
    ;;;;;;;;;;;;;;;;
                               CALL        DESTROY_BRICK                      ;DESTROY THE BRICK I COLLIDED WITH
                               CALL        SOUND
                               CALL        BALL_SPEED_LEVELS
                               NEG         BALL_SPEED_Y                       ;REVERSE THE DIRECTION OF SPEED IN Y
                               RET

    RET_:                      
                               RET
HANDLE_COLLISION ENDP

DESTROY_BRICK PROC
                               PUSH        AX
                               PUSH        BX
                               PUSH        DX
                               PUSH        CX
                               PUSH        DI
    ;;;;;;;;;;;;;;;;;;;MATHEMATICAL OPERATIONS TO DETERMINE WHICH BRICK I COLIDED WITH;;;;;;;;;;;;;;;;;;;
                               MOV         DX,0
                               MOV         AX,SI
                               MOV         BX,320
                               DIV         BX                                 ;AX=>NUMBER OF ROWS     ;DX=>MODULS<320
    ;;;;;;;;;;;;;;;;;;

                               PUSH        AX
                               INC         Points

                               MOV         SAVEBRICKSPOS_X,DX
                               MOV         SAVEBRICKSPOS_Y,AX

                              
    CNT:                       
                               POP         AX
    ;;;;;;;;;;;;;;;;;;
                               MOV         CX,DX
                               MOV         DX,0
                               MOV         BX,STEP_PER_COL
                               SUB         AX,FIRST_ROW_POS
                               DIV         BX
                               MOV         BP,AX                              ;;;;;;;;;;;;;;;;;;;;;;;;;;BP IS THE ACTUAL ROW

                               MOV         DX,0
                               MOV         AX,CX
                               SUB         AX,FIRST_COL_POS
                               MOV         BX,STEP_PER_ROW
                               DIV         BX
                               MOV         CX,AX                              ;;;;;;;;;;;;;;;;;;;;;;;;;;;CX IS THE ACTUAL COL
                               MOV         AX,BP
                               MOV         BX,BRICKS_PER_ROW
                               MUL         BX
                               ADD         AX,CX
                               MOV         DI,AX                              ;;;;;;;;;;;;;;;;;;;;;;;;;;;DI IS THE ACTUAL BRICK

                               CMP         [COLOR_MATRIX+DI],POWERDOWN_CLR
                               JNZ         C1
                               mov         [COLOR_MATRIX+DI],1
                               CMP         IsPowerDown,1
                               JZ          C2
                               MOV         IsPowerDown,1
                               MOV         IsPowerDown_pre,1
                               MOV         DX, SAVEBRICKSPOS_X
                               MOV         AX, SAVEBRICKSPOS_Y
                               MOV         PowerDown_X,DX
                               MOV         PowerDown_Y,70D
                               CALL        Draw_PowerDown
                               CALL        DRAW_DOWN_ARROW
                               jmp         C2

    C1:                        
                               CMP         [COLOR_MATRIX+DI],POWERUP_CLR
                               JNZ         C2
                               mov         [COLOR_MATRIX+DI],1
                               CMP         IsPowerUp,1
                               JZ          C2
                               MOV         IsPowerUp,1
                               MOV         IsPowerUp_pre,1
                               MOV         DX, SAVEBRICKSPOS_X
                               MOV         AX, SAVEBRICKSPOS_Y
                               MOV         PowerUp_X,DX
                               MOV         PowerUp_Y,70D
                               CALL        Draw_PowerUp
                               CALL        DRAW_UP_ARROW
                              

    C2:                        DEC         [COLOR_MATRIX+DI]
                               cmp         [COLOR_MATRIX+DI],0
                               JNZ         Continue
                               INC         SCORE


                               CMP         SCORE, 32
                               JNE         Continue

                               CALL        CLEARING_SCREEN
                               MOV         LOSE_OR_WIN, 1
                               CALL        DRAW_FINAL_SCREEN

                               
    Continue:                  POP         DI
                               POP         CX
                               POP         DX
                               POP         BX
                               POP         AX
                               RET
DESTROY_BRICK ENDP


SOUND PROC
                               push        ax
                               push        bx
                               push        cx
                               push        dx
                               push        bp
                               push        si
                               push        di

                               mov         ax, SOUND_FREQ
                               MOV         BX, AX                             ;Preserve the note value by storing it in BX.
                               MOV         AL, 182                            ;Set up the write to the control word register.
                               OUT         43h, AL                            ;Perform the write.
                               MOV         AX, BX                             ;Pull back the frequency from BX.
                               OUT         42h, AL                            ;Send lower byte of the frequency.
                               MOV         AL, AH                             ;Load higher byte of the frequency.
                               OUT         42h, AL                            ;Send the higher byte.
                               IN          AL, 61h                            ;Read the current keyboard controller status.
                               OR          AL, 03h                            ;Turn on 0 and 1 bit, enabling the PC speaker gate and the data transfer.
                               OUT         61h, AL                            ;Save the new keyboard controller status.
                               MOV         AH, 86h                            ;Load the BIOS WAIT, int15h function AH=86h.
                               MOV         AL, 0
                               MOV         CX, 1
                               MOV         DX, 2
                               INT         15h                                ;Immediately interrupt. The delay is already in CX:DX.
                               IN          AL, 61h                            ;Read the current keyboard controller status.
                               AND         AL, 0FCh                           ;Turn off 0 and 1 bit, simply disabling the gate.
                               OUT         61h, AL                            ;Write the new keyboard controller status.


                               pop         di
                               pop         si
                               pop         bp
                               pop         dx
                               pop         cx
                               pop         bx
                               pop         ax
                               ret
SOUND ENDP


BALL_SPEED_LEVELS PROC
                               CMP         SCORE, 5                           ;IF SCORE REACH 12 ===> INCREASE BALL SPEED
                               JE          POWER_LEVEL1

                               CMP         SCORE, 15
                               JE          POWER_LEVEL2

                               CMP         SCORE, 25                          ;IF SCORE REACH 12 ===> INCREASE BALL SPEED
                               JE          POWER_LEVEL3
                               JMP         CONTTT

    POWER_LEVEL1:              
                               MOV         AX, 2H
                               MOV         BX, 5H
                               MOV         BALL_SPEED_X, AX
                               MOV         BALL_SPEED_Y, BX
                               MOV         STRING_COLOR, 0FH
                               MOV         BORDER_COLOR, 12
                               CALL        DRAW_BORDER_LEVELS
                               MOV         BX, 200
    PAUSE11:                   
                               MOV         CX, 9500
    PAUSE21:                   
                               DEC         CX
                               JNE         PAUSE21
                               DEC         BX
                               JNE         PAUSE11
                               MOV         STRING_COLOR, 00H
                               MOV         BORDER_COLOR, 0
                               CALL        DRAW_BORDER_LEVELS
                               JMP         CONTTT


    POWER_LEVEL2:              
                               MOV         AX, 3H
                               MOV         BX, 6H
                               MOV         BALL_SPEED_X, AX
                               MOV         BALL_SPEED_Y, BX
                               MOV         STRING_COLOR, 0FH
                               MOV         BORDER_COLOR, 12
                               CALL        DRAW_BORDER_LEVELS
                               MOV         BX, 200
    PAUSE12:                   
                               MOV         CX, 9500
    PAUSE22:                   
                               DEC         CX
                               JNE         PAUSE22
                               DEC         BX
                               JNE         PAUSE12
                               MOV         STRING_COLOR, 00H
                               MOV         BORDER_COLOR, 0
                               CALL        DRAW_BORDER_LEVELS
                               JMP         CONTTT


    POWER_LEVEL3:              
                               MOV         AX, 3H
                               MOV         BX, 7H
                               MOV         BALL_SPEED_X, AX
                               MOV         BALL_SPEED_Y, BX
                               MOV         STRING_COLOR, 0FH
                               MOV         BORDER_COLOR, 12
                               CALL        DRAW_BORDER_LEVELS
                               MOV         BX, 200
    PAUSE13:                   
                               MOV         CX, 9500
    PAUSE23:                   
                               DEC         CX
                               JNE         PAUSE23
                               DEC         BX
                               JNE         PAUSE13
                               MOV         STRING_COLOR, 00H
                               MOV         BORDER_COLOR, 0
                               CALL        DRAW_BORDER_LEVELS

    CONTTT:                    
                               RET
BALL_SPEED_LEVELS ENDP


DRAWING_BALL PROC

                    
                               MOV         CX, BALL_POSITION_X                ;SET THE COLUMN POSITION OF THE PIXEL
                               MOV         DX, BALL_POSITION_Y                ;SET THE ROW POSITION OF THE PIXEL
                               MOV         AL, BALL_COLOR                     ;COLOR OF THE PIXEL IS RED
                               MOV         AH, 0CH                            ;DRAW PIXEL COMMMAND
    DRAW_HORIZONTAL:           INT         10H
                               INC         CX                                 ;INCREMENT THE SIZE IN X DIRECTION
                               MOV         BX, CX                             ;TO PRESERVE THE VALUE IN THE CX
                               SUB         BX, BALL_POSITION_X                ;GET THE DIFFERENCE
                               CMP         BX, BALL_SIZE                      ;CMPARE THE DIFFERENCE WITH THE BALL SIZE
                               JL          DRAW_HORIZONTAL


                               INC         DX                                 ;INCREMENT THE SIZE IN THE Y DIRECTION
                               MOV         CX, BALL_POSITION_X                ;SET THE X DIRECTION AGAIN
                               MOV         BX, DX
                               SUB         BX, BALL_POSITION_Y                ;GET THE DIFFERENCE
                               CMP         BX, BALL_SIZE
                               JL          DRAW_HORIZONTAL                    ;IF THE SIZE IN THE Y DIRECTION NOT COMPLETED WILL GO AGAIN TO DRAW IN THE X DIRECTION
                               RET                                            ;ELSE WILL RETURN

DRAWING_BALL ENDP

DRAW_ALL_BRICKS PROC
                               MOV         CRNT_BRICK,0                       ;INITIALIZE THE BIRCKS COUNTER
                               MOV         CX,0                               ;INITIALIZE THE COLUMNS COUNTER
                               MOV         DX,0                               ;INITIALIZE THE ROWS COUNTER
    DRAWIT:                    
                               CALL        DRAWBRICK
                               ADD         COL,STEP_PER_ROW
                               INC         CRNT_BRICK
                               INC         CX
                               CMP         CX,BRICKS_PER_ROW
                               JL          DRAWIT                             ;(IF CX >= BRICKS_PER_ROW ) BREAK
                               MOV         CX,0                               ;REINITIALIZE THE COLUMNS COUNTER
                               INC         DX
                               MOV         COL,FIRST_COL_POS                  ;MOVE TO THE NEXT POSITION TO DRAW THE NEXT BRICK (MOVE TO THE NEXT ROW)
                               ADD         ROW,STEP_PER_COL
                               CMP         DX,TOTAL_ROWS
                               JL          DRAWIT                             ;(IF DX >= BRICKS_PER_COL ) BREAK
                               MOV         ROW,FIRST_ROW_POS                  ;RESET ROWS & COL TO ITS INITIAL POSITION
                               MOV         COL,FIRST_COL_POS
                               RET
DRAW_ALL_BRICKS ENDP



DRAWBRICK PROC
                               push        DX
                               push        CX
                               PUSH        AX
                               PUSH        BX
                               mov         ax,ROW                             ;==>column number
                               mov         bx,320                             ;bx=320
                               mul         bx                                 ;ax=ax*bx
                               add         ax,COL                             ;ax==>in now target pixel to draw
                               MOV         SI,AX                              ; CALC THE POSITION OF THE FIRST PIXEL IN THE VIDEO MEMORY
                               MOV         DI,CRNT_BRICK
                               mov         bl,[COLOR_MATRIX+DI]               ;STORE THE COLOR OF THE CRNT BRICK
                               mov         cx,0                               ;INITIALIZE COLUMNS COUNTER (COUNTER FOR NUMBER OF PIXELS PER ROW PRE BRICK)
                               mov         dx,0                               ;INITIALIZE ROWS COUNTER (COUNTER FOR NUMBER OF ROWS PRE BRICK)
    draw:                      mov         es:[si],bl                         ;COLOR THIS PIXEL
                               inc         si                                 ;GO RIGHT
                               inc         CX
                               cmp         cx,BRICK_WIDTH
                               jl          draw                               ;(IF CX >= BRICKS_WIDTH ) BREAK
                               add         si,320                             ;GO DOWN (GO TO THE NEXT ROW)
                               sub         si, BRICK_WIDTH                    ;GO TO BACK TO THE START OF THE BRICK
                               INC         DX
                               MOV         CX,0                               ;RESET COLUMNS COUNTER
                               CMP         DX,BRICK_HEIGHT
                               jl          draw                               ;(IF DX >= BRICK_HEIGHT ) BREAK
                               POP         BX
                               POP         AX
                               pop         CX
                               pop         DX
                               ret
DRAWBRICK ENDP


Move_Paddle PROC
                               push        DX
                               push        CX
                               PUSH        AX
                               PUSH        BX

                               MOV         AH, 01h                            ; Function to check if a key is pressed
                               INT         16h                                ; Call BIOS interrupt
                               JZ          NoKey                              ; Jump if no key is pressed (ZF = 1)
    ; Code to handle key press
                               JMP         Done

    NoKey:                     
                               JMP         rett

    Done:                      

    ; Read the key
                               MOV         AH, 0h
                               INT         16h
                               MOV         sendChar,ax
    ;check for send
                             CMP IS_MULTI,0
                            JE checkPressed
                               mov         dx,3FDH                            ; Line Status Register
                               In          al , dx                            ;Read Line Status
                               test        al , 00100000b
                               jz          checkPressed                       ;Not empty
                               mov         dx , 3F8H                          ; Transmit data register
                               mov         al,BYTE PTR sendChar + 1           ; put the data into al
                               out         dx , al                            ; sending the data

           
    ; Check for left arrow (E0 4B)
    checkPressed:              
                               CMP         BYTE PTR sendChar + 1, 19h         ; Compare scancode
                               JE          p_press                            ; Jump if P button


                               CMP         BYTE PTR sendChar + 1, 4Bh         ; Compare scancode (AL contains scancode without E0 prefix)
                               JE          left_pressed                       ; Jump if Left Arrow
                  
    ; Check for right arrow (E0 4D)
                               CMP         BYTE PTR sendChar + 1, 4Dh         ; Compare scancode (AL contains scancode without E0 prefix)
                               JE          right_pressed                      ; Jump if Right Arrow
                   
                               JMP         rett
                               
                               
                                                  
    p_press:                   
                               MOV         is_P_pressed,1
                               JMP         rett                               ; Return to polling
            
    left_pressed:              
                   
    ; Check for the boundries
                               MOV         BX,Paddle_Speed
                               SUB         Paddle_X,BX
                               MOV         AX,RightBoundry
                               CMP         Paddle_X,AX
                               JB          Maintain_Right_Boundry
                               JMP         rett                               ; Return to polling
                   
    right_pressed:             
                               MOV         BX,Paddle_Speed
                               ADD         Paddle_X,BX
                               MOV         AX,LeftBoundry
                               MOV         CX,Paddle_X
                               ADD         CX, width_Paddle
                               CMP         CX,AX
                               JA          Maintain_Left_Boundry
                               JMP         rett

     
     	                 
    Maintain_Right_Boundry:    
                               MOV         AX,RightBoundry
                               MOV         Paddle_X,AX
                               JMP         rett
                   
    Maintain_Left_Boundry:     
                               MOV         AX,LeftBoundry
                               SUB         AX,width_Paddle
                               MOV         Paddle_X,AX
                               JMP         rett


    rett:                      
                               POP         BX
                               POP         AX
                               pop         CX
                               pop         DX
                               RET

Move_Paddle endp
    
                  
           
clear_Paddle PROC
                               push        DX
                               push        CX
                               PUSH        AX
                               PUSH        BX
               

    ; the coordinates of the paddle
	                 
                               MOV         CX,Paddle_X
                               MOV         DX,Paddle_Y
	                 	                 
		
    clear_Paddle_hori:         
                               MOV         BX,width_Paddle
	                 
 	
    clear_Paddle_ver:          
    ; AL = Color, BH = Page Number, CX = x, DX = y
                               MOV         AH,0CH
                               MOV         AL,00
                               PUSH        BX
                               MOV         BH,00
                               INT         10h
                               INC         CX
                               POP         BX
                               DEC         BL
                               JNZ         clear_Paddle_ver
                               MOV         CX,Paddle_X
                               INC         DX
                               CMP         DX,199
                               JNZ         clear_Paddle_hori
	    
                               POP         BX
                               POP         AX
                               pop         CX
                               pop         DX
                           
                               RET
clear_Paddle endp

Draw_Paddle PROC
                               push        DX
                               push        CX
                               PUSH        AX
                               PUSH        BX
               

    ; the coordinates of the paddle
	                 
                               MOV         CX,Paddle_X
                               MOV         DX,Paddle_Y
	                 	                 
		
    draw_Paddle_hori:          
                               MOV         BX,width_Paddle
	                 
 	
    draw_Paddle_ver:           
    ; AL = Color, BH = Page Number, CX = x, DX = y
                               MOV         AH,0CH
                               MOV         AL,Paddle_Color
                               PUSH        BX
                               MOV         BH,00
                               INT         10h
                               INC         CX
                               POP         BX
                               DEC         BL
                               JNZ         draw_Paddle_ver
                               MOV         CX,Paddle_X
                               INC         DX
                               CMP         DX,199
                               JNZ         draw_Paddle_hori
	    
                               POP         BX
                               POP         AX
                               pop         CX
                               pop         DX
                           
                               RET
Draw_Paddle endp




    ;;;;;;;;;;;; PowerUp's & Down's
Duplicate_Paddle_Velocity PROC
                               PUSH        AX
                               MOV         AX,Paddle_Speed
                               ADD         Paddle_Speed,AX
                               POP         AX
                               RET
Duplicate_Paddle_Velocity endp

Halv_Paddle_Velocity PROC
                               PUSH        AX
                               MOV         AX,Paddle_Speed
                               SHR         AX,1
                               MOV         Paddle_Speed,AX
                               POP         AX
                               RET
Halv_Paddle_Velocity endp

Duplicate_Paddle_Size PROC
                               PUSH        AX
                               PUSH        CX
                               PUSH        BX

                               MOV         BX, Paddle_X
                               MOV         AX,Paddle_X
                               MOV         CX ,width_Paddle
                               SHR         CX,1
                               SUB         AX,CX
                               MOV         Paddle_X,AX
                               
                               MOV         AX, width_Paddle
                               ADD         AX,AX
                               mov         width_Paddle,AX

                               CMP         AX, Max_size
                               JG          Reset_MaxSize
                               JMP         RET___
    Reset_MaxSize:             
                               MOV         Paddle_X,BX
                               MOV         AX, Max_size
                               mov         width_Paddle,AX

    RET___:                    POP         BX
                               POP         CX
                               POP         AX
                               RET
Duplicate_Paddle_Size endp
Duplicate_Paddle_Size2 PROC
                               PUSH        AX
                               PUSH        CX
                               PUSH        BX

                               MOV         BX, Paddle_X2
                               MOV         AX,Paddle_X2
                               MOV         CX ,width_Paddle2
                               SHR         CX,1
                               SUB         AX,CX
                               MOV         Paddle_X2,AX
                               
                               MOV         AX, width_Paddle2
                               ADD         AX,AX
                               mov         width_Paddle2,AX

                               CMP         AX, Max_size
                               JG          Reset_MaxSize2
                               JMP         RET___2

    Reset_MaxSize2:            MOV         Paddle_X2,BX
                               MOV         AX, Max_size
                               mov         width_Paddle2,AX

    RET___2:                   POP         BX
                               POP         CX
                               POP         AX
                               RET
Duplicate_Paddle_Size2 endp

Halv_Paddle_Size PROC
                               PUSH        AX
                               PUSH        CX
                               PUSH        BX
                               
                               MOV         BX, Paddle_X
                               MOV         AX,Paddle_X
                               MOV         CX ,width_Paddle
                               SHR         CX,1
                               SHR         CX,1
                               ADD         AX,CX
                               MOV         Paddle_X,AX

                               MOV         AX,width_Paddle
                               SHR         AX,1
                               MOV         width_Paddle,AX

                               CMP         AX, Min_size
                               JB          Reset_MinSize
                               JMP         RETT_
    Reset_MinSize:             
                               MOV         Paddle_X,BX
                               MOV         AX, Min_size
                               mov         width_Paddle,AX

    RETT_:                     
                               POP         BX
                               POP         CX
                               POP         AX
                               RET
Halv_Paddle_Size endp

Halv_Paddle_Size2 PROC
                               PUSH        AX
                               PUSH        CX
                               PUSH        BX
                               
                               MOV         BX, Paddle_X2
                               MOV         AX,Paddle_X2
                               MOV         CX ,width_Paddle2
                               SHR         CX,1
                               SHR         CX,1
                               ADD         AX,CX
                               MOV         Paddle_X2,AX

                               MOV         AX,width_Paddle2
                               SHR         AX,1
                               MOV         width_Paddle2,AX

                               CMP         AX, Min_size
                               JB          Reset_MinSize2
                               JMP         RETT_2
    Reset_MinSize2:            
                               MOV         Paddle_X2,BX
                               MOV         AX, Min_size
                               mov         width_Paddle2,AX

    RETT_2:                    
                               POP         BX
                               POP         CX
                               POP         AX
                               RET
Halv_Paddle_Size2 endp

    ;;;;;;;;;;;;;;;;;;;

    ;;;;;;
Move_Power_UP PROC
    
                               PUSH        AX
    ;;;;;;;;;;;;;;;; Check PowerUP-Paddle collision


                               MOV         AX,Paddle_Y
                               SUB         AX, PowerUpHeight                  ; check for y-axis
                               CMP         PowerUp_Y,AX
                               JB          StillAbove

                               MOV         AX,Paddle_X                        ; check for x-axis for the first paddle
                               CMP         PowerUp_X,AX
                               JB          check_2nd_player
                               ADD         AX,width_Paddle
                               CMP         PowerUp_X,AX
                               JBE         COLLIDE_POWERUP1
    ;    JMP  NOT_COLLIDE_POWERUP

    check_2nd_player:          MOV         AX,Paddle_X2                       ; check for x-axis for the second paddle
                               CMP         PowerUp_X,AX
                               JB          NOT_COLLIDE_POWERUP
                               ADD         AX,width_Paddle2
                               CMP         PowerUp_X,AX
                               JBE         COLLIDE_POWERUP2
                               JMP         NOT_COLLIDE_POWERUP


    StillAbove:                                                               ; the powerUp is above the paddle
                               MOV         AX,PowerUp_Speed
                               ADD         PowerUp_Y,AX
                               JMP         _ret

    NOT_COLLIDE_POWERUP:       
                               MOV         IsPowerUp_pre,0
                               JMP         _ret
    COLLIDE_POWERUP1:          
                               MOV         IsPowerUp_pre,0
                               CALL        clear_Paddle
                               CALL        Duplicate_Paddle_Size              ;Power up
                               JMP         _ret
    COLLIDE_POWERUP2:          
                               MOV         IsPowerUp_pre,0
                               CALL        clear_Paddle2
                               CALL        Duplicate_Paddle_Size2             ;Power up
    ;    CALL Draw_Paddle
    _ret:                      
                               POP         AX
                               RET

Move_Power_UP endp

Move_Power_Down PROC
    
                               PUSH        AX
    ;;;;;;;;;;;;;;;; Check PowerDOWN-Paddle collision


                               MOV         AX,Paddle_Y
                               SUB         AX, PowerDownHeight                ; check for y-axis
                               CMP         PowerDown_Y,AX
                               JB          StillAbove_Down

                               MOV         AX,Paddle_X                        ; check for x-axis
                               CMP         PowerDown_X,AX
                               JB          check_2nd_player_down
                               ADD         AX,width_Paddle
                               CMP         PowerDown_X,AX
                               JBE         COLLIDE_POWERDOWN1
    ;    JMP  check_2nd_player_down


    check_2nd_player_down:     MOV         AX,Paddle_X2                       ; check for x-axis
                               CMP         PowerDown_X,AX
                               JB          NOT_COLLIDE_POWERDOWN
                               ADD         AX,width_Paddle2
                               CMP         PowerDown_X,AX
                               JBE         COLLIDE_POWERDOWN2
                               JMP         NOT_COLLIDE_POWERDOWN


    StillAbove_Down:                                                          ; the powerDown is above the paddle
                               MOV         AX,PowerDown_Speed
                               ADD         PowerDown_Y,AX
                               POP         AX
                               RET

    NOT_COLLIDE_POWERDOWN:     
                               MOV         IsPowerDown_pre,0
                               POP         AX
                               RET
    COLLIDE_POWERDOWN1:        
                               MOV         IsPowerDown_pre,0
                               CALL        clear_Paddle
                               CALL        Halv_Paddle_Size                   ;Power up
                               POP         AX
                               RET
    COLLIDE_POWERDOWN2:        
                               MOV         IsPowerDown_pre,0
                               CALL        clear_Paddle2
                               CALL        Halv_Paddle_Size2                  ;Power up
                               POP         AX
                               RET

Move_Power_Down endp
    ;;;;;;;

    
Clear_PowerUp PROC
    
                               push        DX
                               push        CX
                               PUSH        AX
                               PUSH        BX


                               MOV         CX,PowerUp_X
                               MOV         DX,PowerUp_Y
    
    ClearUP_hori:              
                               MOV         BX,PowerUpWidth
	                      
 	
    ClearUP_ver:               
    ; AL = Color, BH = Page Number, CX = x, DX = y
                               MOV         AH,0CH
                               MOV         AL,00H                             ; Green Shape
                               PUSH        BX
                               MOV         BH,00
                               INT         10h
                               INC         CX
                               POP         BX
                               DEC         BX
                               JNZ         ClearUP_ver
                               MOV         CX,PowerUp_X
                               INC         DX
                               MOV         AX,PowerUp_Y
                               ADD         AX,PowerUpHeight
                               CMP         DX,AX
                               JNZ         ClearUP_hori

                               POP         BX
                               POP         AX
                               pop         CX
                               pop         DX

                               RET
Clear_PowerUp ENDP



Draw_PowerUp PROC
    
                               push        DX
                               push        CX
                               PUSH        AX
                               PUSH        BX


                               MOV         CX,PowerUp_X
                               MOV         DX,PowerUp_Y
    
    drawUP_hori:               
                               MOV         BX,PowerUpWidth
	                      
 	
    drawUP_ver:                
    ; AL = Color, BH = Page Number, CX = x, DX = y
                               MOV         AH,0CH
                               MOV         AL,02H                             ; Green Shape
                               PUSH        BX
                               MOV         BH,00
                               INT         10h
                               INC         CX
                               POP         BX
                               DEC         BX
                               JNZ         drawUP_ver
                               MOV         CX,PowerUp_X
                               INC         DX
                               MOV         AX,PowerUp_Y
                               ADD         AX,PowerUpHeight
                               CMP         DX,AX
                               JNZ         drawUP_hori

                               POP         BX
                               POP         AX
                               pop         CX
                               pop         DX

                               RET
Draw_PowerUp ENDP

    
Clear_PowerDown PROC
                               push        DX
                               push        CX
                               PUSH        AX
                               PUSH        BX


                               MOV         CX,PowerDown_X
                               MOV         DX,PowerDown_Y
    
    ClearDown_hori:            
                               MOV         BX,PowerDownWidth
	                      
 	
    ClearDown_ver:             
    ; AL = Color, BH = Page Number, CX = x, DX = y
                               MOV         AH,0CH
                               MOV         AL,00H                             ; Black Shape
                               PUSH        BX
                               MOV         BH,00
                               INT         10h
                               INC         CX
                               POP         BX
                               DEC         BX
                               JNZ         ClearDown_ver
                               MOV         CX,PowerDown_X
                               INC         DX
                               MOV         AX,PowerDown_Y
                               ADD         AX,PowerDownHeight
                               CMP         DX,AX
                               JNZ         ClearDown_hori


                               POP         BX
                               POP         AX
                               pop         CX
                               pop         DX

                               RET
Clear_PowerDown ENDP


Draw_PowerDown PROC
                               push        DX
                               push        CX
                               PUSH        AX
                               PUSH        BX


                               MOV         CX,PowerDown_X
                               MOV         DX,PowerDown_Y
    
    drawDown_hori:             
                               MOV         BX,PowerDownWidth
	                      
 	
    drawDown_ver:              
    ; AL = Color, BH = Page Number, CX = x, DX = y
                               MOV         AH,0CH
                               MOV         AL,04H                             ; Red Shape
                               PUSH        BX
                               MOV         BH,00
                               INT         10h
                               INC         CX
                               POP         BX
                               DEC         BX
                               JNZ         drawDown_ver
                               MOV         CX,PowerDown_X
                               INC         DX
                               MOV         AX,PowerDown_Y
                               ADD         AX,PowerDownHeight
                               CMP         DX,AX
                               JNZ         drawDown_hori


                               POP         BX
                               POP         AX
                               pop         CX
                               pop         DX

                               RET
Draw_PowerDown ENDP


Clear_UP_ARROW PROC
                               push        DX
                               push        CX
                               PUSH        AX
                               PUSH        BX
                              
                               MOV         CX,PowerUp_X                       ; Set X position to the vertex of the arrow
                               MOV         DX,PowerUpWidth
                               SHR         DX,1
                               ADD         CX,DX
                               MOV         DX,PowerUp_Y                       ; Set Y position to the vertex of the arrow
                               ADD         DX,2
    
    loopUp_Clear:                                                             ; Clear the first line in the first arrow
    ; AL = Color, BH = Page Number, CX = x, DX = y
                               MOV         AH,0CH
                               MOV         AL,00H
                               MOV         BH,00
                               INT         10h
                               INC         CX
                               INC         DX
                               MOV         AX, PowerUp_Y
                               ADD         AX,PowerUpHeight
                               SUB         AX, 3
                               CMP         DX,AX
                               JB          loopUp_Clear
                            
                            
                            
                                    
                               MOV         CX,PowerUp_X                       ; Set X position to the vertex of the arrow
                               MOV         DX,PowerUpWidth
                               SHR         DX,1
                               ADD         CX,DX
                               MOV         DX,PowerUp_Y                       ; Set Y position to the vertex of the arrow
                               ADD         DX,2
    
    loopUpInv_Clear:                                                          ; Clear the second line in the first arrow
    ; AL = Color, BH = Page Number, CX = x, DX = y
                               MOV         AH,0CH
                               MOV         AL,00H
                               MOV         BH,00
                               INT         10h
                               DEC         CX
                               INC         DX
                               MOV         AX, PowerUp_Y
                               ADD         AX,PowerUpHeight
                               SUB         AX, 3
                               CMP         DX,AX
                               JB          loopUpInv_Clear
                           
                           
                           
     
                               MOV         CX,PowerUp_X                       ; Set X position to the vertex of the arrow
                               MOV         DX,PowerUpWidth
                               SHR         DX,1
                               ADD         CX,DX
                               MOV         DX,PowerUp_Y                       ; Set  Y position to the vertex of the arrow
                               ADD         DX,4
    
    loopUp2_Clear:                                                            ; Clear the first line in the second arrow
    ; AL = Color, BH = Page Number, CX = x, DX = y
                               MOV         AH,0CH
                               MOV         AL,00H
                               MOV         BH,00
                               INT         10h
                               INC         CX
                               INC         DX
                               MOV         AX, PowerUp_Y
                               ADD         AX,PowerUpHeight
                               SUB         AX, 5
                               CMP         DX,AX
                               JB          loopUp2_Clear
                            
                            
                            
   
                               MOV         CX,PowerUp_X                       ; Set X position to the vertex of the arrow
                               MOV         DX,PowerUpWidth
                               SHR         DX,1
                               ADD         CX,DX
                               MOV         DX,PowerUp_Y                       ; Set Y position to the vertex of the arrow
                               ADD         DX,4
    
    loopUpInv2_Clear:                                                         ; Clear the second line in the second arrow
    ; AL = Color, BH = Page Number, CX = x, DX = y
                               MOV         AH,0CH
                               MOV         AL,00H
                               MOV         BH,00
                               INT         10h
                               DEC         CX
                               INC         DX
                               MOV         AX, PowerUp_Y
                               ADD         AX,PowerUpHeight
                               SUB         AX, 5
                               CMP         DX,AX
                               JB          loopUpInv2_Clear
                           
                               POP         BX
                               POP         AX
                               pop         CX
                               pop         DX
        
                               RET
Clear_UP_ARROW ENDP



DRAW_UP_ARROW PROC
                               push        DX
                               push        CX
                               PUSH        AX
                               PUSH        BX
                              
                               MOV         CX,PowerUp_X                       ; Set X position to the vertex of the arrow
                               MOV         DX,PowerUpWidth
                               SHR         DX,1
                               ADD         CX,DX
                               MOV         DX,PowerUp_Y                       ; Set Y position to the vertex of the arrow
                               ADD         DX,2
    
    loopUp_:                                                                  ; Draw the first line in the first arrow
    ; AL = Color, BH = Page Number, CX = x, DX = y
                               MOV         AH,0CH
                               MOV         AL,0fH
                               MOV         BH,00
                               INT         10h
                               INC         CX
                               INC         DX
                               MOV         AX, PowerUp_Y
                               ADD         AX,PowerUpHeight
                               SUB         AX, 3
                               CMP         DX,AX
                               JB          loopUp_
                            
                            
                            
                                    
                               MOV         CX,PowerUp_X                       ; Set X position to the vertex of the arrow
                               MOV         DX,PowerUpWidth
                               SHR         DX,1
                               ADD         CX,DX
                               MOV         DX,PowerUp_Y                       ; Set Y position to the vertex of the arrow
                               ADD         DX,2
    
    loopUpInv_:                                                               ; Draw the second line in the first arrow
    ; AL = Color, BH = Page Number, CX = x, DX = y
                               MOV         AH,0CH
                               MOV         AL,0fH
                               MOV         BH,00
                               INT         10h
                               DEC         CX
                               INC         DX
                               MOV         AX, PowerUp_Y
                               ADD         AX,PowerUpHeight
                               SUB         AX, 3
                               CMP         DX,AX
                               JB          loopUpInv_
                           
                           
                           
     
                               MOV         CX,PowerUp_X                       ; Set X position to the vertex of the arrow
                               MOV         DX,PowerUpWidth
                               SHR         DX,1
                               ADD         CX,DX
                               MOV         DX,PowerUp_Y                       ; Set  Y position to the vertex of the arrow
                               ADD         DX,4
    
    loopUp2_:                                                                 ; Draw the first line in the second arrow
    ; AL = Color, BH = Page Number, CX = x, DX = y
                               MOV         AH,0CH
                               MOV         AL,0fH
                               MOV         BH,00
                               INT         10h
                               INC         CX
                               INC         DX
                               MOV         AX, PowerUp_Y
                               ADD         AX,PowerUpHeight
                               SUB         AX, 5
                               CMP         DX,AX
                               JB          loopUp2_
                            
                            
                            
   
                               MOV         CX,PowerUp_X                       ; Set X position to the vertex of the arrow
                               MOV         DX,PowerUpWidth
                               SHR         DX,1
                               ADD         CX,DX
                               MOV         DX,PowerUp_Y                       ; Set Y position to the vertex of the arrow
                               ADD         DX,4
    
    loopUpInv2_:                                                              ; Draw the second line in the second arrow
    ; AL = Color, BH = Page Number, CX = x, DX = y
                               MOV         AH,0CH
                               MOV         AL,0fH
                               MOV         BH,00
                               INT         10h
                               DEC         CX
                               INC         DX
                               MOV         AX, PowerUp_Y
                               ADD         AX,PowerUpHeight
                               SUB         AX, 5
                               CMP         DX,AX
                               JB          loopUpInv2_
                           
                               POP         BX
                               POP         AX
                               pop         CX
                               pop         DX
        
                               RET
DRAW_UP_ARROW ENDP
  
 
Clear_DOWN_ARROW PROC
    
                               push        DX
                               push        CX
                               PUSH        AX
                               PUSH        BX
    
                               MOV         CX,PowerDown_X                     ; Set X position to the vertex of the arrow
                               MOV         DX,PowerDownHeight
                               SHR         DX,1
                               ADD         CX,DX
                               MOV         DX,PowerDown_Y                     ; Set Y position to the vertex of the arrow
                               MOV         AX,PowerDownHeight
                               SUB         AX,2
                               ADD         DX,AX
    
    loopDown_Clear:                                                           ; Clear the first line in the first arrow
    ; AL = Color, BH = Page Number, CX = x, DX = y
                               MOV         AH,0CH
                               MOV         AL,00H
                               MOV         BH,00
                               INT         10h
                               INC         CX
                               DEC         DX
                               MOV         AX, PowerDown_Y
                               ADD         AX, 3
                               CMP         DX,AX
                               JG          loopDown_Clear
                            
                            
                            
                            
                            
                            
                               MOV         CX,PowerDown_X                     ; Set X position to the vertex of the arrow
                               MOV         DX,PowerDownWidth
                               SHR         DX,1
                               ADD         CX,DX
                               MOV         DX,PowerDown_Y                     ; Set Y position to the vertex of the arrow
                               MOV         AX,PowerDownHeight
                               SUB         AX,2
                               ADD         DX,AX
    
    loopDownInv_Clear:                                                        ; Clear the second line in the first arrow
    ; AL = Color, BH = Page Number, CX = x, DX = y
                               MOV         AH,0CH
                               MOV         AL,00H
                               MOV         BH,00
                               INT         10h
                               DEC         CX
                               DEC         DX
                               MOV         AX, PowerDown_Y
                               ADD         AX, 3
                               CMP         DX,AX
                               JG          loopDownInv_Clear
                     
              
                 
                               MOV         CX,PowerDown_X                     ; Set X position to the vertex of the arrow
                               MOV         DX,PowerDownWidth
                               SHR         DX,1
                               ADD         CX,DX
                               MOV         DX,PowerDown_Y                     ; Set Y position to the vertex of the arrow
                               MOV         AX,PowerDownHeight
                               SUB         AX,4
                               ADD         DX,AX
                     
                           
                           
    loopDown2_Clear:                                                          ; Clear the first line in the second arrow
    ; AL = Color, BH = Page Number, CX = x, DX = y
                               MOV         AH,0CH
                               MOV         AL,00H
                               MOV         BH,00
                               INT         10h
                               INC         CX
                               DEC         DX
                               MOV         AX, PowerDown_Y
                               ADD         AX, 4
                               CMP         DX,AX
                               JG          loopDown2_Clear
                            
                            
                               MOV         CX,PowerDown_X                     ; Set X position to the vertex of the arrow
                               MOV         DX,PowerDownWidth
                               SHR         DX,1
                               ADD         CX,DX
                               MOV         DX,PowerDown_Y                     ; Set Y position to the vertex of the arrow
                               MOV         AX,PowerDownHeight
                               SUB         AX,4
                               ADD         DX,AX
    
    loopDownInv2_Clear:                                                       ; Clear the second line in the second arrow
    ; AL = Color, BH = Page Number, CX = x, DX = y
                               MOV         AH,0CH
                               MOV         AL,00H
                               MOV         BH,00
                               INT         10h
                               DEC         CX
                               DEC         DX
                               MOV         AX, PowerDown_Y
                               ADD         AX, 4
                               CMP         DX,AX
                               JG          loopDownInv2_Clear
                           
                               POP         BX
                               POP         AX
                               pop         CX
                               pop         DX

                               RET
       
Clear_DOWN_ARROW ENDP
 
 
DRAW_DOWN_ARROW PROC
    
                               push        DX
                               push        CX
                               PUSH        AX
                               PUSH        BX
    
                               MOV         CX,PowerDown_X                     ; Set X position to the vertex of the arrow
                               MOV         DX,PowerDownHeight
                               SHR         DX,1
                               ADD         CX,DX
                               MOV         DX,PowerDown_Y                     ; Set Y position to the vertex of the arrow
                               MOV         AX,PowerDownHeight
                               SUB         AX,2
                               ADD         DX,AX
    
    loopDown_:                                                                ; Draw the first line in the first arrow
    ; AL = Color, BH = Page Number, CX = x, DX = y
                               MOV         AH,0CH
                               MOV         AL,0fH
                               MOV         BH,00
                               INT         10h
                               INC         CX
                               DEC         DX
                               MOV         AX, PowerDown_Y
                               ADD         AX, 3
                               CMP         DX,AX
                               JG          loopDown_
                            
                            
                            
                            
                            
                            
                               MOV         CX,PowerDown_X                     ; Set X position to the vertex of the arrow
                               MOV         DX,PowerDownWidth
                               SHR         DX,1
                               ADD         CX,DX
                               MOV         DX,PowerDown_Y                     ; Set Y position to the vertex of the arrow
                               MOV         AX,PowerDownHeight
                               SUB         AX,2
                               ADD         DX,AX
    
    loopDownInv_:                                                             ; Draw the second line in the first arrow
    ; AL = Color, BH = Page Number, CX = x, DX = y
                               MOV         AH,0CH
                               MOV         AL,0fH
                               MOV         BH,00
                               INT         10h
                               DEC         CX
                               DEC         DX
                               MOV         AX, PowerDown_Y
                               ADD         AX, 3
                               CMP         DX,AX
                               JG          loopDownInv_
                     
              
                 
                               MOV         CX,PowerDown_X                     ; Set X position to the vertex of the arrow
                               MOV         DX,PowerDownWidth
                               SHR         DX,1
                               ADD         CX,DX
                               MOV         DX,PowerDown_Y                     ; Set Y position to the vertex of the arrow
                               MOV         AX,PowerDownHeight
                               SUB         AX,4
                               ADD         DX,AX
                     
                           
                           
    loopDown2_:                                                               ; Draw the first line in the second arrow
    ; AL = Color, BH = Page Number, CX = x, DX = y
                               MOV         AH,0CH
                               MOV         AL,0fH
                               MOV         BH,00
                               INT         10h
                               INC         CX
                               DEC         DX
                               MOV         AX, PowerDown_Y
                               ADD         AX, 4
                               CMP         DX,AX
                               JG          loopDown2_
                            
                            
                               MOV         CX,PowerDown_X                     ; Set X position to the vertex of the arrow
                               MOV         DX,PowerDownWidth
                               SHR         DX,1
                               ADD         CX,DX
                               MOV         DX,PowerDown_Y                     ; Set Y position to the vertex of the arrow
                               MOV         AX,PowerDownHeight
                               SUB         AX,4
                               ADD         DX,AX
    
    loopDownInv2_:                                                            ; Draw the second line in the second arrow
    ; AL = Color, BH = Page Number, CX = x, DX = y
                               MOV         AH,0CH
                               MOV         AL,0fH
                               MOV         BH,00
                               INT         10h
                               DEC         CX
                               DEC         DX
                               MOV         AX, PowerDown_Y
                               ADD         AX, 4
                               CMP         DX,AX
                               JG          loopDownInv2_
                           
                               POP         BX
                               POP         AX
                               pop         CX
                               pop         DX

                               RET
       
DRAW_DOWN_ARROW ENDP
 
DISPLAY_STATS PROC

                               push        ax
                               push        bx
                               push        cx
                               push        dx

    ;       Shows the score text
                               MOV         AH,02h                             ;set cursor position
                               MOV         BH,00h                             ;set page number
                               MOV         DH,0h                              ;set row
                               MOV         DL,1h                              ;set column
                               INT         10h

                               MOV         AH,09h                             ;WRITE STRING
                               LEA         DX, TEXT_SCORE                     ;give DX a pointer
                               INT         21h                                ;print the string

                               MOV         AH,02h                             ;set cursor position
                               MOV         BH,00h                             ;set page number
                               MOV         DH,0h                              ;set row
                               MOV         DL,8h                              ;set column
                               INT         10h

    ;Display Score Value
                               MOV         AL, SCORE
                               MOV         AH,0
                               CALL        PRINT_NUMBER

    ;       Shows the lives text
                               MOV         AH,02h                             ;set cursor position
                               MOV         BH,00h                             ;set page number
                               MOV         DH,0h                              ;set row
                               MOV         DL,20h                             ;set column
                               INT         10h
                            
                               MOV         AH,09h                             ;WRITE STRING
                               LEA         DX, TEXT_LIVES                     ;give DX a pointer
                               INT         21h                                ;print the string

                               MOV         AH,02h                             ;set cursor position
                               MOV         BH,00h                             ;set page number
                               MOV         DH,0h                              ;set row
                               MOV         DL,27h                             ;set column
                               INT         10h

    ;Display Lives Value
                               MOV         AL, LIVES
                               MOV         AH,0
                               CALL        PRINT_NUMBER



                               pop         dx
                               pop         cx
                               pop         bx
                               pop         ax
                               RET
DISPLAY_STATS ENDP

PRINT_NUMBER PROC
                               PUSH        AX
                               PUSH        BX
                               PUSH        CX
                               PUSH        DX

                               MOV         CX,0                               ; Clear CX (digit counter)
    CONVERT_LOOP:              
                               MOV         DX,0                               ; Clear DX (remainder)
                               MOV         BX, 10                             ; Base 10
                               DIV         BX                                 ; Divide AX by 10
                               PUSH        DX                                 ; Push remainder (digit)
                               INC         CX                                 ; Increment digit counter
                               ADD         AX, 0                              ; Check if quotient is 0
                               JNZ         CONVERT_LOOP                       ; Repeat if not

    PRINT_DIGITS:              
                               POP         DX                                 ; Get next digit
                               ADD         DL, '0'                            ; Convert to ASCII
                               MOV         AH, 02h                            ; Function to print character
                               INT         21h                                ; Print digit
                               LOOP        PRINT_DIGITS                       ; Repeat for all digits

                               POP         DX
                               POP         CX
                               POP         BX
                               POP         AX
                               RET
PRINT_NUMBER ENDP

DRAW_WHITE_LINE PROC
                               push        AX
                               push        BX
                               push        CX
                               push        DX

    ; Draw a horizontal white line
                               MOV         CX, 320                            ; Number of pixels in a row
                               MOV         DX, 10                             ; Row position (y-coordinate)
                               MOV         AL, 15                             ; Color (white)
                               MOV         AH, 0Ch                            ; Function to write pixel

    DRAW_LINE_LOOP:            
                               MOV         BX, CX                             ; Set column position (x-coordinate)
                               INT         10h                                ; Draw pixel
                               DEC         CX
                               JNZ         DRAW_LINE_LOOP

                               pop         DX
                               pop         CX
                               pop         BX
                               pop         AX
                               RET
DRAW_WHITE_LINE ENDP


Clear_Paddle2 PROC
                               push        DX
                               push        CX
                               PUSH        AX
                               PUSH        BX


    ; the coordinates of the paddle

                               MOV         CX,Paddle_X2
                               MOV         DX,Paddle_Y2


    clear_Paddle_hori2:        
                               MOV         BX,width_Paddle2


    clear_Paddle_ver2:         
    ; AL = Color, BH = Page Number, CX = x, DX = y
                               MOV         AH,0CH
                               MOV         AL,00
                               PUSH        BX
                               MOV         BH,00
                               INT         10h
                               INC         CX
                               POP         BX
                               DEC         BL
                               JNZ         clear_Paddle_ver2
                               MOV         CX,Paddle_X2
                               INC         DX
                               CMP         DX,199
                               JNZ         clear_Paddle_hori2

                               POP         BX
                               POP         AX
                               pop         CX
                               pop         DX

                               RET
Clear_Paddle2 endp

Draw_Paddle2 PROC
                               push        DX
                               push        CX
                               PUSH        AX
                               PUSH        BX


    ; the coordinates of the paddle

                               MOV         CX,Paddle_X2
                               MOV         DX,Paddle_Y2


    draw_Paddle_hori2:         
                               MOV         BX,width_Paddle2


    draw_Paddle_ver2:          
    ; AL = Color, BH = Page Number, CX = x, DX = y
                               MOV         AH,0CH
                               MOV         AL,Paddle_Color2
                               PUSH        BX
                               MOV         BH,00
                               INT         10h
                               INC         CX
                               POP         BX
                               DEC         BL
                               JNZ         draw_Paddle_ver2
                               MOV         CX,Paddle_X2
                               INC         DX
                               CMP         DX,199
                               JNZ         draw_Paddle_hori2

                               POP         BX
                               POP         AX
                               pop         CX
                               pop         DX

                               RET
Draw_Paddle2 endp

Move_Paddle2 PROC
                               push        DX
                               push        CX
                               PUSH        AX
                               PUSH        BX
    
                               mov         dx , 3FDH                          ; Line Status Register
                               in          al , dx
                               test        al , 1
                               jz          retPaddle2

                               mov         dx , 03F8H
                               in          al , dx
                               MOV         recChar, 0h
                               mov         BYTE PTR recChar,al                ;check if the received data is sec key then terminate the programme
             
    ; Check for left arrow (E0 4B)
                               CMP         BYTE PTR recChar, 4Bh              ; Compare scancode (AL contains scancode without E0 prefix)
                               JE          left_pressed2                      ; Jump if Left Arrow
                    
    ; Check for right arrow (E0 4D)
                               CMP         BYTE PTR recChar, 4Dh              ; Compare scancode (AL contains scancode without E0 prefix)
                               JE          right_pressed2                     ; Jump if Right Arrow
                     
                               JMP         retPaddle2                         ; Return to polling
                            
    left_pressed2:             
                     
    ; Check for the boundries
                               MOV         BX,Paddle_Speed2
                               SUB         Paddle_X2,BX
                               MOV         AX,RightBoundry
                               CMP         Paddle_X2,AX
                               JB          Maintain_Right_Boundry2
                               JMP         retPaddle2                         ; Return to polling
                     
    right_pressed2:            
                               MOV         BX,Paddle_Speed2
                               ADD         Paddle_X2,BX
                               MOV         AX,LeftBoundry
                               MOV         CX,Paddle_X2
                               ADD         CX, width_Paddle2
                               CMP         CX,AX
                               JA          Maintain_Left_Boundry2
                               JMP         rett
         	                 
    Maintain_Right_Boundry2:   
                               MOV         AX,RightBoundry
                               MOV         Paddle_X2,AX
                               JMP         retPaddle2
                         
    Maintain_Left_Boundry2:    
                               MOV         AX,LeftBoundry
                               SUB         AX,width_Paddle2
                               MOV         Paddle_X2,AX
                               JMP         rett
                            

    retPaddle2:                
                               POP         BX
                               POP         AX
                               pop         CX
                               pop         DX
                               RET
Move_Paddle2 endp
Lose_Life PROC
                               CMP         LIVES,1
                               JNE         DEC_LIVES
                               DEC         LIVES
                               CALL        CLEARING_SCREEN
                               MOV         LOSE_OR_WIN, 0
                               CALL        DRAW_FINAL_SCREEN
                               RET
    DEC_LIVES:                 
                               DEC         LIVES
                               CALL        RESET_GAME
                               CMP         LIVES, 0
                               JNE         REEETT

                            

    REEETT:                    
                               RET
Lose_Life ENDP


RESET_GAME PROC

    ; CALL MOVING_BALL
    ; MOV  BALL_COLOR, 00H
    ; MOV  BALL_COLOR, 0FH
     
                               MOV         BALL_POSITION_X  ,      160D
                               MOV         BALL_POSITION_Y  ,      185D
                               MOV         BALL_SPEED_X,1
                               MOV         BALL_SPEED_Y,3
    ;    MOV  BALL_SPEED_Y     ,       3H        ;THE SPEED OF THE BALL IN Y DIRECTION
    ;    MOV  BALL_SPEED_X      ,      1H
    ;    mov  BALL_POWER_UP  , 0
    ;    mov  BALL_POWER_DOWN     , 0

    
    ; CALL MOVING_BALL

    ; CALL DRAWING_BALL

    ; call CLEARING_SCREEN
                               CALL        clear_Paddle
                               MOV         Paddle_X         ,      135D
                               MOV         Paddle_Y         ,      196D
                               MOV         width_Paddle     ,      50d
                               MOV         height_Paddle    ,      4d
                               MOV         Paddle_Speed     ,      6
                               CALL        Draw_Paddle
                               MOV         width_Paddle2     ,      0d
                               CMP         IS_MULTI,1
                               JNE         RESET_NOT_MULT

                               CALL        clear_Paddle2
                               MOV         Paddle_X2         ,      135D
                               MOV         Paddle_Y2        ,      196D
                               MOV         height_Paddle2    ,      4d
                               MOV         width_Paddle2     ,      50d
                               MOV         Paddle_Speed2     ,      6
                               CALL        Draw_Paddle2

    ;     ;RESET_CLR_MATRIX
    ; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;                            MOV  DI,0
    ;                            mov  ROW      ,       FIRST_ROW_POS
    ;                            mov  COL        ,     FIRST_COL_POS
    ;                            mov  CRNT_BRICK ,     0
    ; RESET_CLR_MTRX:
    ;                            MOV  AL,[GNCLR_MATRIX+DI]
    ;                            MOV  [COLOR_MATRIX+DI],AL
    ;                            INC  DI
    ;                            CMP  DI,33
    ;                            JNZ  RESET_CLR_MTRX
    ; ;     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    RESET_NOT_MULT:            MOV         IsPowerDown_pre,0
                               MOV         IsPowerUp_pre,0
                               call        Clear_PowerUp
                               call        Clear_PowerDown
    ;    mov  score,0

                               CALL        DRAWING_BALL
    ;   CALL DRAW_ALL_BRICKS
                               CALL        DISPLAY_STATS
    ;   CALL DRAW_WHITE_LINE
                               CMP         IS_MULTI,1
                               JNZ         RESET_RE
                               CALL        START_COO
                               JMP         RESET_MULTI
    RESET_RE:                  
                               MOV         AH,0
                               INT         16H
    RESET_MULTI:               MOV         READY1,0
                               MOV         READY2,0
                               RET
RESET_GAME ENDP

DRAW_BORDER_LEVELS PROC


                               MOV         CX, HIGH_POSITION_X
                               MOV         DX, LOW_POSITION_Y
                               MOV         AL, BORDER_COLOR
                               MOV         AH, 0Ch
                               MOV         SI, 000EH

    DRAW_V_DOWN:               
                               INT         10h
                               INC         DX
                               DEC         SI
                               JNZ         DRAW_V_DOWN

                               MOV         CX, LOW_POSITION_X
                               MOV         DX, LOW_POSITION_Y
                               MOV         AL, BORDER_COLOR
                               MOV         AH, 0Ch
                               MOV         SI, 0007H

    DRAW_V_DOWN2:              
                               INT         10h                                ; Draw pixel
                               INC         DX
                               DEC         SI
                               JNZ         DRAW_V_DOWN2

                               MOV         CX, HIGH_POSITION_X
                               MOV         DX, LOW_POSITION_Y
                               MOV         AL, BORDER_COLOR
                               MOV         AH, 0Ch
                               MOV         SI, 004BH

    DRAW_UP_LLOOP:             
                               INT         10h                                ; Draw pixel
                               DEC         CX
                               DEC         SI
                               JNZ         DRAW_UP_LLOOP
    ; Draw a horizontal white line
                               MOV         CX, HIGH_POSITION_X
                               MOV         DX, HIGH_POSITION_Y                ; Row
                               MOV         AL, BORDER_COLOR                   ; Color
                               MOV         AH, 0Ch
                               MOV         SI, 0052H

    DRAW_LINE_LLOOP:           
                               INT         10h
                               DEC         CX
                               DEC         SI
                               JNZ         DRAW_LINE_LLOOP

                               MOV         CX, LOW_POSITION_X
                               MOV         DX, LOW_POSITION_Y
                               ADD         DX, 0007H
                               MOV         AL, BORDER_COLOR
                               MOV         AH, 0Ch
                               MOV         SI, 0008H

    DRAW_LOOP:                 
                               INT         10h
                               DEC         CX
                               INC         DX
                               DEC         SI
                               JNZ         DRAW_LOOP

                               MOV         AH, 02H                            ;SET CURSOR POSITION
                               MOV         BH, 00                             ;PAGE NUMBER
                               MOV         DH, 22                             ;ROW
                               MOV         DL, 2                              ;COLUMN
                               INT         10H                                ;EXECUTE

                               CMP         SCORE, 5                           ;IF SCORE REACH 12 ===> INCREASE BALL SPEED
                               JE          PRINT_LEVEL1

                               CMP         SCORE, 15
                               JE          PRINT_LEVEL2

                               CMP         SCORE, 25                          ;IF SCORE REACH 12 ===> INCREASE BALL SPEED
                               JE          PRINT_LEVEL3
                               RET

    PRINT_LEVEL1:              
                               LEA         SI, LEVEL1                         ; Load string address into SI
                               PUSH        SI
                               JMP         GO_PRINT

    PRINT_LEVEL2:              
                               LEA         SI, LEVEL2
                               PUSH        SI
                               JMP         GO_PRINT

    PRINT_LEVEL3:              
                               LEA         SI, LEVEL3
                               PUSH        SI
    GO_PRINT:                  
                               MOV         ROW_CURSOR, DH
                               MOV         COLOUM_CURSOR, DL
                               CALL        PRINT_STRING


                               RET
DRAW_BORDER_LEVELS ENDP

Draw_pause PROC
                               push        DX
                               push        CX
                               PUSH        AX
                               PUSH        BX


    ;                            MOV  CX,Pause_X
    ;                            MOV  DX,Pause_Y
    
    ; drawPause_hori:
    ;                            MOV  BX,Pause_width
	                      
 	
    ; drawPause_ver:
    ; ; AL = Color, BH = Page Number, CX = x, DX = y
    ;                            MOV  AH,0CH
    ;                            MOV  AL,0cH                             ; Red Shape
    ;                            PUSH BX
    ;                            MOV  BH,00
    ;                            INT  10h
    ;                            INC  CX
    ;                            POP  BX
    ;                            DEC  BX
    ;                            JNZ  drawPause_ver
    ;                            MOV  CX,Pause_X
    ;                            INC  DX
    ;                            MOV  AX,Pause_Y
    ;                            ADD  AX,Pause_height
    ;                            CMP  DX,AX
    ;                            JNZ  drawPause_hori


    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;SET CURSOR POSITION AND PRINT CHAT
                               MOV         AH, 02H                            ;SET CURSOR POSITION
                               MOV         BH, 00                             ;PAGE NUMBER
                               MOV         DH, 0CH                            ;ROW
                               MOV         DL, 0AH                            ;COLUMN
                               INT         10H                                ;EXECUTE
                               LEA         SI, TEXT_RESUME
                               PUSH        SI
                               MOV         AH, 0FH
                               MOV         STRING_COLOR, AH
                               MOV         ROW_CURSOR, DH
                               MOV         COLOUM_CURSOR, DL
                               CALL        PRINT_STRING

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;SET CURSOR POSITION AND PRINT CHAT
                               MOV         AH, 02H                            ;SET CURSOR POSITION
                               MOV         BH, 00                             ;PAGE NUMBER
                               MOV         DH, 0fH                            ;ROW
                               MOV         DL, 0AH                            ;COLUMN
                               INT         10H                                ;EXECUTE
                               LEA         SI, TEXT_RESTART
                               PUSH        SI
                               MOV         AH, 0FH
                               MOV         STRING_COLOR, AH
                               MOV         ROW_CURSOR, DH
                               MOV         COLOUM_CURSOR, DL
                               CALL        PRINT_STRING

                               POP         BX
                               POP         AX
                               pop         CX
                               pop         DX


                               RET
Draw_pause ENDP

Clear_Pause PROC

                               push        DX
                               push        CX
                               PUSH        AX
                               PUSH        BX




    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;SET CURSOR POSITION AND PRINT CHAT
                               MOV         AH, 02H                            ;SET CURSOR POSITION
                               MOV         BH, 00                             ;PAGE NUMBER
                               MOV         DH, 0CH                            ;ROW
                               MOV         DL, 0AH                            ;COLUMN
                               INT         10H                                ;EXECUTE
                               LEA         SI, TEXT_RESUME
                               PUSH        SI
                               MOV         AH, 00H
                               MOV         STRING_COLOR, AH
                               MOV         ROW_CURSOR, DH
                               MOV         COLOUM_CURSOR, DL
                               CALL        PRINT_STRING

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;SET CURSOR POSITION AND PRINT CHAT
                               MOV         AH, 02H                            ;SET CURSOR POSITION
                               MOV         BH, 00                             ;PAGE NUMBER
                               MOV         DH, 0fH                            ;ROW
                               MOV         DL, 0AH                            ;COLUMN
                               INT         10H                                ;EXECUTE
                               LEA         SI, TEXT_RESTART
                               PUSH        SI
                               MOV         AH, 00H
                               MOV         STRING_COLOR, AH
                               MOV         ROW_CURSOR, DH
                               MOV         COLOUM_CURSOR, DL
                               CALL        PRINT_STRING

                               POP         BX
                               POP         AX
                               pop         CX
                               pop         DX

                               RET
Clear_Pause ENDP

DRAW_FINAL_SCREEN PROC
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;SET CURSOR POSITION AND PRINT CONGRATULATIONS OR HARD LUCK
                               CMP         LOSE_OR_WIN, 0                     ;LOSE
                               JE          LOSE_SCREEN


    ;PRINT CONGRATULATIONS
                               MOV         AH, 02H                            ;SET CURSOR POSITION
                               MOV         BH, 00                             ;PAGE NUMBER
                               MOV         DH, 04                             ;ROW
                               MOV         DL, 0BH                            ;COLUMN
                               INT         10H                                ;EXECUTE
                               LEA         SI, CONGRATULATIONS                ; Load string address into SI
                               PUSH        SI
                               MOV         AH, 0Fh
                               MOV         STRING_COLOR, AH
                               MOV         ROW_CURSOR, DH
                               MOV         COLOUM_CURSOR, DL
                               CALL        PRINT_STRING
                               MOV         AL, 3
                               MOV         BH, 00H
                               MOV         BL, 12
                               MOV         CX, 1
                               MOV         AH, 09H
                               INT         10H
                               JMP         CONT_PRINT

    LOSE_SCREEN:               
    ;PRINT HARD LUCK
                               MOV         AH, 02H                            ;SET CURSOR POSITION
                               MOV         BH, 00                             ;PAGE NUMBER
                               MOV         DH, 04                             ;ROW
                               MOV         DL, 0EH                            ;COLUMN
                               INT         10H                                ;EXECUTE
                               LEA         SI, HARD_LUCK                      ; Load string address into SI
                               PUSH        SI
                               MOV         AH, 0Fh
                               MOV         STRING_COLOR, AH
                               MOV         ROW_CURSOR, DH
                               MOV         COLOUM_CURSOR, DL
                               CALL        PRINT_STRING
                               LEA         SI, SAD_FACE                       ; Load string address into SI
                               PUSH        SI
                               MOV         AH, 12
                               MOV         STRING_COLOR, AH
                               MOV         ROW_CURSOR, DH
                               MOV         COLOUM_CURSOR, DL
                               CALL        PRINT_STRING
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;PRINT HEART
    CONT_PRINT:                
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;SET CURSOR POSITION AND PRINT SCORE
                               MOV         AH, 02H                            ;SET CURSOR POSITION
                               MOV         BH, 00                             ;PAGE NUMBER
                               MOV         DH, 09H                            ;ROW
                               MOV         DL, 05H                            ;COLUMN
                               INT         10H                                ;EXECUTE
                               LEA         SI, TEXT_SCORE                     ; Load string address into SI
                               PUSH        SI
                               MOV         AH, 0Fh
                               MOV         STRING_COLOR, AH
                               MOV         ROW_CURSOR, DH
                               MOV         COLOUM_CURSOR, DL
                               CALL        PRINT_STRING
                               MOV         AL, SCORE
                               MOV         AH, 0
                               CALL        PRINT_NUMBER
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;PRINT LIVES
                               MOV         AH, 02H                            ;SET CURSOR POSITION
                               MOV         BH, 00                             ;PAGE NUMBER
                               MOV         DH, 09H                            ;ROW
                               MOV         DL, 1BH                            ;COLUMN
                               INT         10H                                ;EXECUTE
                               LEA         SI, TEXT_LIVES                     ; Load string address into SI
                               PUSH        SI
                               MOV         AH, 0Fh
                               MOV         STRING_COLOR, AH
                               MOV         ROW_CURSOR, DH
                               MOV         COLOUM_CURSOR, DL
                               CALL        PRINT_STRING
                               MOV         AL, LIVES
                               MOV         AH,0
                               CALL        PRINT_NUMBER
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;PRINT PLAY AGAIN
                               MOV         AH, 02H                            ;SET CURSOR POSITION
                               MOV         BH, 00                             ;PAGE NUMBER
                               MOV         DH, 10H                            ;ROW
                               MOV         DL, 0DH                            ;COLUMN
                               INT         10H                                ;EXECUTE
                               LEA         SI, PLAY_AGAIN                     ; Load string address into SI
                               PUSH        SI
                               MOV         AH, 0FH
                               MOV         STRING_COLOR, AH
                               MOV         ROW_CURSOR, DH
                               MOV         COLOUM_CURSOR, DL
                               CALL        PRINT_STRING
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                               MOV         AH, 02H                            ;SET CURSOR POSITION
                               MOV         BH, 00                             ;PAGE NUMBER
                               MOV         DH, 12H                            ;ROW
                               MOV         DL, 0FH                            ;COLUMN
                               INT         10H                                ;EXECUTE
                               LEA         SI, O_BRACKET                      ; Load string address into SI
                               PUSH        SI
                               MOV         AH, 0FH
                               MOV         STRING_COLOR, AH
                               MOV         ROW_CURSOR, DH
                               MOV         COLOUM_CURSOR, DL
                               CALL        PRINT_STRING

                               LEA         SI, Y_CHAR                         ; Load string address into SI
                               PUSH        SI
                               MOV         AH, 10
                               MOV         STRING_COLOR, AH
                               MOV         ROW_CURSOR, DH
                               MOV         COLOUM_CURSOR, DL
                               CALL        PRINT_STRING

                               LEA         SI, SLASH_CHAR                     ; Load string address into SI
                               PUSH        SI
                               MOV         AH, 0FH
                               MOV         STRING_COLOR, AH
                               MOV         ROW_CURSOR, DH
                               MOV         COLOUM_CURSOR, DL
                               CALL        PRINT_STRING

                               LEA         SI, N_CHAR                         ; Load string address into SI
                               PUSH        SI
                               MOV         AH, 12
                               MOV         STRING_COLOR, AH
                               MOV         ROW_CURSOR, DH
                               MOV         COLOUM_CURSOR, DL
                               CALL        PRINT_STRING

                               LEA         SI, C_BRACKET                      ; Load string address into SI
                               PUSH        SI
                               MOV         AH, 0FH
                               MOV         STRING_COLOR, AH
                               MOV         ROW_CURSOR, DH
                               MOV         COLOUM_CURSOR, DL
                               CALL        PRINT_STRING



    RETTT:                     
                               RET
DRAW_FINAL_SCREEN ENDP

initializingUART proc
    ; set divisor latch access bit

                               mov         dx,3fbh                            ; Line Control Register
                               mov         al,10000000b                       ;Set Divisor Latch Access Bit
                               out         dx,al

    ;Set LSB byte of the Baud Rate Divisor Latch register.

                               mov         dx,3f8h
                               mov         al,0ch
                               out         dx,al

    ;Set MSB byte of the Baud Rate Divisor Latch register.

                               mov         dx,3f9h
                               mov         al,00h
                               out         dx,al

    ;Set port configuration
                               mov         dx,3fbh
                               mov         al,00011011b
                               out         dx,al

    ;splitting screen to two half



                               ret
initializingUART ENDP


scrollUpper MACRO

                               mov         ah,6                               ; function 6
                               mov         al,1                               ; scroll up one line
                               mov         bh,21h                             ; normal video attribute
                               mov         ch,UpperScreen[1]                  ; upper left Y
                               mov         cl,UpperScreen[0]                  ; upper left X
                               mov         dh,UpperScreen[3]                  ; lower right Y
                               mov         dl,UpperScreen[2]                  ; lower right X
                               int         10h

                               ENDM        scrollUpper
    ;-----------------------------------------------------------------------------------------------
    ;This is a macro to clear the lower half of the screen when it's completely full of characters

scrollLower MACRO

                               mov         ah,6                               ; function 6
                               mov         al,1                               ; scroll up one line
                               mov         bh,12h                             ; normal video attribute
                               mov         ch,LowerScreen[1]                  ; upper left Y
                               mov         cl,LowerScreen[0]                  ; upper left X
                               mov         dh,LowerScreen[3]                  ; lower right Y
                               mov         dl,LowerScreen[2]                  ; lower right X
                               int         10h

                               ENDM        scrollLower
    ;--------------------------------------------------------------------------------------------------
    ;this is a macro to get the cursor position of the send mode in dx "we need to save the cursor position every time we go to receive mode or send mode"
saveCursorS MACRO
                               mov         ah,3h
                               mov         bh,0h
                               int         10h
                               mov         xposS,dl
                               mov         yposS,dh
                               ENDM        saveCursorS
    ;---------------------------------------------------------------------------------------------------
    ;this is a macro to get the cursor position of the receive mode in dx "we need to save the cursor position every time we go to receive mode or send mode"
saveCursorR MACRO
                               mov         ah,3h
                               mov         bh,0h
                               int         10h
                               mov         xposR,dl
                               mov         yposR,dh
                               ENDM        saveCursorR
    ;----------------------------------------------------------------------------------------------------
    ;this is a macro to set the cursor in the right position
setCursor MACRO x,y
                               mov         ah,2
                               mov         bh,0
                               mov         dl,x
                               mov         dh,y
                               int         10h
                               ENDM        setCursor

SendReceive proc
                               mov         ah, 0                              ;open text mode
                               mov         al, 3
                               int         10h

                               mov         ah,6                               ; function 6
                               mov         al,0                               ; clear screen
                               mov         bh,21h                             ; normal video attribute
                               mov         ch,UpperScreen[1]                  ; upper left Y
                               mov         cl,UpperScreen[0]                  ; upper left X
                               mov         dh,UpperScreen[3]                  ; lower right Y
                               mov         dl,UpperScreen[2]                  ; lower right X
                               int         10h


                               mov         ah,6                               ; function 6
                               mov         al,0                               ; clear screen
                               mov         bh,12h                             ; normal video attribute
                               mov         ch,LowerScreen[1]                  ; upper left Y
                               mov         cl,LowerScreen[0]                  ; upper left X
                               mov         dh,LowerScreen[3]                  ; lower right Y
                               mov         dl,LowerScreen[2]                  ; lower right X
                               int         10h
    ChatLoop:                  

                               mov         ah,1                               ;check if a key is pressed
                               int         16h
                               jz          dummyReceive                       ; if not then jmp to receiving mode
                               jnz         send                               ;if yes jmp to send mode



    send:                      

                               mov         ah,0                               ;clear the keyboard buffer
                               int         16h

                               mov         value,al                           ; save the key ascii code in al
                               CMP         al,0Dh                             ; check if the key is enter
                               jnz         continue_chat
                               jz          newline

    dummyReceive:              jmp         receive

    newline:                   
                               CMP         yposS,12                           ;check first about if y position in 12 then the enter must do scroll up
                               jz          LastLineUpper
                               jnz         NotLastUpper
    LastLineUpper:             scrollUpper
                               mov         xposS,0                            ;set the cursor manually to 0,12
                               mov         yposS,12
                               setCursor   xposS,yposS
                               jmp         print
 
    NotLastUpper:              inc         yposS                              ;if enter go to the next line so we need to change the position of x,y manually then call the macro of setting cursor
                               mov         xposS,0

    continue_chat:             
                               setCursor   xposS,yposS                        ; setting the cursor
                               CMP         xposS,79                           ; if the x goes to 79 the most right of screen check where is y
                               JZ          checkY
                               jnz         print

    checkY:                    CMP         yposS,12                           ;if y goes to the lower bound of the first half of the screen go to clear the upper half of screen
                               JNZ         print
                               scrollUpper
                               mov         xposS,0                            ;set the cursor manually to 0,12
                               mov         yposS,12
                               setCursor   xposS,yposS

                               jmp         print                              ; if none of the above happened then go to print the char on the user screen
 


    print:                     mov         ah,2                               ; printing the char
                               mov         dl,value
                               int         21h
  
                               mov         dx,3FDH                            ; Line Status Register
                               In          al , dx                            ;Read Line Status
                               test        al , 00100000b
                               jz          receive                            ;Not empty
                               mov         dx , 3F8H                          ; Transmit data register
                               mov         al,value                           ; put the data into al
                               out         dx , al                            ; sending the data
                               CMP         al,27                              ; if the key was esc terminate the programme and this check must be after the send is done
                               JZ          dummyExit
                               saveCursorS                                    ; we need to save the cursor here
                               jmp         ChatLoop                           ; loop again

    dummyExit:                 RET

    dummySend:                 jmp         send

    receive:                   
                               mov         ah,1                               ;check if there is key pressed then go to the sending mode
                               int         16h
                               jnz         dummySend



                               mov         dx , 3FDH                          ; Line Status Register
                               in          al , dx
                               test        al , 1
                               JZ          receive


                               mov         dx , 03F8H
                               in          al , dx
                               mov         value,al                           ;check if the received data is sec key then terminate the programme
                               CMP         value,27
                               JZ          dummyExit

                               CMP         value,0Dh                          ;check if the key is enter
                               JNZ         contR
                               JZ          newlineR



    newlineR:                  
                               cmp         yposR,24
                               JZ          XR
                               jnz         YR
    XR:                        
                               scrollLower
                               mov         xposR,0
                               mov         yposR,24
                               setCursor   xposR,yposR
                               jmp         printR

    YR:                        
                               inc         yposR
                               mov         xposR,0

    contR:                     
                               setCursor   xposR,yposR
                               CMP         xposR,79
                               JZ          checkYR
                               jnz         printR

    checkYR:                   cmp         yposR,24
                               jnz         printR
                               scrollLower
                               mov         xposR,0
                               mov         yposR,24
                               setCursor   xposR,yposR

    printR:                    mov         ah,2
                               mov         dl,value
                               int         21h

                               saveCursorR

                               jmp         ChatLoop

                               ret
SendReceive endp
end main