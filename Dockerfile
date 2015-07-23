FROM python:3-wheezy
MAINTAINER Dang Mai <contact@dangmai.net>

RUN pip install -r https://raw.githubusercontent.com/ProgVal/Limnoria/master/requirements.txt

RUN pip install git+https://github.com/ProgVal/Limnoria.git@master --upgrade

VOLUME ["/var/supybot/data"]
WORKDIR /var/supybot/data

ADD ["start.sh", "/"]
ENTRYPOINT ["/start.sh"]
