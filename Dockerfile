FROM python:2.7-slim

MAINTAINER Adam Hicks <thomas.adam.hicks@gmail.com>

RUN apt-get update -y && \
    apt-get install -y build-essential libldap2-dev libsasl2-dev libssl-dev libffi-dev python-pip python-dev libmysqlclient-dev

ENV INSTALL_PATH /app

RUN mkdir -p $INSTALL_PATH

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR $INSTALL_PATH

COPY . .

RUN pip install -r requirements.txt

EXPOSE 9393

CMD [ "python", "./run.py" ]
