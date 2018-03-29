FROM ubuntu:xenial-20180228

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

RUN pip3 install --no-cache-dir --upgrade pip
RUN pip3 install --no-cache-dir --upgrade jupyter matplotlib numpy pandas scipy scikit-learn
RUN pip3 install --no-cache-dir --upgrade tensorflow
RUN pip3 install --no-cache-dir --upgrade tensorflow-gpu

RUN mkdir /ml
ENV ML_PATH /ml
WORKDIR /ml

ENV PORT 8888
EXPOSE 8888
RUN mkdir -p /root/.jupyter/ && \
  echo "c.NotebookApp.token = ''" > /root/.jupyter/jupyter_notebook_config.py

CMD jupyter notebook --allow-root --ip=0.0.0.0 --port=$PORT --notebook-dir=/ml
