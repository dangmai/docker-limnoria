FROM python:3-alpine
MAINTAINER Dang Mai <contact@dangmai.net>

ENV LIMNORIA_VERSION master-2016-10-02-2

RUN apk add --update git \
    && pip install -r https://raw.githubusercontent.com/ProgVal/Limnoria/${LIMNORIA_VERSION}/requirements.txt \
    && pip install git+https://github.com/ProgVal/Limnoria.git@${LIMNORIA_VERSION} --upgrade \
    && apk del git \
    && rm -rf /var/cache/apk/*

VOLUME ["/var/supybot/data"]
WORKDIR /var/supybot/data

ADD ["start.sh", "/"]
RUN chmod u+x /start.sh
ENTRYPOINT ["/start.sh"]
