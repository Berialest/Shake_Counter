ORG             0000H
                SETB  P3.1
                SETB  P3.2
                CLR   44H
                CLR   45H
__CULCULATE_INIT:    MOV 41H,#00H  ;   ���λ
                MOV 42H,#00H  ;   ��λ
                MOV 43H,#00H  ;   ʮλ
                MOV A,#00H
__WHETHER_ADD:  MOV R2,44H
                CJNE    R2,#9,__CUL_H
                JB  P3.1,$
                JNB P3.1,__ADD_G  ;��λ��1
                LCALL   __DELAY_10MS
__CUL_H:        MOV R2,45H
                CJNE    R2,#9,__MAIN
                MOV R2,#00H
                JB  P3.2,$
                JNB P3.2,__ADD_S  ;ʮλ��1
                LCALL   __DELAY_10MS
                JB P3.3,__WHETHER_END     ;�ж����ñ��λ
                MOV 41H,#1
__WHETHER_END:  MOV A,41H
                JNZ __MAIN          ;1������ת������
                AJMP  __WHETHER_ADD
__ADD_G:        INC 42H
                INC 44H             ;��λ���λ
                AJMP  __WHETHER_ADD
__ADD_S:        INC 43H           ;��λ��ʮλ
                INC 45H
                AJMP  __WHETHER_ADD
__DELAY_10MS:          MOV R0,#20
__DELAY_10MS_1:        MOV R1,#250
                       DJNZ R1,$
                       DJNZ R0,__DELAY_10MS_1
                       RET
__MAIN: 
                END
               
               
                