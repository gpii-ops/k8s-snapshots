FROM python:3.6-alpine

ADD . /app
WORKDIR /app

RUN apk --no-cache add \
        g++ \
        make \
    && pip install -r requirements.txt \
    && python setup.py install \
    && apk del \
        g++ \
        make

ENV TZ UTC

# nobody:nobody
USER 65534:65534

CMD ["k8s-snapshots"]
