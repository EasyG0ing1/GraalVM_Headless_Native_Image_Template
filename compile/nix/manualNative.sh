#!/bin/bash

cur=$(pwd)
JP=$(dirname "$cur")
T="$JP/target"
O="$JP/native-image"

mvn -f $JP/pom.xml clean package

native-image \
-Djava.awt.headless=true \
--no-fallback \
--verbose \
--enable-preview \
--enable-https \
--enable-native-access=ALL-UNNAMED \
-march=native \
-H:+UnlockExperimentalVMOptions \
-H:+ReportExceptionStackTraces \
-H:ConfigurationFileDirectories=src/main/resources/META-INF/native-image/${PACKAGE_NAME}/${PROJECT_NAME}} \
-O3 \
-jar $T/${PROJECT_NAME}-jar-with-dependencies.jar \
-o $O/${PROJECT_NAME}


# For SQLite projects, include this in the arguments:
#
# --initialize-at-build-time=org.sqlite.util.ProcessRunner \
# -cp "$HOME/.m2/repository/org/xerial/sqlite-jdbc/3.47.1.0/sqlite-jdbc-3.47.1.0.jar" \
#
# Only use the correct path in your environment pointing to the correct sqlite-jdbc jar based on your dependencies

