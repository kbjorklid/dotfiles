#!/bin/sh

#Template file for system-specific environment paths

### node.js, io.js ###
NPMGLOBAL_DIR=$HOME/.npmglobal
export NODE_PATH=$NODE_PATH:$NPMGLOBAL_DIR/lib/node_modules

### JAVA ###
export JAVA_HOME=/opt/java/current-java

### CODING PROJECTS ###
export PROJECTS=$HOME/code


### JIRA ###
# This is for oh-my-zsh jira plugin:
# export JIRA_URL=

### PATH ###
# Not in home directory
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
#Typical home directory bin directories
PATH=$PATH:$NPMGLBAL_DIR/bin:$HOME/bin:$JAVA_HOME/bin
# Java directories
# PATH=$PATH:$HOME/java/idea/bin:$HOME/java/maven/bin

export PATH




