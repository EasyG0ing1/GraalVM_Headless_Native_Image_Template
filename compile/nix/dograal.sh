#!/bin/bash

cur=$(pwd)
JP=$(dirname "$cur")
G="$JP/src/main/resources/META-INF/native-image/${PACKAGE_NAME}/${PROJECT_NAME}"
T="$JP/target"

JAR_FILE=$T/${PROJECT_NAME}-jar-with-dependencies.jar
GRAAL_INSPECTOR=-agentlib:native-image-agent=config-merge-dir=$G
ADD_OPENS=--add-opens java.base/sun.nio.fs=ALL-UNNAMED

mvn -f $JP/pom.xml clean package
echo "***************************************************************"
echo "Make sure you include a run for every possible picocli command"
echo "line argument because picocli relies heavily on reflection!"
echo "***************************************************************"

java $GRAAL_INSPECTOR $ADD_OPENS -jar $JAR_FILE --version
java $GRAAL_INSPECTOR $ADD_OPENS -jar $JAR_FILE --string String
java $GRAAL_INSPECTOR $ADD_OPENS -jar $JAR_FILE -u DAYS=3 -u HOURS=10 -uMINUTES=30 -u SECONDS=45
java $GRAAL_INSPECTOR $ADD_OPENS -jar $JAR_FILE --boolean
java $GRAAL_INSPECTOR $ADD_OPENS -jar $JAR_FILE --array This Is My Array
java $GRAAL_INSPECTOR $ADD_OPENS -jar $JAR_FILE --graal
