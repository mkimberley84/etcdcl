FROM        ubuntu:xenial

RUN         apt-get update -y && apt-get upgrade -y             ;\
            apt-get install -y python               ;\
            apt-get install -y python-pip          ;

ENV         ETCDSERVER 127.0.0.1

COPY        . /app

WORKDIR     /app

RUN         pip install --upgrade pip==9.0.3 --user   ;\
            pip install python-etcd    ;\
            pip install flask;
ENTRYPOINT  "python"
CMD         [ "client.py" ]



