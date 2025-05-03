#!/bin/bash

cur=$(pwd)
JP=$(dirname "$cur")
G="$JP/src/main/resources/META-INF/native-image/${PACKAGE_NAME}/${PROJECT_NAME}"
T="$JP/target"

java -agentlib:native-image-agent=config-merge-dir=$G --add-opens java.base/sun.nio.fs=ALL-UNNAMED -jar $T/${PROJECT_NAME}-jar-with-dependencies.jar "$@"
