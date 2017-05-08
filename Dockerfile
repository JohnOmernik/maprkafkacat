from ubuntu:latest

ENV LIBVER=0.9.5
ENV CATVER=1.3.1

RUN apt-get update && apt-get install -y wget syslinux python3 python3-dev python python-dev git zlib1g-dev libevent-pthreads-2.0-5 openjdk-8-jre netcat syslinux-utils nfs-common libssl-dev libsasl2-dev liblz4-dev libsnappy1v5 libsnappy-dev liblzo2-2 liblzo2-dev build-essential make && apt-get clean && apt-get autoremove -y

#RUN wget https://github.com/edenhill/librdkafka/archive/v$LIBVER.tar.gz && tar zxf v$LIBVER.tar.gz && cd librdkafka-$LIBVER && ./configure && make && make install && ldconfig && cd .. && rm -rf librdkafka-$LIBVER && rm v$LIBVER.tar.gz

RUN wget http://archive.mapr.com/releases/v5.2.1/ubuntu/mapr-client-5.2.1.42646.GA-1.amd64.deb && dpkg -i mapr-client-5.2.1.42646.GA-1.amd64.deb && rm mapr-client-5.2.1.42646.GA-1.amd64.deb

RUN wget http://archive.mapr.com/releases/MEP/MEP-3.0/ubuntu/mapr-librdkafka_0.9.1.201703301726_all.deb && dpkg -i mapr-librdkafka_0.9.1.201703301726_all.deb && rm mapr-librdkafka_0.9.1.201703301726_all.deb

RUN wget https://github.com/edenhill/kafkacat/archive/$CATVER.tar.gz && tar zxf $CATVER.tar.gz && cd kafkacat-$CATVER && ./configure &&  make && make install && ldconfig && cd .. && rm -rf kafkacat-$CATVER && rm $CATVER.tar.gz

CMD ["/bin/bash"]
