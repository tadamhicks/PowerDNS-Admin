FROM python:2.7-slim

MAINTAINER Adam Hicks <thomas.adam.hicks@gmail.com>

RUN apt-get update -y && \
    apt-get install -y build-essential libldap2-dev libsasl2-dev libssl-dev libffi-dev python-pip python-dev libmysqlclient-dev

ENV INSTALL_PATH /app

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY . .

RUN pip install -r requirements.txt

EXPOSE 80

CMD [ "python", "./run.py" ]
