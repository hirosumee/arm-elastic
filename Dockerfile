FROM armbuild/ubuntu

RUN apt-get update && apt-get install -y wget software-properties-common && apt-get clean

RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections

RUN \
	add-apt-repository -y ppa:webupd8team/java; \
	apt-get update; \
	apt-get install -y oracle-java8-installer; \
	apt-get clean; \
	rm -rf /var/cache/oracle-jdk8-installer

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

RUN useradd -m -d /elasticsearch-2.0.0 elasticsearch

USER elasticsearch

RUN \
	cd /; \
	wget -q -O /tmp/elasticsearch.tar.gz https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.0.0/elasticsearch-2.0.0.tar.gz; \
	tar -zxf /tmp/elasticsearch.tar.gz; \
	rm /tmp/elasticsearch.tar.gz

RUN /elasticsearch-2.0.0/bin/plugin install royrusso/elasticsearch-HQ

VOLUME /data

ENV ES_HEAP_SIZE 512M

ENTRYPOINT ["/elasticsearch-2.0.0/bin/elasticsearch", "-Dpath.data=/data"]
