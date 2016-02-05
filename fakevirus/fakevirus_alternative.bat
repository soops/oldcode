@echo off
echo ---------------------
echo     Fake Virus 3
echo  by Ethan Arterberry
echo ---------------------
ping -n 5 127.0.0.1>nul
cls
color A
echo     DISCLAIMER:
echo I am not responsible
echo for any damage to your
echo education/career for
echo using this fake virus.
echo You may get in a lot
echo of trouble for using
echo this fake virus. But
echo keep in mind one thing:
echo this program is completely
echo harmless and will NOT damage
echo your computer in any way.
pause
cls
ping -n 5 127.0.0.1>nul
:colors
echo Please press "r" for red or "g" for green
set /p pingas=Please enter your letter.
if /i {%pingas%}=={r} (goto :red) 
if /i {%pingas%}=={g} (goto :green) 
cls
echo You did not type "r" or "g". Please type a correct letter.
ping -n 5 127.0.0.1>nul
cls
goto :colors

:red
color C
cd c:\
tree

:green
color A
cd c:\
tree

REM Retrieved from my school cloud folder
