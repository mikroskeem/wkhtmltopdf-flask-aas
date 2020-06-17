FROM alpine:latest

MAINTAINER Mark Vainomaa <mikroskeem@mikroskeem.eu>

RUN    apk update \
    && apk add dumb-init python3 py3-pip wkhtmltopdf

WORKDIR /

COPY app.py /app.py
COPY requeriments.txt /requeriments.txt
RUN pip install -r requeriments.txt

EXPOSE 80

ENTRYPOINT ["/usr/bin/dumb-init"]
CMD ["/usr/bin/python3", "app.py"]
