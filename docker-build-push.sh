#!/bin/bash -ex

mvn -Ddockerfile.skip=false clean package

# need git tag for major release, such as 0.1
# git tag -a 1.0 -m "version 1.0"
# git push --tag
#
DEMO_VERSION=$(git describe --long --tags | tr - .)
echo "version is ${DEMO_VERSION}"

docker tag reactor-demo-webui tascape/reactor-demo-webui:latest
docker tag reactor-demo-webui tascape/reactor-demo-webui:${DEMO_VERSION}

echo 'please run "docker login -u tascape"'

docker push tascape/reactor-demo-webui:latest
docker push tascape/reactor-demo-webui:${DEMO_VERSION}
