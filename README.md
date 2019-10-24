# reactor-demo-webui

## run from source

### 1 reporting (optional)

refer to [reporting](https://github.com/tascape/reactor-report)


### 2 install chromedriver

download latest chromedriver from [WebDriver for Chrome](http://chromedriver.chromium.org/downloads),
unpackage and move the executable to be ~/.reactor/webui/chromedriver


### 3 build and run tests

    ./build.sh
    ./run-functional-ui-suite.sh


### 4 check results

[Suites Result](http://127.0.0.1:30080/rr/suites_result.xhtml) (if you have reporting deployed locally),
or ~/.reactor/logs/


## run with docker

    ./run-functional-ui-suite-docker.sh
  or, if you don't want to even clone this repo     

    curl https://raw.githubusercontent.com/tascape/reactor-demo-webui/master/run-functional-ui-suite-docker.sh | bash
