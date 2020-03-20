FROM armbuild/ubuntu

MAINTAINER ginneversmile@gmail.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y

RUN apt-get install -y curl && apt-get clean

RUN curl -L -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.6.1-linux-x86_64.tar.gz

RUN curl -L -O https://github.com/bell-sw/Liberica/releases/download/14/bellsoft-jdk14+36-linux-arm32-vfp-hflt-full.tar.gz

RUN tar xf bellsoft-jdk14+36-linux-arm32-vfp-hflt-full.tar.gz -C /opt

ENV JAVA_HOME /opt/jdk-14-full

RUN useradd -m -d /elasticsearch-7.6.1 elasticsearch

USER elasticsearch

RUN tar -xvf elasticsearch-7.6.1-linux-x86_64.tar.gz

USER root

RUN rm elasticsearch-7.6.1-linux-x86_64.tar.gz bellsoft-jdk14+36-linux-arm32-vfp-hflt-full.tar.gz

ADD run.sh /run.sh

VOLUME /data

ENV ES_HEAP_SIZE 512M

ENTRYPOINT ["/run.sh"]

EXPOSE 9200 9300

