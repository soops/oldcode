@echo off
echo Essay Maker 2.0 (Command Line)
echo by Ethan Arterberry
pause
cls
echo This program will save your essay into a
echo text file in My Documents.
pause
cls
color A
set topicsentence /p Please enter your topic sentence: 
echo Your topic sentence is: %topicsentence%
pause
cls
set evidence /p Please enter your evidence: 
echo Your supporting evidence is: %evidence%
pause
cls
set conclusion /p Please enter your conclusion: 
echo Your conclusion is: %conclusion%
pause
cls
set title /p Please create a title: 
pause
cls
echo     %title%
echo %topicsentence%
echo %evidence%
echo %conclusion%
pause
echo Writing to a text file...
@echo    %title%>
