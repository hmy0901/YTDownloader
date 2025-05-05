@echo off
echo.
echo %~dp0
title Youtube Downloader Made By MikeYuan
echo Youtube Downloader V3.0 Made By MikeYuan
setlocal enabledelayedexpansion


set /p mode=Please choose a mode. (1.mp3 2.mp4) : 
set /p url=Please enter a Youtube URL. : 
set /p a=Please enter a folder name. (Default name is playlist name) : 

if "%a%" == "" (set a="%%(playlist)s/%%(title)s.%%(ext)s") else (set a="%a%""/%%(title)s.%%(ext)s")


if "%mode%" == "1" goto mp3
if "%mode%" == "2" goto mp4

:mp3
set /p aq=Please choose audio-quality. (1.192k 2.320k 3.Customize):
if %aq% ==1 set aq=192
if %aq% ==2 set aq=320
if %aq% ==3 set /p aq=Please enter a value. : 
%~dp0\ytdlp.exe --output "%a%" --ffmpeg-location %~dp0\ffmpeg\bin --embed-thumbnail --add-metadata --extract-audio --audio-format mp3 --audio-quality !aq!K !url!
goto exit

:mp4
.\ytdlp.exe --output "%a%" --ffmpeg-location .\ffmpeg\bin --embed-thumbnail --add-metadata --merge-output-format mp4 "!url!"
goto exit



:exit
pause
