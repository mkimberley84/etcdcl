FROM        ubuntu:latest

RUN         apt-get update && apt-upgrade             ;\
            apt-get install -y python3-pip          ;

ENV         ETCDSERVER 127.0.0.1

COPY        . /app

WORKDIR     /app

RUN         python3.5 -m pip install python-etcd    ;\
            python3.5 -m pip install flask; \
ENTRYPOINT  "python"
CMD         [ "client.py" ]



