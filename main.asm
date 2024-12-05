.MODEL SMALL
.STACK 4000
.DATA

    MAX_WIDTH       DW  140H              ;THE WIDTH OF THE WINDOW
    MAX_HIGHT       DW  0C8H              ;THE HIGHT OF THE WINDOW          ; WILL REPLACE IT WITH THE BADLE POSITION

    BALL_POSITION_X DW  0A0H              ;X POSITION OF THE BALL COLUMNNN
    BALL_POSITION_Y DW  64H               ;Y POSITION OF THE BALL ROWWWWWW
    BALL_SIZE       EQU 05H               ;NUMBER OF PIXELS OF THE BALL IN 2D DIRECTION

    PREV_TIME       DB  0                 ;USED TO CHECK IF THE TIME HAS CHANGED
    BALL_SPEED      DB  7H                ;TO CONTROLL THE SPEED OF THE BALL

    BALL_SPEED_Y    DW  5H                ;THE SPEED OF THE BALL IN Y DIRECTION
    BALL_SPEED_X    DW  2H

    BALL_COLOR      DB  04H               ;RED COLOR
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;Paddle var
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    width_Paddle    DW  50d
    height_Paddle   DW  4d

    Time_Aux        DB  0                 ; variable used when changing if the time is changed

    Paddle_Speed    DW  6

    Paddle_X        DW  135D
    Paddle_Y        DW  195D

    LeftBoundry     DW  265
    RightBoundry    DW  6
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;Breaks var
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;size for each brick
    BRICK_WIDTH     EQU 35
    BRICK_HEIGHT    EQU 8

    ;STARTING POINT TO DRAW BREAKS
    FIRST_ROW_POS   EQU 4
    FIRST_COL_POS   EQU 1

    BRICKS_PER_ROW  EQU 8                 ; NUMBER OF BRICKS IN EACH ROW
    TOTAL_ROWS      EQU 4                 ; NUMBER OF ROWS

    STEP_PER_ROW    EQU 40                ;(BRICK_WIDTH+1PX SPACE)
    STEP_PER_COL    EQU 12                ;(BRICK_WIDTH+1PX SPACE)

    COLOR_MATRIX    db  11 dup (1,2,3)    ; EACH Brick must have certain color here


    ;VARIABLES USED TO DRAW ALL BRICKS (NOT CONFIGURATIONS)
    ROW             dw  FIRST_ROW_POS
    COL             dw  FIRST_COL_POS
    CRNT_BRICK      dW  0                 ;counter used to draw each brick with its coressponding color

.CODE

MAIN PROC FAR

                           MOV  AX, @DATA
                           MOV  DS, AX                    ;MOVING DATA TO DATA SEGNMENT

                           mov  ax, 0A000h                ; Video memory segment for mode 13h
                           mov  es, ax                    ; Set ES to point to video memory
                           MOV  AH, 00H
                           MOV  AL, 13H                   ;CHOOSE THE VIDEO MODE
                           INT  10H

                           CALL CLEARING_SCREEN
    ; CALL Move_Paddle

    TIME_AGAIN:            MOV  AH, 2CH                   ;GET THE SYSTEM TIME
                           INT  21H                       ;CH = HOURS, CL = MINUTES, DH = SECONDS AND DL = 1/100 SECONDS

                           MOV  AL, DL                    ;TO AVOID MEMORY TO MEMORY COMMAND
                           CMP  AL, PREV_TIME             ;COMPARE THE PREVSE TIME WITH THE CURENT
                           JE   TIME_AGAIN


                           MOV  PREV_TIME, DL
                           CALL CLEARING_SCREEN           ;TO CLEAR THE SCREEN
                           CALL DRAW_ALL_BRICKS           ;DRAW ALL BRICKS ACCORDING TO CONFIGS
                           CALL DRAWING_BALL              ;DRAWING BALL

                           CALL Move_Paddle
                           CALL Draw_Paddle
                           CALL MOVING_BALL
                           CALL HANDLE_COLLISION          ;HANDLE COLLISIONS WITH BRICK
                           JMP  TIME_AGAIN


                           RET
MAIN ENDP



CLEARING_SCREEN PROC

                           MOV  AH, 06H                   ;SCROLL UP
                           XOR  AL, AL                    ;CLEAR ENTIRE SCREEN
                           XOR  CX, CX                    ;CH = ROW, CL = COLUMN (FROM UPPER LEFT CORNER)
                           MOV  DX, 184FH                 ;DH = ROW, DL = COLUMN (TO LOWER RIGHT CORNER)
                           MOV  BH, 00H                   ;BLACK COLOR
                           INT  10H                       ;CLEAR THE SCREEN


                           RET
CLEARING_SCREEN ENDP


MOVING_BALL PROC

                           MOV  AX, BALL_SPEED_Y
                           SUB  BALL_POSITION_Y, AX       ;MOVE THE BALL UP

                           CMP  BALL_POSITION_Y, 0        ;CHECK IF Y < 0
                           JL   REVERSE_Y                 ;IF Y < 0 REVERSE THE DIRECTION OF MOVING

                           MOV  AX, MAX_HIGHT
                           SUB  AX, BALL_SIZE
                           CMP  BALL_POSITION_Y, AX       ;CHECK IF Y > MAX HIGHT
                           JG   REVERSE_Y                 ;IF Y > MAX HIGHT - BALL SIZE REVERSE THE DIRECTION TOO

                           MOV  AX, BALL_SPEED_X
                           ADD  BALL_POSITION_X, AX       ;MOV RIGHT

                           CMP  BALL_POSITION_X, 0        ;CHECK IF X < 0
                           JL   REVERSE_X                 ;IF X < 0 REVERSE THE DIRECTION

                           MOV  AX, MAX_WIDTH
                           SUB  AX, BALL_SIZE
                           CMP  BALL_POSITION_X, AX       ;CHECK IF x > MAX WIDTH - BALL SIZE
                           JG   REVERSE_X                 ;REVERSE IF GREATER


    ;;;;;;;;;;;;;;;; Check Ball-Paddle collision

                           MOV  AX,Paddle_X
                           CMP  AX, BALL_POSITION_X       ;; Check x -->Start
                           JB   NOT_COLLIDE
                           ADD  AX,width_Paddle
                           CMP  AX, BALL_POSITION_X       ;; Check x -->End
                           JBE  CHECK_Y

    CHECK_Y:               
                           MOV  AX,Paddle_Y
                           SUB  AX,height_Paddle
                           CMP  AX, BALL_POSITION_Y
                           JA   NOT_COLLIDE
                           JMP  REVERSE_Y


    NOT_COLLIDE:           
    ;;;;;;;;;;;;;;;;;;;;;;;;;;


    RT:                    RET

    REVERSE_Y:             NEG  BALL_SPEED_Y              ;REVERSE THE DIRECTION OF SPEED IN Y
                           RET

    REVERSE_X:             NEG  BALL_SPEED_X              ;REVERSE THE DIRECTION OF SPEED IN Y

                           RET
MOVING_BALL ENDP



HANDLE_COLLISION PROC
;WHEN COLLIDE WITH THE UPPER FACE OF BRICK
                    MOV AX,BALL_POSITION_Y
                    ADD AX,BALL_SIZE
                    MOV BX,320
                    MUL BX
                    ADD AX,BALL_POSITION_X   ;AX=ROWS*320+COLS 
                    MOV SI,AX                
                    MOV DL,BALL_COLOR
                    CMP ES:[SI],DL           ; CHECK IF SI IS COLORED AS SAME AS THE BALL (INSIDE THE BALL)
                    JZ X1
                    CMP ES:[SI], BYTE PTR  0 ; CHECK IF COLIDED WITH DIFFERENT COLOR THAN BLACK OR BALL_COLOR (COLLISION WITH BRICK) 
                    JNZ .REVERSE_Y          

;WHEN COLLIDE WITH THE LOWER FACE OF BRICK
                X1: MOV AX,BALL_POSITION_Y
                    SUB AX,BALL_SIZE
                    MOV BX,320
                    MUL BX
                    ADD AX,BALL_POSITION_X
                    MOV SI,AX
                    MOV DL,BALL_COLOR
                    CMP ES:[SI],DL           ; CHECK IF SI IS COLORED AS SAME AS THE BALL (INSIDE THE BALL)
                    JZ X2
                    CMP ES:[SI], BYTE PTR  0 ; CHECK IF COLIDED WITH DIFFERENT COLOR THAN BLACK OR BALL_COLOR (COLLISION WITH BRICK) 
                    JNZ .REVERSE_Y  

                    ;WHEN COLLIDE WITH THE LOWER FACE OF BRICK
                X2: MOV AX,BALL_POSITION_Y
                    MOV BX,320
                    MUL BX
                    ADD AX,BALL_POSITION_X
                    ADD AX,BALL_SIZE
                    MOV SI,AX
                    MOV DL,BALL_COLOR
                    CMP ES:[SI],DL           ; CHECK IF SI IS COLORED AS SAME AS THE BALL (INSIDE THE BALL)
                    JZ X3
                    CMP ES:[SI], BYTE PTR  0 ; CHECK IF COLIDED WITH DIFFERENT COLOR THAN BLACK OR BALL_COLOR (COLLISION WITH BRICK) 
                    JNZ .REVERSE_Y 
                X3: MOV AX,BALL_POSITION_Y
                    MOV BX,320
                    MUL BX
                    ADD AX,BALL_POSITION_X
                    SUB AX,BALL_SIZE
                    MOV SI,AX
                    MOV DL,BALL_COLOR
                    CMP ES:[SI],DL           ; CHECK IF SI IS COLORED AS SAME AS THE BALL (INSIDE THE BALL)
                    JZ .RT
                    CMP ES:[SI], BYTE PTR  0 ; CHECK IF COLIDED WITH DIFFERENT COLOR THAN BLACK OR BALL_COLOR (COLLISION WITH BRICK) 
                    JNZ .REVERSE_Y 

                .RT:    RET

                .REVERSE_Y:
                      NEG  BALL_SPEED_Y           ;REVERSE THE DIRECTION OF SPEED IN Y
                      CALL DESTROY_BRICK          ;DESTROY THE BRICK I COLLIDED WITH
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
                           DIV  BX                        ;AX=>NUMBER OF ROWS     ;DX=>MODULS<320
                           MOV  CX,DX
                           MOV  DX,0
                           MOV  BX,STEP_PER_COL
                           SUB  AX,FIRST_ROW_POS
                           DIV  BX
                           MOV  BP,AX                     ;;;;;;;;;;;;;;;;;;;;;;;;;;BP IS THE ACTUAL ROW

                           MOV  DX,0
                           MOV  AX,CX
                           SUB  AX,FIRST_COL_POS
                           MOV  BX,STEP_PER_ROW
                           DIV  BX
                           MOV  CX,AX                     ;;;;;;;;;;;;;;;;;;;;;;;;;;;CX IS THE ACTUAL COL
                           MOV  AX,BP
                           MOV  BX,BRICKS_PER_ROW
                           MUL  BX
                           ADD  AX,CX
                           MOV  DI,AX
                           DEC  [COLOR_MATRIX+DI]

                           POP  DI
                           POP  CX
                           POP  DX
                           POP  BX
                           POP  AX
                           RET
DESTROY_BRICK ENDP




DRAWING_BALL PROC

                    
                           MOV  CX, BALL_POSITION_X       ;SET THE COLUMN POSITION OF THE PIXEL
                           MOV  DX, BALL_POSITION_Y       ;SET THE ROW POSITION OF THE PIXEL
                           MOV  AL, BALL_COLOR            ;COLOR OF THE PIXEL IS RED
                           MOV  AH, 0CH                   ;DRAW PIXEL COMMMAND
    DRAW_HORIZONTAL:       INT  10H
                           INC  CX                        ;INCREMENT THE SIZE IN X DIRECTION
                           MOV  BX, CX                    ;TO PRESERVE THE VALUE IN THE CX
                           SUB  BX, BALL_POSITION_X       ;GET THE DIFFERENCE
                           CMP  BX, BALL_SIZE             ;CMPARE THE DIFFERENCE WITH THE BALL SIZE
                           JL   DRAW_HORIZONTAL


                           INC  DX                        ;INCREMENT THE SIZE IN THE Y DIRECTION
                           MOV  CX, BALL_POSITION_X       ;SET THE X DIRECTION AGAIN
                           MOV  BX, DX
                           SUB  BX, BALL_POSITION_Y       ;GET THE DIFFERENCE
                           CMP  BX, BALL_SIZE
                           JL   DRAW_HORIZONTAL           ;IF THE SIZE IN THE Y DIRECTION NOT COMPLETED WILL GO AGAIN TO DRAW IN THE X DIRECTION
                           RET                            ;ELSE WILL RETURN

DRAWING_BALL ENDP

DRAW_ALL_BRICKS PROC
                           MOV  CRNT_BRICK,0              ;INITIALIZE THE BIRCKS COUNTER
                           MOV  CX,0                      ;INITIALIZE THE COLUMNS COUNTER
                           MOV  DX,0                      ;INITIALIZE THE ROWS COUNTER
    DRAWIT:                
                           CALL DRAWBRICK
                           ADD  COL,STEP_PER_ROW
                           INC  CRNT_BRICK
                           INC  CX
                           CMP  CX,BRICKS_PER_ROW
                           JL   DRAWIT                    ;(IF CX >= BRICKS_PER_ROW ) BREAK
                           MOV  CX,0                      ;REINITIALIZE THE COLUMNS COUNTER
                           INC  DX
                           MOV  COL,FIRST_COL_POS         ;MOVE TO THE NEXT POSITION TO DRAW THE NEXT BRICK (MOVE TO THE NEXT ROW)
                           ADD  ROW,STEP_PER_COL
                           CMP  DX,TOTAL_ROWS
                           JL   DRAWIT                    ;(IF DX >= BRICKS_PER_COL ) BREAK
                           MOV  ROW,FIRST_ROW_POS         ;RESET ROWS & COL TO ITS INITIAL POSITION
                           MOV  COL,FIRST_COL_POS
                           RET
DRAW_ALL_BRICKS ENDP



DRAWBRICK PROC
                           push DX
                           push CX
                           PUSH AX
                           PUSH BX
                           mov  ax,ROW                    ;==>column number
                           mov  bx,320                    ;bx=320
                           mul  bx                        ;ax=ax*bx
                           add  ax,COL                    ;ax==>in now target pixel to draw
                           MOV  SI,AX                     ; CALC THE POSITION OF THE FIRST PIXEL IN THE VIDEO MEMORY
                           MOV  DI,CRNT_BRICK
                           mov  bl,[COLOR_MATRIX+DI]      ;STORE THE COLOR OF THE CRNT BRICK
                           mov  cx,0                      ;INITIALIZE COLUMNS COUNTER (COUNTER FOR NUMBER OF PIXELS PER ROW PRE BRICK)
                           mov  dx,0                      ;INITIALIZE ROWS COUNTER (COUNTER FOR NUMBER OF ROWS PRE BRICK)
    draw:                  mov  es:[si],bl                ;COLOR THIS PIXEL
                           inc  si                        ;GO RIGHT
                           inc  CX
                           cmp  cx,BRICK_WIDTH
                           jl   draw                      ;(IF CX >= BRICKS_WIDTH ) BREAK
                           add  si,320                    ;GO DOWN (GO TO THE NEXT ROW)
                           sub  si, BRICK_WIDTH           ;GO TO BACK TO THE START OF THE BRICK
                           INC  DX
                           MOV  CX,0                      ;RESET COLUMNS COUNTER
                           CMP  DX,BRICK_HEIGHT
                           jl   draw                      ;(IF DX >= BRICK_HEIGHT ) BREAK
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

                           MOV  AH, 01h                   ; Function to check if a key is pressed
                           INT  16h                       ; Call BIOS interrupt
                           JZ   NoKey                     ; Jump if no key is pressed (ZF = 1)
    ; Code to handle key press
                           JMP  Done

    NoKey:                 
                           JMP  rett

    Done:                  

    ; Read the key
                           MOV  AH, 00h
                           INT  16h
           
    ; Check for left arrow (E0 4B)
                           CMP  AH, 4Bh                   ; Compare scancode (AL contains scancode without E0 prefix)
                           JE   left_pressed              ; Jump if Left Arrow
                  
    ; Check for right arrow (E0 4D)
                           CMP  AH, 4Dh                   ; Compare scancode (AL contains scancode without E0 prefix)
                           JE   right_pressed             ; Jump if Right Arrow
                   
                           JMP  rett                      ; Return to polling
                        
    left_pressed:          
                   
    ; Check for the boundries
                           MOV  BX,Paddle_Speed
                           SUB  Paddle_X,BX
                           MOV  AX,RightBoundry
                           CMP  Paddle_X,AX
                           JB   Maintain_Right_Boundry
                           JMP  rett                      ; Return to polling
                   
    right_pressed:         
                           MOV  BX,Paddle_Speed
                           ADD  Paddle_X,BX
                           MOV  AX,LeftBoundry
                           CMP  Paddle_X,AX
                           JA   Maintain_Left_Boundry
                           JMP  rett                      ; Return to polling
     
     	                 
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
    
    
                  
           
Draw_Paddle PROC
                           push DX
                           push CX
                           PUSH AX
                           PUSH BX
               
    ;                        MOV  CX,0
    ;                        MOV  DX,Paddle_Y
	                 
	                 
    ; clear_The_Screen_hori:
	                 
    ;                        MOV  AX,320
    ; clear_The_Screen_ver:
    ; ; AL = Color, BH = Page Number, CX = x, DX = y
    ;                        PUSH AX
    ;                        MOV  AH,0CH
    ;                        MOV  AL,00H
    ;                        MOV  BH,00
    ;                        INT  10h
    ;                        INC  CX
    ;                        POP  AX
    ;                        DEC  AX
    ;                        JNZ  clear_The_Screen_ver
    ;                        MOV  CX,0
    ;                        INC  DX
    ;                        CMP  DX,199
    ;                        JNZ  clear_The_Screen_hori
	                 
    ; the coordinates of the paddle
	                 
                           MOV  CX,Paddle_X
                           MOV  DX,Paddle_Y
	                 	                 
		
    draw_Paddle_hori:      
                           MOV  BX,width_Paddle
	                 
 	
    draw_Paddle_ver:       
    ; AL = Color, BH = Page Number, CX = x, DX = y
                           MOV  AH,0CH
                           MOV  AL,07H
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

END MAIN
