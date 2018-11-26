FROM        ubuntu:latest

RUN         apt-get update && apt-get upgrade             ;\
            apt-get install -y python3-pip          ;

ENV         ETCDSERVER 127.0.0.1

COPY        . /app

WORKDIR     /app

RUN         pip install python-etcd    ;\
            pip install flask; \
ENTRYPOINT  "python"
CMD         [ "client.py" ]



