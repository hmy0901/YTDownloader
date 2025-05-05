@echo off
echo.

(
echo @echo off
echo echo.
echo.
echo set /p run=1.Run  2.UnInstall : 
echo.
echo if %%run%% == 1 goto run
echo if %%run%% == 2 goto uninstall
echo.
echo.
echo :run
echo %~dp0\ytdlp.cmd
echo goto exit
echo.
echo.
echo :uninstall
echo rd %~dp0 /s /q
echo del %%userprofile%%\desktop\YTDownloader.cmd
echo goto exit
echo.
echo.
echo :exit
echo timeout 3
) > YTDownloader.cmd



copy ".\YTDownloader.cmd" "%userprofile%\desktop\YTDownloader.cmd"
del ".\YTDownloader.cmd"