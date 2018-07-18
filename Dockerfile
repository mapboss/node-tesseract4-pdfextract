FROM mapboss/node-tesseract4

RUN apt-get update && apt-get install -y pdftk poppler-utils ghostscript
