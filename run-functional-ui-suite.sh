#!/bin/bash -ex

if [[ -x "$(command -v Xvfb)" ]]; then
  Xvfb :9 -screen 0 1280x1024x16 &> ${HOME}/.reactor/logs/xvfb.log &
  sleep 5
  export DISPLAY=:9.0
fi

java -cp target/*:target/dependency/* \
    -Dreactor.exec.id=$exec_id \
    -Dreactor.log.path=${HOME}/.reactor/logs \
    -Dreactor.comm.webbrowser.TYPE=chrome \
    -Dreactor.comm.webbrowser.HEADLESS=false \
    -Dreactor.exec.thread.count=1 \
  com.tascape.demo.suite.JsonEditorOnlineSuite
