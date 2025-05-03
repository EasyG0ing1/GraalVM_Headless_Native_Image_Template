#!/bin/bash

cur=$(pwd)
JP=$(dirname "$cur")

mvn -f $JP/pom.xml clean package
