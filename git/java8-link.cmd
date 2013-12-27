@echo Linking projects:
@echo.
@call :All Print
@IF ERRORLEVEL 500 GOTO :Error
@call :All Link
@goto :End

:All
@call :%1 eclipse.jdt.core
@call :%1 eclipse.jdt.debug
@call :%1 eclipse.jdt.ui
@call :%1 rt.equinox.framework
@call :%1 eclipse.pde.ui
@goto :eof

:Print
@IF EXIST "%~dp0\%~1\" (
	echo [READY] %~1
) ELSE IF EXIST "%~dp0..\..\a-%~1\" (
	echo [   OK] a-%~1
) ELSE IF EXIST "%~dp0..\..\%~1\" (
	echo [   OK] %~1
) ELSE (
	echo [ERROR] %~1 not found
	echo [ WARN] a-%~1 not found
	exit /B 500
)
@goto :eof

:Link
@IF EXIST "%~dp0\%~1\" (
	goto :eof
) ELSE IF EXIST "%~dp0..\..\a-%~1\" (
	call :MakeALink "%~dp0..\..\a-%~1\" "%~dp0%~1"
) ELSE IF EXIST "%~dp0..\..\%~1\" (
	call :MakeALink "%~dp0..\..\%~1\" "%~dp0%~1"
)
@goto :eof

:MakeALink
@mklink /D "%~2" "%~1"
@goto :eof

:Error
@echo.
@echo Please clone the missing projects. Linking aborted.
@echo (Error code %ERRORLEVEL%)
@echo.
@pause
@exit /B 0

:End
@exit /B 0


