FROM ubuntu
MAINTAINER Alain Domissy alaindomissy@gmail.com

ENV DEBIAN_FRONTEND noninteractive

# System packages
RUN apt-get update && apt-get install -y wget git

RUN wget http://repo.continuum.io/miniconda/Miniconda3-3.7.3-Linux-x86_64.sh  -O miniconda.sh
RUN bash miniconda.sh -b -p /root/miniconda

ENV PATH="/root/miniconda/bin:$PATH"
RUN $HOME/miniconda/bin/conda config --set always_yes yes --set changeps1 no
RUN $HOME/miniconda/bin/conda update -q conda
RUN $HOME/miniconda/bin/conda info -a
