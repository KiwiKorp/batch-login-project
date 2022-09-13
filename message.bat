@echo off
Color 0A
Title Message
:loop
cls
set /p message=
echo %name%:%message% >> message.data
goto loop