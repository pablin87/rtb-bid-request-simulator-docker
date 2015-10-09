FROM ubuntu:12.04
MAINTAINER Pablo Berrilio <pabloberrilio@gmail.com>

# Install rtbkit dependencies
RUN apt-get update && apt-get install -y \
wget git-core build-essential python-dev python-setuptools python-virtualenv

RUN mkdir -p downloads
ADD http://dist.schmorp.de/libev/Attic/libev-4.15.tar.gz downloads/
WORKDIR downloads
RUN tar -xvzf libev-4.15.tar.gz
WORKDIR libev-4.15
RUN ./configure --prefix=/usr
RUN make
RUN make install
WORKDIR ../..

# More dependencies 
RUN pip install pyev http_parser mako protobuf beautifulsoup

ENV HOME /root

VOLUME [ $HOME/rtb_exchange_sim ]
WORKDIR $HOME/rtb_exchange_sim

CMD [ "python", "run.py" ]
