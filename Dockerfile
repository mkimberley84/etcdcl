FROM        ubuntu:latest

RUN         apt-get update -y && apt-get upgrade -y             ;\
            apt-get install -y python               ;\
            apt-get install -y python-pip          ;

ENV         ETCDSERVER 127.0.0.1

COPY        . /app

WORKDIR     /app

RUN         pip install --upgrade pip   ;\
            pip install python-etcd    ;\
            pip install flask;
ENTRYPOINT  "python"
CMD         [ "client.py" ]



