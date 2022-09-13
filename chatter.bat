@echo off
Color 0A
Title Hacker Chatroom
:checklogs
if exist==logs.bat goto login
if NOT exist==logs.bat goto register

:register
cls
echo Please create an account before proceeding
echo.
echo Press any key to create
pause > nul
goto create

:create
cls
echo Please type in your username below
set /p name=
echo Is the name "%name%" correct? y/n 
set /p option=
if %option%==Y goto create2
if %option%==y goto create2
goto create

:create2
cls
echo Please type in your desired password below
set /p pass=
cls
echo Please type it again
set /p nextpass=
if NOT %nextpass%==%pass% goto wrongpass
goto create3

:create3
echo set pass=%pass% >> logs.bat
echo set name=%name% >> logs.bat
exit

:login
call logs.bat
echo Please login
set /p name1=Username--
if NOT %name1%==%name% goto wrongname
set /p pass1=Password--
if NOT %pass1%==%pass% goto wrong
goto menu

:wrong 
cls
echo Your password is wrong
pause
exit

:menu
cls
call logs.bat
echo Welcome %name%!
echo Press any key to go to chat now!
pause >nul
goto start1

:start1
call logs.bat
echo %name% Joined the chatroom (%time%:%date%) >> message.data
start message.bat
goto start2

:start2
type log.data
type message.data
timeout /t 1 
cls
goto start2

:wrongname
echo Username is wrong
pause
goto login

:wrongpass
echo The two passwords don't match 
echo Please type it again or type r to restart
set /p option=
if %option%==r goto restart
if %option%==%pass% goto save

:restart
exit && start shopeezada.bat