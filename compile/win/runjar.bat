@echo off
setlocal enabledelayedexpansion

set cur=%cd%
for %%I in ("%cur%\..") do set JP=%%~fI
set T=!JP!\target

java -jar "!T!\${PROJECT_NAME}-jar-with-dependencies.jar" %*

endlocal
