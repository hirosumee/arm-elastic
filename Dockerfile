FROM armbuild/ubuntu


ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y

RUN apt-get install -y curl wget software-properties-common && apt-get clean

RUN curl -L -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.6.1-linux-x86_64.tar.gz

RUN curl -L -O https://mirrors.huaweicloud.com/java/jdk/8u202-b08/jdk-8u202-linux-arm32-vfp-hflt.tar.gz

RUN tar xf jdk-8u202-linux-arm32-vfp-hflt.tar.gz -C /opt

ENV JAVA_HOME /opt/jdk1.8.0_202

RUN useradd -m -d /elasticsearch-7.6.1 elasticsearch

USER elasticsearch

RUN tar -xvf elasticsearch-7.6.1-linux-x86_64.tar.gz

USER root

ADD run.sh /run.sh

VOLUME /data

ENV ES_HEAP_SIZE 512M

ENTRYPOINT ["/run.sh"]
