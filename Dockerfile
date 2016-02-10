FROM ubuntu
MAINTAINER Alain Domissy alaindomissy@gmail.com


# removed, per : https://github.com/docker/docker/issues/4032
# ENV DEBIAN_FRONTEND noninteractive

# System packages
RUN apt-get update && \
    apt-get install -y wget git

#RUN git config push.default simple

RUN wget http://repo.continuum.io/miniconda/Miniconda3-3.7.3-Linux-x86_64.sh  -O miniconda.sh && \
    bash miniconda.sh -b -p /root/miniconda && \
    rm /miniconda.sh && \
    /root/miniconda/bin/conda config --set always_yes True --set changeps1 True && \
    /root/miniconda/bin/conda update -q conda && \
    /root/miniconda/bin/conda info -a

ENV PATH="/root/miniconda/bin:$PATH"