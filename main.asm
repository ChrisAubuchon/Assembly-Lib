;===================================================================================================
; Assembly Library
;
; File Name: test.asm
; Written By: Oded Cnaan (oded.8bit@gmail.com)
; Site: http://odedc.net 
; Licence: GPLv3 (see LICENSE file)
; Package: AsmLib
;
; Description: 
; Testing program for the package
;===================================================================================================
LOCALS @@
.486
IDEAL
MODEL small
	stack 256

DATASEG



CODESEG

    ; Include library (order is important!)
    include "UtilLib.inc"
    include "GrLib.inc"
    ; Include tests
    include "Tests/tests.asm"

start:
	mov ax, @data
	mov ds,ax

    mov ax, TRUE
    ut_init_lib ax

    ; -- DOUBLE BUFFERING
    ; Free redundant memory take by program
    ; to allow using malloc
    ; call AllocateDblBuffer

    gr_set_video_mode_vga
    gr_set_color GR_COLOR_GREEN

    ;----- NO PASS
    call TestBmp
    ;;;;call TestSprite
    ;;;;call TestAnim
    ;;;;call TestMySprite
    
    ;------ PASS
    ;call TestShapes
    ;call TestSound
    ;call TestRandomAndPrint
    ;call TestPrint
   
exit:
    call WaitForKeypress 

    ; -- DOUBLE BUFFERING   
    ; call ReleaseDblBuffer

    gr_set_video_mode_txt
    return 0

END start
CODSEG ends