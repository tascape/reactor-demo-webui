#!/bin/bash -ex

exec_id=rx_$(uuidgen | tr - _)
exit_value=0
reactor_dir="${HOME}/.reactor"
mkdir -p ${log_dir}/logs

docker run --rm --privileged -it \
  --name "$exec_id" \
  --mount type=bind,source="${reactor_dir}",target="/home/ubuntu/.reactor" \
  -e exec_id=$exec_id \
  tascape/reactor-demo-webui:latest \
  /home/ubuntu/run-functional-ui-suite.sh || exit_value=$?

open "${log_dir}/${exec_id}/result.html" || echo "check result at ${log_dir}/${exec_id}/result.html"
exit $exit_value
