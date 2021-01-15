#!/bin/bash

platform='unknown'
unamestr=`uname`
case "$unamestr" in
        Linux)
                platform='linux'
                rootdir=$(dirname "$(readlink -f $0)")
        ;;
        Darwin)
                platform='mac'
                rootdir=$(cd "$(dirname $0)"; pwd -P)
        ;;
esac

case "$platform" in
        mac)
                java -Xdock:name=AarowAutomationGcodeSender -Xmx256m -cp "$rootdir"/AarowAutomationGcodeSender*.jar com.willwinder.ugs.cli.TerminalClient $@
        ;;
        linux)
                java -Xmx256m -cp "$rootdir"/AarowAutomationGcodeSender*.jar com.willwinder.ugs.cli.TerminalClient $@
        ;;
esac
        
