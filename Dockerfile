FROM ubuntu:xenial-20171114

RUN apt-get update && \
  apt-get install -y \
    python3 \
    python3-pip \
    libjpeg-dev \
    python3-dev \
    cmake \
    zlib1g-dev \
    swig \
  && apt-get clean all

RUN pip3 install --upgrade pip
RUN pip3 install --upgrade jupyter matplotlib numpy pandas scipy scikit-learn
RUN pip3 install --upgrade tensorflow
RUN pip3 install --upgrade tensorflow-gpu
RUN pip3 install --upgrade 'gym[all]'

RUN mkdir /ml
ENV ML_PATH /ml
WORKDIR /ml

ENV PORT 8888
EXPOSE 8888
CMD jupyter notebook --allow-root --ip=0.0.0.0 --port=$PORT --notebook-dir=/ml

