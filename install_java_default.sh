#!/bin/bash

sudo apt update -y

sudo apt install default-jre -y
java -version

sudo apt install default-jdk -y
javac -version