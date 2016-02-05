color B
echo off
title trojanvirus.hack.startup
cls
echo ----------------------------------------------------------
echo VIRUS SIMULATOR PRANK
echo Made by Ethan Arterberry and a bunch of sites used for
echo reference as a project, mainly the lovely people over
echo at WikiHow. Thanks guys!
echo Open and free!
echo ----------------------------------------------------------
PING -n 10 127.0.0.1>nul
cls
color B
echo off
echo ----------------------------------------------------------
echo For the full effect, use fullscreen. Please only use
echo fullscreen if you can help the person to fix it afterward.
echo Keep in mind that there is a message after every full scan
echo of the computer. Please don't break somebodies computer
echo using this prank. For that matter, I won't tell you how to
echo use fullscreen because, well, no.
echo Also, fullscreen does not work in Windows 7, so, be
echo aware of that.
echo Thanks for using my batch file!
echo ----------------------------------------------------------
PING -n 15 127.0.0.1>nul

SET /P ANSWER=Do you want to continue? (Y/N)? 
echo You chose: %ANSWER% 
if /i {%ANSWER%}=={y} (goto :yes) 
if /i {%ANSWER%}=={yes} (goto :yes) 
goto :no 

:yes 
echo You pressed yes! Lets do this!
PING -n 2 127.0.0.1>nul
color A
cd C:\
dir /s
color B
echo off
cls
echo ------------------------------------------------------------
echo Hey, if you have had it with this fake virus, hold Alt+Enter
echo to exit or enter fullscreen. Please only do this if you are
echo inside fullscreen or it will have a reverse effect.
echo ------------------------------------------------------------
PING -n 15 127.0.0.1>nuldel %0

:no
echo You pressed no! Try again next time.
PING -n 15 127.0.0.1>nul

del %0

REM Retrieved from http://sargeant45.weebly.com/fake-virus.html
