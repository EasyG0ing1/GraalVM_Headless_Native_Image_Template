@echo off
setlocal enabledelayedexpansion
set cur=%cd%
for %%I in ("%cur%\..") do set JP=%%~fI
mvn -f !JP!\pom.xml clean -Pnative native:compile
endlocal
