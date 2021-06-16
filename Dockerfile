FROM python:3.8.8-alpine
MAINTAINER cheungmk

RUN apk add --no-cache py3-grpcio && \
    mv /usr/lib/python3.8/site-packages/* /usr/local/lib/python3.8/site-packages/

WORKDIR /app
COPY datastore-viewer/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

COPY datastore-viewer/bin /app/bin
COPY datastore-viewer/datastore_viewer /app/datastore_viewer

ENV PYTHONPATH .

ENTRYPOINT ["bin/datastore-viewer"]
