FROM ubuntu
MAINTAINER Alain Domissy alaindomissy@gmail.com

ENV DEBIAN_FRONTEND noninteractive

# System packages
RUN apt-get update && \
    apt-get install -y wget git

RUN wget http://repo.continuum.io/miniconda/Miniconda3-3.7.3-Linux-x86_64.sh  -O miniconda.sh && \
    bash miniconda.sh -b -p /root/miniconda && \
    rm /miniconda.sh

ENV PATH="/root/miniconda/bin:$PATH"

RUN /root/miniconda/bin/conda config --set always_yes
RUN /root/miniconda/bin/conda config --set changeps1 yes
RUN /root/miniconda/bin/condagit config push.default simple

RUN /root/miniconda/bin/conda update -q conda && \
    /root/miniconda/bin/conda info -a
