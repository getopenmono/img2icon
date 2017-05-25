FROM monolit/monofrm
MAINTAINER  Kristoffer Andersen <ka@openmono.com>

CMD git clone https://github.com/getopenmono/img2icon.git && \
    cd img2icon && \
    qmake && \
    make && \
    ./img2icon -h && \
    if [ -d $TARGET_DIR ]; then echo "copy to $TARGET_DIR"; cp img2icon $TARGET_DIR; fi