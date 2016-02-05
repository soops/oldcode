@echo off
echo Welcome to the extremely lightweight password changer!
echo This will change the password of a user on your computer until the computer
echo is shut down. This program will ONLY work if you are an administrator or in
echo some other cases. I encourage you to try out the program to see if it works
echo because I can't diagnose all cases.
pause
cls
echo Okay! The computer will now run a command to show you all usernames on the
echo computer.
echo Finding users
PING -n 2 127.0.0.1>nul
cls
echo Okay! The computer will now run a command to show you all usernames on the
echo computer.
echo Finding users.
PING -n 2 127.0.0.1>nul
cls
echo Okay! The computer will now run a command to show you all usernames on the
echo computer.
echo Finding users..
PING -n 2 127.0.0.1>nul
cls
echo Okay! The computer will now run a command to show you all usernames on the
echo computer.
echo Finding users...
PING -n 2 127.0.0.1>nul
cls
echo Okay! The computer will now run a command to show you all usernames on the
echo computer.
echo Users will now be shown.
PING -n 5 127.0.0.1>nul
net user
echo --------------------------------------------------------------------------
echo These are all of the user names.
echo Please find the user you would like to change the password of and remember
echo the exact user name so you can type it in to change the password later.
pause
cls
echo Okay! Here is the part where we change the password. Do you still remember
echo the user name?
set /p ANSWER=Do you? (Y/N)
if /i {%ANSWER%}=={yes} (goto :passwordchange)
if /i {%ANSWER%}=={y} (goto :passwordchange)
echo Okay. Well, I will now exit the program.
PING -n 5 127.0.0.1>nul
goto :exit

:passwordchange
cls
set /p username=Please enter the user name:
echo Saving your user name.
PING -n 3 127.0.0.1>nul
echo Your user name is: %username%
set /p ANSWER=Is that right(Y/N)?
if /i {%ANSWER%}=={n} (goto :exit)
if /i {%ANSWER%}=={n} (goto :exit)
cls
echo Great!
set /p password=Please enter the new password:
echo Great!
PING -n 5 127.0.0.1>nul
cls
echo Okay. Let's review. Your new password is: %password%
PING -n 5 127.0.0.1>nul
echo Your user name is: %username%
PING -n 5 127.0.0.1>nul
echo Now changing password.
net user %username% %password%
echo Password is now changed.
PING -n 5 127.0.0.1>nul
cls
echo Thank you for using this program! The password will be changed.
echo Now exiting!
exit


:exit
exit
