@echo off
color 1F
set randomtime=%random%
set /a randomword=%random% %%10 +1


SET /P ANSWER=Do you want to read the intro?(Y/N)? 
echo You chose: %ANSWER% 
if /i {%ANSWER%}=={y} (goto :yes) 
if /i {%ANSWER%}=={yes} (goto :yes) 
goto :no
:yes
echo -------------------------------------------------
echo Hey! It's a fake blue screen by Ethan Arterberry!
echo -------------------------------------------------
echo                  PRANK TIPS!                    
echo 1. If you are on Windows Vista or earlier, then 
echo you can enter fullscreen. This basically only   
echo really works in fullscreen. Hold ALT+ENTER to go
echo into fullscreen.                                
echo 2. Act surprised when you see somebody walk by  
echo and see the blue screen.                        
echo 3. Press ALT+ENTER again to exit fullscreen.    
echo -------------------------------------------------
PING -n 10 127.0.0.1>nul
:no
cls
echo A problem has been detected and Windows has been shut down to prevent
echo damage to your computer.
echo.
echo.
if /i {%RANDOMWORD%}=={1} (echo UNHANDLED_KERNEL_EXCEPTION)
if /i {%RANDOMWORD%}=={2} (echo PFN_LIST_CORRUPT)
if /i {%RANDOMWORD%}=={3} (echo PAGE_FAULT_IN_NONPAGED_AREA)
if /i {%RANDOMWORD%}=={4} (echo DRIVER_IRQL_NOT_LESS_OR_EQUAL)
if /i {%RANDOMWORD%}=={5} (echo HARD_DRIVE_NOBOOT)
if /i {%RANDOMWORD%}=={6} (echo KERNEL_IS_SCREWED)
if /i {%RANDOMWORD%}=={7} (echo COMPUTER_IS_DEAD)
if /i {%RANDOMWORD%}=={8} (echo LOL_YOU_SUCK)
if /i {%RANDOMWORD%}=={9} (echo UNHANDLED_BOOT_ERROR)
if /i {%RANDOMWORD%}=={10} (echo ERRONEOUS_BOOT_FILES)
echo.
echo.
echo If this is the first time you've seen this Stop error screen,
echo restart your computer. If this screen appears again, follow
echo these steps:
echo.
echo.
echo Check to make sure any new hardware or software is properly installed.
echo If this is a new installation, ask your hardware or software manufacturer
echo for any Windows updates you might need.
echo.
echo.
echo If problems continue, disable or remove any newly installed hardware
echo or software. Disable BIOS memory options such as caching or shadowing.
echo If you need to use Safe Mode to remove or disable components, restart
echo your computer, press F8 to select Advanced Startup Options, and then
echo select Safe Mode.
echo.
echo.
echo Technical information:
echo *** STOP: 0x0000004e (0x%random%0099, 0x009%random%9, 0x00000900, 0x%random%900)
echo.
echo.
echo.
echo ***       45q.sys - Address FWTV1999 base at 4S4M5000, Datestamp 4d5dd88c
echo.
echo.
echo.
echo Beginning dump of physical memory
PING -n 30 127.0.0.1>nul
echo Physical memory dump complete
echo Contact your system administrator or technical support for further
echo assistance.
:loop
PING -n 10 127.0.0.1>nul
goto loop

REM Retrieved from http://sargeant45.weebly.com/fake-blue-screen.html
