FROM mapboss/node

RUN apk add --no-cache \
        tesseract-ocr \
        antiword \
        pdftk \
        poppler-utils \
        ghostscript \
        git

RUN npm install -g textract pdf-extract && npm cache clean --force

ENV TESSDATA_PREFIX /usr/local/share/tessdata

RUN mkdir -p ${TESSDATA_PREFIX} \
        && wget -O ${TESSDATA_PREFIX}/osd.traineddata https://github.com/tesseract-ocr/tessdata/raw/master/osd.traineddata \
        && wget -O ${TESSDATA_PREFIX}/equ.traineddata https://github.com/tesseract-ocr/tessdata/raw/master/equ.traineddata \
        && wget -O ${TESSDATA_PREFIX}/eng.traineddata https://github.com/tesseract-ocr/tessdata_fast/raw/master/eng.traineddata \
        && wget -O ${TESSDATA_PREFIX}/tha.traineddata https://github.com/tesseract-ocr/tessdata_fast/raw/master/tha.traineddata

