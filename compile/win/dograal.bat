@echo off
setlocal enabledelayedexpansion

set cur=%cd%
for %%I in ("%cur%\..") do set JP=%%~fI
set G=!JP!\src\main\resources\META-INF\native-image\${PACKAGE_NAME}\${PROJECT_NAME}
set T=!JP!\target

mvn -f !JP!\pom.xml clean package

echo "***************************************************************"
echo "Make sure you include a run for every possible picocli command"
echo "line argument because picocli relies heavily on reflection!"
echo "***************************************************************"

java -agentlib:native-image-agent=config-merge-dir=!G! --add-opens java.base/sun.nio.fs=ALL-UNNAMED -jar !T!\${PROJECT_NAME}-jar-with-dependencies.jar --version
java -agentlib:native-image-agent=config-merge-dir=!G! --add-opens java.base/sun.nio.fs=ALL-UNNAMED -jar !T!\${PROJECT_NAME}-jar-with-dependencies.jar --string String
java -agentlib:native-image-agent=config-merge-dir=!G! --add-opens java.base/sun.nio.fs=ALL-UNNAMED -jar !T!\${PROJECT_NAME}-jar-with-dependencies.jar --boolean
java -agentlib:native-image-agent=config-merge-dir=!G! --add-opens java.base/sun.nio.fs=ALL-UNNAMED -jar !T!\${PROJECT_NAME}-jar-with-dependencies.jar -u HOURS=10 -uMINUTES=30 -u SECONDS=45
java -agentlib:native-image-agent=config-merge-dir=!G! --add-opens java.base/sun.nio.fs=ALL-UNNAMED -jar !T!\${PROJECT_NAME}-jar-with-dependencies.jar --array This Is My Array
java -agentlib:native-image-agent=config-merge-dir=!G! --add-opens java.base/sun.nio.fs=ALL-UNNAMED -jar !T!\${PROJECT_NAME}-jar-with-dependencies.jar --graal

endlocal
