@echo off
setlocal enabledelayedexpansion

set cur=%cd%
for %%I in ("%cur%\..") do set JP=%%~fI
set G=!JP!\src\main\resources\META-INF\native-image\${PACKAGE_NAME}\${PROJECT_NAME}
set T=!JP!\target

java -agentlib:native-image-agent=config-merge-dir=!G! --add-opens java.base/sun.nio.fs=ALL-UNNAMED -jar !T!\${PROJECT_NAME}-jar-with-dependencies.jar %*

endlocal
