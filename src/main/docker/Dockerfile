FROM ubuntu:16.04

RUN apt-get update && apt-get install --no-install-recommends -y \
    openjdk-8-jre \
    apt-transport-https \
    ca-certificates \
    uuid-runtime \
    curl \
    unzip \
    gnupg \
    sudo \
    xvfb

RUN curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list
RUN apt-get update && apt-get install --no-install-recommends -y google-chrome-stable

RUN useradd -d /home/ubuntu -ms /bin/bash -g root -G sudo -p ubuntu ubuntu
USER ubuntu
WORKDIR /home/ubuntu
COPY . /home/ubuntu/

RUN mkdir -p ~/.reactor/webui && \
    export LATEST_RELEASE=$(curl -sSL https://chromedriver.storage.googleapis.com/LATEST_RELEASE) && \
    curl https://chromedriver.storage.googleapis.com/${LATEST_RELEASE}/chromedriver_linux64.zip -o chromedriver_linux64.zip && \
    unzip chromedriver_linux64.zip && \
    mv chromedriver ~/.reactor/webui/chromedriver && \
    chmod +x ~/.reactor/webui/chromedriver
