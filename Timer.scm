ORG             0000H
                SETB  P3.1
                SETB  P3.2
                CLR   44H
                CLR   45H
__CULCULATE_INIT:    MOV 41H,#00H  ;   标记位
                MOV 42H,#00H  ;   个位
                MOV 43H,#00H  ;   十位
                MOV A,#00H
__WHETHER_ADD:  MOV R2,44H
                CJNE    R2,#9,__CUL_H
                JB  P3.1,$
                JNB P3.1,__ADD_G  ;个位加1
                LCALL   __DELAY_10MS
__CUL_H:        MOV R2,45H
                CJNE    R2,#9,__MAIN
                MOV R2,#00H
                JB  P3.2,$
                JNB P3.2,__ADD_S  ;十位加1
                LCALL   __DELAY_10MS
                JB P3.3,__WHETHER_END     ;判断设置标记位
                MOV 41H,#1
__WHETHER_END:  MOV A,41H
                JNZ __MAIN          ;1，则跳转主函数
                AJMP  __WHETHER_ADD
__ADD_G:        INC 42H
                INC 44H             ;低位存个位
                AJMP  __WHETHER_ADD
__ADD_S:        INC 43H           ;高位存十位
                INC 45H
                AJMP  __WHETHER_ADD
__DELAY_10MS:          MOV R0,#20
__DELAY_10MS_1:        MOV R1,#250
                       DJNZ R1,$
                       DJNZ R0,__DELAY_10MS_1
                       RET
__MAIN: 
                END
               
               
                