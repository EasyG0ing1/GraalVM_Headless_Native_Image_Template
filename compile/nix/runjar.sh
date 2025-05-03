#!/bin/bash

cur=$(pwd)
JP=$(dirname "$cur")
T="$JP/target"

java -jar $T/${PROJECT_NAME}-jar-with-dependencies.jar "$@"
