FROM python:3.8.8-alpine
MAINTAINER cheungmk

RUN apk add --no-cache py3-grpcio && \
    mv /usr/lib/python3.8/site-packages/* /usr/local/lib/python3.8/site-packages/
RUN pip install --no-cache-dir datastore-viewer==0.3.1

ENTRYPOINT ["datastore-viewer"]
