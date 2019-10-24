#!/bin/bash -ex

exec_id=rx_$(uuidgen | tr - _)
exit_value=0
log_dir="${HOME}/.reactor/logs"
mkdir -p ${log_dir}/logs

docker pull tascape/reactor-demo-webui:latest
docker run --rm --privileged -t --shm-size=2g \
  --name "$exec_id" \
  --mount type=bind,source="${log_dir}",target="/home/ubuntu/.reactor/logs" \
  -e exec_id=$exec_id \
  tascape/reactor-demo-webui:latest \
  /home/ubuntu/run-functional-ui-suite.sh || exit_value=$?

open "${log_dir}/${exec_id}/result.html" || echo "check result at ${log_dir}/${exec_id}/result.html"
exit $exit_value
