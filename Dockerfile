FROM mapboss/node

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CEF9E52D \
        && echo "deb http://ppa.launchpad.net/alex-p/tesseract-ocr/ubuntu xenial main\ndeb-src http://ppa.launchpad.net/alex-p/tesseract-ocr/ubuntu xenial main " >> /etc/apt/sources.list \
        && apt-get update \
        && apt-get install tesseract-ocr -y \
        && apt-get clean \
        && apt-get autoremove

ENV TESSDATA_PREFIX /usr/local/share/tessdata

RUN wget -O ${TESSDATA_PREFIX}/osd.traineddata https://github.com/tesseract-ocr/tessdata/raw/3.04.00/osd.traineddata \
        && wget -O ${TESSDATA_PREFIX}/equ.traineddata https://github.com/tesseract-ocr/tessdata/raw/3.04.00/equ.traineddata \
        && wget -O ${TESSDATA_PREFIX}/eng.traineddata https://github.com/tesseract-ocr/tessdata/raw/4.00/eng.traineddata \
        && wget -O ${TESSDATA_PREFIX}/tha.traineddata https://github.com/tesseract-ocr/tessdata/raw/4.00/tha.traineddata

RUN apt-get update \
        && apt-get install -y pdftk \
                              poppler-utils \
                              ghostscript

RUN npm install -g textract pdf-extract
