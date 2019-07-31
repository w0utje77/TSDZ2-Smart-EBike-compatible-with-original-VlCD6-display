@echo off
PATH = %PATH%;C:\STMicroelectronics\st_toolset\stvp

CALL compile_ihx.bat
if errorlevel == 1 goto FAIL

STVP_CmdLine -BoardName=ST-LINK -ProgMode=SWIM -Port=USB -Device=STM8S105x6 -FileOption=option_no_prot.ihx -verbose -no_verif -no_loop
if errorlevel == 1 goto FAIL

STVP_CmdLine -BoardName=ST-LINK -ProgMode=SWIM -Port=USB -Device=STM8S105x6 -FileProg=main.ihx -FileData=data.ihx -FileOption=option_no_prot.ihx -verbose -no_loop -no_verif -no_warn_protect
if errorlevel == 1 goto FAIL

::STVP_CmdLine -BoardName=ST-LINK -ProgMode=SWIM -Port=USB -Device=STM8S105x6 -FileProg=main.ihx -FileData=data.ihx -FileOption=option_prot.ihx -verbose -no_loop -no_verif -no_warn_protect
::if errorlevel == 1 goto FAIL

:PASS
goto EXIT
:FAIL
pause
:EXIT
exit