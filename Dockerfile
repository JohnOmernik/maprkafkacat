from ubuntu:latest

ENV LIBVER=0.9.5
ENV CATVER=1.3.1

RUN apt-get update && apt-get install -y wget git zlib1g-dev libevent-pthreads-2.0-5 libssl-dev libsasl2-dev liblz4-dev libsnappy1v5 libsnappy-dev liblzo2-2 liblzo2-dev build-essential make && apt-get clean && apt-get autoremove -y

RUN wget https://github.com/edenhill/librdkafka/archive/v$LIBVER.tar.gz && tar zxf v$LIBVER.tar.gz && cd librdkafka-$LIBVER && ./configure && make && make install && ldconfig && cd .. && rm -rf librdkafka-$LIBVER && rm v$LIBVER.tar.gz

RUN wget https://github.com/edenhill/kafkacat/archive/$CATVER.tar.gz && tar zxf $CATVER.tar.gz && cd kafkacat-$CATVER && ./configure &&  make && make install && ldconfig && cd .. && rm -rf kafkacat-$CATVER && rm $CATVER.tar.gz

CMD["/bin/bash"]
