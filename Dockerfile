from ubuntu:latest

ENV MAPRVER=5.2.1
ENV MAPRMEP=3.0
ENV LIBVER=0.9.5
ENV CATVER=1.3.1

RUN echo "deb http://package.mapr.com/releases/$MAPRVER/ubuntu binary" > /etc/apt/sources.list.d/mapr.list

RUN echo "deb http://package.mapr.com/releases/MEP/MEP-$MAPRMEP/ubuntu binary" >> /etc/apt/sources.list.d.mapr.list

RUN apt-get update && apt-get install -y wget python3 python3-dev python python-dev git zlib1g-dev libevent-pthreads-2.0-5 libssl-dev libsasl2-dev liblz4-dev libsnappy1v5 libsnappy-dev liblzo2-2 liblzo2-dev build-essential make && apt-get clean && apt-get autoremove -y

RUN apt-get update && apt-get install -y mapr-client mapr-librdkafka

#RUN wget https://github.com/edenhill/librdkafka/archive/v$LIBVER.tar.gz && tar zxf v$LIBVER.tar.gz && cd librdkafka-$LIBVER && ./configure && make && make install && ldconfig && cd .. && rm -rf librdkafka-$LIBVER && rm v$LIBVER.tar.gz

RUN wget https://github.com/edenhill/kafkacat/archive/$CATVER.tar.gz && tar zxf $CATVER.tar.gz && cd kafkacat-$CATVER && ./configure &&  make && make install && ldconfig && cd .. && rm -rf kafkacat-$CATVER && rm $CATVER.tar.gz

CMD ["/bin/bash"]
