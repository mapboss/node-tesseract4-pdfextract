FROM jitesoft/tesseract-ocr:18.04
MAINTAINER Johannes Tegnér <johannes@jitesoft.com>

RUN apt-get update \
    && apt-get install -y \
        antiword \
        poppler-utils \
        ghostscript \
        git \
        wget \
        curl

RUN wget http://nodejs.org/dist/v8.11.4/node-v8.11.4-linux-x64.tar.gz \
    && tar -xf node-v8.11.4-linux-x64.tar.gz --directory /usr/local --strip-components 1

RUN npm install -g textract pdf-extract

RUN npm cache clean --force

ENV TESSDATA_PREFIX /usr/local/share/tessdata

RUN mkdir -p ${TESSDATA_PREFIX} \
        && wget -O ${TESSDATA_PREFIX}/osd.traineddata https://github.com/tesseract-ocr/tessdata/raw/master/osd.traineddata \
        && wget -O ${TESSDATA_PREFIX}/equ.traineddata https://github.com/tesseract-ocr/tessdata/raw/master/equ.traineddata \
        && wget -O ${TESSDATA_PREFIX}/eng.traineddata https://github.com/tesseract-ocr/tessdata_best/raw/master/eng.traineddata \
        && wget -O ${TESSDATA_PREFIX}/tha.traineddata https://github.com/tesseract-ocr/tessdata_best/raw/master/tha.traineddata

ENTRYPOINT
