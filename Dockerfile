FROM        ubuntu:xenial

RUN         apt-get update -y && apt-get upgrade -y             ;\
            apt-get install -y python               ;\
            apt-get install -y python-pip          ;

COPY        . /app

WORKDIR     /app

RUN         pip install --upgrade pip==9.0.3 --user   ;\
            pip install -r requirements.txt ;
ENTRYPOINT  ["python"]
CMD         [ "client.py" ]



