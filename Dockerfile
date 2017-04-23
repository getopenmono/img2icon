FROM ubuntu:zesty
MAINTAINER  Kristoffer Andersen <ka@openmono.com>

RUN apt-key update && \
    apt-get -qq update && \
    apt-get -qq install git build-essential devscripts wget
RUN apt-get -qq install qt5-default qttools5-dev-tools devscripts qtmultimedia5-dev
CMD git clone https://github.com/getopenmono/img2icon.git && \
    cd img2icon && \
    qmake && \
    make && \
    ./img2icon -h