#!/bin/bash

log=$HOME/.xlog
targetpath=${1#file://}


if [ -d $targetpath ]
    then
        st ranger $targetpath &>> $log
    else
        st ranger --selectfile=$targetpath &>> $log
    fi
